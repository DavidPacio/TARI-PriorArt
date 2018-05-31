unit TBImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, IB_Grid, IB_Components, IB_QImport2Wizard,
  IB_UpdateBar, ExtCtrls, IB_NavigationBar, IB_QImport2, IB_QImport2XLS,
  IB_QImport2ASCII, IB_Process, IB_Script, Telesis_IB_LookupEnh,
  Telesis_EditEnh, Telesis_ComboEnh, Telesis_DateTimeEnh,
  Telesis_IB_DateTimeEnh, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit, Telesis_CheckBoxEnh,
  Telesis_IB_CheckBoxEnh, Telesis_IB_EditEnh, DMClient, LGlobals, DMrep1U,
  cxLabel, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCheckBox,
  cxNavigator, cxDBNavigator, cxButtons, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, db, cxMRUEdit, ComCtrls, ImpTemplates, DateUtils;

type
  TTBImportF = class(TForm)
    IB_QImport2Wizard1: TIB_QImport2Wizard;
    qryImport_Data: TIB_Query;
    DSImport_Data: TIB_DataSource;
    DeleteScript: TIB_Script;
    DSImportHeader: TIB_DataSource;
    qryImport_Header: TIB_Query;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    cxLabel2: TcxLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxDBNavigator1: TcxDBNavigator;
    cxLabel1: TcxLabel;
    cxImportDesc: TcxDBTextEdit;
    cxLabel3: TcxLabel;
    ImportStartDate: TcxDBDateEdit;
    cxLabel4: TcxLabel;
    ImportEndDate: TcxDBDateEdit;
    cxDBCheckBox1: TcxDBCheckBox;
    cxDBCheckBox2: TcxDBCheckBox;
    cxLabel6: TcxLabel;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    cxLabel5: TcxLabel;
    cxComboDestination: TcxDBComboBox;
    cxButton3: TcxButton;
    TabSheet2: TTabSheet;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBSeqNumber: TcxGridDBColumn;
    cxGrid1DBTableView1DBAccountNumber: TcxGridDBColumn;
    cxGrid1DBTableView1DBAccTitle: TcxGridDBColumn;
    cxGrid1DBTableView1DBDRAmount: TcxGridDBColumn;
    cxGrid1DBTableView1DBCRAmount: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    TabSheet3: TTabSheet;
    cxLabel7: TcxLabel;
    CloseBtn: TcxButton;
    MappingtempBtn: TcxButton;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    AddExpenseBtn: TcxButton;
    cxButton4: TcxButton;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid2Level1: TcxGridLevel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    Panel1: TPanel;
    DeptLbl: TcxLabel;
    PostDataBtn: TcxButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure qryImport_DataNewRecord(IB_Dataset: TIB_Dataset);
    procedure CloseBtnClick(Sender: TObject);
    procedure MappingtempBtnClick(Sender: TObject);
    procedure AddExpenseBtnClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure PostDataBtnClick(Sender: TObject);
    procedure ImportStartDateExit(Sender: TObject);
  private
    { Private declarations }
    function BalanceOK: Boolean;
    function AccountMappingOK: Boolean;
  public
    { Public declarations }
  end;

var
  TBImportF: TTBImportF;

implementation

{$R *.dfm}

uses DataCollector, auchtypes;

procedure TTBImportF.Button1Click(Sender: TObject);
var
  templatefile : TStringList;
  tfilename : String;
  Importid : Integer;
  Varg : Variant;
begin
  if DataModuleClient.DSImportHeader.State in [dsInsert,dsedit] then
    DataModuleClient.Import_Header.Post;
  ImportID := DataModuleClient.import_HeaderIMPORT_ID.value;
  Varg := DataModuleClient.Import_HeaderTEMPLATE_ID.Value;
  DataModuleClient.Import_Templates.Locate('TEMPLATE_ID', varg, []);
  Varg := ImportID;
  qryImport_Header.Refresh;
  qryImport_Header.Locate('IMPORT_ID', varg, []);
  // first delete any previously imported Data
  templateFile := TStringList.Create;
  DeleteScript.SQL.Delete(DeleteScript.SQL.Count - 1);
  DeleteScript.SQL.Add('WHERE (IMPORT_ID=' + qryImport_Header.fieldbyName('IMPORT_ID').AsString + ');');
  DeleteScript.Execute;
  tFileName := gglobals.BaseDir + 'proto\TBImport.imp';
  IB_QImport2Wizard1.TemplateFileName:= TfileName;
  templatefile.CommaText := DataModuleClient.Import_TemplatesIMPORT_PROFILE.AsString;
  templatefile.SaveToFile(TfileName);
  IB_QImport2Wizard1.Execute;
  TemplateFile.LoadFromFile(TfileName);
  DataModuleClient.Import_Templates.Edit;
  DataModuleClient.Import_TemplatesIMPORT_PROFILE.AsString := templatefile.CommaText;
  DataModuleClient.Import_Templates.Post;
  if not BalanceOK then exit;
  if Not AccountMappingOK then
    begin
    MappingtempBtnClick(Sender);// call account mapping form
    end;
  DataModuleClient.Imported_Data.Refresh;
