unit MainMYOBInterface;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MYOBDM, StdCtrls, MYOBInterGlobals, auchtypes,{$IFDEF Embedded} IB_Session511, {$ENDIF}
  IB_Components, IB_Script, dbtables, db, MYOBSetup, cxLabel, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxGroupBox, ExtCtrls, dxNavBar,
  cxControls, cxContainer, cxEdit, cxProgressBar, cxButtons, inifiles;

type
  TMainMYOBInterfaceF = class(TForm)
    MYOB2TariExitBtn: TcxButton;
    cxButton1: TcxButton;
    MYOBTransactionsGRP: TcxGroupBox;
    MYOBStartdate: TcxDateEdit;
    cxLabel1: TcxLabel;
    MYOBEndDate: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxButton3: TcxButton;
    MYOBTransProgressBar: TcxProgressBar;
    UpdateTARIBtn: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxGroupBox1: TcxGroupBox;
    cxButton2: TcxButton;
    SupportProgressBar: TcxProgressBar;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    LastSupportDateLbl: TcxLabel;
    LastTransDateLbl: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure MYOB2TariExitBtnClick(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure UpdateTARIBtnClick(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateSupportProgress;
    procedure UpdateTransactionProgress;
    procedure InsertNewProduct(Prod_ID: Integer);
    procedure InsertAccountNumber(AccountNo: Integer);
    procedure InsertNewClient(Client_ID: Integer);
    procedure InsertNewStaff(Staff_ID: Integer);
    procedure createcomponent(ServicesIdNumber: Integer; NewComp: Boolean; CompIdx, ProdGroup: integer; ServiceDesc: string; SellingPrice, LabourTime: Currency);
  public
    { Public declarations }
    ProgressInt, ProgressTotal : integer;
    function OpenMYOBDB(FilePath : String): Boolean;
//    procedure TransferSCData;
//    procedure UpdateTARIData;
  end;

var
  MainMYOBInterfaceF: TMainMYOBInterfaceF;
  NewFileName : string;

function GetTARIInterfaceINI: Boolean;
function UpdateTARIInterfaceINI: Boolean;
function OpenClientDB : Boolean;

implementation

{$R *.dfm}

uses TARITIMES, MYOBReports, TARIMYOBDataModule;

function GetTARIInterfaceINI: Boolean;
Var
  Dataini : TiniFile;
begin
  Result := False;
  if fileexists(GGlobals.BaseDir + 'TARIInterface.ini') then
    begin
    DataIni := TiniFile.create(GGlobals.BaseDir + 'TARIInterface.ini');
    GGlobals.TARIServer := DataIni.ReadString('TARI', 'TARIServer', '');
    GGlobals.TARIPath := DataIni.ReadString('TARI', 'TARIFBPath', '');
    GGlobals.TARIStartDate := DataIni.ReadDate('TARI', 'TARIStartDate', 0);
    GGlobals.TARIEndDate := DataIni.ReadDate('TARI', 'TARIEndDate', 0);
    GGLobals.TARIInterfaceDBPath := DataIni.ReadString('TARIInterface', 'DBPath', '');
    GGLobals.TARIInterfaceServer := DataIni.ReadString('TARIInterface', 'InterfaceServer', '');
    Dataini.Free;
    Result := True;
    end;
end;

function UpdateTARIInterfaceINI: Boolean;
Var
  Dataini : TiniFile;
begin
  Result := False;
  if fileexists(GGlobals.BaseDir + 'TARIInterface.ini') then
    begin
    DataIni := TiniFile.create(GGlobals.BaseDir + 'TARIInterface.ini');
    DataIni.WriteString('TARIInterface', 'DBPath', GGLobals.TARIInterfaceDBPath);
    if length(GGLobals.TARIInterfaceServer) = 0 then
      DataIni.WriteString('TARIInterface', 'InterfaceServer', GGLobals.TARIServer);
    Dataini.UpdateFile;
    DataIni.Free;
    Result := True;
    end;
end;

function OpenClientDB: Boolean;
var
  i: Integer;
  dbpass : string;
begin
  GGlobals.DebugOut('Open File - Start');
  GGlobals.DebugOut('Open File - Update Checked');
  GGlobals.DebugOut('Attempting to Open - ' + GGLobals.TARIPath);
  Result := True;
  if (Length(GGlobals.CurrentDBPWD) > 0) Then
    If (InputPwdQuery('Database Password', 'Enter the Password', dbpass, False, GGlobals.FormColour)) then
      begin
      if not ansisametext(GGlobals.CurrentDBPWD, dbPass) then
        Result := False;
      end
    else
      Result := False;
  if Result = True then
    begin
    TARIMYOBDM.ClientDatabase.Connected := False;
    TARIMYOBDM.ClientDatabase.Path := GGlobals.TariPath;
      try
        TARIMYOBDM.ClientDatabase.Connected := True;
      except
        on E: EDBEngineError do
          begin
          Result := False;
          for i:= 0 to E.ErrorCount - 1 do
            begin
            GGlobals.DebugOut('DBopen Error - File : ' + GGlobals.TariPath);
            GGlobals.DebugOut('               Code : ' + inttoStr(E.Errors[i].Errorcode));
            GGlobals.DebugOut('               SubCode : ' + InttoStr(E.Errors[i].subCode));
            GGlobals.DebugOut('               Message : ' + E.Errors[i].Message);
            GGlobals.DebugOut('               NativeError : ' + InttoStr(E.Errors[i].NativeError));
            end;
          end;
      else
        ; //raise;
      end;
    end;
  if Result then
    GGlobals.DebugOut('Connected to - ' + GGLobals.TARIPath)
  else
    GGlobals.DebugOut('Failed Connected to - ' + GGLobals.TARIPath);
  if TARIMYOBDM.ClientDatabase.Connected then
    GGlobals.TARIBusinessName := TARIMYOBDM.Business_DetailsBUSINESS_NAME.Value;
end;


function TMainMYOBInterfaceF.OpenMYOBDB(FilePath : String): Boolean;
begin
  DMMYOBInterface.MYOBPath := DMMYOBInterface.GetMYOBPath;
  DMMYOBInterface.MYOBDatabase.Connected := True;
  result := DMMYOBInterface.MYOBDatabase.Connected;
end;

procedure TMainMYOBInterfaceF.FormCreate(Sender: TObject);
begin
  GGlobals.DebugOut('Main Form Create');
  color := GGlobals.FormColour;
  MYOBStartdate.Properties.DisplayFormat := GGlobals.DateFDE;
  MYOBEnddate.Properties.DisplayFormat := GGLobals.DateFDE;
  MYOBStartdate.Date := GGlobals.TARIStartDate;
  MYOBEnddate.Date := GGlobals.TARIEndDate;
  GGlobals.DebugOut('Main Form Create 1');
  if DMMYOBInterface.GetLastSupportDate <> 0 then
    LastSupportDateLbl.Caption := FormatDateTime(GGLobals.DateFENH, DMMYOBInterface.GetLastSupportDate);
  if DMMYOBInterface.GetLastTransDate <> 0 then
    LastTransDateLbl.Caption := FormatDateTime(GGLobals.DateFENH, DMMYOBInterface.GetLastTransDate);
  UpdateTARIInterfaceINI;
end;

procedure TMainMYOBInterfaceF.cxButton1Click(Sender: TObject);
begin
  if (TARIMYOBDM.ClientDatabase.Connected) then
    begin
    Application.CreateForm(TSCSetupF, SCSetupF);
    SCSetupf.Showmodal;
    SCSetupf.free;
    end
  else
    showMessage('Not connected to TARI for Business Database. Call Support!');
end;

procedure TMainMYOBInterfaceF.createcomponent(ServicesIdNumber: Integer; NewComp: Boolean; CompIdx, ProdGroup: integer; ServiceDesc: string; SellingPrice, LabourTime: Currency);
begin

end;

procedure TMainMYOBInterfaceF.cxButton2Click(Sender: TObject);
var
  Varg : variant;
begin
// here's where we
  screen.Cursor := crHourGlass;
  // Try for a connection
  OpenMYOBDB('None');

  screen.Cursor := crDefault;
end;

procedure TMainMYOBInterfaceF.UpdateSupportProgress;
begin
  SupportProgressBar.Position := (ProgressInt * 100) /ProgressTotal;
  SupportProgressBar.Refresh;
end;

procedure TMainMYOBInterfaceF.UpdateTransactionProgress;
begin
  MYOBTransProgressBar.Position := (ProgressInt * 100) /ProgressTotal;
  MYOBTransProgressBar.Refresh;
end;

procedure TMainMYOBInterfaceF.InsertNewProduct(Prod_ID: Integer);
begin
//    DMMYOBInterface.SC2
{
    DMMYOBInterface.FBProducts.Insert;
    DMMYOBInterface.FBProductsPRODUCT_ID.Value := Prod_ID;
    DMMYOBInterface.FBProductsDESCRIPTION.Value := 'Unknown - Data Transfer';
    DMMYOBInterface.FBProductsCOST_PRICE.Value := 0;
    DMMYOBInterface.FBProductsPRODUCT_GROUP.Value := 0;
    DMMYOBInterface.FBProductsSELLING_PRICE.Value := 0;
    DMMYOBInterface.FBProductsIS_LABOUR.Value := 0;  // These are not labour products
    DMMYOBInterface.FBProductsIS_LISTED.Value := 1;  // It is listed
    DMMYOBInterface.FBProductsIS_CALCULATED.Value := 1; // These are base products
    DMMYOBInterface.FBProductsLAST_UPDATED.Value := now();
    DMMYOBInterface.FBProducts.Post;
}
end;

procedure TMainMYOBInterfaceF.InsertAccountNumber(AccountNo: Integer);
begin
//    DMMYOBInterface.SC2
{
    DMMYOBInterface.FB_Accounts.Insert;
    DMMYOBInterface.FB_AccountsACCOUNT_NO.Value := AccountNo;
    DMMYOBInterface.FB_AccountsACCOUNT_TITLE.Value := 'Unknown Account';
    DMMYOBInterface.FB_AccountsACCOUNT_DESC.Value := '';
    DMMYOBInterface.FB_AccountsIS_PETTY_CASH.Value := 0;  // These are not labour products
    DMMYOBInterface.FB_AccountsIS_ACTIVE.Value := 1;  // It is listed
    DMMYOBInterface.FB_Accounts.Post;
}
end;

procedure TMainMYOBInterfaceF.InsertNewClient(Client_ID: Integer);
begin
{
  DMMYOBInterface.FB_Clients.Insert;
  DMMYOBInterface.FB_ClientsCLIENT_ID.Value := Client_ID;
  if DMMYOBInterface.SCClients.Locate('IdNumber', variant(Client_ID), []) then
    begin
    DMMYOBInterface.FB_ClientsLASTNAME.Value := DMMYOBInterface.SCClientsLastName.Value;
    DMMYOBInterface.FB_ClientsFIRSTNAME.Value := DMMYOBInterface.SCClientsFirstName.Value;
    end;
  DMMYOBInterface.FB_ClientsLASTNAME.Value := 'Unknown';
  DMMYOBInterface.FB_ClientsFIRSTNAME.Value := 'Person';
  DMMYOBInterface.FB_Clients.Post;
}
end;

procedure TMainMYOBInterfaceF.InsertNewStaff(Staff_ID: Integer);
begin
{
  DMMYOBInterface.FBStaff.Insert;
  DMMYOBInterface.FBStaffSTAFF_ID.Value := Staff_ID;
  if DMMYOBInterface.SCEmploys.Locate('IdNumber', variant(Staff_ID), []) then
    begin
    DMMYOBInterface.FBStaffLASTNAME.Value := DMMYOBInterface.SCEmploysLastName.Value;
    DMMYOBInterface.FBStaffFIRSTNAME.Value := DMMYOBInterface.SCEmploysFirstName.Value;
    end;
  DMMYOBInterface.FBStaffLASTNAME.Value := 'Unknown';
  DMMYOBInterface.FBStaffFIRSTNAME.Value := 'Person';
  DMMYOBInterface.FBStaffPRODUCTION_PC.value := 100;
  DMMYOBInterface.FBStaff.Post;
}
end;

procedure TMainMYOBInterfaceF.cxButton3Click(Sender: TObject);
var
  CurrentClientID, newtrans_id, Lindex, I, AccountIndex : Integer;
  ReachedEnd : Boolean;
  Varg1 : Variant;
begin
  screen.Cursor := crHourGlass;
  screen.Cursor := crDefault;
end;

procedure TMainMYOBInterfaceF.MYOB2TariExitBtnClick(Sender: TObject);
begin
  close;
end;

procedure TMainMYOBInterfaceF.cxButton4Click(Sender: TObject);
begin
//  DMMYOBInterface.FBUnitsUpdate.Active := True;
//  Application.CreateForm(TTARITimesF, TARITimesF);
//  TARITIMESF.formstarted := True;
//  TARITimesF.ShowModal;
//  TARITimesF.free;
//  DMMYOBInterface.FBUnitsUpdate.Active := False;
  screen.Cursor := crDefault;
end;

procedure TMainMYOBInterfaceF.cxButton5Click(Sender: TObject);
begin
{
  if Not DMMYOBInterface.SCDatabase.Connected then
    DMMYOBInterface.SCDatabase.Connected := True;
  if Not DMMYOBInterface.SC2TARIDB.Connected then
    DMMYOBInterface.SC2TARIDB.Connected := True;
  Application.CreateForm(TSCReportsF, SCReportsF);
  SCReportsF.showmodal;
  SCReportsF.free;
  screen.Cursor := crDefault;
}
end;

procedure TMainMYOBInterfaceF.UpdateTARIBtnClick(Sender: TObject);
begin
{
  if not TARIDM.ClientDatabase.Connected then
    begin
    showMessage('Not connected to TARI for Business Database. Call Support!');
    exit;
    end;
  if ((DMMYOBInterface.GetTARIServiceDept = -1) or (DMMYOBInterface.GetTARISalesDept = -1))
     and (TARIDM.ClientDatabase.Connected) then
    begin
    Application.CreateForm(TSCSetupF, SCSetupF);
    SCSetupf.Showmodal;
    SCSetupf.free;
    end;
  screen.Cursor := crHourglass;
  if (DMMYOBInterface.GetTARIServiceDept <> -1) AND (DMMYOBInterface.GetTARISalesDept <> -1)
     and (TARIDM.ClientDatabase.Connected) then
    TARIDM.UpdateTariSaleTracking;
  screen.Cursor := crDefault;
}
end;

initialization
  GGlobals := TSCInterGlobals.Create;
  if Not GGlobals.SecondInstance then
    begin
    GGlobals.initFailed := False;
    GGlobals.LoadData;
    NewFileName := '';
    if (Not GetTARIInterfaceINI) then
       GGlobals.initFailed := True;

    if (not GGlobals.initFailed) and (not Fileexists(GGlobals.Servers.CurrentServer.NetworkFolder + 'data\' + ExtractFileName(GGlobals.TARIInterfaceDBPath))) then
      begin
      If (InputQuery('New Shortcuts Interface File', 'Enter File Name', NewFileName)) then
        begin
        newFileName := ChangeFileext(NewFileName, '.FDB');
        GGlobals.TARIInterfaceDBPath := GGlobals.Servers.CurrentServer.NetworkFolder + 'data\' + NewFileName;
        if not GGlobals.CopyMastFile(GGlobals.Servers.CurrentServer.NetworkFolder + 'proto\SHORTCUTSMASTER.FDB', GGlobals.TARIInterfaceDBPath) then
          begin
          showmessage('Failed to create Interface Master File');
          GGlobals.initFailed := True;
          end
        else
          begin
          UpdateTARIInterfaceINI;
          end;
        end
      else
        GGlobals.initFailed := True;
      end;
    GGlobals.DebugOut('Init Phase 1');
    if not GGlobals.initFailed then
      begin
      GGlobals.DebugOut('Init Phase 2');
      Application.CreateForm(TDMMYOBInterface, DMMYOBInterface);
      Application.CreateForm(TTARIMYOBDM, TARIMYOBDM);
      if not SameText(GGLobals.Servers.CurrentServer.ServerName, GGLobals.TARIServer) then
        GGLobals.Servers.SetCurrentServer(GGLobals.TARIServer);
      GGlobals.DebugOut('Init Phase 3');

      If Not OpenClientDB then
        begin
        showMessage('Failed to open TARI Database File');
        GGlobals.initFailed := True;
        end;
      GGlobals.DebugOut('Init Phase 4 - Interface Server is ' + GGlobals.TARIInterfaceServer);
      DMMYOBInterface.FB_MYOBTARIDB.Server := GGlobals.TARIInterfaceServer;
      GGlobals.DebugOut('Init Phase 5 - Path is ' + GGlobals.TARIInterfaceDBPath);
      DMMYOBInterface.FB_MYOBTARIDB.Path := GGlobals.TARIInterfaceDBPath;
      GGlobals.DebugOut('Init Phase 6');
      DMMYOBInterface.FB_MYOBTARIDB.Connected := True;
      GGlobals.DebugOut('Init Phase 7');
      DMMYOBInterface.MYOBPath := DMMYOBInterface.GetMYOBPath;
      GGlobals.DebugOut('Init Phase 8');
      if (Length(NewFileName) > 0)  and (TARIMYOBDM.ClientDatabase.Connected) then
        begin
        UpdateTARIInterfaceINI;
        Application.CreateForm(TSCSetupF, SCSetupF);
        SCSetupf.Showmodal;
        SCSetupf.free;
        end;
      end;
    end;

Finalization
if Not GGlobals.Secondinstance then
  begin
  GGlobals.DebugOut('On Finalization');
  GGlobals.Destroy;
  end;

end.
