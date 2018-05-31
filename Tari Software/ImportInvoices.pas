unit ImportInvoices;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DMClient, AuchTypes, DMRep1U, LGlobals, DB, {$IFDEF Embedded} IB_Session511,{$ENDIF}
  IB_Session, IBODataset, IB_Components,
  Grids, DBGrids, AbBase, AbBrowse, AbZBrows, AbZipper, AbZipKit, StdCtrls,
  cxButtons, cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxProgressBar;

type
  TImportInvoicesF = class(TForm)
    ImportDBEngine: TIBODatabase;
    TariControl: TIBOTable;
    ImportInvoices: TIBOTable;
    TariControlINDEX_ID: TIntegerField;
    TariControlBUSINESSNAME: TStringField;
    TariControlDEPARTMENTNAME: TStringField;
    TariControlTARI_VALUE: TBCDField;
    TariControlWEEKLYTARGET: TBCDField;
    TariControlSTART_DATE: TDateField;
    TariControlEND_DATE: TDateField;
    ImportInvoicesINV_DATE: TDateField;
    ImportInvoicesINVOICE_NUMBER: TStringField;
    ImportInvoicesNETSALES: TBCDField;
    ImportInvoicesMATERIALSATCOST: TBCDField;
    ImportInvoicesSUBCONTRACTORS: TBCDField;
    ImportInvoicesUNITSREQUIRED: TBCDField;
    DSTariControl: TDataSource;
    OpenDialog1: TOpenDialog;
    AbZipKit1: TAbZipKit;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    ImpStartdate: TcxDBDateEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    ImpEndDate: TcxDBDateEdit;
    ImportCloseBtn: TcxButton;
    CancelBtn: TcxButton;
    ProgressBar1: TcxProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AbZipKit1NeedPassword(Sender: TObject;
      var NewPassword: String);
    procedure ImportDBEngineAfterConnect(Sender: TIB_Connection);
    procedure ImportCloseBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
  private
    { Private declarations }
    FirstPWD : Boolean;
    procedure unzipInvoiceDB;
    function OpenZip: Boolean;
    function ConnectDB: Boolean;
    procedure SetFilter;
  public
    { Public declarations }
    CurrentDBName : String;
    Invoicetype : Integer;
    DefaultDate : TDateTime;
  end;

var
  ImportInvoicesF: TImportInvoicesF;

implementation

{$R *.dfm}


procedure TImportInvoicesF.FormCreate(Sender: TObject);
begin
  color := GGlobals.FormColour;
  OpenDialog1.InitialDir := GGlobals.BaseDir + 'Imports';
  if Not OpenZip then
    close;
end;

function TImportInvoicesF.OpenZip: Boolean;
begin
  if OpenDialog1.Execute then
    begin
    CurrentDBName := OpenDialog1.FileName;
    Result := True;
    end
  else
    result := False;
end;

procedure TImportInvoicesF.unzipInvoiceDB;
var
  CurrentZipfile : String;
begin
  FirstPWD := True;
  Abzipkit1.BaseDirectory := GGlobals.BaseDir + 'Imports';
  CurrentZipFile := CurrentDBName;
  CurrentDBName := ChangeFileExt(CurrentZipFile, '.fdb');
  if Fileexists(CurrentDBName) then
    deleteFile(CurrentDBName);
  ABZipKit1.FileName := CurrentZipFile;
  AbZipKit1.ExtractFiles('*.fdb');
end;