end;

function TTBImportF.BalanceOK: Boolean;
var
  DRTotal, CRTotal : Currency;
begin
  DRTotal := 0;
  CRTotal := 0;
  qryImport_data.Refresh;
  qryImport_Data.first;
  while qryImport_Data.Eof = false do
    begin
    DRTotal := DRTotal + qryImport_Data.fieldbyname('DR_AMOUNT').AsCurrency;
    CRTotal := CRTotal + qryImport_Data.fieldbyname('CR_AMOUNT').AsCurrency;
    qryImport_Data.Next;
    end;    // while
  if DRTotal = CRTotal then
    result := True
  else
    Result := False;
end;

function TTBImportF.AccountMappingOK: Boolean;
var
  varg : Variant;
  vargacc : Variant;
begin
  Result := True;
  DATAMODULECLIENT.Imported_Data.CommitUpdates;
  DATAMODULECLIENT.Imported_DataUpdate.Active := True;
  DatAMODULECLIENT.Template_Details.IndexName := 'PK_TEMPLATE_DETAILS';
  varg := VarArrayCreate([0, 1], varVariant);
  Vargacc := DataModuleClient.Import_HeaderTEMPLATE_ID.Value;
  DataModuleClient.Import_Templates.Locate('TEMPLATE_ID', vargacc, []);
  Varg[0] := DataModuleClient.Import_HeaderTEMPLATE_ID.Value;
  DataModuleClient.Imported_DataUpdate.First;
  while DataModuleClient.Imported_DataUpdate.Eof = false do
    begin
    if DataModuleClient.Import_HeaderUSE_ACCOUNT_NUMBER.Value > 0 then
      begin
      if (DataModuleClient.Imported_DataUpdateACCOUNT_NUMBER.IsNull) then
        begin
        messagedlg('The Import Header has ''Use Account Number'' as a Source Reference,' + #13#10
        + 'however there is no account number for ' + DataModuleClient.Imported_DataUpdateACCOUNT_TITLE.AsString
        + 'Please Import again!', mtWarning, [mbok], 0);
        exit;
        end;
      varg[1] := DataModuleClient.Imported_DataUpdateACCOUNT_NUMBER.value;
      end
    else
      varg[1] := DataModuleClient.Imported_DataUpdateACCOUNT_TITLE.value;
    if not DataModuleClient.Template_Details.Locate('TEMPLATE_ID,SOURCE_ID', varg, [loCaseInsensitive]) then
      begin
      result := False;
      DataModuleClient.Template_Details.Insert;
      DataModuleClient.Template_DetailsSOURCE_ID.Value := Varg[1];
      Vargacc := DataModuleClient.Imported_DataUpdateACCOUNT_TITLE.value;
      if DataModuleClient.AccountDetails.Locate('ACCOUNT_TITLE', vargacc, []) then
        DataModuleClient.Template_DetailsACCOUNT_NUMBER.Value := DataModuleClient.AccountDetailsACCOUNT_NUMBER.Value;
      DataModuleClient.Template_Details.Post;
      end
    else
      begin
      DATAMODULECLIENT.Imported_DataUpdate.Edit;
      DATAMODULECLIENT.Imported_DataUpdateACCOUNT_NUMBER.Value := DATAMODULECLIENT.Template_DetailsACCOUNT_NUMBER.value;
      DATAMODULECLIENT.Imported_DataUpdate.Post;
      end;
    DataModuleClient.Imported_DataUpdate.Next;
    end;    // while
  DATAMODULECLIENT.Imported_DataUpdate.Active := False;
  DATAMODULECLIENT.Imported_Data.Refresh;
