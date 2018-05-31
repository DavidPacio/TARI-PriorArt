unit DepartmentSetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons, cxPC,
  cxControls, LGlobals, DMClient, DataCollector, DMrep1U, ImgList, auchTypes,
  cxStyles, cxGridCustomTableView, cxGridTableView, cxClasses, cxGridCustomView, cxGridLevel,
  cxGrid, db, cxGridDBTableView, cxDBEdit, cxTextEdit, cxMaskEdit,
	cxDropDownEdit, cxCalendar, DateUtils,  PlanExtension, cxGroupBox,
  cxSpinEdit, cxCheckBox, cxRadioGroup, cxCurrencyEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, ExtCtrls, cxNavigator, cxDBNavigator,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData,
  cxLookAndFeelPainters, cxDBLabel, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxPCdxBarPopupMenu, cxLookAndFeels, Menus,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type

  TSetupType = (stAll, stPast, stTarget, stActivity, stCashFlow, stExpenses);

  TDepartmentSetupF = class(TForm)
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    NextFinishBtn: TcxButton;
    PrevBtn: TcxButton;
    cxTabSheet5: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableViewStartDate: TcxGridDBColumn;
    cxGrid1DBTableView1EndDate: TcxGridDBColumn;
    AddDateRangeBtn: TcxButton;
    AppendDateRangeBtn: TcxButton;
    DeleteDateRangeBtn: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    PlanningStartDate: TcxDBDateEdit;
    PlanningEndDate: TcxDBDateEdit;
    PlanExtBtn: TcxButton;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    SingleCB: TcxComboBox;
    PluralCB: TcxComboBox;
    cxLabel35: TcxLabel;
    CancelBtn: TcxButton;
    AdvYearBtn: TcxButton;
    BackYearBtn: TcxButton;
    BusinessSyncCB: TcxDBCheckBox;
    cxDBCheckBox1: TcxDBCheckBox;
    cxTabSheet3: TcxTabSheet;
    MonitoringStartDate: TcxDBDateEdit;
    cxLabel16: TcxLabel;
    cxLabel17: TcxLabel;
    cxLabel18: TcxLabel;
    MonitoringEndDate: TcxDBDateEdit;
    cxLabel19: TcxLabel;
    cxLabel20: TcxLabel;
    cxLabel21: TcxLabel;
    cxLabel22: TcxLabel;
    GroupingCB: TcxComboBox;
    BusinessTrackingSyncCB: TcxDBCheckBox;
    TrackGoBackOneYearBtn: TcxButton;
    TrackAdvanceOneYearBtn: TcxButton;
    cxLabel14: TcxLabel;
    cxDBLabel3: TcxDBLabel;
    cxDBLabel4: TcxDBLabel;
    cxLabel15: TcxLabel;
    cxDBLabel5: TcxDBLabel;
    cxDBLabel6: TcxDBLabel;
    cxDBLabel1: TcxDBLabel;
    cxDBLabel2: TcxDBLabel;
    PastDatesWarningLbl: TcxLabel;
    procedure NextFinishBtnClick(Sender: TObject);
    procedure PrevBtnClick(Sender: TObject);
    procedure cxPageControl1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGrid1DBTableView1STARTDATEPropertiesValidate(
      Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxGrid1DBTableView1ENDDATEPropertiesValidate(
      Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PlanningStartDateExit(Sender: TObject);
    procedure PlanExtBtnClick(Sender: TObject);
    procedure AddDateRangeBtnClick(Sender: TObject);
    procedure AppendDateRangeBtnClick(Sender: TObject);
    procedure DeleteDateRangeBtnClick(Sender: TObject);
    procedure cxTabSheet2Exit(Sender: TObject);
    procedure SingleCBPropertiesChange(Sender: TObject);
    procedure PluralCBPropertiesChange(Sender: TObject);
    procedure SingleCBExit(Sender: TObject);
    procedure PluralCBExit(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure cxGrid1Exit(Sender: TObject);
    procedure cxTabSheet5Enter(Sender: TObject);
    procedure cxTabSheet4Show(Sender: TObject);
    procedure BackYearBtnClick(Sender: TObject);
    procedure AdvYearBtnClick(Sender: TObject);
    procedure UsesStockDaysCHECKClick(Sender: TObject);
    procedure cxGrid2Exit(Sender: TObject);
    procedure cxDBTaxRateEnter(Sender: TObject);
    procedure PlanningEndDateExit(Sender: TObject);
    procedure cxTabSheet5Exit(Sender: TObject);
    procedure BusinessSyncCBClick(Sender: TObject);
    procedure MonitoringStartDateExit(Sender: TObject);
    procedure MonitoringEndDateExit(Sender: TObject);
    procedure GroupingCBExit(Sender: TObject);
    procedure TrackAdvanceOneYearBtnClick(Sender: TObject);
    procedure TrackGoBackOneYearBtnClick(Sender: TObject);
    procedure cxTabSheet3Enter(Sender: TObject);
    procedure cxTabSheet3Exit(Sender: TObject);
    procedure BusinessTrackingSyncCBClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    InsertedExpense : Boolean;
    CurrentDeptID : integer;
//    DeptBm : Pointer;
//    WM_MY_UNIQUE_MESSAGE : System.Cardinal;
    function EnddateExists(Newdate : TDateTime): Boolean;
    procedure handlePastDates(var Msg : TMessage); message LoPastDatePeriods;
    procedure UpdateGrouping;
    procedure SaveGroupName;
  public
    { Public declarations }
    procedure checkPastDates;
  end;

var
  DepartmentSetupF: TDepartmentSetupF;
  SelectedType : TSetupType;

implementation

{$R *.dfm}

procedure TDepartmentSetupF.NextFinishBtnClick(Sender: TObject);
begin
  if (cxPageControl1.ActivePageIndex < (cxPageControl1.PageCount - 1)) and (SelectedType = stAll) then
    begin
//    if cxPageControl1.ActivePage = cxTabsheet3 then
//      ExitOptions;
    cxPageControl1.ActivePageIndex := cxPageControl1.ActivePageIndex + 1;
    if cxPageControl1.ActivePageIndex = (cxPageControl1.PageCount - 1) then
      begin
      NextFinishBtn.Glyph.FreeImage;
      NextFinishBtn.Glyph := nil;
      DMrep1.TariButtonList.GetImage(0, NextFinishBtn.Glyph);
      NextFinishBtn.Caption := 'Finish';
      NextFinishBtn.Invalidate;
      end
    else
      begin
      NextFinishBtn.Glyph.FreeImage;
      NextFinishBtn.Glyph := nil;
      DMrep1.TariButtonList.GetImage(1, NextFinishBtn.Glyph);
      NextFinishBtn.Caption := 'Next';
      NextFinishBtn.Invalidate;
      end;
    end
  else
    begin
    ModalResult := mrOK;
    end;
end;

procedure TDepartmentSetupF.PrevBtnClick(Sender: TObject);
begin
  if cxPageControl1.ActivePageIndex = (cxPageControl1.PageCount - 1) then
    begin
      NextFinishBtn.Glyph.FreeImage;
      NextFinishBtn.Glyph := nil;
      DMrep1.TariButtonList.GetImage(1, NextFinishBtn.Glyph);
      NextFinishBtn.Caption := 'Next';
      NextFinishBtn.Invalidate;
    end;
  if cxPageControl1.ActivePageIndex > 0 then
    cxPageControl1.ActivePageIndex := cxPageControl1.ActivePageIndex - 1;
end;

procedure TDepartmentSetupF.cxPageControl1Change(Sender: TObject);
begin
if cxPageControl1.ActivePageIndex = 0 then
 PrevBtn.Enabled := False
else
 PrevBtn.Enabled := True;
end;

procedure TDepartmentSetupF.FormCreate(Sender: TObject);
var
  currentdept : Variant;
begin
  DataModuleClient.PlanHandle := self.handle;
  InsertedExpense := False;
  CurrentDept := DatamoduleClient.DeptRefDEPT_ID.AsVariant;
  DataModuleClient.Departments.Locate('DEPT_ID', CurrentDept, []);
  Caption := 'Setup - ' + DataModuleClient.DepartmentsREVENUE_GROUP_NAME.AsString;
  DataModuleClient.DepartmentsFIRSTPLANDATE.DisplayFormat := GGlobals.GetDateFENH;
  DataModuleClient.DepartmentsLATESTPLANDATE.DisplayFormat := GGlobals.GetDateFENH;
  DataModuleClient.DeptOptions.Active := False;
  DataModuleClient.DeptOptions.Filter := 'DEPT_ID=' + DataModuleClient.DepartmentsDEPT_ID.AsString;
  DataModuleClient.DeptOptions.Filtered := True;
  DataModuleClient.DeptOptions.active := True;
  InitialPlanStart := DataModuleClient.DepartmentsCurrentPlanStart.Value;
  InitialPlanEnd := DataModuleClient.DepartmentsCurrentPlanEnd.Value;
  if (InitialPlanEnd = 0) or (Daysbetween(DataModuleClient.DepartmentsCURRENTPLANEND.Value, DataModuleClient.DepartmentsFirstPlanDate.Value) <= 366) Then
    PlanExtBtn.Enabled := False;
  checkPastDates;
  if DataModuleClient.DepartmentsSingular_UnitDesc.value > '' then
    begin
		SingleCB.itemindex := SingleCB.Properties.Items.IndexOf(DataModuleClient.DepartmentsSingular_UnitDesc.AsString);
    if SingleCB.ItemIndex < 0
			then SingleCB.itemindex := SingleCB.Properties.items.Add(DataModuleClient.DepartmentsSingular_UnitDesc.AsString);
    end;
  if DataModuleClient.DepartmentsPlural_UnitDesc.value > '' then
    begin
		PluralCB.itemindex := PluralCB.Properties.Items.IndexOf(DataModuleClient.DepartmentsPlural_UnitDesc.AsString);
    if PluralCB.ItemIndex < 0
			then PluralCB.itemindex := PluralCB.Properties.items.Add(DataModuleClient.DepartmentsPlural_UnitDesc.AsString);
    end;
  if SelectedType = stAll then
    begin
    cxPageControl1.HideTabs := True;
    cxPageControl1.ActivePage := cxTabSheet1;
    cxPageControl1.HideTabs := True;
    DMrep1.TariButtonList.GetImage(1, NextFinishBtn.Glyph);
    end;
  if SelectedType = stTarget then
    begin
    NextFinishBtn.Caption := 'Close';
    PrevBtn.Visible := False;
    cxPageControl1.HideTabs := True;
    cxPageControl1.ActivePage := cxTabsheet5;
    DMrep1.TariButtonList.GetImage(0, NextFinishBtn.Glyph);
    end;
  DMrep1.TariButtonList.GetImage(2, PrevBtn.Glyph);
  DMrep1.TariButtonList.GetImage(3, CancelBtn.Glyph);
end;

procedure TDepartmentSetupF.checkPastDates;
begin
    if Datamoduleclient.DateRangers.RecordCount < 5 then
    begin
    AddDateRangeBtn.Enabled := True;
    AppendDateRangeBtn.enabled := True;
    PastDatesWarningLbl.Visible := false;
    End
  else
    begin
    AddDateRangeBtn.Enabled := False;
    AppendDateRangeBtn.enabled := False;
    PastDatesWarningLbl.Visible := True;
    end;
end;
procedure TDepartmentSetupF.cxGrid1DBTableView1STARTDATEPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  d, m, y : Word;
  editdate, Newdate : TdateTime;
  ChangeYear : Boolean;
begin
  Editdate := strtodate(DisplayValue);
  Error := False;
  ErrorText := '';
  decodeDate(editdate, y, m, d);
  ChangeYear := False;
  // if end of month
  if d = 1 then
  begin
    if m <> 1 then // Different year
      ChangeYear := True;
    if m > 1 then dec(m) else m := 12;
		if ChangeYear then
			d := DaysInAMonth(Y + 1, m)
		else
			d := DaysInAMonth(Y, m);
  end
  else
    begin
    ChangeYear := True;
    dec(d);
    end;
  if ChangeYear then Inc(y);
  Newdate := encodedate(y, m, d);
  // Does this end date already exist??
  while EnddateExists(newdate) do Newdate := Newdate - 1;
  if not (DataModuleClient.DSDateRangers.State in [dsEdit, dsInsert]) then
    DataModuleClient.DateRangers.Edit;
  DatamoduleClient.DateRangersSTARTDATE.Value := Editdate;
  if DatamoduleClient.DateRangersENDDATE.Value <= DatamoduleClient.DateRangersSTARTDATE.Value then
    DatamoduleClient.DateRangersENDDATE.Value := Newdate;
  DataModuleClient.DateRangers.post;
  checkPastDates;
end;

function TDepartmentSetupF.EnddateExists(Newdate : TDateTime): Boolean;
var
  varg : Variant;
begin
  varg := VarArraycreate([0,2], VarVariant);
  varg[0] := DatamoduleClient.DepartmentsDEPT_ID.Value;
  Varg[1] := Newdate;
  Result := DatamoduleClient.DateRef.Locate('DEPT_ID;EndDate',varg, []);
end;

procedure TDepartmentSetupF.cxGrid1DBTableView1ENDDATEPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
  d, d1, m, y : Word;
  Newdate, NewSdate : TdateTime;
begin
  Newdate := strtodate(DisplayValue);
  Error := False;
  ErrorText := '';
  decodeDate(Newdate, y, m, d);
	d1 := DaysInAMonth(Y, m);
  if (m <> 12) and (d1 = d) then
    dec(y);
  if d = d1 then
  begin
    if m = 12 then m := 1 else inc(m);
    d := 1;
  end
  else
    inc(d);
  NewSdate := encodedate(y, m, d);
  if not (DataModuleClient.DSDateRangers.State in [dsEdit, dsInsert]) then
    DataModuleClient.DateRangers.Edit;
  if DatamoduleClient.DateRangersSTARTDATE.Value < NewSdate then
    DatamoduleClient.DateRangersSTARTDATE.Value := NewSdate;
  DatamoduleClient.DateRangersENDDATE.Value := Newdate;
  DataModuleClient.DateRangers.post;
  checkPastDates;
end;

procedure TDepartmentSetupF.cxGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  Application.ProcessMessages;
end;

procedure TDepartmentSetupF.PlanningStartDateExit(Sender: TObject);
begin
  if (DataModuleClient.DepartmentsCurrentPlanEnd.value = 0) or
    (DaySpan(DataModuleClient.DepartmentsCurrentPlanEnd.value, DataModuleClient.DepartmentsCurrentPlanStart.value) > 366) then
    begin
    DataModuleClient.Departments.edit;
    DataModuleClient.DepartmentsCurrentPlanEnd.value := IncYear(DataModuleClient.DepartmentsCurrentPlanStart.value) - 1;
    DataModuleClient.Departments.Post;
    end;
  if (InitialPlanend > 0) and ((InitialPlanend <> DataModuleClient.DepartmentsCurrentPlanEnd.value) or (InitialPlanStart <> DataModuleClient.DepartmentsCurrentPlanStart.value)) then
    PlanExtBtn.Enabled := True;
  if (DataModuleClient.DepartmentsFirstPlanDate.value > 0)
    and (CompareDateTime(DataModuleClient.DepartmentsCurrentPlanStart.value, DataModuleClient.DepartmentsCurrentPlanEnd.value) >= 0) then
    begin
    MessageDlg('Plan End date can not be before the the Start Date = ' + DataModuleClient.DepartmentsCurrentPlanStart.asstring + #13#10 + 'A suggested End Date has been made. Please edit if necessary.', mtInformation, [mbOK], 0);
    DataModuleClient.Departments.edit;
    DataModuleClient.DepartmentsCurrentPlanEnd.value := IncYear(DataModuleClient.DepartmentsCurrentPlanStart.value, 1) - 1;
    DataModuleClient.Departments.Post;
    end;

  DataModuleClient.ClientDatabase.Refresh(true);
  DataModuleClient.Departments.Locate('DEPT_ID', variant(CurrentDeptID), []);
//  DataModuleClient.Departments.GotoBookmark(DeptBM);
  FindPastDate;
  BackYearBtn.Enabled := True;
  AdvYearBtn.Enabled := True;
end;

procedure TDepartmentSetupF.PlanExtBtnClick(Sender: TObject);
begin
    Application.CreateForm(TPlanExtensionF, PlanExtensionF);
    PlanExtensionF.showmodal;
    PlanExtensionF.free;
    Screen.Cursor := crDefault;
end;

procedure TDepartmentSetupF.AddDateRangeBtnClick(Sender: TObject);
begin
  cxGrid1.SetFocus;
  DataModuleClient.DateRangers.Insert;
end;

procedure TDepartmentSetupF.handlePastDates(var Msg : TMessage);
begin
  checkPastDates;
{  if (Msg.WParam < 5) and  (Msg.LParam = DELETION) then
    begin
    AddDateRangeBtn.Enabled := True;
    AppendDateRangeBtn.enabled := True;
    end;
  if (Msg.WParam = 5) and  (Msg.LParam = POSTING) then
    begin
    AddDateRangeBtn.Enabled := False;
    AppendDateRangeBtn.enabled := False;
    end;
}
end;

procedure TDepartmentSetupF.AppendDateRangeBtnClick(Sender: TObject);
var
  LastDate : TdateTime;
begin
  cxGrid1.SetFocus;
  DataModuleClient.DateRangers.Last;
  LastDate := DataModuleClient.DateRangersENDDATE.Value;
  DataModuleClient.DateRangers.Insert;
  DataModuleClient.DateRangersSTARTDATE.value := Lastdate + 1;
  DataModuleClient.DateRangersENDDATE.Value := incYear(LastDate, 1);
end;

procedure TDepartmentSetupF.DeleteDateRangeBtnClick(Sender: TObject);
var
  Varg : Variant;
  DeleteDate : TDateTime;
begin
if messagedlg('Delete the selected date range. Are you sure?', mtWarning, [mbOK,mbCancel], 0)= mrOK then
  begin
  cxGrid1DBTableView1.BeginUpdate;
  Varg := DATAMODULECLIENT.DepartmentsDEPT_ID.Value;
  DeleteDate := DATAMODULECLIENT.DateRangersENDDATE.Value;
  // delete Actual Balances
  DATAMODULECLIENT.ActualData.First;
  while DATAMODULECLIENT.ActualData.Eof = False do
    begin
    if (DATAMODULECLIENT.ActualDataDEPT_ID.Value = Varg) and (DATAMODULECLIENT.ActualDataPERIODEND.Value = DeleteDate) then
      DATAMODULECLIENT.ActualData.Delete
    else
      DATAMODULECLIENT.ActualData.Next;
    end;    // while
  // Delete Invoices of Type 0 (Analysis)
  DATAMODULECLIENT.ActualInvoiceDetails.First;
  while DATAMODULECLIENT.ActualInvoiceDetails.Eof = False do
    begin
    if (DATAMODULECLIENT.ActualInvoiceDetailsDEPT_ID.Value = Varg) and
       (DATAMODULECLIENT.ActualInvoiceDetailsINVOICETYPE.Value = 0) and
       (DATAMODULECLIENT.ActualInvoiceDetailsINV_DATE.Value = DeleteDate) then
      DATAMODULECLIENT.ActualInvoiceDetails.Delete
    else
      DATAMODULECLIENT.ActualInvoiceDetails.Next;
    end;
  end;    // while
  DataModuleClient.DateRangers.Delete;
  cxGrid1DBTableView1.EndUpdate;
  checkPastDates;
end;

procedure TDepartmentSetupF.cxTabSheet2Exit(Sender: TObject);
begin
  GGlobals.DebugOut('Setup: Exit Activity Names');
  DataModuleClient.Departments.edit;
	DataModuleClient.DepartmentsSingular_UnitDesc.AsString := SingleCB.Text;
	DataModuleClient.DepartmentsPlural_UnitDesc.AsString := PluralCB.Text;
  DataModuleClient.Departments.Post;
  FindpastDate;
end;

procedure TDepartmentSetupF.SingleCBPropertiesChange(Sender: TObject);
begin
  if (PluralCB.ItemIndex < 7) and (SingleCB.ItemIndex < 7) then
    PluralCB.ItemIndex := SingleCB.itemIndex;
//  setLabels;
end;

procedure TDepartmentSetupF.PluralCBPropertiesChange(Sender: TObject);
begin
  if (SingleCB.ItemIndex < 7) and (PluralCB.ItemIndex < 7) then
    SingleCB.ItemIndex := PluralCB.itemIndex;
end;

procedure TDepartmentSetupF.SingleCBExit(Sender: TObject);
begin
  if (SingleCB.Properties.Items.IndexOf(SingleCB.text)< 0) and (length(SingleCB.text) > 0)then
    SingleCB.itemindex := SingleCB.Properties.items.Add(SingleCB.text);
end;

procedure TDepartmentSetupF.PluralCBExit(Sender: TObject);
begin
  if (PluralCB.Properties.Items.IndexOf(PluralCB.text)< 0) and (length(PluralCB.text) > 0) then
    PluralCB.itemindex := PluralCB.Properties.items.Add(PluralCB.text);
end;

procedure TDepartmentSetupF.cxButton1Click(Sender: TObject);
var
  TaxRateExp : currency;
begin
  TaxRateExp := DataCollect.GetUserOption(OTAXRATE_EXPENSES, UOCurrency);
  DataModuleClient.ExpAccounts.First;
  while DataModuleClient.ExpAccounts.Eof = false do
    begin
    if DataModuleClient.ExpAccountsACCOUNT_TITLE.Value > '' then
      begin
      DataModuleClient.Dept_Accounts.Edit;
      if (DATAMODULECLIENT.ExpAccountsWAGE_ACCOUNT.Value <> 1) and
         (DATAMODULECLIENT.ExpAccountsINTEREST_ACCOUNT.Value <> 1) and
         (DATAMODULECLIENT.ExpAccountsNON_CASH.Value <> 1) then
        DataModuleClient.Dept_AccountsTAX_RATE.Value := TaxRateExp;
      DataModuleClient.Dept_Accounts.Post;
      end;
    DataModuleClient.ExpAccounts.Next;
    end;    // while
end;

procedure TDepartmentSetupF.CancelBtnClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TDepartmentSetupF.cxGrid1Exit(Sender: TObject);
begin
  if (DataModuleClient.DSDateRangers.State in [dsEdit, dsInsert]) then
    DataModuleClient.DateRangers.Post;
end;

procedure TDepartmentSetupF.cxTabSheet5Enter(Sender: TObject);
Var
  StartTargetDate, sdate, edate : TDateTime;
  M,Y : Word;
begin
//  DeptBM := DataModuleClient.Departments.GetBookmark;
  CurrentDeptID := DatamoduleClient.DepartmentsDEPT_ID.AsInteger;
  if DataModuleClient.DateRangers.RecordCount > 0 then
    begin
    DataModuleClient.DateRangers.Last;
    StartTargetDate := DataModuleClient.DateRangersENDDATE.Value + 1;
    End
  else
    begin
    // find the beginning of the next quarter.
    M := MonthOfTheYear(Now());
    Y := YearOf(Now());
    if (M Mod 3) <> 1 then
      begin
      if (M Mod 3) = 2 then
        M := M + 2;
      if (M mod 3) = 0 then
        M := M + 1;
      if M > 12 then
        begin
        Y := Y + 1;
        M := 1;
        end;
      end;
    StartTargetDate := StartofaMonth(Y, M);
    end;
  if not (DataModuleClient.DSDepartments.State in [dsEdit, dsInsert]) then
    DataModuleClient.Departments.Edit;
  if DataModuleClient.DepartmentsCURRENTPLANSTART.Value < 10 then
    begin
    DataModuleClient.DepartmentsCURRENTPLANSTART.Value := StartTargetDate;
    DataModuleClient.DepartmentsCurrentPlanEnd.value := IncYear(DataModuleClient.DepartmentsCurrentPlanStart.value) - 1;
    BackYearBtn.Enabled := False;
    AdvYearBtn.Enabled := false;
    end;
  if DataCollect.FindFirstandLastPlanDates(DataModuleClient.DepartmentsDEPT_ID.Value, sdate, edate) then
    begin
    DataModuleClient.DepartmentsFIRSTPLANDATE.Value:= sdate;
    DataModuleClient.DepartmentsLATESTPLANDATE.Value := edate;
    end
  else
    begin
    DataModuleClient.DepartmentsFIRSTPLANDATE.Value := DataModuleClient.DepartmentsCURRENTPLANSTART.Value;
    DataModuleClient.DepartmentsLATESTPLANDATE.Value := DataModuleClient.DepartmentsCurrentPlanEnd.value;
    cxDBLabel1.Enabled := False;
    cxDBLabel2.Enabled := False;
    cxDBLabel5.Enabled := False;
    cxDBLabel6.Enabled := False;
    PlanExtBtn.Enabled := False;
    end;
  DataModuleClient.Departments.Post;
end;

procedure TDepartmentSetupF.cxTabSheet4Show(Sender: TObject);
begin
  DataModuleClient.BSAccounts.active := True;
  DataModuleClient.ExpAccounts.Active := True;
  DataModuleClient.Dept_Accounts.Active := False;
  DataModuleClient.Dept_Accounts.Filter := 'DEPT_ID=' + DataModuleClient.DepartmentsDEPT_ID.AsString;
  DataModuleClient.Dept_Accounts.Filtered := True;
  DataModuleClient.Dept_Accounts.active := True;
  DataModuleClient.CreateDeptExpenseAccountRecords;
end;

procedure TDepartmentSetupF.BackYearBtnClick(Sender: TObject);
begin
  if not (DataModuleClient.DSDepartments.State in [dsEdit, dsInsert]) then
    DataModuleClient.Departments.Edit;
  DataModuleClient.DepartmentsCURRENTPLANSTART.Value := incYear(DataModuleClient.DepartmentsCURRENTPLANSTART.Value, -1);
  DataModuleClient.DepartmentsCURRENTPLANEND.Value := incYear(DataModuleClient.DepartmentsCURRENTPLANEND.Value, -1);
  if InitialPlanend = 0 then
    begin
    DataModuleClient.DepartmentsFIRSTPLANDATE.value := DataModuleClient.DepartmentsCurrentPlanStart.value;
    DataModuleClient.DepartmentsLATESTPLANDATE.value := DataModuleClient.DepartmentsCurrentPlanEnd.value;
    end;
  DataModuleClient.Departments.Post;
end;

procedure TDepartmentSetupF.AdvYearBtnClick(Sender: TObject);
begin
  if not (DataModuleClient.DSDepartments.State in [dsEdit, dsInsert]) then
    DataModuleClient.Departments.Edit;
  DataModuleClient.DepartmentsCURRENTPLANSTART.Value := incYear(DataModuleClient.DepartmentsCURRENTPLANSTART.Value, 1);
  DataModuleClient.DepartmentsCURRENTPLANEND.Value := incYear(DataModuleClient.DepartmentsCURRENTPLANEND.Value, 1);
  if InitialPlanend = 0 then
    begin
    DataModuleClient.DepartmentsFIRSTPLANDATE.value := DataModuleClient.DepartmentsCurrentPlanStart.value;
    DataModuleClient.DepartmentsLATESTPLANDATE.value := DataModuleClient.DepartmentsCurrentPlanEnd.value;
    end;
  DataModuleClient.Departments.post;
  if (InitialPlanend > 0) and ((InitialPlanend <> DataModuleClient.DepartmentsCurrentPlanEnd.value) or (InitialPlanStart <> DataModuleClient.DepartmentsCurrentPlanStart.value)) then
    PlanExtBtn.Enabled := True;
end;

procedure TDepartmentSetupF.UsesStockDaysCHECKClick(Sender: TObject);
begin
//  if UsesStockDaysCHECK.Checked then
//    cxLabel18.Caption := 'Stock Days'
//  else
//    cxLabel18.Caption := 'Stock Turns';
//  cxLabel18.Refresh;
;
end;

procedure TDepartmentSetupF.cxGrid2Exit(Sender: TObject);
begin
  if DataModuleClient.DSEXPACCOUNTS.State in [dsinsert,dsedit] then
    begin
    DataModuleClient.ExpAccounts.Post;
    DataModuleClient.ExpAccounts.CommitUpdates;
    DataModuleClient.ClientDatabase.Commit;
    DataModuleClient.ExpAccounts.Refresh;
    end;
end;

procedure TDepartmentSetupF.cxDBTaxRateEnter(Sender: TObject);
begin
  if DataModuleClient.Dept_AccountsTAX_RATE.IsNull then
      DataModuleClient.Dept_Accounts.Insert;
end;

procedure TDepartmentSetupF.PlanningEndDateExit(Sender: TObject);
begin
  if (InitialPlanend > 0) and ((InitialPlanend <> DataModuleClient.DepartmentsCurrentPlanEnd.value) or (InitialPlanStart <> DataModuleClient.DepartmentsCurrentPlanStart.value)) then
    PlanExtBtn.Enabled := True;
end;

procedure TDepartmentSetupF.cxTabSheet5Exit(Sender: TObject);
begin
//
  DataModuleClient.Departments.Locate('DEPT_ID', variant(CurrentDeptID), []);
//  DataModuleClient.Departments.GotoBookmark(DeptBM);
  if (Daysbetween(DataModuleClient.DepartmentsCurrentPlanStart.Value, DataModuleClient.DepartmentsCurrentPlanEnd.Value) > 365) Then
    begin
    messagedlg('The Target Start and End dates must be no more than 366 days apart!', mtwarning, [mbOK], 0);
    cxPageControl1.ActivePageIndex := 1;
    end;
  DataModuleClient.Departments.Edit;
  if (DataModuleClient.DepartmentsCurrentPlanStart.value < DataModuleClient.DepartmentsFIRSTPLANDATE.value) or (DataModuleClient.DepartmentsFIRSTPLANDATE.value = 0) then
    DataModuleClient.DepartmentsFIRSTPLANDATE.value := DataModuleClient.DepartmentsCurrentPlanStart.value;
  if DataModuleClient.DepartmentsCurrentPlanEnd.value > DataModuleClient.DepartmentsLATESTPLANDATE.value then
    DataModuleClient.DepartmentsLATESTPLANDATE.value := DataModuleClient.DepartmentsCurrentPlanEnd.value;
  DataModuleClient.Departments.post;
end;

procedure TDepartmentSetupF.BusinessSyncCBClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  DataModuleClient.Departments.DisableControls;
  if DataModuleClient.DepartmentsSYNC_TARGETDATE.Value > 0 then
    DataModuleClient.DepartmentsSYNC_TARGETDATE.Value := 0
  else
    begin
    DataModuleClient.DepartmentsSYNC_TARGETDATE.Value := 1;
    DataModuleClient.DepartmentsCURRENTPLANSTART.Value := DataModuleClient.BusinessesTARGET_START.value;
    DataModuleClient.DepartmentsCURRENTPLANEND.Value := DataModuleClient.BusinessesTARGET_END.value;
    end;
  DataModuleClient.Departments.EnableControls;
  Screen.Cursor := crDefault;
end;

procedure TDepartmentSetupF.MonitoringStartDateExit(Sender: TObject);
begin
  if (DataModuleClient.DepartmentsFirstPlanDate.value > 0)
    and (DataModuleClient.DepartmentsCurrentMonitoringStart.value < DataModuleClient.DepartmentsFirstPlanDate.value)
    then begin
    DataModuleClient.Departments.edit;
    DataModuleClient.DepartmentsCurrentMonitoringStart.value := DataModuleClient.DepartmentsFirstPlanDate.value;
		DataModuleClient.Departments.Post;
    MessageDlg('Monitoring Start date can not be before ' + DataModuleClient.DepartmentsFirstPlanDate.asstring + #13#10 + 'To plan before this date, you must clear this plan and reenter data', mtInformation, [mbOK], 0);
  end;
  if (DataModuleClient.DepartmentsCurrentMonitoringEnd.value = 0) or
    (trunc(DataModuleClient.DepartmentsCurrentMonitoringEnd.value) - trunc(DataModuleClient.DepartmentsCurrentMonitoringStart.value) > 366)
    then begin
    DataModuleClient.Departments.edit;
    DataModuleClient.DepartmentsCurrentMonitoringEnd.value :=
			IncDay(IncYear(DataModuleClient.DepartmentsCurrentMonitoringStart.value, 1), -1);
    DataModuleClient.Departments.Post;
  end;

end;

procedure TDepartmentSetupF.MonitoringEndDateExit(Sender: TObject);
begin
  DataModuleClient.Departments.edit;
  if DataModuleClient.DepartmentsLatestPlanDate.Value <  DataModuleClient.DepartmentsCurrentMonitoringEnd.Value then
    DataModuleClient.DepartmentsCurrentMonitoringEnd.value := DataModuleClient.DepartmentsLatestPlanDate.Value;
  if (DataModuleClient.DepartmentsCurrentMonitoringEnd.value = 0) or
    (trunc(DataModuleClient.DepartmentsCurrentMonitoringEnd.value) - trunc(DataModuleClient.DepartmentsCurrentMonitoringStart.value) > 366) then
		DataModuleClient.DepartmentsCurrentMonitoringEnd.value := IncDay(IncYear(DataModuleClient.DepartmentsCurrentMonitoringStart.value, 1), -1);
  DataModuleClient.Departments.Post;
end;

procedure TDepartmentSetupF.GroupingCBExit(Sender: TObject);
begin
  if GroupingCB.Properties.Items.IndexOf(GroupingCB.text) < 0 then
    GroupingCB.itemindex := GroupingCB.Properties.items.Add(GroupingCB.text);
end;

procedure TDepartmentSetupF.TrackAdvanceOneYearBtnClick(Sender: TObject);
begin
  if not (DataModuleClient.DSDepartments.State in [dsEdit, dsInsert]) then
    DataModuleClient.Departments.Edit;
  DataModuleClient.DepartmentsCURRENTMONITORINGSTART.Value := incYear(DataModuleClient.DepartmentsCURRENTMONITORINGSTART.Value, 1);
  DataModuleClient.DepartmentsCURRENTMONITORINGEND.Value := incYear(DataModuleClient.DepartmentsCURRENTMONITORINGEND.Value, 1);
  DataModuleClient.Departments.Post;
end;

procedure TDepartmentSetupF.TrackGoBackOneYearBtnClick(Sender: TObject);
begin
  if not (DataModuleClient.DSDepartments.State in [dsEdit, dsInsert]) then
    DataModuleClient.Departments.Edit;
  DataModuleClient.DepartmentsCURRENTMONITORINGSTART.Value := incYear(DataModuleClient.DepartmentsCURRENTMONITORINGSTART.Value, -1);
  DataModuleClient.DepartmentsCURRENTMONITORINGEND.Value := incYear(DataModuleClient.DepartmentsCURRENTMONITORINGEND.Value, -1);
  DataModuleClient.Departments.Post;
end;

procedure TDepartmentSetupF.cxTabSheet3Enter(Sender: TObject);
begin
  DataModuleClient.Departments.edit;
  if (DataModuleClient.DepartmentsCurrentMonitoringStart.value = 0) or
     (DataModuleClient.DepartmentsCurrentMonitoringEnd.value = 0) then
    begin
    if DataModuleClient.DepartmentsCurrentPlanStart.value > 0 then
      begin
      DataModuleClient.DepartmentsCurrentMonitoringStart.value := DataModuleClient.DepartmentsCurrentPlanStart.value;
      DataModuleClient.DepartmentsCurrentMonitoringEnd.value := DataModuleClient.DepartmentsCurrentPlanEnd.value;
      end;
    end
  else
    begin
    if (DataModuleClient.DepartmentsCurrentPlanStart.value < DataModuleClient.DepartmentsFirstPlanDate.value) or (DataModuleClient.DepartmentsFirstPlanDate.value = 0) then
      DataModuleClient.DepartmentsFirstPlanDate.value := DataModuleClient.DepartmentsCurrentPlanStart.value;
    if DataModuleClient.DepartmentsCurrentPlanEnd.value > DataModuleClient.DepartmentsLatestPlanDate.value then
      DataModuleClient.DepartmentsLatestPlanDate.value := DataModuleClient.DepartmentsCurrentPlanEnd.value;
    end;
  DataModuleClient.Departments.Post;
  UpdateGrouping;
  // set minimum and maximum dates for period selection
  MonitoringStartDate.Properties.MinDate := DataModuleClient.DepartmentsFIRSTPLANDATE.Value;
  MonitoringStartDate.Properties.MaxDate := DataModuleClient.DepartmentsLATESTPLANDATE.Value;
  MonitoringEndDate.Properties.MinDate := DataModuleClient.DepartmentsFIRSTPLANDATE.Value;
  MonitoringEndDate.Properties.MaxDate := DataModuleClient.DepartmentsLATESTPLANDATE.Value;
end;

procedure TDepartmentSetupF.UpdateGrouping;
begin
  if length(DataModuleClient.DepartmentsInvGroupName.value) > 0 then
    begin
		GroupingCB.itemindex := GroupingCB.Properties.Items.IndexOf(DataModuleClient.DepartmentsInvGroupName.AsString);
    if GroupingCB.ItemIndex < 0 then
			GroupingCB.itemindex := GroupingCB.Properties.items.Add(DataModuleClient.DepartmentsInvGroupName.AsString);
    end
  else
    GroupingCB.ItemIndex := 0;
end;

procedure TDepartmentSetupF.SaveGroupName;
begin
  DataModuleClient.departments.edit;
  DataModuleClient.DepartmentsInvGroupName.AsString := GroupingCB.Text; //Items[GroupingCB.ItemIndex];
  DataModuleClient.Departments.post;
  GroupingCBExit(Self);
end;

procedure TDepartmentSetupF.cxTabSheet3Exit(Sender: TObject);
begin
  if (Daysbetween(DataModuleClient.DepartmentsCURRENTMONITORINGSTART.Value, DataModuleClient.DepartmentsCURRENTMONITORINGEND.Value) > 366) Then
    begin
    messagedlg('The Tracking Start and End dates must be no more than 366 days apart!', mtwarning, [mbOK], 0);
    cxPageControl1.ActivePageIndex := 2;
    end;
  SaveGroupName;
end;

procedure TDepartmentSetupF.BusinessTrackingSyncCBClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  DataModuleClient.Departments.DisableControls;
  if DataModuleClient.DepartmentsSYNC_TRACKDATE.Value > 0 then
    DataModuleClient.DepartmentsSYNC_TRACKDATE.Value := 0
  else
    begin
    DataModuleClient.DepartmentsSYNC_TRACKDATE.Value := 1;
    DataModuleClient.DepartmentsCURRENTMONITORINGSTART.Value := DataModuleClient.BusinessesTRACKing_START.value;
    DataModuleClient.DepartmentsCURRENTMONITORINGEND.Value := DataModuleClient.BusinessesTRACKing_END.value;
    end;
  DataModuleClient.Departments.EnableControls;
  Screen.Cursor := crDefault;
end;

procedure TDepartmentSetupF.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  currentDept : Variant;
begin
  DataModuleClient.DeptRef.Refresh;
  currentDept := DataModuleClient.DeptRefDEPT_ID.AsVariant;
//  DataModuleClient.Sync_Businessdates;
  DataModuleClient.DeptRef.Locate('DEPT_ID', CurrentDept, []);
  Canclose := True;
end;

end.