procedure TImportInvoicesF.FormShow(Sender: TObject);
begin
  UnzipInvoiceDB();
  if Fileexists(CurrentDBName) then
    connectDB;
  if Not ImportDBEngine.Connected then
    begin
    showmessage('Database did not extract from zip file' + #13#10 + 'Click ''Cancel'' and try again!');
    DATAMODULECLIENT.Departments.Edit;
    DATAMODULECLIENT.DepartmentsINVOICEPASSWORD.Value := '';
    DATAMODULECLIENT.Departments.Post;
    end;
end;

function TImportInvoicesF.ConnectDB: Boolean;
begin
  if ImportDBEngine.Connected then
    ImportDBEngine.Disconnect;
  ImportDBEngine.Username := 'SYSDBA';
  if length(GGLobals.Servers.CurrentServer.SysdbaPassword) > 0 then
    ImportDBEngine.Password := GGLobals.Servers.CurrentServer.SysdbaPassword
  else
    ImportDBEngine.Password := 'masterkey';
  ImportDBEngine.Path := CurrentDBName;
  ImportDBEngine.Server := '';
  ImportDBEngine.Protocol := cpLocal;
  ImportDBEngine.Connect;
  result := ImportDBEngine.Connected;
end;


procedure TImportInvoicesF.AbZipKit1NeedPassword(Sender: TObject;
  var NewPassword: String);
var
  NoPassword : Boolean;
begin
  NoPassword := True;

  if (not DATAMODULECLIENT.DepartmentsINVOICEPASSWORD.IsNull) and
     (DATAMODULECLIENT.DepartmentsINVOICEPASSWORD.Value > '') and
     (FirstPWD) then
    newPassword := DATAMODULECLIENT.DepartmentsINVOICEPASSWORD.Value
  else
    while NoPassword do
      begin
      If (InputPwdQuery('Invoice Database Password', 'Enter the Password', newPassword, False, GGlobals.FormColour)) then
        begin
        DATAMODULECLIENT.Departments.Edit;
        DATAMODULECLIENT.DepartmentsINVOICEPASSWORD.Value := newPassword;
        DATAMODULECLIENT.Departments.Post;
        NoPassword := False;
        end;
      end;    // while
  FirstPWD := False;
end;

procedure TImportInvoicesF.ImportDBEngineAfterConnect(
  Sender: TIB_Connection);
begin
  TariControl.Active := True;
  setfilter;
end;

procedure TImportInvoicesF.SetFilter;
begin
  with ImportInvoices do
    begin
    Active := False;
    Filtered := False;
    Filter := '';
    if TariControlSTART_DATE.Value < TariControlEND_DATE.Value then
      Filter := 'Inv_Date >= ''' + formatDateTime('c', TariControlSTART_DATE.Value) +
              ''' and Inv_Date <= ''' + formatDateTime('c', TariControlEND_DATE.Value) + '''';
    if (TariControlSTART_DATE.Value = TariControlEND_DATE.Value) then
      Filter := 'Inv_Date = ''' + formatDateTime('c', TariControlSTART_DATE.Value) + '''';
    if Filter > '' then
      Filtered := True;
    Active := True;
    end;
end;

procedure TImportInvoicesF.ImportCloseBtnClick(Sender: TObject);
var
  varg : Variant;
begin
  SetFilter;
  if DATAMODULECLIENT.MonitoringImpInv.Active = False then
    DATAMODULECLIENT.MonitoringImpInv.Active := True;
  varg := VarArrayCreate([0, 2], varVariant);
  Varg[0] := DATAMODULECLIENT.DepartmentsDEPT_ID.value;
  Varg[1] := Invoicetype;
  if InvoiceType = 2 then
    DefaultDate := 0;
  ImportInvoices.First;
  ProgressBar1.Properties.Max := ImportInvoices.RecordCount;
  if (DATAMODULECLIENT.MonitoringImpInvINVOICE_NUMBER.Value = '') and
     (DATAMODULECLIENT.MonitoringImpInvNETSALES.Value = 0) and
     (DATAMODULECLIENT.MonitoringImpInvUNITSREQUIRED.Value = 0) then
     DATAMODULECLIENT.MonitoringImpInv.Delete;
  while ImportInvoices.Eof = False do
    begin
    Varg[2] := ImportInvoicesINVOICE_NUMBER.Value;
    if DATAMODULECLIENT.MonitoringImpInv.Locate('DEPT_ID,INVOICETYPE,INVOICE_NUMBER', varg, []) then
      DATAMODULECLIENT.MonitoringImpInv.Edit
    else
      begin
      DATAMODULECLIENT.MonitoringImpInv.Insert;
      DATAMODULECLIENT.MonitoringImpInvINVOICE_NUMBER.Value := ImportInvoicesINVOICE_NUMBER.Value;
      end;
    if DefaultDate > 0 then
      DATAMODULECLIENT.MonitoringImpInvINV_DATE.Value := DefaultDate
    else
      DATAMODULECLIENT.MonitoringImpInvINV_DATE.Value := ImportInvoicesINV_DATE.Value;
    DATAMODULECLIENT.MonitoringImpInvINVOICETYPE.Value := Invoicetype;
    DATAMODULECLIENT.MonitoringImpInvNETSALES.Value := ImportInvoicesNETSALES.Value;
    DATAMODULECLIENT.MonitoringImpInvMATERIALSATCOST.Value := ImportInvoicesMATERIALSATCOST.Value;
    DATAMODULECLIENT.MonitoringImpInvSUBCONTRACTORS.Value := ImportInvoicesSUBCONTRACTORS.Value;
    DATAMODULECLIENT.MonitoringImpInvUNITSREQUIRED.Value := ImportInvoicesUNITSREQUIRED.Value;
    DATAMODULECLIENT.MonitoringImpInvRECORDEDUNITS.Value := ImportInvoicesUNITSREQUIRED.Value;
    DATAMODULECLIENT.MonitoringImpInv.Post;
    ProgressBar1.Position := ImportInvoices.RecNo;
    ImportInvoices.Next;
    end;    // while
  DATAMODULECLIENT.MonitoringImpInv.Active := False;
  ImportDBEngine.Disconnect;
  ModalResult := mrOK;
  Close;
end;

procedure TImportInvoicesF.CancelBtnClick(Sender: TObject);
begin
  ImportDBEngine.Disconnect;
  ModalResult := mrCancel;
  Close;
end;

end.