end;

procedure TTBImportF.FormCreate(Sender: TObject);
var
  I : Integer;
begin
  Color := GGlobals.FormColour;
  Panel1.Color := GGlobals.FormColour;
  Deptlbl.Caption := 'Department: ' + DATAMODULECLIENT.DepartmentsREVENUE_GROUP_NAME.Value;
  AddExpenseBtn.Visible := False;
  DMrep1.ButtonGlyphList.GetBitmap(0, CloseBtn.Glyph);

  DataModuleClient.Import_Templates.Active := True;
  DataModuleClient.Template_Details.Active := True;
  DataModuleClient.Import_Header.Active := True;
  DataModuleClient.Imported_Data.Active := True;
  DataModuleClient.Account_Mapping.Active := True;
  for I := 0 to Componentcount - 1 do    // Iterate
    begin
    if (Components[I] is TIB_Query) then
    with Components[I] as TIB_Query do
      begin
      Prepare;
      Open;
      if Active = False then
        ShowMessage('Qry - ' + Name + '. Not Active');
      end;    // with
    end;    // for
end;

procedure TTBImportF.FormClose(Sender: TObject; var Action: TCloseAction);
var
  I : Integer;
begin
//  IB_Transaction1.Commit;
  for I := 0 to Componentcount - 1 do    // Iterate
    begin
    if (Components[I] is TIB_Query) then
    with Components[I] as TIB_Query do
      begin
      UnPrepare;
      Close;
      end;    // with
    end;    // for
  DataModuleClient.Import_Templates.Active := False;
  DataModuleClient.Template_Details.Active := False;
  DataModuleClient.Import_Header.Active := False;
  DataModuleClient.Imported_Data.Active := False;
  DataModuleClient.Account_Mapping.Active := False;
end;

procedure TTBImportF.cxButton2Click(Sender: TObject);
begin
  DataModuleClient.Import_Header.Delete;
end;

procedure TTBImportF.cxButton1Click(Sender: TObject);
begin
  DataModuleClient.Import_Header.Insert;
  cxImportDesc.SetFocus;
end;

procedure TTBImportF.qryImport_DataNewRecord(IB_Dataset: TIB_Dataset);
begin
  qryImport_Data.FieldByName('SEQUENCE_NUMBER').value := 1;
  qryImport_Data.FieldByName('IMPORT_ID').value := DataModuleClient.Import_HeaderIMPORT_ID.value;
  qryImport_Data.FieldByName('ACCOUNT_NUMBER').value := 1500;
end;

procedure TTBImportF.CloseBtnClick(Sender: TObject);
begin
  ModalResult := MrOK;
end;

procedure TTBImportF.MappingtempBtnClick(Sender: TObject);
begin
  if not BalanceOK then exit;
  Application.CreateForm(TImpTemplatesF, ImpTemplatesF);
  ImpTemplatesF.showmodal;
  ImpTemplatesF.free;
  DATAMODULECLIENT.Import_Templates.Refresh;
end;

procedure TTBImportF.AddExpenseBtnClick(Sender: TObject);
var
  varg : variant;
