unit TargetSetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons, cxPC,
  cxControls, LGlobals, DMClient, DataCollector, DMrep1U, ImgList, auchTypes,
  cxStyles, cxGridCustomTableView, cxGridTableView, cxClasses, cxGridCustomView, cxGridLevel,
  cxGrid, db, cxGridDBTableView, cxDBEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, DateUtils, stdate,  PlanExtension, cxGroupBox,
  cxSpinEdit, cxCheckBox, cxRadioGroup, cxCurrencyEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, ExtCtrls, cxNavigator, cxDBNavigator,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData,
  cxLookAndFeelPainters, cxDBLabel;

type

  TSetupType = (stAll, stPast, stTarget, stActivity, stCashFlow, stExpenses);

  TTargetSetupF = class(TForm)
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    cxTabSheet4: TcxTabSheet;
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
    cxGroupBox1: TcxGroupBox;
    cxLabel14: TcxLabel;
    PeriodCB: TcxComboBox;
    UsesStockDaysCHECK: TcxCheckBox;
    cxLabel15: TcxLabel;
    ARAverage: TcxSpinEdit;
    cxLabel16: TcxLabel;
    StockAverage: TcxSpinEdit;
    APAverage: TcxSpinEdit;
    AccruedAverage: TcxSpinEdit;
    cxLabel17: TcxLabel;
    cxLabel18: TcxLabel;
    cxLabel19: TcxLabel;
    cxLabel20: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    TaxRateSales: TcxCurrencyEdit;
    TaxRateMaterialsStock: TcxCurrencyEdit;
    TaxRateSubCon: TcxCurrencyEdit;
    TaxRateExpenses: TcxCurrencyEdit;
    cxLabel21: TcxLabel;
    TaxPaymentRB: TcxRadioGroup;
    cxLabel22: TcxLabel;
    cxLabel23: TcxLabel;
    TaxPaidDay: TcxSpinEdit;
    cxLabel25: TcxLabel;
    TaxMethodRB: TcxRadioGroup;
    cxGroupBox3: TcxGroupBox;
    FirstDay: TcxComboBox;
    cxLabel26: TcxLabel;
    cxLabel27: TcxLabel;
    cxLabel28: TcxLabel;
    cxLabel29: TcxLabel;
    FirstMonth: TcxComboBox;
    BankODCB: TcxCheckBox;
    ODInterest: TcxCurrencyEdit;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxLabel30: TcxLabel;
    cxGrid2DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn2: TcxGridDBColumn;
    cxDBTextEdit1: TcxDBTextEdit;
    cxLabel31: TcxLabel;
    cxDBTaxRate: TcxDBSpinEdit;
    cxDBPaid_Via_APCB: TcxDBCheckBox;
    cxLabel32: TcxLabel;
    cxDBLookupCBBalAccount: TcxDBLookupComboBox;
    cxButton1: TcxButton;
    cxLabel33: TcxLabel;
    cxLabel34: TcxLabel;
    cxLabel35: TcxLabel;
    CancelBtn: TcxButton;
    AdvYearBtn: TcxButton;
    BackYearBtn: TcxButton;
    Panel1: TPanel;
    cxLabel37: TcxLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    cxLabel24: TcxLabel;
    cxGrid2DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn4: TcxGridDBColumn;
    InsertTitleBtn: TcxButton;
    cxButton3: TcxButton;
    cxGroupBox4: TcxGroupBox;
    cxLabel36: TcxLabel;
    TaxLossesEdit: TcxCurrencyEdit;
    cxLabel38: TcxLabel;
    IncomeTaxRate: TcxCurrencyEdit;
    cxLabel39: TcxLabel;
    DividendRate: TcxCurrencyEdit;
    cxLabel40: TcxLabel;
    MinDividendAmount: TcxCurrencyEdit;
    cxLabel41: TcxLabel;
    MaxDividendAmount: TcxCurrencyEdit;
    cxDBLabel1: TcxDBLabel;
    cxDBLabel2: TcxDBLabel;
    ApplyTargetDatetoAllBtn: TcxButton;
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
    procedure cxTabSheet3Show(Sender: TObject);
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
    procedure InsertTitleBtnClick(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure PlanningEndDateExit(Sender: TObject);
    procedure cxTabSheet5Exit(Sender: TObject);
    procedure ApplyTargetDatetoAllBtnClick(Sender: TObject);
  private
    { Private declarations }
    NoSave : Boolean;
    Initialised : Boolean;
    CurrentGroupIndex : Integer;
    NewGroupIndex : Integer;
    InsertedExpense : Boolean;
    DeptBm : Pointer;
    function EnddateExists(Newdate : TDateTime): Boolean;
    procedure handlePastDates(var Msg : TMessage); message LoPastDatePeriods;
    procedure SaveOptions;
    procedure LoadOptions;
    procedure ExitOptions;
    procedure ExitExpenses;
  public
    { Public declarations }
  end;

var
  TargetSetupF: TTargetSetupF;
  SelectedType : TSetupType;

implementation

{$R *.dfm}

procedure TTargetSetupF.NextFinishBtnClick(Sender: TObject);
begin
  if (cxPageControl1.ActivePageIndex < (cxPageControl1.PageCount - 1)) and (SelectedType = stAll) then
    begin
    if cxPageControl1.ActivePage = cxTabsheet3 then
      ExitOptions;
    cxPageControl1.ActivePageIndex := cxPageControl1.ActivePageIndex + 1;
    if cxPageControl1.ActivePageIndex = (cxPageControl1.PageCount - 1) then
      begin
      NextFinishBtn.Glyph.FreeImage;
      NextFinishBtn.Glyph := nil;
      DMrep1.ButtonGlyphList.GetBitmap(0, NextFinishBtn.Glyph);
      NextFinishBtn.Caption := 'Finish';
      NextFinishBtn.Invalidate;
      end
    else
      begin
      NextFinishBtn.Glyph.FreeImage;
      NextFinishBtn.Glyph := nil;
      DMrep1.ButtonGlyphList.GetBitmap(1, NextFinishBtn.Glyph);
      NextFinishBtn.Caption := 'Next';
      NextFinishBtn.Invalidate;
      end;
    end
  else
    begin
    if (SelectedType = stExpenses) or (cxPageControl1.ActivePage = cxTabsheet4) then
      begin
      ExitExpenses;
      end;
    if (SelectedType = stCashFlow) or (cxPageControl1.ActivePage = cxTabsheet3) then
      begin
      ExitOptions;
      end;
    ModalResult := mrOK;
    end;
end;

procedure TTargetSetupF.PrevBtnClick(Sender: TObject);
begin
  if cxPageControl1.ActivePageIndex = (cxPageControl1.PageCount - 1) then
    begin
      NextFinishBtn.Glyph.FreeImage;
      NextFinishBtn.Glyph := nil;
      DMrep1.ButtonGlyphList.GetBitmap(1, NextFinishBtn.Glyph);
      NextFinishBtn.Caption := 'Next';
      NextFinishBtn.Invalidate;
    end;
  if cxPageControl1.ActivePage = cxTabsheet3 then
    ExitOptions;
  if cxPageControl1.ActivePage = cxTabsheet4 then
    ExitExpenses;
  if cxPageControl1.ActivePageIndex > 0 then
    cxPageControl1.ActivePageIndex := cxPageControl1.ActivePageIndex - 1;
end;

procedure TTargetSetupF.ExitExpenses;
begin
  DataModuleClient.ExpAccounts.First;
  while DataModuleClient.ExpAccounts.Eof = false do
    begin
    if (DataModuleClient.ExpAccountsNON_CASH.Value = 1) and (DataModuleClient.Dept_AccountsBALANCE_SHEET_ACCOUNT.value = 0) then
      begin
      MessageDlg('Account - ' + DataModuleClient.ExpAccountsACCOUNT_TITLE.Value + ' is a non cash account' +
      #13#10 + 'requires a Balance Sheet account association. Please correct.', mtInformation, [mbOK], 0);
      end;
    DataModuleClient.ExpAccounts.Next;
    end;    // while
  DataModuleClient.ClientDatabase.Commit;
  DataModuleClient.Dept_Accounts.active := False;
  DataModuleClient.ExpAccounts.Active := False;
  DataModuleClient.BSAccounts.active := False;
end;

procedure TTargetSetupF.ExitOptions;
begin
  if Not NoSave then
    begin
    SaveOptions;
    end;
end;

procedure TTargetSetupF.cxPageControl1Change(Sender: TObject);
begin
if cxPageControl1.ActivePageIndex = 0 then
 PrevBtn.Enabled := False
else
 PrevBtn.Enabled := True;
end;

procedure TTargetSetupF.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  Color := GGlobals.FormColour;
  InsertedExpense := False;
  Caption := 'Setup - ' + DataModuleClient.DepartmentsREVENUE_GROUP_NAME.Value;
  DataModuleClient.DepartmentsFIRSTPLANDATE.DisplayFormat := GGlobals.GetDateFENH;
  DataModuleClient.DepartmentsLATESTPLANDATE.DisplayFormat := GGlobals.GetDateFENH;
  DataModuleClient.DeptOptions.Active := False;
  DataModuleClient.DeptOptions.Filter := 'DEPT_ID=' + DataModuleClient.DepartmentsDEPT_ID.AsString;
  DataModuleClient.DeptOptions.Filtered := True;
  DataModuleClient.DeptOptions.active := True;
  for I := 0 to cxPageControl1.PageCount - 1 do    // Iterate
    cxPageControl1.Pages[I].Color := GGlobals.FormColour;
  InitialPlanStart := DataModuleClient.DepartmentsCurrentPlanStart.Value;
  InitialPlanEnd := DataModuleClient.DepartmentsCurrentPlanEnd.Value;
  if (Daysbetween(DataModuleClient.DepartmentsLatestPlandate.Value, DataModuleClient.DepartmentsFirstPlanDate.Value) <= 366) Then
    PlanExtBtn.Enabled := False;
  if Datamoduleclient.DateRangers.RecordCount < 5 then
    begin
    AddDateRangeBtn.Enabled := True;
    AppendDateRangeBtn.enabled := True;
    End
  else
    begin
    AddDateRangeBtn.Enabled := False;
    AppendDateRangeBtn.enabled := False;
    end;
  if DataModuleClient.DepartmentsSingular_UnitDesc.value > '' then
    begin
    SingleCB.itemindex := SingleCB.Properties.Items.IndexOf(DataModuleClient.DepartmentsSingular_UnitDesc.value);
    if SingleCB.ItemIndex < 0
      then SingleCB.itemindex := SingleCB.Properties.items.Add(DataModuleClient.DepartmentsSingular_UnitDesc.value);
    end;
  if DataModuleClient.DepartmentsPlural_UnitDesc.value > '' then
    begin
    PluralCB.itemindex := PluralCB.Properties.Items.IndexOf(DataModuleClient.DepartmentsPlural_UnitDesc.value);
    if PluralCB.ItemIndex < 0
      then PluralCB.itemindex := PluralCB.Properties.items.Add(DataModuleClient.DepartmentsPlural_UnitDesc.value);
    end;
  if SelectedType = stAll then
    begin
    cxPageControl1.HideTabs := True;
    cxPageControl1.ActivePage := cxTabSheet1;
    cxPageControl1.HideTabs := True;
    DMrep1.ButtonGlyphList.GetBitmap(1, NextFinishBtn.Glyph);
    end;
  if SelectedType = stTarget then
    begin
    NextFinishBtn.Caption := 'Close';
    PrevBtn.Visible := False;
    cxPageControl1.HideTabs := True;
    cxPageControl1.ActivePage := cxTabsheet5;
    DMrep1.ButtonGlyphList.GetBitmap(0, NextFinishBtn.Glyph);
    end;
  if SelectedType = stCashFlow then
    begin
    NextFinishBtn.Caption := 'Close';
    PrevBtn.Visible := False;
    cxPageControl1.HideTabs := True;
    cxPageControl1.ActivePage := cxTabsheet3;
    DMrep1.ButtonGlyphList.GetBitmap(0, NextFinishBtn.Glyph);
    end;
  if SelectedType = stExpenses then
    begin
    NextFinishBtn.Caption := 'Close';
    PrevBtn.Visible := False;
    cxPageControl1.ActivePage := cxTabsheet4;
    cxPageControl1.HideTabs := True;
    DMrep1.ButtonGlyphList.GetBitmap(0, NextFinishBtn.Glyph);
    end;
  DMrep1.ButtonGlyphList.GetBitmap(2, PrevBtn.Glyph);
  DMrep1.ButtonGlyphList.GetBitmap(3, CancelBtn.Glyph);
end;

procedure TTargetSetupF.cxGrid1DBTableView1STARTDATEPropertiesValidate(
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
      d := DaysInMonth(m, Y + 1, 1950)
    else
      d := DaysInMonth(m, Y, 1950);
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
end;

function TTargetSetupF.EnddateExists(Newdate : TDateTime): Boolean;
var
  varg : Variant;
begin
  varg := VarArraycreate([0,2], VarVariant);
  varg[0] := DatamoduleClient.DepartmentsDEPT_ID.Value;
  Varg[1] := Newdate;
  Result := DatamoduleClient.DateRef.Locate('DEPT_ID;EndDate',varg, []);
end;

procedure TTargetSetupF.cxGrid1DBTableView1ENDDATEPropertiesValidate(
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
  d1 := DaysInMonth(m, Y, 1950);
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
end;

procedure TTargetSetupF.cxGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  Application.ProcessMessages;
end;

procedure TTargetSetupF.PlanningStartDateExit(Sender: TObject);
begin
  if (DataModuleClient.DepartmentsCurrentPlanEnd.value = 0) or
    (DaySpan(DataModuleClient.DepartmentsCurrentPlanEnd.value, DataModuleClient.DepartmentsCurrentPlanStart.value) > 366) then
    begin
    DataModuleClient.Departments.edit;
    DataModuleClient.DepartmentsCurrentPlanEnd.value := IncYear(DataModuleClient.DepartmentsCurrentPlanStart.value) - 1;
    DataModuleClient.Departments.Post;
    end;
  if (InitialPlanend <> DataModuleClient.DepartmentsCurrentPlanEnd.value) or (InitialPlanStart <> DataModuleClient.DepartmentsCurrentPlanStart.value) then
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
  DataModuleClient.Departments.GotoBookmark(DeptBM);
  FindPastDate;
  BackYearBtn.Enabled := True;
  AdvYearBtn.Enabled := True;
end;

procedure TTargetSetupF.PlanExtBtnClick(Sender: TObject);
begin
    Application.CreateForm(TPlanExtensionF, PlanExtensionF);
    PlanExtensionF.showmodal;
    PlanExtensionF.free;
    Screen.Cursor := crDefault;
end;

procedure TTargetSetupF.AddDateRangeBtnClick(Sender: TObject);
begin
  cxGrid1.SetFocus;
  DataModuleClient.DateRangers.Insert;
end;

procedure TTargetSetupF.handlePastDates(var Msg : TMessage);
begin
  if (Msg.WParam < 5) and  (Msg.LParam = DELETION) then
    begin
    AddDateRangeBtn.Enabled := True;
    AppendDateRangeBtn.enabled := True;
    end;
  if (Msg.WParam = 5) and  (Msg.LParam = POSTING) then
    begin
    AddDateRangeBtn.Enabled := False;
    AppendDateRangeBtn.enabled := False;
    end;
end;

procedure TTargetSetupF.AppendDateRangeBtnClick(Sender: TObject);
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

procedure TTargetSetupF.DeleteDateRangeBtnClick(Sender: TObject);
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
end;

procedure TTargetSetupF.cxTabSheet2Exit(Sender: TObject);
begin
  GGlobals.DebugOut('Setup: Exit Activity Names');
  DataModuleClient.Departments.edit;
  DataModuleClient.DepartmentsSingular_UnitDesc.value := SingleCB.Text;
  DataModuleClient.DepartmentsPlural_UnitDesc.value := PluralCB.Text;
  DataModuleClient.Departments.Post;
  FindpastDate;
end;

procedure TTargetSetupF.SingleCBPropertiesChange(Sender: TObject);
begin
  if (PluralCB.ItemIndex < 7) and (SingleCB.ItemIndex < 7) then
    PluralCB.ItemIndex := SingleCB.itemIndex;
//  setLabels;
end;

procedure TTargetSetupF.PluralCBPropertiesChange(Sender: TObject);
begin
  if (SingleCB.ItemIndex < 7) and (PluralCB.ItemIndex < 7) then
    SingleCB.ItemIndex := PluralCB.itemIndex;
end;

procedure TTargetSetupF.SingleCBExit(Sender: TObject);
begin
  if (SingleCB.Properties.Items.IndexOf(SingleCB.text)< 0) and (length(SingleCB.text) > 0)then
    SingleCB.itemindex := SingleCB.Properties.items.Add(SingleCB.text);
end;

procedure TTargetSetupF.PluralCBExit(Sender: TObject);
begin
  if (PluralCB.Properties.Items.IndexOf(PluralCB.text)< 0) and (length(PluralCB.text) > 0) then
    PluralCB.itemindex := PluralCB.Properties.items.Add(PluralCB.text);
end;

procedure TTargetSetupF.LoadOptions;
Var
  Temp : Currency;
  PreviousBalance : Boolean;
begin
  PeriodCB.ItemIndex := DataCollect.GetUserOption(OPERIODSIZE, UOInteger);
  PeriodCB.ItemIndex := 4;
  if DataCollect.GetUserOption(OUSESTOCKDAYS, UOInteger) <> 0 then
    UsesStockDaysCHECK.Checked := True
  else
    UsesStockDaysCHECK.Checked := False;
  UsesStockDaysCHECKClick(Self);
//  ARAverage.Value := DataCollect.GetUserOption(OARDAYSAVERAGE, UOCurrency);
//  StockAverage.Value := DataCollect.GetUserOption(OSTOCKAVERAGE, UOCurrency);
//  APAverage.Value := DataCollect.GetUserOption(OAPDAYSAVERAGE, UOCurrency);
//  AccruedAverage.Value := DataCollect.GetUserOption(OAEDAYSAVERAGE, UOCurrency);
  TaxRateSales.Value := DataCollect.GetUserOption(OTAXRATE_SALES, UOCurrency);
  TaxRateMaterialsStock.Value := DataCollect.GetUserOption(OTAXRATE_STOCK, UOCurrency);
  TaxRateSubCon.Value := DataCollect.GetUserOption(OTAXRATE_SUBCON, UOCurrency);
  TaxRateExpenses.Value := DataCollect.GetUserOption(OTAXRATE_EXPENSES, UOCurrency);
  TaxPaymentRB.ItemIndex := DataCollect.GetUserOption(OTAXPAYMENTQUARTERLY, UOInteger);
  TaxMethodRB.ItemIndex := DataCollect.GetUserOption(OTAXACCOUNTINGMETHOD, UOInteger);
  TaxPaidDay.Value := DataCollect.GetUserOption(OTAXPAIDDAY, UOInteger);
  if TaxPaidDay.Value = 0 then
    TaxPaidDay.Value := 25;    
  FirstDay.ItemIndex := DataCollect.GetUserOption(OFIRSTDAY, UOInteger);
  FirstMonth.ItemIndex := DataCollect.GetUserOption(OFIRSTMONTH, UOInteger);
  if DataCollect.GetUserOption(OBANKACCOUNTLIABILITY, UOInteger) <> 0 then
    BankODCB.Checked := True
  else
    BankODCB.Checked := False;
  ODInterest.Value := DataCollect.GetUserOption(OOVERDRAFTRATE, UOCurrency);
  // Income Tax and Dividend Options
  DataCollect.getPlanBalanceonDateEx(DataModuleClient.DepartmentsDEPT_ID.Value, DataModuleClient.DepartmentsCURRENTPLANSTART.Value - 1, TAX_LOSSES, temp, previousBalance);
  TaxLossesEdit.Value := Temp;
  IncomeTaxRate.Value := DataCollect.GetUserOption(OINCOMETAXRATE, UOCurrency);
  DividendRate.Value := DataCollect.GetUserOption(ODIVIDENDRATE, UOCurrency);
  MinDividendAmount.Value := DataCollect.GetUserOption(OMINDIVIDEND, UOCurrency);
  MaxDividendAmount.Value := DataCollect.GetUserOption(OMAXDIVIDEND, UOCurrency);
end;

procedure TTargetSetupF.SaveOptions;
var
  BValue : Variant;
  Temp : Currency;
begin
  initialised := False;
  if CurrentGroupIndex <> NewGroupIndex then
    begin;
    Bvalue := CurrentGroupIndex;
    DataModuleClient.DeptOptions.Locate('OPTION_GROUP_ID', Bvalue, [])
    end;
  PeriodCB.ItemIndex := 4;
  DataCollect.SetUserOption(OPERIODSIZE, UOInteger, PeriodCB.ItemIndex);
  if UsesStockDaysCHECK.Checked then
     Bvalue := 1
  else
     Bvalue := 0;
  DataCollect.setUserOption(OUSESTOCKDAYS, UOInteger, Bvalue);
//  DataCollect.setUserOption(OARDAYSAVERAGE, UOCurrency, ARAverage.Value);
//  DataCollect.SetUserOption(OSTOCKAVERAGE, UOCurrency, StockAverage.Value);
//  DataCollect.setUserOption(OAPDAYSAVERAGE, UOCurrency, APAverage.Value);
//  DataCollect.SetUserOption(OAEDAYSAVERAGE, UOCurrency, AccruedAverage.Value);
  DataCollect.setUserOption(OARDAYSAVERAGE, UOCurrency, 2);
  DataCollect.SetUserOption(OSTOCKAVERAGE, UOCurrency, 2);
  DataCollect.setUserOption(OAPDAYSAVERAGE, UOCurrency, 2);
  DataCollect.SetUserOption(OAEDAYSAVERAGE, UOCurrency, 2);
  DataCollect.SetUserOption(OTAXRATE_SALES, UOCurrency, TaxRateSales.Value);
  DataCollect.SetUserOption(OTAXRATE_STOCK, UOCurrency, TaxRateMaterialsStock.Value);
  DataCollect.SetUserOption(OTAXRATE_SUBCON, UOCurrency, TaxRateSubCon.Value);
  DataCollect.SetUserOption(OTAXRATE_EXPENSES, UOCurrency, TaxRateExpenses.Value);
  DataCollect.SetUserOption(OTAXPAYMENTQUARTERLY, UOInteger, TaxPaymentRB.ItemIndex);
  DataCollect.SetUserOption(OTAXACCOUNTINGMETHOD, UOInteger, TaxMethodRB.ItemIndex);
  DataCollect.SetUserOption(OTAXPAIDDAY, UOInteger, Trunc(TaxPaidDay.Value));
  DataCollect.SetUserOption(OFIRSTDAY, UOInteger, FirstDay.ItemIndex);
  DataCollect.SetUserOption(OFIRSTMONTH, UOInteger, FirstMonth.ItemIndex);
  if BankODCB.Checked then
     Bvalue := 1
  else
     Bvalue := 0;
  DataCollect.SetUserOption(OBANKACCOUNTLIABILITY, UOInteger, Bvalue);
  DataCollect.SetUserOption(OOVERDRAFTRATE, UOCurrency, ODInterest.Value);
  if CurrentGroupIndex <> NewGroupIndex then
    begin;
    Bvalue := NewGroupIndex;
    DataModuleClient.DeptOptions.Locate('OPTION_GROUP_ID', Bvalue, []);
    CurrentGroupIndex := NewGroupIndex;
    end;
  // Income Tax and Dividend Options
  Temp := TaxLossesEdit.Value;
  DataCollect.SetPlanBalanceonDateEx(DataModuleClient.DepartmentsDEPT_ID.Value, DataModuleClient.DepartmentsCURRENTPLANSTART.Value - 1, TAX_LOSSES, temp);
  DataCollect.SetUserOption(OINCOMETAXRATE, UOCurrency, IncomeTaxRate.Value);
  DataCollect.SetUserOption(ODIVIDENDRATE, UOCurrency, DividendRate.Value);
  DataCollect.SetUserOption(OMINDIVIDEND, UOCurrency, MinDividendAmount.Value);
  DataCollect.SetUserOption(OMAXDIVIDEND, UOCurrency, MaxDividendAmount.Value);
  initialised := True;
end;

procedure TTargetSetupF.cxTabSheet3Show(Sender: TObject);
//var
//  varg : variant;
begin
  NoSave := False;
  cxGroupBox1.Style.Color := GGLobals.FormColour;
  cxGroupBox2.Style.Color := GGLobals.FormColour;
  cxGroupBox3.Style.Color := GGLobals.FormColour;
  cxGroupBox4.Style.Color := GGLobals.FormColour;
  Initialised := False;
//  Varg := DataModuleClient.DepartmentsCURRENTPLANEND.Value;
//  if (DataModuleClient.DeptOptions.RecordCount = 0) or (not DataModuleClient.DeptOptions.Locate('EXPIRY_DATE', varg, [])) then
//    DataModuleClient.Deptoptions.Insert;
  // get options
  DataModuleClient.LookupSummaryIntervals.First;
  PeriodCB.Properties.Items.Clear;
  while DataModuleClient.LookupSummaryIntervals.eof = False do
    begin
    PeriodCB.Properties.Items.Add(DataModuleClient.LookupSummaryIntervalsPeriod_Desc.value);
    DataModuleClient.LookupSummaryIntervals.Next;
    end;
  LoadOptions;
  Initialised := True;
  if DataModuleClient.DeptOptions.RecordCount < 1 then
    begin
    DataModuleClient.DeptOptions.Insert;
    end;
  CurrentGroupIndex := DataModuleClient.DeptOptionsOPTION_GROUP_ID.Value;
  NewGroupIndex := CurrentGroupIndex;
{  if ARAverage.Value < 1 then
    ARAverage.Value := 2;
  if StockAverage.Value < 1 then
    StockAverage.Value := 2;
  if APAverage.Value < 1 then
    APAverage.Value := 2;
  if AccruedAverage.Value < 1 then
    AccruedAverage.Value := 2;
}
end;

procedure TTargetSetupF.cxButton1Click(Sender: TObject);
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

procedure TTargetSetupF.CancelBtnClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TTargetSetupF.cxGrid1Exit(Sender: TObject);
begin
  if (DataModuleClient.DSDateRangers.State in [dsEdit, dsInsert]) then
    DataModuleClient.DateRangers.Post;
end;

procedure TTargetSetupF.cxTabSheet5Enter(Sender: TObject);
begin
  DeptBM := DataModuleClient.Departments.GetBookmark;
  if DataModuleClient.DepartmentsCURRENTPLANSTART.Value < 10 then
    begin
    BackYearBtn.Enabled := False;
    AdvYearBtn.Enabled := false;
    end;
end;

procedure TTargetSetupF.cxTabSheet4Show(Sender: TObject);
begin
  DataModuleClient.BSAccounts.active := True;
  DataModuleClient.ExpAccounts.Active := True;
  DataModuleClient.Dept_Accounts.Active := False;
  DataModuleClient.Dept_Accounts.Filter := 'DEPT_ID=' + DataModuleClient.DepartmentsDEPT_ID.AsString;
  DataModuleClient.Dept_Accounts.Filtered := True;
  DataModuleClient.Dept_Accounts.active := True;
  DataModuleClient.CreateDeptExpenseAccountRecords;
end;

procedure TTargetSetupF.BackYearBtnClick(Sender: TObject);
begin
  if not (DataModuleClient.DSDepartments.State in [dsEdit, dsInsert]) then
    DataModuleClient.Departments.Edit;
  DataModuleClient.DepartmentsCURRENTPLANSTART.Value := incYear(DataModuleClient.DepartmentsCURRENTPLANSTART.Value, -1);
  DataModuleClient.DepartmentsCURRENTPLANEND.Value := incYear(DataModuleClient.DepartmentsCURRENTPLANEND.Value, -1);
  DataModuleClient.Departments.Post;
end;

procedure TTargetSetupF.AdvYearBtnClick(Sender: TObject);
begin
  if not (DataModuleClient.DSDepartments.State in [dsEdit, dsInsert]) then
    DataModuleClient.Departments.Edit;
  DataModuleClient.DepartmentsCURRENTPLANSTART.Value := incYear(DataModuleClient.DepartmentsCURRENTPLANSTART.Value, 1);
  DataModuleClient.DepartmentsCURRENTPLANEND.Value := incYear(DataModuleClient.DepartmentsCURRENTPLANEND.Value, 1);
  DataModuleClient.Departments.Post;
  if (InitialPlanend <> DataModuleClient.DepartmentsCurrentPlanEnd.value) or (InitialPlanStart <> DataModuleClient.DepartmentsCurrentPlanStart.value) then
    PlanExtBtn.Enabled := True;
end;

procedure TTargetSetupF.UsesStockDaysCHECKClick(Sender: TObject);
begin
//  if UsesStockDaysCHECK.Checked then
//    cxLabel18.Caption := 'Stock Days'
//  else
//    cxLabel18.Caption := 'Stock Turns';
//  cxLabel18.Refresh;
;
end;

procedure TTargetSetupF.cxGrid2Exit(Sender: TObject);
begin
  if DataModuleClient.DSEXPACCOUNTS.State in [dsinsert,dsedit] then
    begin
    DataModuleClient.ExpAccounts.Post;
    DataModuleClient.ExpAccounts.CommitUpdates;
    DataModuleClient.ClientDatabase.Commit;
    DataModuleClient.ExpAccounts.Refresh;
    end;
end;

procedure TTargetSetupF.cxDBTaxRateEnter(Sender: TObject);
begin
  if DataModuleClient.Dept_AccountsTAX_RATE.IsNull then
      DataModuleClient.Dept_Accounts.Insert;
end;

procedure TTargetSetupF.InsertTitleBtnClick(Sender: TObject);
begin
  DATAMODULECLIENT.ExpAccounts.Insert;
  cxGrid2.SetFocus;
end;

procedure TTargetSetupF.cxButton3Click(Sender: TObject);
begin
  if Messagedlg('Are you sure you want to delete this expense account?' + #13#10
    + 'If this account has balances, they will be deleted in all Departments / Revenue Groups' + #13#10
    + 'and in all areas - Past, Target and Tracking', mtWarning, [mbYes, mbNo], 0) = mrYes then
    DATAMODULECLIENT.ExpAccounts.Delete;
  cxGrid2.SetFocus;
end;

procedure TTargetSetupF.PlanningEndDateExit(Sender: TObject);
begin
  if (InitialPlanend <> DataModuleClient.DepartmentsCurrentPlanEnd.value) or (InitialPlanStart <> DataModuleClient.DepartmentsCurrentPlanStart.value) then
    PlanExtBtn.Enabled := True;
end;

procedure TTargetSetupF.cxTabSheet5Exit(Sender: TObject);
begin
//
  DataModuleClient.Departments.GotoBookmark(DeptBM);
  DataModuleClient.Departments.Edit;
  if DataModuleClient.DepartmentsCurrentPlanStart.value < DataModuleClient.DepartmentsFIRSTPLANDATE.value then
    DataModuleClient.DepartmentsFIRSTPLANDATE.value := DataModuleClient.DepartmentsCurrentPlanStart.value;
  if DataModuleClient.DepartmentsCurrentPlanEnd.value > DataModuleClient.DepartmentsLATESTPLANDATE.value then
    DataModuleClient.DepartmentsLATESTPLANDATE.value := DataModuleClient.DepartmentsCurrentPlanEnd.value;
  DataModuleClient.Departments.post;
end;

procedure TTargetSetupF.ApplyTargetDatetoAllBtnClick(Sender: TObject);
begin
// using DeptRef to set the date on all departments the same.
  DataModuleClient.DeptRef.First;
  while DataModuleClient.DeptRef.Eof = False do
    begin
    if DataModuleClient.DeptRefDEPT_ID.Value <> DataModuleClient.DepartmentsDEPT_ID.value then
      begin
      DataModuleClient.DeptRef.Edit;
      DataModuleClient.DeptrefCurrentPlanStart.value := DataModuleClient.DepartmentsCurrentPlanStart.value;
      DataModuleClient.DeptrefCurrentPlanEnd.value := DataModuleClient.DepartmentsCurrentPlanEnd.value;
      if DataModuleClient.DeptrefCurrentPlanStart.value < DataModuleClient.DeptrefFIRSTPLANDATE.value then
        DataModuleClient.DeptrefFIRSTPLANDATE.value := DataModuleClient.DeptrefCurrentPlanStart.value;
      if DataModuleClient.DeptrefCurrentPlanEnd.value > DataModuleClient.DeptrefLATESTPLANDATE.value then
        DataModuleClient.DeptrefLATESTPLANDATE.value := DataModuleClient.DeptrefCurrentPlanEnd.value;
      DataModuleClient.Deptref.Post;
      end;
    DataModuleClient.DeptRef.Next;
    end;    // while
end;

end.
