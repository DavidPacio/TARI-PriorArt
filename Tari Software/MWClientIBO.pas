unit MWClientIBO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Data.DB,
  Vcl.StdCtrls, IB_Utils, IB_ArrayGrid, IBODataset, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  Vcl.Menus, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxButtons, cxLabel, cxTextEdit, cxDBLabel, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxCurrencyEdit, cxDBEdit, DMRep1U,
  cxMemo, DMClient, DMUsers, Datacollector, LGlobals, TBFiles, cxGroupBox,
  cxCheckGroup, dxBevel, cxNavigator, cxDBNavigator, auchtypes, InvoiceClass,
  DateUtils, cxCheckBox;

type
  TMWClientForm = class(TForm)
    Username: TcxTextEdit;
    Passwordtxt: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    LoginLabel: TcxLabel;
    LoginBtn: TcxButton;
    TSBusinessSelect: TcxLookupComboBox;
    cxMemo1: TcxMemo;
    TSLinkBtn: TcxButton;
    cxDBLabel2: TcxDBLabel;
    cxDBLabel3: TcxDBLabel;
    cxDBLabel4: TcxDBLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel7: TcxLabel;
    SelectionGroup: TcxCheckGroup;
    ImportBtn: TcxButton;
    ExportBtn: TcxButton;
    dxBevel1: TdxBevel;
    cxLabel6: TcxLabel;
    CloseBtn: TcxButton;
    cxDBNavigator1: TcxDBNavigator;
    DeselectAllBtn: TcxButton;
    SelectAllBtn: TcxButton;
    RemainLoggedInBtn: TcxCheckBox;
    procedure LoginBtnClick(Sender: TObject);
    procedure cxDBLookupComboBox1PropertiesEditValueChanged(Sender: TObject);
    procedure TSLinkBtnClick(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure ImportBtnClick(Sender: TObject);
    procedure ExportBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TSBusinessSelectEnter(Sender: TObject);
    procedure SelectAllBtnClick(Sender: TObject);
    procedure DeselectAllBtnClick(Sender: TObject);
    procedure RemainLoggedInBtnClick(Sender: TObject);
  private
    { Private declarations }
    CurrentDepartmentID : integer;
    CurrentBusinessID : integer;
    Procedure setTSLinkBtnCaption;
    Function SelectLocalFile:Boolean;
    procedure setSelection(Selected : Boolean);
    procedure Enablecontrols(Enable : Boolean);
    procedure getSelectedTSBusiness(ID:Integer);
    procedure getTSConnectionDetails(Busid : integer);
    procedure SelectLocalDepartments;
    Function SelectDepartment(TB_Department: Variant):Boolean;
    Procedure handleDepartmentChange(var Msg : TDMCIntMessage); message LoDepartmentChange;
    Procedure UpdateSeries(ArrayItem, AccountNo: Integer);
    procedure CalculateArray(Accountno: integer);
    Function hasLink(DeptID : integer): Boolean;
    procedure AttemptConnection;
    procedure ImportAnalysisData;
    procedure ImportAnalysisInvoices;
    procedure ImportTargetData;
    procedure ImportTrackingInvoices;
    procedure ExportAnalysisData;
    procedure ExportAnalysisInvoices;
    procedure ExportTargetData;
    procedure ExportTrackingInvoices;
    procedure UpdateMonitoring;
  public
    { Public declarations }
  end;

var
  MWClientForm: TMWClientForm;

implementation

{$R *.dfm}
 uses DMTariMWCli;

procedure TMWClientForm.LoginBtnClick(Sender: TObject);
begin
  if LoginBtn.Caption = 'Logout' then
    begin
    DMTariMwClient.BreakConnections;
    LoginBtn.Caption := 'Login';
    end
  else
    begin
    screen.Cursor := crHourGlass;
    DMTariMwClient.MakeConnections;
    DMTariMWClient.LoginQuery.Active := false;
    CurrentMemberID := -1;
    DMTariMWClient.LoginQuery.Query.text:= '@TARILOGIN';
    DMTariMWClient.LoginQuery.FieldDefs.Update;
    DMTariMWClient.LoginQuery.Params.ParamByName('USERNAME').AsString := Username.Text;
    DMTariMWClient.LoginQuery.Params.ParamByName('PASSWORD').AsString := PasswordTxt.Text;
    DMTariMWClient.LoginQuery.Active := true;
    if DMTariMWClient.LoginQuery.FieldByName('ID').isnull then
      LoginLabel.Caption := 'Login Failed'
    else
      begin
     if RemainLoggedInBtn.Checked then
        begin
        GGlobals.TS_Login := Username.Text;
        GGlobals.TS_Password := PasswordTxt.Text;
        end;
      LoginBtn.Caption := 'Logout';
      LoginLabel.Caption := 'Logged in as : ' + DMTariMWClient.LoginQuery.FieldByName('Firstname').AsString + ' ' + DMTariMWClient.LoginQuery.FieldByName('Lastname').AsString;
      CurrentMemberID := DMTariMWClient.LoginQuery.FieldByName('Id').AsInteger;
      // now we get the businesses attached to this member excluding samples and consolidations
      SelectLocalDepartments;  // this must be opened before we get memberbusinesses
      DMTariMWCLient.MemberBusinessesQuery.Active := false;
      DMTarimwClient.MemberBusinessesQuery.FieldDefs.Update;
      DMTariMWClient.MemberBusinessesQuery.Params.ParamByName('MEMBERID').AsInteger := CurrentMemberID;
      DMTariMWCLient.MemberBusinessesQuery.Active := True;
      SelectLocalDepartments;
      if DMTariMWClient.AliasQuery.RecordCount > 0 then
        begin
        // does the the current department on this file have a link
        if hasLink(DataModuleClient.DepartmentsDEPT_ID.AsInteger) then
          begin
          TSBusinessSelect.EditValue := DMTariMWClient.AliasQuery.FieldByName('BUSINESS_ID').AsInteger;
          getSelectedTSBusiness(DMTariMWClient.AliasQuery.FieldByName('BUSINESS_ID').AsInteger);
          end;
        end;
      end;
    screen.Cursor := crDefault;
    end;
end;

procedure TMWClientForm.RemainLoggedInBtnClick(Sender: TObject);
begin
  if RemainLoggedInBtn.Checked then
    begin
    GGlobals.TS_Login := Username.Text;
    GGlobals.TS_Password := PasswordTxt.Text;
    end
  else
    begin
    GGlobals.TS_Login := '';
    GGlobals.TS_Password := '';
    end;
end;

function TMWClientForm.hasLink(DeptID: Integer): Boolean;
begin
  Result := false;
  if DMTariMWClient.AliasQuery.Locate('TB_DEPTID', variant(DeptID), []) then
    Result := true;
end;

procedure TMWClientForm.TSBusinessSelectEnter(Sender: TObject);
begin
// here's where we gently close the current connection to restart
  DMTariMWClient.ResolveBusiness;
  SetSelection(False);
  EnableControls(false);
end;

procedure TMWClientForm.TSLinkBtnClick(Sender: TObject);
begin
  // here's where we start create or delete a link.
  // before we create a new link, we check to see that the current business is not linked to another TS business.
  if DMTariMwClient.TBConnectQuery.FieldByName('Business_id').IsNull then
    begin
    DMTariMwClient.TBConnectQuery.Insert;
    DMTariMwClient.TBConnectQuery.FieldByName('Business_id').AsInteger := TSBusinessSelect.EditValue;
    DMTariMwClient.TBConnectQuery.FieldByName('TB_ALIAS').AsString := DataModuleClient.ClientDatabase.AliasName;
    DMTariMwClient.TBConnectQuery.FieldByName('TB_DEPTID').AsInteger := DataModuleClient.DepartmentsDEPT_ID.AsInteger;
    DMTariMwClient.TBConnectQuery.FieldByName('DATE_CREATED').AsDateTime := now;
    DMTariMwClient.TBConnectQuery.FieldByName('LAST_MODIFIED').AsDateTime := DMTariMwClient.TBConnectQuery.FieldByName('DATE_CREATED').AsDateTime;
    DMTariMWClient.TBConnectQuery.Post;
    end
  else
    DMTariMwClient.TBConnectQuery.Delete;
  DMTariMWClient.TBConnectQuery.Resolve();
  // now we requery based on the current file and its alias.
  SelectLocalDepartments;
  AttemptConnection;
end;

Function TMWClientform.SelectLocalFile: Boolean;
begin
  result := false;
  if (TBfile.ConnectFile(DMTariMwClient.TBConnectQuery.FieldByName('TB_ALIAS').AsString, '')) then
    begin
    GGlobals.Servers.CurrentServer.CurrentDBAlias := DMTariMwClient.TBConnectQuery.FieldByName('TB_ALIAS').AsString;
    selectLocalDepartments;
    DMTariMWClient.MemberBusinessesQuery.Refresh;
    Result := SelectDepartment(DMTariMwClient.TBConnectQuery.FieldByName('TB_DEPTID').AsVariant);
    end;
end;

procedure TMWClientForm.SelectAllBtnClick(Sender: TObject);
begin
  SetSelection(True);
end;

Function TMWClientForm.SelectDepartment(TB_Department: Variant): Boolean;
begin
  Result := DataModuleClient.Departments.Locate('DEPT_ID', TB_Department, []);
end;

procedure TMWClientform.SelectLocalDepartments;
begin
  DMTariMWCLient.AliasQuery.Active := false;
  DMTarimwClient.AliasQuery.FieldDefs.Update;
  DMTariMWClient.AliasQuery.Params.ParamByName('ALIAS').Asstring := GGlobals.Servers.CurrentServer.CurrentDBAlias;
  DMTariMWClient.AliasQuery.Params.ParamByName('MEMBERID').AsInteger := CurrentMemberID;
  DMTariMWCLient.AliasQuery.Active := True;
end;

procedure TMWClientForm.CloseBtnClick(Sender: TObject);
begin
   DMTariMwClient.BreakConnections;
   LoginBtn.Caption := 'Login';
   MWClientForm.ModalResult := mrOK;
end;

procedure TMWClientForm.cxDBLookupComboBox1PropertiesEditValueChanged(
  Sender: TObject);
begin
  AttemptConnection;
end;
procedure TMWClientForm.DeselectAllBtnClick(Sender: TObject);
begin
  SetSelection(False);
end;

procedure TMWClientForm.AttemptConnection;
var
  LinkFound : Boolean;
begin
  LinkFound := false;
  SetSelection(False);
  EnableControls(false);
// Before we get a business, lets see if there's a link to the current Department.
  getTSConnectionDetails(TSBusinessSelect.EditValue);
  if Not DMTariMWClient.TBConnectQuery.FieldByName('BUSINESS_ID').IsNull then
    begin
    //
    if (DMTariMwClient.TBConnectQuery.FieldByName('TB_ALIAS').AsString <> GGlobals.Servers.CurrentServer.CurrentDBAlias) then
      LinkFound := SelectLocalFile
    else
      LinkFound := SelectDepartment(DMTariMwClient.TBConnectQuery.FieldByName('TB_DEPTID').AsVariant);
    end;
  If Linkfound then
    getSelectedTSBusiness(TSBusinessSelect.EditValue);
  setTSLinkBtnCaption;
end;

procedure TMWClientForm.getSelectedTSBusiness(ID: Integer);
begin
  DMTariMWClient.BusinessQuery.Active := false;
  DMTariMWClient.BusinessQuery.FieldDefs.Update;
  DMTariMWClient.BusinessQuery.Params.ParamByName('BUSINESSID').AsInteger := ID;
  DMTariMWClient.BusinessQuery.Active := true;
  DMTariMWClient.PastDataQuery.Active := false;
  DMTariMWClient.PastDataQuery.FieldDefs.Update;
  DMTariMWClient.PastDataQuery.Active := true;
  DMTariMWClient.TargetDataQuery.Active := false;
  DMTariMWClient.TargetDataQuery.FieldDefs.Update;
  DMTariMWClient.TargetDataQuery.Active := true;
  DMTariMWClient.PastInvoicesQuery.Active := false;
  DMTariMWClient.PastInvoicesQuery.FieldDefs.Update;
  DMTariMWClient.PastInvoicesQuery.Active := true;
  DMTariMWClient.CurrentInvoicesQuery.Active := false;
  DMTariMWClient.CurrentInvoicesQuery.FieldDefs.Update;
  DMTariMWClient.CurrentInvoicesQuery.Active := true;
  DMTariMWClient.MonthlyTargetsQuery.Active := False;
  DMTariMWClient.MonthlyTargetsQuery.FieldDefs.Update;
  DMTariMWClient.MonthlyTargetsQuery.Active := True;
end;

procedure TMWClientForm.getTSConnectionDetails(Busid: Integer);
begin
  DMTariMWClient.TBConnectQuery.Active := False;
  DMTariMWClient.TBConnectQuery.FieldDefs.Update;
  DMTariMWClient.TBConnectQuery.Params.ParamByName('BUSINESS_ID').AsInteger := Busid;
  DMTariMWClient.TBConnectQuery.active := true;
end;
procedure TMWClientForm.ExportBtnClick(Sender: TObject);
begin
  CurrentBusinessID := DMTariMwClient.TBConnectQuery.FieldByName('BUSINESS_ID').AsInteger;
  if SelectionGroup.States[0] = cbschecked then
    ExportAnalysisData;
  if SelectionGroup.States[1] = cbschecked then
    ExportAnalysisInvoices;
  if SelectionGroup.States[2] = cbschecked then
    ExportTargetData;
  if SelectionGroup.States[3] = cbschecked then
    ExportTrackingInvoices;
  showmessage('Export Completed!');
end;

procedure TMWClientForm.FormShow(Sender: TObject);
begin
  EnableControls(false);
  if GGlobals.TS_Login <> '' then
    begin
    Username.Text := GGLobals.TS_Login;
    Passwordtxt.Text := GGLobals.TS_Password;
    RemainLoggedInBtn.Checked := true;
    if DMTariMwClient.kbmMWClientConnectionPool1.CurConnections > 0 then
      DMTariMwClient.BreakConnections;
    LoginBtnClick(sender);
    screen.Cursor := crDefault;
    MWClientForm.Refresh;
    end;
end;

procedure TMWClientForm.handleDepartmentChange(var Msg: TDMCIntMessage);
begin
  if (msg.LParam^ = POSTING) then
    begin
    if (DMTariMWClient.AliasQuery.Locate('TB_DEPTID', Variant(Msg.WParam^), [])) then
      TSBusinessSelect.EditValue := DMTariMWClient.AliasQuery.FieldByName('BUSINESS_ID').AsInteger
    else
      begin
      SetSelection(False);
      EnableControls(false);
      setTSLinkBtnCaption;
      end;
    end;
end;
procedure TMWClientForm.ImportBtnClick(Sender: TObject);
begin
  CurrentDepartmentID := DataModuleClient.DepartmentsDEPT_ID.Value;
  if (DataModuleClient.DepartmentsSingular_UnitDesc.IsNull) or (DataModuleClient.DepartmentsSingular_UnitDesc.AsString = '') then
    begin
    DataModuleClient.Departments.Edit;
    DataModuleClient.DepartmentsSingular_UnitDesc.AsString := DMTariMwClient.BusinessQuery.FieldByName('Singular_Name').AsString;
    DataModuleClient.DepartmentsPlural_UnitDesc.AsString := DMTariMwClient.BusinessQuery.FieldByName('Plural_Name').AsString;
    DataModuleClient.Departments.Post;
    end;
  if SelectionGroup.States[0] = cbschecked then
    ImportAnalysisData;
  if SelectionGroup.States[1] = cbschecked then
    ImportAnalysisInvoices;
  if SelectionGroup.States[2] = cbschecked then
    ImportTargetData;
  if SelectionGroup.States[3] = cbschecked then
    ImportTrackingInvoices;
  showmessage('Import Completed!');
end;

Procedure TMWClientForm.setTSLinkBtnCaption;
var
  linked : boolean;
begin
  if DMTariMwClient.TBConnectQuery.FieldByName('Business_id').IsNull then
    TSLinkBtn.Caption := 'Click to Link Current Files/Departments'
  else
    begin
    if DMTariMwClient.TBConnectQuery.FieldByName('TB_alias').AsString <> GGlobals.Servers.CurrentServer.CurrentDBAlias then
      linked := SelectlocalFile
    else
      linked := true;
    if not linked then
      TSLinkBtn.Caption := 'Local File Not found (Click to Delete Link)'
    else
      begin
      TSLinkBtn.Caption := 'Current Files/Departments Linked' + #10#13 + '(Click to Delete Link)';
      EnableControls(true);
      end;
    end;
end;

Procedure TMWClientForm.setSelection(Selected : Boolean);
var
  i : integer;
  cbsLocal : TcxCheckBoxState;
begin
  if Selected then
    cbsLocal := cbsChecked
  else
    cbsLocal := cbsUnchecked;
  for I := 0 to SelectionGroup.Properties.Items.Count - 1 do
    SelectionGroup.States[i] := cbslocal;
end;

procedure TMWClientForm.Enablecontrols(Enable: Boolean);
begin
  if Enable = false then
    SetSelection(false);
  SelectionGroup.Enabled := enable;
  ImportBtn.Enabled := enable;
  ExportBtn.Enabled := enable;
  SelectAllBtn.Enabled := enable;
  DeselectAllBtn.Enabled := enable;
end;

procedure TMWClientForm.ImportAnalysisData;
var
  DateIndex : integer;
  rangefound : boolean;
  PValue : Currency;
begin
  // Id;Business_Id;Ps_Date;Pe_Date;Isplan;Sales;Grossprofit;Total_Expenses;Potential_Units;Billed_Units
  DataModuleClient.DeptRef.Refresh;
  DATAMODULECLIENT.DateRangers.Refresh;
  // set up a date rangers entry if there is no matching range.
  dateindex := 1;
  rangefound := false;
  if DATAMODULECLIENT.DateRangers.RecordCount > 0 then
    begin
    rangefound := DATAMODULECLIENT.DateRangers.Locate('ENDDATE', DMTariMWClient.PastDataQuery.FieldByName('PE_DATE').AsVariant, []);
    if not rangefound then
      begin
      DATAMODULECLIENT.DateRangers.First;
      while DATAMODULECLIENT.DateRangers.Eof = false do
        begin
        if DATAMODULECLIENT.DateRangersD_INDEX.Value > Dateindex then
          dateindex := DATAMODULECLIENT.DateRangersD_INDEX.Value;
        DATAMODULECLIENT.DateRangers.Next;
        end;
      end;
    end;
  if not rangefound then
    begin
    DATAMODULECLIENT.DateRangers.Insert;
    DATAMODULECLIENT.DateRangersDEPT_ID.Value := CurrentDepartmentID;
    DATAMODULECLIENT.DateRangersENDDATE.Value := DMTariMWClient.PastDataQuery.FieldByName('PE_DATE').AsDateTime;
    DATAMODULECLIENT.DateRangersSTARTDATE.Value := DMTariMWClient.PastDataQuery.FieldByName('PS_DATE').AsDateTime;
    DATAMODULECLIENT.DateRangersD_INDEX.Value := dateindex;
    DATAMODULECLIENT.DateRangers.Post;
    DataModuleClient.DateRef.Refresh;
    end;
  // now we find or insert account details for the period.
  // account are 10 sales, 110 cogs, 210 GP, 980, 990, 100 units, 90 potential
  pValue := DMTariMWClient.PastDataQuery.FieldByName('SALES').AsCurrency;
  datacollect.setPastBalance( @pvalue, 10);
  pValue := DMTariMWClient.PastDataQuery.FieldByName('SALES').AsCurrency - DMTariMWClient.PastDataQuery.FieldByName('GROSSPROFIT').AsCurrency;
  datacollect.setPastBalance( @pvalue, 110);
  pValue := DMTariMWClient.PastDataQuery.FieldByName('GROSSPROFIT').AsCurrency;
  datacollect.setPastBalance( @pvalue, 210);
  pValue := DMTariMWClient.PastDataQuery.FieldByName('TOTAL_EXPENSES').AsCurrency;
  datacollect.setPastBalance( @pvalue, 980); // we assume that total other expenses = total expenses
  datacollect.setPastBalance( @pvalue, 990);
  pValue := DMTariMWClient.PastDataQuery.FieldByName('POTENTIAL_UNITS').AsCurrency;
  datacollect.setPastBalance( @pvalue, 90);
  pValue := DMTariMWClient.PastDataQuery.FieldByName('BILLED_UNITS').AsCurrency;
  datacollect.setPastBalance( @pvalue, 100);
end;

Procedure TMWCLientForm.ImportAnalysisInvoices;
var
  InvoiceO : TInvoiceDetail;
  invIndex : integer;
  InvoiceRec : TInvoiceRecPtr;
begin
  Datamoduleclient.DateRangers.Locate('ENDDATE', DMTariMWClient.PastDataQuery.FieldByName('PE_DATE').AsVariant, []);
  InvoiceO := TInvoiceDetail.create(Integer(AnalysisInv), DataModuleClient.DateRangersStartDate.Value, DataModuleClient.DateRangersEndDate.Value);
  InvoiceO.LoadInvoices;
  DMTariMWClient.PastInvoicesQuery.First;
  while DMTariMWClient.PastInvoicesQuery.Eof = false do
    begin
    invindex := InvoiceO.LocateInvoice(DMTariMWClient.PastInvoicesQuery.FieldByName('INV_DATE').AsDateTime,
        DMTariMWClient.PastInvoicesQuery.FieldByName('INV_NO').AsString);
    if invIndex >= 0 then
      InvoiceRec := InvoiceO.GetInvoice(invindex)
    else
      begin
      InvoiceRec := InvoiceO.CreateNewInvoiceRecord;
      InvoiceRec.Depart_ID := CurrentDepartmentID;;
      InvoiceRec.Inv_Type := AnalysisInv;
      InvoiceRec.Invoice_Date := DMTariMWClient.PastInvoicesQuery.FieldByName('INV_DATE').AsDateTime;
      InvoiceRec.Invoice_Number := DMTariMWClient.PastInvoicesQuery.FieldByName('INV_NO').AsString;
      end;
    InvoiceRec.NetSales := DMTariMWClient.PastInvoicesQuery.FieldByName('INV_SALE').AsCurrency;
    InvoiceRec.materials := DMTariMWClient.PastInvoicesQuery.FieldByName('INV_COGS').AsCurrency;
    InvoiceRec.subcon := 0;
    InvoiceRec.gross := DMTariMWClient.PastInvoicesQuery.FieldByName('INV_SALE').AsCurrency - DMTariMWClient.PastInvoicesQuery.FieldByName('INV_COGS').AsCurrency;
    InvoiceRec.Units := DMTariMWClient.PastInvoicesQuery.FieldByName('INV_UNITS').AsCurrency;
    DMTariMWClient.PastInvoicesQuery.Next;
    end;
  InvoiceO.saveInvoices;
  InvoiceO.Destroy;
end;

Procedure TMWClientform.ImportTargetData;
var
  I, J, summaryType, AccountNo : integer;
  Y, m, d : Word;
  PlanDataRec: TPlanDataRecPtr;
  PlanSalesRec : TPlanDataRecPtr;
  PlanGPRec : TPlanDataRecPtr;
  PlanBilledRec : TPlanDataRecPtr;
  PlanPotentialRec : TPlanDataRecPtr;
  PlanGPUnitRec : TPlanDataRecPtr;
  PlanGPPCRec : TPlanDataRecPtr;
  PlanExpRec : TPlanDataRecPtr;
  DBalance : Currency;
begin
  // Id;Business_Id;Ps_Date;Pe_Date;Isplan;Sales;Grossprofit;Total_Expenses;Potential_Units;Billed_Units
  //  Business_Id;Account_Id;Mth;Balance
  //First ensure that the planningstart and planningend dates for current department are set to the imported values
  DatamoduleClient.Departments.Edit;
  Datamoduleclient.DepartmentsCURRENTPLANSTART.Value := DMTariMWClient.TargetDataQuery.FieldByName('PS_DATE').AsDateTime;
  Datamoduleclient.DepartmentsCURRENTPLANEND.Value := DMTariMWClient.TargetDataQuery.FieldByName('PE_DATE').AsDateTime;
  DataModuleClient.DepartmentsCurrentMonitoringStart.value := DMTariMWClient.TargetDataQuery.FieldByName('PS_DATE').AsDateTime;
  DataModuleClient.DepartmentsCurrentMonitoringEnd.value := DMTariMWClient.TargetDataQuery.FieldByName('PE_DATE').AsDateTime;
  DatamoduleClient.Departments.post;
  DataCollect.GetConsolidatedList(DataModuleClient.DepartmentsDEPT_ID.Value, ctNormal);
  if DataCollect.Planloaded = false then
    Begin
    DataCollect.psdate := DataModuleClient.DepartmentsCurrentPlanStart.value;
    DataCollect.pedate := DataModuleClient.DepartmentsCurrentPlanEnd.value;
    DataCollect.getPlanningData;
    end;
  SummaryType := 4;
  createSummaryIndex(SummaryType, DataModuleClient.DepartmentsCurrentPlanStart.value, DataModuleClient.DepartmentsCurrentPlanEnd.value);
  for j := 0 to DETAILEDPLANLIST - 1 do    // Iterate
    begin
    PlanDataRec := PlanDataList.items[GetaccountListIndex(DetailedPlan[j])];
    BuildSummary(PlanDataRec.Accountno, DataModuleClient.DepartmentsCurrentPlanStart.value, DataModuleClient.DepartmentsCurrentPlanEnd.value, PlanDataRec.PlanDetail, PlanDataRec.PlanSummary);
    end;    // for
  PlanSalesRec := PlanDataList.Items[GetaccountListIndex(SALES)];
  PlanGPRec := PlanDataList.Items[GetaccountListIndex(GROSSPROFIT)];
  PlanBilledRec := PlanDataList.Items[GetaccountListIndex(BILLED)];
  PlanPotentialRec := PlanDataList.Items[GetaccountListIndex(POTENTIAL)];
  PlanGPUnitRec := PlanDataList.Items[GetaccountListIndex(GPUNIT)];
  PlanGPPCRec := PlanDataList.Items[GetaccountListIndex(GPPC)];
  PlanExpRec := PlanDataList.Items[GetaccountListIndex(TOTALEXPENSES)];

  decodeDate(DataModuleClient.DepartmentsCurrentPlanStart.value, y, m, d);
  DMTariMwClient.MonthlyTargetsQuery.First;
  while DMTariMwClient.MonthlyTargetsQuery.Eof = false do
    begin
    // As we import, we must adjust for the months ie 1 means January.  I is zero based.
    I := DMTariMwClient.MonthlyTargetsQuery.FieldByName('MTH').AsInteger - m;
    if I < 0 then
      I := 12 + I;
    AccountNo := DMTariMwClient.MonthlyTargetsQuery.FieldByName('ACCOUNT_ID').AsInteger;
    DBalance := DMTariMwClient.MonthlyTargetsQuery.FieldByName('BALANCE').AsCurrency;
    if AccountNo = BILLED then
      begin
      PlanbilledRec.PlanSummary[I] := DBalance;
      AccountNo := PlanbilledRec.Accountno;
      end;
    if AccountNo = GPPCACC then
      begin
      PlanGPPCRec.PlanSummary[I] := dBalance;
      AccountNo := PlanGPPCRec.Accountno;
      end;
    if AccountNo = GPBILLED then
      begin
      PlanGPUnitRec.PlanSummary[I] := DBalance;
      AccountNo := PlanGPUnitRec.Accountno;
      end;
    UpdateSeries(I, AccountNo);
    DMTariMwClient.MonthlyTargetsQuery.Next;
    end;
  PlanbilledRec.PlanTotal := Datacollect.GetTotalBalance(PlanBilledRec^.PlanDetail,
        double(DataCollect.psdate), double(DataCollect.psdate), double(DataCollect.pedate));
  if PlanbilledRec.PlanTotal <> DMTariMWClient.TargetDataQuery.FieldByName('BILLED_UNITS').AsCurrency then
    begin
    DataCollect.updateArray(PlanBILLEDRec.Plandetail, 0, DaysBetween(DataCollect.pedate, DataCollect.psdate),
         DMTariMWClient.TargetDataQuery.FieldByName('BILLED_UNITS').AsCurrency, 2);
    PlanBilledRec.PlanTotal := DMTariMWClient.TargetDataQuery.FieldByName('BILLED_UNITS').AsCurrency;
    end;
  DataCollect.updateArray(PlanPotentialRec.Plandetail, 0, DaysBetween(DataCollect.pedate, DataCollect.psdate),
         DMTariMWClient.TargetDataQuery.FieldByName('POTENTIAL_UNITS').AsCurrency, 2);
  PlanPotentialRec.PlanTotal := DMTariMWClient.TargetDataQuery.FieldByName('POTENTIAL_UNITS').AsCurrency;
  CalculateArray(GROSSPROFIT);
  DataCollect.updateArray(PlanGPRec.Plandetail, 0, DaysBetween(DataCollect.pedate, DataCollect.psdate),
         DMTariMWClient.TargetDataQuery.FieldByName('GROSSPROFIT').AsCurrency, 1);
  PlanGPRec.PlanTotal := DMTariMWClient.TargetDataQuery.FieldByName('GROSSPROFIT').AsCurrency;
  CalculateArray(SALES);
  DataCollect.updateArray(PlanSalesRec.Plandetail, 0, DaysBetween(DataCollect.pedate, DataCollect.psdate),
         DMTariMWClient.TargetDataQuery.FieldByName('SALES').AsCurrency, 1);
  PlanSalesRec.PlanTotal := DMTariMWClient.TargetDataQuery.FieldByName('SALES').AsCurrency;
  // we update expenses
  DataCollect.updateArray(PlanExpRec.Plandetail, 0, DaysBetween(DataCollect.pedate, DataCollect.psdate),
         DMTariMWClient.TargetDataQuery.FieldByName('Total_Expenses').AsCurrency, 1);
  PlanExpRec.PlanTotal := DMTariMWClient.TargetDataQuery.FieldByName('Total_Expenses').AsCurrency;
  CalculateArray(NETOPERATINGPROFIT);
  DataCollect.getPlanningExpData(True);  // This will adjust TotalOther Expenses
  Datacollect.setPlanningExpData;
  DataCollect.ClearPlanExpDataList;
  DataCollect.CalcNetProfit;
  DataCollect.SetPlanningData;
  DataCollect.ClearPlanDataList;
end;

Procedure TMWClientForm.ImportTrackingInvoices;
var
  varg : Variant;
begin
  // Id;Business_Id;Inv_Date;Inv_No;Inv_Sale;Inv_Cogs;Inv_Units;Inv_Items;Isquote;Ispast
  DatamoduleClient.Departments.Edit;
  Datamoduleclient.DepartmentsCURRENTPLANSTART.Value := DMTariMWClient.TargetDataQuery.FieldByName('PS_DATE').AsDateTime;
  Datamoduleclient.DepartmentsCURRENTPLANEND.Value := DMTariMWClient.TargetDataQuery.FieldByName('PE_DATE').AsDateTime;
  DataModuleClient.DepartmentsCurrentMonitoringStart.value := DMTariMWClient.TargetDataQuery.FieldByName('PS_DATE').AsDateTime;
  DataModuleClient.DepartmentsCurrentMonitoringEnd.value := DMTariMWClient.TargetDataQuery.FieldByName('PE_DATE').AsDateTime;
  DatamoduleClient.Departments.post;
  DataModuleClient.invoiceType := MonitorInv;
  varg := VarArraycreate([0,4], VarVariant);
  varg[0] := CurrentDepartmentID;
  varg[1] := integer(MonitorInv);  // INVOICETYPE

  DMTariMWClient.CurrentInvoicesQuery.First;
  while DMTariMWClient.CurrentInvoicesQuery.Eof = false do
    begin
    if (DMTariMWClient.CurrentInvoicesQuery.FieldByName('ISQuote').AsInteger = 0) then
      begin
      varg[2] := DMTariMWClient.CurrentInvoicesQuery.FieldByName('INV_DATE').AsDateTime;
      varg[3] := DMTariMWClient.CurrentInvoicesQuery.FieldByName('INV_NO').AsString;
      if DatamoduleClient.ActualInvoiceDetails.Locate('DEPT_ID;INVOICETYPE;INV_DATE;INVOICE_NUMBER', varg, []) then
        DatamoduleClient.ActualInvoiceDetails.Edit
      else
        begin
        DatamoduleClient.ActualInvoiceDetails.Insert;
        DatamoduleClient.ActualInvoiceDetailsDEPT_ID.Value := CurrentDepartmentID;
        DataModuleClient.ActualInvoiceDetailsINV_DATE.Value := DMTariMWClient.CurrentInvoicesQuery.FieldByName('INV_DATE').AsDateTime;
        DataModuleClient.ActualInvoiceDetailsINVOICE_NUMBER.Value := DMTariMWClient.CurrentInvoicesQuery.FieldByName('INV_NO').AsAnsiString;
        end;
      DataModuleClient.ActualInvoiceDetailsNETSALES.Value := DMTariMWClient.CurrentInvoicesQuery.FieldByName('INV_SALE').AsCurrency;
      DataModuleClient.ActualInvoiceDetailsMATERIALSATCOST.Value := DMTariMWClient.CurrentInvoicesQuery.FieldByName('INV_COGS').AsCurrency;
      DataModuleClient.ActualInvoiceDetailsGROSSPROFIT.Value := DataModuleClient.ActualInvoiceDetailsNETSALES.Value - DataModuleClient.ActualInvoiceDetailsMATERIALSATCOST.Value;
      DataModuleClient.ActualInvoiceDetailsUNITSREQUIRED.Value := DMTariMWClient.CurrentInvoicesQuery.FieldByName('INV_UNITS').AsCurrency;
      DatamoduleClient.ActualInvoiceDetails.Post;
      end;
    DMTariMWClient.CurrentInvoicesQuery.Next;
    end;
  //now we must update the monitoring data
  UpdateMonitoring;
end;

procedure TMWClientForm.ExportAnalysisData;
//var
//  DateIndex : integer;
//  rangefound : boolean;
//  PValue : Currency;
//  SalesRec : TPastBalances;
begin
  // Id;Business_Id;Ps_Date;Pe_Date;Isplan;Sales;Grossprofit;Total_Expenses;Potential_Units;Billed_Units
  DataModuleClient.DeptRef.Refresh;
  DATAMODULECLIENT.DateRangers.Refresh;
  DataModuleClient.DateRef.IndexName := 'ENDDATEIDX';
  DataModuleClient.DateRef.Refresh;
  DataModuleClient.DateRef.Last;  // the most recent date
  DataModuleClient.ActualDataLU.Refresh;
  // set up a date rangers entry if there is no matching range.
  if DMTariMWClient.PastDataQuery.RecordCount = 1 then
    DMTariMWClient.PastDataQuery.Edit
  else
    begin
    DMTariMWClient.PastDataQuery.Insert;
    DMTariMWClient.PastDataQuery.FieldByName('BUSINESS_ID').AsInteger := CurrentBusinessID;
    DMTariMWClient.PastDataQuery.FieldByName('ISPLAN').AsInteger := 0; // False
    end;
  DMTariMWClient.PastDataQuery.FieldByName('PS_DATE').AsDateTime := DataModuleClient.DateRefSTARTDATE.AsDateTime;
  DMTariMWClient.PastDataQuery.FieldByName('PE_DATE').AsDateTime := DataModuleClient.DateRefENDDATE.AsDateTime;
  DMTariMWClient.PastDataQuery.FieldByName('SALES').AsCurrency := DataCollect.getPastBalance(SALES, DataModuleClient.DateRefENDDATE.AsDateTime);
  DMTariMWClient.PastDataQuery.FieldByName('GROSSPROFIT').AsCurrency := DataCollect.getPastBalance(GROSSPROFIT, DataModuleClient.DateRefENDDATE.AsDateTime);
  DMTariMWClient.PastDataQuery.FieldByName('TOTAL_EXPENSES').AsCurrency := DataCollect.getPastBalance(TOTALEXPENSES, DataModuleClient.DateRefENDDATE.AsDateTime);
  DMTariMWClient.PastDataQuery.FieldByName('POTENTIAL_UNITS').AsCurrency := DataCollect.getPastBalance(POTENTIAL, DataModuleClient.DateRefENDDATE.AsDateTime);
  DMTariMWClient.PastDataQuery.FieldByName('BILLED_UNITS').AsCurrency := DataCollect.getPastBalance(BILLED, DataModuleClient.DateRefENDDATE.AsDateTime);
  DMTariMWClient.PastDataQuery.Post;
  DMTariMWClient.PastDataQuery.Resolve();
end;

Procedure TMWCLientForm.ExportAnalysisInvoices;
var
  InvoiceO : TInvoiceDetail;
  invIndex : integer;
  InvoiceRec : TInvoiceRecPtr;
  varg : Variant;
begin
  // Id;Business_Id;Inv_Date;Inv_No;Inv_Sale;Inv_Cogs;Inv_Units;Inv_Items;Isquote;Ispast  DataModuleClient.DeptRef.Refresh;
  DATAMODULECLIENT.DateRangers.Refresh;
  DataModuleClient.DateRef.IndexName := 'ENDDATEIDX';
  DataModuleClient.DateRef.Refresh;
  DataModuleClient.DateRef.Last;  // the most recent date
  varg := VarArraycreate([0,2], VarVariant);

  InvoiceO := TInvoiceDetail.create(Integer(AnalysisInv), DataModuleClient.DateRefStartDate.Value, DataModuleClient.DateRefEndDate.Value);
  InvoiceO.LoadInvoices;
  for invIndex := 0 to InvoiceO.InvoiceCount - 1 do
    begin
    InvoiceRec := InvoiceO.GetInvoice(invIndex);
    varg[0] := InvoiceRec.Invoice_Date;
    varg[1] := InvoiceRec.Invoice_Number;
    if DMTariMWClient.PastInvoicesQuery.Locate('INV_DATE;INV_NO', varg, []) then
      DMTariMWClient.PastInvoicesQuery.Edit
    else
      begin
      DMTariMWClient.PastInvoicesQuery.Insert;
      DMTariMWClient.PastInvoicesQuery.FieldByName('ID').AsInteger := 0;
      DMTariMWClient.PastInvoicesQuery.FieldByName('BUSINESS_ID').AsInteger := CurrentBusinessID;
      DMTariMWClient.PastInvoicesQuery.FieldByName('INV_DATE').AsDateTime := InvoiceRec.Invoice_Date;
      DMTariMWClient.PastInvoicesQuery.FieldByName('INV_NO').AsString := InvoiceRec.Invoice_Number;
      DMTariMWClient.PastInvoicesQuery.FieldByName('ISQUOTE').AsInteger := 0;  // False
      DMTariMWClient.PastInvoicesQuery.FieldByName('ISPAST').AsInteger := 1;  // True
      end;
    DMTariMWClient.PastInvoicesQuery.FieldByName('INV_SALE').AsCurrency := InvoiceRec.NetSales;
    DMTariMWClient.PastInvoicesQuery.FieldByName('INV_COGS').AsCurrency := InvoiceRec.NetSales - InvoiceRec.gross;
    DMTariMWClient.PastInvoicesQuery.FieldByName('INV_UNITS').AsCurrency := InvoiceRec.Units;
    DMTariMWClient.PastInvoicesQuery.FieldByName('INV_ITEMS').AsCurrency := 1;
    DMTariMWClient.PastInvoicesQuery.Post;
    end;
  DMTariMWClient.PastInvoicesQuery.Resolve();
  InvoiceO.destroy;
end;

Procedure TMWClientform.ExportTargetData;
var
  I, J, summaryType : integer;
  Y, m, d : Word;
  PlanDataRec: TPlanDataRecPtr;
  PlanSalesRec : TPlanDataRecPtr;
  PlanGPRec : TPlanDataRecPtr;
  PlanBilledRec : TPlanDataRecPtr;
  PlanPotentialRec : TPlanDataRecPtr;
  PlanGPUnitRec : TPlanDataRecPtr;
  PlanGPPCRec : TPlanDataRecPtr;
  PlanExpRec : TPlanDataRecPtr;
//  DBalance : Currency;
  varg : Variant;
begin
  // Id;Business_Id;Ps_Date;Pe_Date;Isplan;Sales;Grossprofit;Total_Expenses;Potential_Units;Billed_Units
  //  Business_Id;Account_Id;Mth;Balance
  DataCollect.GetConsolidatedList(DataModuleClient.DepartmentsDEPT_ID.Value, ctNormal);
  if DataCollect.Planloaded = false then
    Begin
    DataCollect.psdate := DataModuleClient.DepartmentsCurrentPlanStart.value;
    DataCollect.pedate := DataModuleClient.DepartmentsCurrentPlanEnd.value;
    DataCollect.getPlanningData;
    end;
  PlanSalesRec := PlanDataList.Items[GetaccountListIndex(SALES)];
  PlanGPRec := PlanDataList.Items[GetaccountListIndex(GROSSPROFIT)];
  PlanBilledRec := PlanDataList.Items[GetaccountListIndex(BILLED)];
  PlanPotentialRec := PlanDataList.Items[GetaccountListIndex(POTENTIAL)];
  PlanGPUnitRec := PlanDataList.Items[GetaccountListIndex(GPUNIT)];
  PlanGPPCRec := PlanDataList.Items[GetaccountListIndex(GPPC)];
  PlanExpRec := PlanDataList.Items[GetaccountListIndex(TOTALEXPENSES)];
  SummaryType := 4;
  createSummaryIndex(SummaryType, DataModuleClient.DepartmentsCurrentPlanStart.value, DataModuleClient.DepartmentsCurrentPlanEnd.value);
  for j := 0 to DETAILEDPLANLIST - 1 do    // Iterate
    begin
    PlanDataRec := PlanDataList.items[GetaccountListIndex(DetailedPlan[j])];
    BuildSummary(PlanDataRec.Accountno, DataModuleClient.DepartmentsCurrentPlanStart.value, DataModuleClient.DepartmentsCurrentPlanEnd.value, PlanDataRec.PlanDetail, PlanDataRec.PlanSummary);
    end;    // for
  if DMTariMWClient.TargetDataQuery.RecordCount = 1 then
    DMTariMWClient.TargetDataQuery.Edit
  else
    begin
    DMTariMWClient.TargetDataQuery.Insert;
    DMTariMWClient.TargetDataQuery.FieldByName('BUSINESS_ID').AsInteger := CurrentBusinessID;
    DMTariMWClient.TargetDataQuery.FieldByName('ISPLAN').AsInteger := 1;  // True
    end;
  DMTariMWClient.TargetDataQuery.FieldByName('PS_DATE').AsDateTime := DataModuleClient.DepartmentsCurrentPlanStart.AsDateTime;
  DMTariMWClient.TargetDataQuery.FieldByName('PE_DATE').AsDateTime := DataModuleClient.DepartmentsCurrentPlanEnd.AsDateTime;
  DMTariMWClient.TargetDataQuery.FieldByName('SALES').AsCurrency := PlanSalesRec.PlanTotal;
  DMTariMWClient.TargetDataQuery.FieldByName('GROSSPROFIT').AsCurrency := PlanGPRec.PlanTotal;
  DMTariMWClient.TargetDataQuery.FieldByName('Total_Expenses').AsCurrency := PlanExpRec.PlanTotal;
  DMTariMWClient.TargetDataQuery.FieldByName('POTENTIAL_UNITS').AsCurrency := PlanPotentialRec.PlanTotal;
  DMTariMWClient.TargetDataQuery.FieldByName('BILLED_UNITS').AsCurrency := PlanBilledRec.PlanTotal;
  DMTariMWClient.TargetDataQuery.Post;
  DMTariMWClient.TargetDataQuery.Resolve();
  // now we update Monthly Balances
  varg := VarArraycreate([0,3], VarVariant);
  varg[0] := CurrentBusinessID;
  // Ensure GPPC and GPUNIT are calculated
  CalculateArray(GPUNIT);
  CalculateArray(GPPC);
  decodeDate(DataModuleClient.DepartmentsCurrentPlanStart.value, y, m, d);
  for I := 0 to 11 do
    begin
    J := i + m;  // 1 based months starting with January
    if J > 12 then
      J := J - 12;
    varg[2] := J;
    // first account - Billed
    varg[1] := BILLED;
    if DMTariMwClient.MonthlyTargetsQuery.Locate('BUSINESS_ID;ACCOUNT_ID;MTH', varg, []) then
      DMTariMwClient.MonthlyTargetsQuery.Edit
    else
      begin
      DMTariMwClient.MonthlyTargetsQuery.Insert;
      DMTariMwClient.MonthlyTargetsQuery.FieldByName('BUSINESS_ID').AsInteger := DMTariMWClient.AliasQuery.FieldByName('BUSINESS_ID').AsInteger;
      DMTariMwClient.MonthlyTargetsQuery.FieldByName('ACCOUNT_ID').AsInteger := BILLED;
      DMTariMwClient.MonthlyTargetsQuery.FieldByName('MTH').AsInteger := J;
      end;
    DMTariMwClient.MonthlyTargetsQuery.FieldByName('BALANCE').AsCurrency := PlanbilledRec.PlanSummary[I];
    DMTariMwClient.MonthlyTargetsQuery.Post;
    // first account - GPPC
    varg[1] := GPPCACC;
    if DMTariMwClient.MonthlyTargetsQuery.Locate('BUSINESS_ID;ACCOUNT_ID;MTH', varg, []) then
      DMTariMwClient.MonthlyTargetsQuery.Edit
    else
      begin
      DMTariMwClient.MonthlyTargetsQuery.Insert;
      DMTariMwClient.MonthlyTargetsQuery.FieldByName('BUSINESS_ID').AsInteger := CurrentBusinessID;
      DMTariMwClient.MonthlyTargetsQuery.FieldByName('ACCOUNT_ID').AsInteger := GPPCACC;
      DMTariMwClient.MonthlyTargetsQuery.FieldByName('MTH').AsInteger := J;
      end;
    DMTariMwClient.MonthlyTargetsQuery.FieldByName('BALANCE').AsCurrency := PlangppcRec.PlanSummary[I];
    DMTariMwClient.MonthlyTargetsQuery.Post;
    // first account - GPRate
    varg[1] := GPBILLED;
    if DMTariMwClient.MonthlyTargetsQuery.Locate('BUSINESS_ID;ACCOUNT_ID;MTH', varg, []) then
      DMTariMwClient.MonthlyTargetsQuery.Edit
    else
      begin
      DMTariMwClient.MonthlyTargetsQuery.Insert;
      DMTariMwClient.MonthlyTargetsQuery.FieldByName('BUSINESS_ID').AsInteger := DMTariMWClient.AliasQuery.FieldByName('BUSINESS_ID').AsInteger;
      DMTariMwClient.MonthlyTargetsQuery.FieldByName('ACCOUNT_ID').AsInteger := GPBILLED;
      DMTariMwClient.MonthlyTargetsQuery.FieldByName('MTH').AsInteger := J;
      end;
    DMTariMwClient.MonthlyTargetsQuery.FieldByName('BALANCE').AsCurrency := PlanGPUnitRec.PlanSummary[I];
    DMTariMwClient.MonthlyTargetsQuery.Post;
    end;
  DMTariMwClient.MonthlyTargetsQuery.Resolve();
  DataCollect.ClearPlanDataList;
end;

Procedure TMWClientForm.ExportTrackingInvoices;
var
  varg : Variant;
  psdateStr, pedateStr : string;
begin
  // Id;Business_Id;Inv_Date;Inv_No;Inv_Sale;Inv_Cogs;Inv_Units;Inv_Items;Isquote;Ispast
  DataModuleClient.invoiceType := MonitorInv;
  psdatestr := formatDateTime('dd/mm/yyyy', DataModuleClient.DepartmentsCurrentPlanStart.value);
  pedatestr := formatDateTime('dd/mm/yyyy', DataModuleClient.DepartmentsCurrentPlanEnd.value);
  DatamoduleClient.ActualInvoiceDetails.Active := False;
  DatamoduleClient.ActualInvoiceDetails.Filter := '(INV_DATE >= ''' + psdateStr + ''') AND (INV_DATE <= ''' + pedateStr + ''')';
  DatamoduleClient.ActualInvoiceDetails.Filtered := True;
  DataModuleClient.ActualInvoiceDetails.Active := true;
  varg := VarArraycreate([0,3], VarVariant);
  varg[0] := CurrentBusinessID;

  DatamoduleClient.ActualInvoiceDetails.First;
  while DatamoduleClient.ActualInvoiceDetails.Eof = false do
    begin
    varg[1] := DataModuleClient.ActualInvoiceDetailsINV_DATE.Value;
    varg[2] := DataModuleClient.ActualInvoiceDetailsINVOICE_NUMBER.Value;
    if DMTariMWClient.CurrentInvoicesQuery.Locate('BUSINESS_ID;INV_DATE;INV_NO', varg, []) then
      DMTariMWClient.CurrentInvoicesQuery.Edit
    else
      begin
      DMTariMWClient.CurrentInvoicesQuery.Insert;
      DMTariMWClient.CurrentInvoicesQuery.FieldByName('ID').AsInteger := 0;
      DMTariMWClient.CurrentInvoicesQuery.FieldByName('BUSINESS_ID').AsInteger := CurrentBusinessID;
      DMTariMWClient.CurrentInvoicesQuery.FieldByName('INV_DATE').AsDateTime := DataModuleClient.ActualInvoiceDetailsINV_DATE.Value;
      DMTariMWClient.CurrentInvoicesQuery.FieldByName('INV_NO').AsAnsiString := DataModuleClient.ActualInvoiceDetailsINVOICE_NUMBER.Value;
      DMTariMWClient.CurrentInvoicesQuery.FieldByName('ISQUOTE').AsInteger := 0;
      DMTariMWClient.CurrentInvoicesQuery.FieldByName('ISPAST').AsInteger := 0;
      end;
    DMTariMWClient.CurrentInvoicesQuery.FieldByName('INV_SALE').AsCurrency := DataModuleClient.ActualInvoiceDetailsNETSALES.Value;
    DMTariMWClient.CurrentInvoicesQuery.FieldByName('INV_COGS').AsCurrency := DataModuleClient.ActualInvoiceDetailsMATERIALSATCOST.Value + DataModuleClient.ActualInvoiceDetailsSUBCONTRACTORS.Value;
    DMTariMWClient.CurrentInvoicesQuery.FieldByName('INV_UNITS').AsCurrency := DataModuleClient.ActualInvoiceDetailsUNITSREQUIRED.Value;
    DMTariMWClient.CurrentInvoicesQuery.Post;
    DatamoduleClient.ActualInvoiceDetails.Next;
    end;
  DMTariMWClient.CurrentInvoicesQuery.Resolve();
  //now we must update the monitoring data
  DatamoduleClient.ActualInvoiceDetails.Active := False;
  DatamoduleClient.ActualInvoiceDetails.Filter := '';
  DatamoduleClient.ActualInvoiceDetails.Filtered := False;
  DataModuleClient.ActualInvoiceDetails.Active := true;
end;

Procedure TMWClientForm.UpdateMonitoring;
var
  I: Integer;
  index: integer;
  LastDate : TdateTime;
  MonSales : TPlanDataRecPtr;
  MonCOGS : TPlanDataRecPtr;
  MonGP : TPlanDataRecPtr;
  MonBilled : TPlanDataRecPtr;
begin
  DataCollect.GetConsolidatedList(DataModuleClient.DepartmentsDEPT_ID.Value, ctNormal);

  DataCollect.getMonitoringData;
  MonSales := MonitoringDataList.Items[GetMonitoringSalesListIndex(SALES)];
  MonCogs := MonitoringDataList.Items[GetMonitoringSalesListIndex(COGS)];
  MonGP := MonitoringDataList.Items[GetMonitoringSalesListIndex(GROSSPROFIT)];
  MonBilled := MonitoringDataList.Items[GetMonitoringSalesListIndex(BILLED)];
  MonSales.PlanTotal := 0;
  MonCogs.PlanTotal := 0;
  MonGP.PlanTotal := 0;
  MonBilled.PlanTotal := 0;
  for index := 0 to trunc(DataModuleClient.DepartmentsCurrentMonitoringEnd.value) - trunc(DataModuleClient.DepartmentsCurrentMonitoringStart.value) do
    begin
      MonSales^.PlanDetail[index] := 0;
      MonCogs^.PlanDetail[Index] := 0;
      MonGP^.PlanDetail[Index] := 0;
      MonBilled^.PlanDetail[Index] := 0;
    end;

  DataModuleClient.ActualInvoiceDetails.First;
  LastDate := 0;
  while DataModuleClient.ActualInvoiceDetails.Eof = False do
    begin
    I := Trunc(DataModuleClient.ActualInvoiceDetailsINV_DATE.Value) - Trunc(DataModuleClient.DepartmentsCurrentMonitoringStart.value);
    if LastDate <> DataModuleClient.ActualInvoiceDetailsINV_DATE.Value then
      begin
      MonSales^.PlanDetail[I] := DataModuleClient.ActualInvoiceDetailsNETSALES.value;
      MonCogs^.PlanDetail[I] := DataModuleClient.ActualInvoiceDetailsMATERIALSATCOST.value + DataModuleClient.ActualInvoiceDetailsSUBCONTRACTORS.value;
      MonGP^.PlanDetail[I] := DataModuleClient.ActualInvoiceDetailsGROSSPROFIT.value;
      MonBilled^.PlanDetail[I] := DataModuleClient.ActualInvoiceDetailsUNITSREQUIRED.value;
      LastDate := DataModuleClient.ActualInvoiceDetailsINV_DATE.Value;
      end
    else
      begin
      MonSales^.PlanDetail[I] := MonSales^.PlanDetail[I] + DataModuleClient.ActualInvoiceDetailsNETSALES.value;
      MonCogs^.PlanDetail[I] := MonCogs^.PlanDetail[I] + DataModuleClient.ActualInvoiceDetailsMATERIALSATCOST.value + DataModuleClient.ActualInvoiceDetailsSUBCONTRACTORS.value;
      MonGP^.PlanDetail[I] := MonGP^.PlanDetail[I] + DataModuleClient.ActualInvoiceDetailsGROSSPROFIT.value;
      MonBilled^.PlanDetail[I] := MonBilled^.PlanDetail[I] + DataModuleClient.ActualInvoiceDetailsUNITSREQUIRED.value;
      end;
    DataModuleClient.ActualInvoiceDetails.Next;
    end;
  MonSales.PlanTotal := Datacollect.GetTotalBalance(MonSales^.PlanDetail,
        double(DataCollect.psdate), double(DataCollect.psdate), double(DataCollect.pedate));
  MonCogs.PlanTotal := Datacollect.GetTotalBalance(MonCogs^.PlanDetail,
        double(DataCollect.psdate), double(DataCollect.psdate), double(DataCollect.pedate));
  MonGP.PlanTotal := Datacollect.GetTotalBalance(MonGP^.PlanDetail,
        double(DataCollect.psdate), double(DataCollect.psdate), double(DataCollect.pedate));
  MonBilled.PlanTotal := Datacollect.GetTotalBalance(MonBilled^.PlanDetail,
        double(DataCollect.psdate), double(DataCollect.psdate), double(DataCollect.pedate));
  DataCollect.setMonitoringData;
  DataCollect.clearMonitoringDataList;
end;

Procedure TMWClientForm.UpdateSeries(ArrayItem, AccountNo: Integer);
var
  PlanDataRec : TPlanDataRecPtr;
  temparray : TDetailedBalArray;
  fromperiod, toperiod : integer;
begin
  PlanDataRec := PlanDataList.Items[GetaccountListIndex(AccountNo)];
  if ArrayItem = 0 then
    begin
    fromperiod := 0;
    toperiod := SummaryPeriodIndexArray[ArrayItem];
    end
  else
    begin
    fromperiod := SummaryPeriodIndexArray[ArrayItem - 1] + 1;
    toperiod := SummaryPeriodIndexArray[ArrayItem];
    end;
  DataCollect.psdate := DataModuleClient.DepartmentsCurrentPlanStart.value;
  DataCollect.pedate := DataModuleClient.DepartmentsCurrentPlanEnd.value;
  move(PlanDataRec.Plandetail, temparray, sizeof(TDetailedBalArray));
  DataCollect.updateArray(PlanDataRec.Plandetail,
        DaysBetween(IncDay(DataCollect.psdate, fromperiod), DataCollect.psdate),
        DaysBetween(IncDay(DataCollect.psdate, toperiod), DataCollect.psdate),
         PlanDataRec.PlanSummary[ArrayItem], 2);
end;

procedure TMWClientForm.CalculateArray(Accountno: integer);
var
  PlanDataRec : TPlanDataRecPtr;
  PlanSalesRec : TPlanDataRecPtr;
  PlanGPRec : TPlanDataRecPtr;
  PlanBilledRec : TPlanDataRecPtr;
  PlanGPUnitRec : TPlanDataRecPtr;
  PlanGPPCRec : TPlanDataRecPtr;
  PlanExpRec : TPlanDataRecPtr;
  PlanOtherRec : TPlanDataRecPtr;
  PlanNOPRec : TPlanDataRecPtr;
  PlanNPRec : TPlanDataRecPtr;
  j, UpdateStart, UpdateEnd: integer;
begin
  updateStart := 0; // These should be fixed for TariSaaS
  UpdateEnd := 11;
  PlanDataRec := PlanDataList.Items[GetaccountListIndex(AccountNo)];
  PlanSalesRec := PlanDataList.Items[GetaccountListIndex(SALES)];
  PlanGPRec := PlanDataList.Items[GetaccountListIndex(GROSSPROFIT)];
  PlanBilledRec := PlanDataList.Items[GetaccountListIndex(BILLED)];
  PlanGPUnitRec := PlanDataList.Items[GetaccountListIndex(GPUNIT)];
  PlanGPPCRec := PlanDataList.Items[GetaccountListIndex(GPPC)];
  PlanExpRec := PlanDataList.Items[GetaccountListIndex(TOTALEXPENSES)];
  PlanOtherRec := PlanDataList.Items[GetaccountListIndex(OTHERINCOME)];
  PlanNOPRec := PlanDataList.Items[GetaccountListIndex(NETOPERATINGPROFIT)];
  PlanNPRec := PlanDataList.Items[GetaccountListIndex(NETPROFIT)];
  if (Accountno = SALES) then
    for j := UpdateStart to UpdateEnd do
      begin
      PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanSummary[j];
      if PlanGPPCRec.PlanSummary[j] <> 0 then
        PlanDataRec.PlanSummary[j] := PlanGPRec.PlanSummary[j] * 100 / PlanGPPCRec.PlanSummary[j]
      else
        PlanDataRec.PlanSummary[j] := 0;
      PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanSummary[j];
      end;
  if (Accountno = GROSSPROFIT) then
    for j := UpdateStart to UpdateEnd do
      begin
      PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanSummary[j];
      if PlanBilledRec.PlanSummary[j] <> 0 then
        PlanDataRec.PlanSummary[j] := PlanBilledRec.PlanSummary[j] * PlanGPUnitRec.PlanSummary[j]
      else
        PlanDataRec.PlanSummary[j] := 0;
      PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanSummary[j];
      end;
  if Accountno = GPUNIT then
    for j := UpdateStart to UpdateEnd do    // Iterate
      begin
      PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanSummary[j];
      if PlanBilledRec.PlanSummary[j] <> 0 then
        PlanDataRec.PlanSummary[j] := PlanGPRec.PlanSummary[j] / PlanBilledRec.PlanSummary[j]
      else
        PlanDataRec.PlanSummary[j] := 0;
      PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanSummary[j];
      end;
  if Accountno = GPPC then
    for j := UpdateStart to UpdateEnd do    // Iterate
      begin
      PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanSummary[j];
      if PlanSalesRec.PlanSummary[j] <> 0 then
        PlanDataRec.PlanSummary[j] := PlanGPRec.PlanSummary[j] * 100 / PlanSalesRec.PlanSummary[j]
      else
        PlanDataRec.PlanSummary[j] := 0;
      PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanSummary[j];
      end;
{  if Accountno = PRODUCTIVITY then
    for j := UpdateStart to UpdateEnd do    // Iterate
      begin
      PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanSummary[j];
      if PlanPotentialRec.PlanSummary[j] <> 0 then
        PlanDataRec.PlanSummary[j] := PlanBilledRec.PlanSummary[j] * 100 / PlanPotentialRec.PlanSummary[j]
      else
        PlanDataRec.PlanSummary[j] := 0;
      PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanSummary[j];
      end;
  if Accountno = BILLED then  // Calculate ONLY if we Have Potential Units
    for j := UpdateStart to UpdateEnd do    // Iterate
      begin
      PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanSummary[j];
      if PlanPotentialRec.PlanSummary[j] <> 0 then
        PlanDataRec.PlanSummary[j] := PlanProdRec.PlanSummary[j] / 100 * PlanPotentialRec.PlanSummary[j];
      PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanSummary[j];
      end;
}
  if Accountno = NETOPERATINGPROFIT then  // Also calculates NETWPROFIT
    for j := UpdateStart to UpdateEnd do    // Iterate
      begin
      PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanSummary[j];
      PlanNPRec.PlanTotal := PlanNPRec.PlanTotal - PlanNPRec.PlanSummary[j];
      PlanDataRec.PlanSummary[j] := PlanGPRec.PlanSummary[j] - PlanExpRec.PlanSummary[j];
      PlanNPRec.PlanSummary[j] := PlanDataRec.PlanSummary[j] + PlanOtherRec.PlanSummary[j];
      PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanSummary[j];
      PlanNPRec.PlanTotal := PlanNPRec.PlanTotal + PlanNPRec.PlanSummary[j];
      end;
  if Accountno = NETPROFIT then
    for j := UpdateStart to UpdateEnd do    // Iterate
      begin
      PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanSummary[j];
      PlanDataRec.PlanSummary[j] := PlanNOPRec.PlanSummary[j] + PlanOtherRec.PlanSummary[j];
      PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanSummary[j];
      end;
end;


end.