begin
// Ask a question before we add
  if MessageDlg('Insert ''' + DATAMODULECLIENT.Imported_DataACCOUNT_TITLE.Value + ''''
               + #13#10 + 'into the Expense Titles for this business', mtWarning, [mbOK, mbCancel], 0) = MrOk then
    begin
    varg := DATAMODULECLIENT.Imported_DataACCOUNT_TITLE.Value;
    DATAMODULECLIENT.ExpAccounts.Active := True;
    DATAMODULECLIENT.ExpAccounts.Insert;
    DATAMODULECLIENT.ExpAccountsACCOUNT_TITLE.Value := DATAMODULECLIENT.Imported_DataACCOUNT_TITLE.Value;
    DATAMODULECLIENT.ExpAccounts.Post;
//    DATAMODULECLIENT.UpdateExpOrder;
    if DATAMODULECLIENT.ExpAccounts.Locate('ACCOUNT_TITLE', Varg, []) then
      begin
      DATAMODULECLIENT.Imported_Data.Edit;
      DATAMODULECLIENT.Imported_DataACCOUNT_NUMBER.Value := DATAMODULECLIENT.ExpAccountsACCOUNT_NUMBER.Value;
      DATAMODULECLIENT.Imported_Data.post;
      end;
    DATAMODULECLIENT.ExpAccounts.Active := False;
    DATAMODULECLIENT.Account_Mapping.Refresh;
    DATAMODULECLIENT.Imported_Data.Refresh;
    end;
end;

procedure TTBImportF.PageControl1Change(Sender: TObject);
begin
  If PageControl1.ActivePageIndex = 1 then
    begin
    AddExpenseBtn.Visible := True;
    AccountMappingOK;
    end
  else
    AddExpenseBtn.Visible := False;
  If PageControl1.ActivePageIndex = 2 then
    begin
    DATAMODULECLIENT.MappedDataQuery.Params[0].Value := DATAMODULECLIENT.Import_HeaderIMPORT_ID.Value;
    DATAMODULECLIENT.MappedDataQuery.Active := True;
    end
  else
    DATAMODULECLIENT.MappedDataQuery.Active := False;
end;

procedure TTBImportF.cxButton4Click(Sender: TObject);
var
  varg : Variant;
begin
  if messagedlg('Pressing OK will update the selected template with the account mapping'
               + #13#10 + 'used with the data shown under ''Imported Data''.', mtInformation, [mbOK, mbCancel], 0) = mrOK then
    begin
    varg := VarArraycreate([0,1], VarVariant);
    Varg[0] := DATAMODULECLIENT.Import_HeaderTEMPLATE_ID.Value;
    DATAMODULECLIENT.Imported_Data.First;
    while DATAMODULECLIENT.Imported_Data.Eof = false do
      begin
      if DATAMODULECLIENT.Import_HeaderUSE_ACCOUNT_NUMBER.Value > 0 then
        varg[1] := DATAMODULECLIENT.Imported_DataACC_NUMBER.Value
      else
        varg[1] := DATAMODULECLIENT.Imported_DataACCOUNT_TITLE.Value;
      if not DATAMODULECLIENT.Template_Details.Locate('TEMPLATE_ID;SOURCE_ID', varg, []) then
        begin
        DATAMODULECLIENT.Template_Details.Insert;
        DATAMODULECLIENT.Template_DetailsTEMPLATE_ID.Value := DATAMODULECLIENT.Import_HeaderTEMPLATE_ID.Value;
        DATAMODULECLIENT.Template_DetailsSOURCE_ID.Value := varg[1];
        end
      else
        DATAMODULECLIENT.Template_Details.Edit;
      DATAMODULECLIENT.Template_DetailsACCOUNT_NUMBER.Value := DATAMODULECLIENT.Imported_DataACCOUNT_NUMBER.Value;
      DATAMODULECLIENT.Template_Details.Post;
      DATAMODULECLIENT.Imported_Data.Next;
      end;    // while
    end;
end;

procedure TTBImportF.PostDataBtnClick(Sender: TObject);
var
  varg : Variant;
  varGroup : Variant;
  varActual : Variant;
  tempbalance : Currency;
  TmpTotalExpenses : currency;
begin
// Check to see if this is what is intented
  if Messagedlg('Mapped data is about to be posted to the specified destination.'
    + #13#10 + 'If you are sure that your mapping is completed, Press ''OK''', mtinformation, [mbOK,mbCancel], 0) = mrOK then
    begin
    // Past Information
    if DATAMODULECLIENT.Import_HeaderDESTINATION.Value = 'Past Information' then
      begin
      // Activate our source!!
      DATAMODULECLIENT.AccountGroups.Active := True;
      DATAMODULECLIENT.MappedDataPost.Params[0].Value := DATAMODULECLIENT.Import_HeaderIMPORT_ID.Value;
      DATAMODULECLIENT.MappedDataPost.Active := True;
      //    Check date range - create if not available
      varg := DATAMODULECLIENT.Import_HeaderPERIOD_END.Value;
      if not DATAMODULECLIENT.DateRangers.Locate('ENDDATE', varg, []) then
        begin
        DATAMODULECLIENT.DateRangers.Insert;
        DATAMODULECLIENT.DateRangersDEPT_ID.Value := DATAMODULECLIENT.DepartmentsDEPT_ID.value;
        DATAMODULECLIENT.DateRangersENDDATE.Value := DATAMODULECLIENT.Import_HeaderPERIOD_END.Value;
        end
      else
        DATAMODULECLIENT.DateRangers.edit;
      DATAMODULECLIENT.DateRangersSTARTDATE.Value := DATAMODULECLIENT.Import_HeaderPERIOD_START.Value;
      DATAMODULECLIENT.DateRangers.Post;
      //    Post all balances overwriting any existing data
      varActual := VarArraycreate([0,2], VarVariant);
      VarActual[0] := DATAMODULECLIENT.Import_HeaderDEPT_ID.Value;
      VarActual[2] := DATAMODULECLIENT.Import_HeaderPERIOD_END.Value;
      TmpTotalExpenses := 0;
      DATAMODULECLIENT.MappedDataPost.First;
      while DATAMODULECLIENT.MappedDataPost.Eof = False do
        begin
        if (DATAMODULECLIENT.MappedDataPostACCOUNT_NUMBER.Value < FIRSTBALANCESHEET) then
          begin
          varg := DATAMODULECLIENT.MappedDataPostACCOUNT_NUMBER.Value;
          DATAMODULECLIENT.AccountDetails.Locate('ACCOUNT_NUMBER', varg, []);
          varActual[1] := DATAMODULECLIENT.MappedDataPostACCOUNT_NUMBER.Value;
          if not DATAMODULECLIENT.ActualData.Locate('DEPT_ID;ACCOUNT_NUMBER;PERIODEND', varactual, []) then
            begin
            DATAMODULECLIENT.ActualData.Insert;
            DATAMODULECLIENT.ActualDataDEPT_ID.Value := DATAMODULECLIENT.Import_HeaderDEPT_ID.Value;
            DATAMODULECLIENT.ActualDataACCOUNT_NUMBER.Value := DATAMODULECLIENT.MappedDataPostACCOUNT_NUMBER.Value;
            DATAMODULECLIENT.ActualDataPERIODEND.Value := DATAMODULECLIENT.Import_HeaderPERIOD_END.Value;
            end
          else
            DATAMODULECLIENT.ActualData.Edit;
          varGroup := DATAMODULECLIENT.AccountDetailsACCOUNT_GROUP.Value;
          DATAMODULECLIENT.accountGroups.Locate('ACCOUNT_GRP_ID', vargroup, []);
          if DATAMODULECLIENT.AccountGroupsGROUP_DR_SIGN.Value > 0 then
            DATAMODULECLIENT.ActualDataBAL.Value := DATAMODULECLIENT.MappedDataPostDRAMOUNT.Value - DATAMODULECLIENT.MappedDatapostCRAMOUNT.Value
          else
            DATAMODULECLIENT.ActualDataBAL.Value := DATAMODULECLIENT.MappedDataPostCRAMOUNT.Value - DATAMODULECLIENT.MappedDataPostDRAMOUNT.Value;
          if (DATAMODULECLIENT.MappedDataPostACCOUNT_NUMBER.Value >=  FIRSTEXPENSE) and
            (DATAMODULECLIENT.MappedDataPostACCOUNT_NUMBER.Value <  TOTALEXPENSES) then
             TmpTotalExpenses := TmpTotalExpenses + DATAMODULECLIENT.ActualDataBAL.Value;
          DATAMODULECLIENT.ActualData.Post;
          end;
        DATAMODULECLIENT.MappedDataPost.Next;
        end;    // while
      if TmpTotalExpenses <> 0 then
        begin
        varg := TOTALEXPENSES;
        DATAMODULECLIENT.AccountDetails.Locate('ACCOUNT_NUMBER', varg, []);
        varActual[1] := TOTALEXPENSES;
        if not DATAMODULECLIENT.ActualData.Locate('DEPT_ID;ACCOUNT_NUMBER;PERIODEND', varactual, []) then
          begin
          DATAMODULECLIENT.ActualData.Insert;
          DATAMODULECLIENT.ActualDataDEPT_ID.Value := DATAMODULECLIENT.Import_HeaderDEPT_ID.Value;
          DATAMODULECLIENT.ActualDataACCOUNT_NUMBER.Value := TOTALEXPENSES;
          DATAMODULECLIENT.ActualDataPERIODEND.Value := DATAMODULECLIENT.Import_HeaderPERIOD_END.Value;
          end
        else
          DATAMODULECLIENT.ActualData.Edit;
        varGroup := TOTALEXPENSES;
        DATAMODULECLIENT.accountGroups.Locate('ACCOUNT_GRP_ID', vargroup, []);
        DATAMODULECLIENT.ActualDataBAL.Value := tmpTotalExpenses;
        DATAMODULECLIENT.ActualData.Post;
        end;
      end;
    // Post balance sheet accounts only
    if DATAMODULECLIENT.Import_HeaderDESTINATION.Value = 'Cash Flow Opening Balance' then
      begin
      // Activate our source!!
      DATAMODULECLIENT.AccountGroups.Active := True;
      DATAMODULECLIENT.MappedDataPost.Params[0].Value := DATAMODULECLIENT.Import_HeaderIMPORT_ID.Value;
      DATAMODULECLIENT.MappedDataPost.Active := True;
      //    Check date range - create if not available
      //    Post all balances overwriting any existing data
      DATAMODULECLIENT.MappedDatapost.First;
      while DATAMODULECLIENT.MappedDataPost.Eof = False do
        begin
        if (DATAMODULECLIENT.MappedDataPostACCOUNT_NUMBER.Value >= FIRSTBALANCESHEET) and
           (DATAMODULECLIENT.MappedDataPostACCOUNT_NUMBER.Value <= EQUITY) then
          begin
          varg := DATAMODULECLIENT.MappedDatapostACCOUNT_NUMBER.Value;
          DATAMODULECLIENT.AccountDetails.Locate('ACCOUNT_NUMBER', varg, []);
          varGroup := DATAMODULECLIENT.AccountDetailsACCOUNT_GROUP.Value;
          DATAMODULECLIENT.accountGroups.Locate('ACCOUNT_GRP_ID', vargroup, []);
          if DATAMODULECLIENT.AccountGroupsGROUP_DR_SIGN.Value > 0 then
            tempbalance := DATAMODULECLIENT.MappedDataPostDRAMOUNT.Value - DATAMODULECLIENT.MappedDataPostCRAMOUNT.Value
          else
            tempbalance := DATAMODULECLIENT.MappedDataPostCRAMOUNT.Value - DATAMODULECLIENT.MappedDataPostDRAMOUNT.Value;

          DataCollect.SetPlanBalanceonDateEx(DataModuleClient.DepartmentsDEPT_ID.Value,
                                          DATAMODULECLIENT.Import_HeaderPERIOD_END.Value,
                                          DATAMODULECLIENT.MappedDataPostACCOUNT_NUMBER.Value,
                                          tempBalance);
          end;
        DATAMODULECLIENT.MappedDataPost.Next;
        end;
      end;
    // Targeting Not Implemented Yet!!
    //   if YTD TB - look for the most recent imported data between PS and PE
    //     Create posting list by substracting the older TB from the Newer TB
    //   if Not YTD, direct post to Tracking Jentries
      // Deactivate our source!!
    DATAMODULECLIENT.MappedDataPost.Active := False;
    DATAMODULECLIENT.AccountGroups.Active := False;
    showmessage('Data Imported!');
    end;
end;

procedure TTBImportF.ImportStartDateExit(Sender: TObject);
begin
  if (DataModuleClient.Import_HeaderPERIOD_END.value = 0) or
    (DaySpan(DataModuleClient.Import_HeaderPERIOD_END.value, DataModuleClient.Import_HeaderPERIOD_START.value) > 366) then
    begin
    DataModuleClient.Import_Header.edit;
    DataModuleClient.Import_HeaderPERIOD_END.value := IncYear(DataModuleClient.Import_HeaderPERIOD_START.value) - 1;
    DataModuleClient.Import_Header.Post;
    end;
  if (CompareDateTime(DataModuleClient.Import_HeaderPERIOD_START.value, DataModuleClient.Import_HeaderPERIOD_END.value) >= 0) then
    begin
    MessageDlg('Plan End date can not be before the the Start Date = ' + DataModuleClient.Import_HeaderPERIOD_START.asstring + #13#10 + 'A suggested End Date has been made. Please edit if necessary.', mtInformation, [mbOK], 0);
    DataModuleClient.Import_Header.edit;
    DataModuleClient.Import_HeaderPERIOD_END.value := IncYear(DataModuleClient.Import_HeaderPERIOD_START.value, 1) - 1;
    DataModuleClient.Import_Header.Post;
    end;
  DataModuleClient.ClientDatabase.Refresh(true);
end;

end.
