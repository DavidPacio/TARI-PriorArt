unit BusinessSetup;

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
  cxLookAndFeelPainters, cxDBLabel, ComCtrls, ExpGrouping, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxPCdxBarPopupMenu, cxLookAndFeels,
  Menus, dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type

  TSetupType = (stAll, stPast, stTarget, stActivity, stCashFlow, stExpenses);

  TBusinessSetupF = class(TForm)
    cxPageControl1: TcxPageControl;
    cxTabSheet3: TcxTabSheet;
    cxTabSheet4: TcxTabSheet;
    NextFinishBtn: TcxButton;
    PrevBtn: TcxButton;
    cxTabSheet5: TcxTabSheet;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    PlanningStartDate: TcxDBDateEdit;
    PlanningEndDate: TcxDBDateEdit;
    cxGroupBox1: TcxGroupBox;
    cxLabel14: TcxLabel;
    PeriodCB: TcxComboBox;
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
    CancelBtn: TcxButton;
    AdvYearBtn: TcxButton;
    BackYearBtn: TcxButton;
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
    UsesStockDaysCHECK: TcxCheckBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel5: TcxLabel;
    TrackingEndDate: TcxDBDateEdit;
    Trackingstartdate: TcxDBDateEdit;
    TrackingBackOneYear: TcxButton;
    TrackingAdvanceOneYear: TcxButton;
    ApplyTargetDatetoAllBtn: TcxButton;
    ApplyTrackDatetoALLBtn: TcxButton;
    CxAccountGroupingBtn: TcxButton;
    cxLabel6: TcxLabel;
    cxLabel37: TcxLabel;
    cxDBLabel4: TcxDBLabel;
    procedure NextFinishBtnClick(Sender: TObject);
    procedure PrevBtnClick(Sender: TObject);
    procedure cxPageControl1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PlanningStartDateExit(Sender: TObject);
    procedure PlanExtBtnClick(Sender: TObject);
    procedure cxTabSheet3Show(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
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
    procedure TrackingBackOneYearClick(Sender: TObject);
    procedure TrackingAdvanceOneYearClick(Sender: TObject);
    procedure ApplyTrackDatetoALLBtnClick(Sender: TObject);
    procedure TrackingEndDateExit(Sender: TObject);
    procedure TrackingstartdateExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CxAccountGroupingBtnClick(Sender: TObject);
  private
    { Private declarations }
    NoSave : Boolean;
    Initialised : Boolean;
    CurrentGroupIndex : Integer;
    NewGroupIndex : Integer;
    InsertedExpense : Boolean;
    BranchID : Integer;
    procedure SaveOptions;
    procedure LoadOptions;
    procedure ExitOptions;
    procedure ExitExpenses;
  public
    { Public declarations }
  end;

var
  BusinessSetupF: TBusinessSetupF;
  SelectedType : TSetupType;

implementation

{$R *.dfm}

procedure TBusinessSetupF.NextFinishBtnClick(Sender: TObject);
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
      DMrep1.TariButtonList.GetImage(0,NextFinishBtn.Glyph);
 //     DMrep1.TariButtonList.GetBitmap(0, NextFinishBtn.Glyph);
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

procedure TBusinessSetupF.PrevBtnClick(Sender: TObject);
begin
  if cxPageControl1.ActivePageIndex = (cxPageControl1.PageCount - 1) then
    begin
      NextFinishBtn.Glyph.FreeImage;
      NextFinishBtn.Glyph := nil;
      DMrep1.TariButtonList.GetImage(1, NextFinishBtn.Glyph);
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

procedure TBusinessSetupF.ExitExpenses;
begin
  DataModuleClient.ExpAccounts.First;
  while DataModuleClient.ExpAccounts.Eof = false do
    begin
    if (DataModuleClient.ExpAccountsNON_CASH.Value = 1) and (DataModuleClient.Dept_AccountsBALANCE_SHEET_ACCOUNT.value = 0) then
      begin
			MessageDlg('Account - ' + DataModuleClient.ExpAccountsACCOUNT_TITLE.AsString + ' is a non cash account' +
      #13#10 + 'requires a Balance Sheet account association. Please correct.', mtInformation, [mbOK], 0);
      end;
    DataModuleClient.ExpAccounts.Next;
    end;    // while
  DataModuleClient.ClientDatabase.Commit;
  DataModuleClient.Dept_Accounts.active := False;
  DataModuleClient.ExpAccounts.Active := False;
  DataModuleClient.BSAccounts.active := False;
end;

procedure TBusinessSetupF.ExitOptions;
begin
  if Not NoSave then
    begin
    SaveOptions;
    end;
end;

procedure TBusinessSetupF.cxPageControl1Change(Sender: TObject);
begin
if cxPageControl1.ActivePageIndex = 0 then
 PrevBtn.Enabled := False
else
 PrevBtn.Enabled := True;
end;

procedure TBusinessSetupF.FormCreate(Sender: TObject);
//var
//  I: Integer;
begin
//  Color := GGlobals.FormColour;
  InsertedExpense := False;
  CxAccountGroupingBtn.Visible := GGlobals.Config_Accountingfmt;

	Caption := 'Setup - ' + DataModuleClient.BusinessesBRANCH_NAME.AsString;
  DataModuleClient.BusinessesTARGET_START.DisplayFormat := GGlobals.GetDateFENH;
  DataModuleClient.BusinessesTARGET_END.DisplayFormat := GGlobals.GetDateFENH;
  DataModuleClient.BusinessesTRACKING_START.DisplayFormat := GGlobals.GetDateFENH;
  DataModuleClient.BusinessesTRACKING_END.DisplayFormat := GGlobals.GetDateFENH;
  DataModuleClient.DeptOptions.Active := False;
  DataModuleClient.DeptOptions.Filter := 'DEPT_ID=' + DataModuleClient.CashFlowDeptDEPT_ID.AsString;
  DataModuleClient.DeptOptions.Filtered := True;
  DataModuleClient.DeptOptions.active := True;
//  for I := 0 to cxPageControl1.PageCount - 1 do    // Iterate
//    cxPageControl1.Pages[I].Color := GGlobals.FormColour;
  InitialPlanStart := DataModuleClient.BusinessesTARGET_START.Value;
  InitialPlanEnd := DataModuleClient.BusinessesTARGET_END.Value;
  if SelectedType = stAll then
    begin
    cxPageControl1.HideTabs := True;
    cxPageControl1.ActivePage := cxTabSheet5;
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
  if SelectedType = stCashFlow then
    begin
    NextFinishBtn.Caption := 'Close';
    PrevBtn.Visible := False;
    cxPageControl1.HideTabs := True;
    cxPageControl1.ActivePage := cxTabsheet3;
    DMrep1.TariButtonList.GetImage(0, NextFinishBtn.Glyph);
    end;
  if SelectedType = stExpenses then
    begin
    NextFinishBtn.Caption := 'Close';
    PrevBtn.Visible := False;
    cxPageControl1.ActivePage := cxTabsheet4;
    cxPageControl1.HideTabs := True;
    DMrep1.TariButtonList.GetImage(0, NextFinishBtn.Glyph);
    end;
  DMrep1.TariButtonList.GetImage(2, PrevBtn.Glyph);
  DMrep1.TariButtonList.GetImage(3, CancelBtn.Glyph);
end;

procedure TBusinessSetupF.PlanningStartDateExit(Sender: TObject);
begin
  if (DataModuleClient.BusinessesTARGET_END.value = 0) or
    (DaySpan(DataModuleClient.BusinessesTARGET_END.value, DataModuleClient.BusinessesTARGET_START.value) > 366) then
    begin
    DataModuleClient.Businesses.edit;
    DataModuleClient.BusinessesTARGET_END.value := IncYear(DataModuleClient.BusinessesTARGET_START.value) - 1;
    DataModuleClient.Businesses.Post;
    end;
  DataModuleClient.ClientDatabase.Refresh(true);
  DataModuleClient.Businesses.Locate('BRANCH_ID', variant(BranchID), []);
//  DataModuleClient.Businesses.GotoBookmark(BranchBM);
  DataModuleClient.Sync_Businessdates;
  BackYearBtn.Enabled := True;
  AdvYearBtn.Enabled := True;
end;

procedure TBusinessSetupF.PlanExtBtnClick(Sender: TObject);
begin
    Application.CreateForm(TPlanExtensionF, PlanExtensionF);
    PlanExtensionF.showmodal;
    PlanExtensionF.free;
    Screen.Cursor := crDefault;
end;

procedure TBusinessSetupF.LoadOptions;
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
  DataCollect.getPlanBalanceonDateEx(DataModuleClient.CashFlowDeptDEPT_ID.Value, DataModuleClient.CashFlowDeptCURRENTPLANSTART.Value - 1, TAX_LOSSES, temp, previousBalance);
  //temp := 0;
  TaxLossesEdit.Value := Temp;
  IncomeTaxRate.Value := DataCollect.GetUserOption(OINCOMETAXRATE, UOCurrency);
  DividendRate.Value := DataCollect.GetUserOption(ODIVIDENDRATE, UOCurrency);
  MinDividendAmount.Value := DataCollect.GetUserOption(OMINDIVIDEND, UOCurrency);
  MaxDividendAmount.Value := DataCollect.GetUserOption(OMAXDIVIDEND, UOCurrency);
end;

procedure TBusinessSetupF.SaveOptions;
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
  DataCollect.SetPlanBalanceonDateEx(DataModuleClient.CashFlowDeptDEPT_ID.Value, DataModuleClient.CashFlowDeptCURRENTPLANSTART.Value - 1, TAX_LOSSES, temp);
  DataCollect.SetUserOption(OINCOMETAXRATE, UOCurrency, IncomeTaxRate.Value);
  DataCollect.SetUserOption(ODIVIDENDRATE, UOCurrency, DividendRate.Value);
  DataCollect.SetUserOption(OMINDIVIDEND, UOCurrency, MinDividendAmount.Value);
  DataCollect.SetUserOption(OMAXDIVIDEND, UOCurrency, MaxDividendAmount.Value);
  initialised := True;
end;

procedure TBusinessSetupF.cxTabSheet3Show(Sender: TObject);
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
    PeriodCB.Properties.Items.Add(DataModuleClient.LookupSummaryIntervalsPeriod_Desc.AsString);
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

procedure TBusinessSetupF.cxButton1Click(Sender: TObject);
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

procedure TBusinessSetupF.CancelBtnClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TBusinessSetupF.cxTabSheet5Enter(Sender: TObject);
begin
  BranchID := DatamoduleClient.BusinessesBRANCH_ID.AsInteger;
//  BranchBM := DataModuleClient.businesseBusinesses.GetBookmark;
  if DataModuleClient.BusinessesTARGET_START.Value < 10 then
    begin
    BackYearBtn.Enabled := False;
    AdvYearBtn.Enabled := false;
    end;
end;

procedure TBusinessSetupF.cxTabSheet4Show(Sender: TObject);
begin
  DataModuleClient.BSAccounts.active := True;
  DataModuleClient.ExpAccounts.Active := True;
  DataModuleClient.Dept_Accounts.Active := False;
  DataModuleClient.Dept_Accounts.Filter := 'DEPT_ID=' + DataModuleClient.CashFlowDeptDEPT_ID.AsString;
  DataModuleClient.Dept_Accounts.Filtered := True;
  DataModuleClient.Dept_Accounts.active := True;
  DataModuleClient.CreateDeptExpenseAccountRecords;
end;

procedure TBusinessSetupF.BackYearBtnClick(Sender: TObject);
begin
  if not (DataModuleClient.DSBusinesses.State in [dsEdit, dsInsert]) then
    DataModuleClient.Businesses.Edit;
  DataModuleClient.BusinessesTARGET_START.Value := incYear(DataModuleClient.BusinessesTARGET_START.Value, -1);
  DataModuleClient.BusinessesTARGET_END.Value := incYear(DataModuleClient.BusinessesTARGET_END.Value, -1);
  DataModuleClient.Businesses.Post;
  DataModuleClient.Businesses.Locate('BRANCH_ID', variant(BranchID), []);
//  DataModuleClient.Businesses.GotoBookmark(BranchBM);
  DataModuleClient.Sync_Businessdates;
end;

procedure TBusinessSetupF.AdvYearBtnClick(Sender: TObject);
begin
  if not (DataModuleClient.DSBusinesses.State in [dsEdit, dsInsert]) then
    DataModuleClient.Businesses.Edit;
  DataModuleClient.BusinessesTARGET_START.Value := incYear(DataModuleClient.BusinessesTARGET_START.Value, 1);
  DataModuleClient.BusinessesTARGET_END.Value := incYear(DataModuleClient.BusinessesTARGET_END.Value, 1);
  DataModuleClient.Businesses.Post;
  DataModuleClient.Businesses.Locate('BRANCH_ID', variant(BranchID), []);
//  DataModuleClient.Businesses.GotoBookmark(BranchBM);
  DataModuleClient.Sync_Businessdates;
end;

procedure TBusinessSetupF.UsesStockDaysCHECKClick(Sender: TObject);
begin
//  if UsesStockDaysCHECK.Checked then
//    cxLabel18.Caption := 'Stock Days'
//  else
//    cxLabel18.Caption := 'Stock Turns';
//  cxLabel18.Refresh;
;
end;

procedure TBusinessSetupF.cxGrid2Exit(Sender: TObject);
begin
  if DataModuleClient.DSEXPACCOUNTS.State in [dsinsert,dsedit] then
    begin
    DataModuleClient.ExpAccounts.Post;
    DataModuleClient.ExpAccounts.CommitUpdates;
    DataModuleClient.ClientDatabase.Commit;
    DataModuleClient.ExpAccounts.Refresh;
    end;
end;

procedure TBusinessSetupF.cxDBTaxRateEnter(Sender: TObject);
begin
  if DataModuleClient.Dept_AccountsTAX_RATE.IsNull then
      DataModuleClient.Dept_Accounts.Insert;
end;

procedure TBusinessSetupF.InsertTitleBtnClick(Sender: TObject);
begin
  DATAMODULECLIENT.ExpAccounts.Insert;
  cxGrid2.SetFocus;
end;

procedure TBusinessSetupF.cxButton3Click(Sender: TObject);
begin
  if DATAMODULECLIENT.ExpAccountsACCOUNT_NUMBER.Value = TOTALOTHEREXPENSES then Exit;
  if Messagedlg('Are you sure you want to delete this expense account?' + #13#10
    + 'If this account has balances, they will be deleted in all Businesses / Departments / Revenue Groups' + #13#10
    + 'and in all areas - Past, Target and Tracking', mtWarning, [mbYes, mbNo], 0) = mrYes then
    DATAMODULECLIENT.ExpAccounts.Delete;
  cxGrid2.SetFocus;
end;

procedure TBusinessSetupF.PlanningEndDateExit(Sender: TObject);
begin
//  if (InitialPlanend <> DataModuleClient.DepartmentsCurrentPlanEnd.value) or (InitialPlanStart <> DataModuleClient.DepartmentsCurrentPlanStart.value) then
//    PlanExtBtn.Enabled := True;
  DataModuleClient.Sync_Businessdates;
end;

procedure TBusinessSetupF.cxTabSheet5Exit(Sender: TObject);
begin
//
//  DataModuleClient.Businesses.GotoBookmark(BranchBM);
  DataModuleClient.Businesses.Locate('BRANCH_ID', variant(BranchID), []);

  if (Daysbetween(DataModuleClient.BusinessesTARGET_START.Value, DataModuleClient.BusinessesTARGET_END.Value) > 366) Then
    begin
    messagedlg('The Target Start and End dates must be no more than 366 days apart!', mtwarning, [mbOK], 0);
    cxPageControl1.ActivePageIndex := 0;
    end;
  if (Daysbetween(DataModuleClient.BusinessesTRACKING_START.Value, DataModuleClient.BusinessesTRACKING_END.Value) > 366) Then
    begin
    messagedlg('The Tracking Start and End dates must be no more than 366 days apart!', mtwarning, [mbOK], 0);
    cxPageControl1.ActivePageIndex := 0;
    end;
//  DataModuleClient.Businesses.Edit;
//  if DataModuleClient.DepartmentsCurrentPlanStart.value < DataModuleClient.DepartmentsFIRSTPLANDATE.value then
//    DataModuleClient.DepartmentsFIRSTPLANDATE.value := DataModuleClient.DepartmentsCurrentPlanStart.value;
//  if DataModuleClient.DepartmentsCurrentPlanEnd.value > DataModuleClient.DepartmentsLATESTPLANDATE.value then
//    DataModuleClient.DepartmentsLATESTPLANDATE.value := DataModuleClient.DepartmentsCurrentPlanEnd.value;
//  DataModuleClient.Departments.post;
end;

procedure TBusinessSetupF.ApplyTargetDatetoAllBtnClick(Sender: TObject);
begin
  DataModuleClient.Businesses.Locate('BRANCH_ID', variant(BranchID), []);

//  DataModuleClient.Businesses.GotoBookmark(BranchBM);
  DataModuleClient.BusinessesRef.First;
  while DataModuleClient.BusinessesRef.Eof = False do
    begin
    if DataModuleClient.BusinessesRefBRANCH_ID.Value <> DataModuleClient.BusinessesBRANCH_ID.value then
      begin
      DataModuleClient.BusinessesRef.Edit;
      DataModuleClient.BusinessesRefTARGET_START.value := DataModuleClient.BusinessesTARGET_START.value;
      DataModuleClient.BusinessesRefTARGET_END.value := DataModuleClient.BusinessesTARGET_END.value;
      DataModuleClient.BusinessesRef.Post;
      end;
    DataModuleClient.BusinessesRef.Next;
    end;    // while
end;

procedure TBusinessSetupF.TrackingBackOneYearClick(Sender: TObject);
begin
  if not (DataModuleClient.DSBusinesses.State in [dsEdit, dsInsert]) then
    DataModuleClient.Businesses.Edit;
  DataModuleClient.BusinessesTRACKING_START.Value := incYear(DataModuleClient.BusinessesTRACKING_START.Value, -1);
  DataModuleClient.BusinessesTRACKING_END.Value := incYear(DataModuleClient.BusinessesTRACKING_END.Value, -1);
  DataModuleClient.Businesses.Post;
  DataModuleClient.Businesses.Locate('BRANCH_ID', variant(BranchID), []);
//  DataModuleClient.Businesses.GotoBookmark(BranchBM);
  DataModuleClient.Sync_Businessdates;
end;

procedure TBusinessSetupF.TrackingAdvanceOneYearClick(Sender: TObject);
begin
  if not (DataModuleClient.DSBusinesses.State in [dsEdit, dsInsert]) then
    DataModuleClient.Businesses.Edit;
  DataModuleClient.BusinessesTRACKING_START.Value := incYear(DataModuleClient.BusinessesTRACKING_START.Value, 1);
  DataModuleClient.BusinessesTRACKING_END.Value := incYear(DataModuleClient.BusinessesTRACKING_END.Value, 1);
  DataModuleClient.Businesses.Post;
  DataModuleClient.Businesses.Locate('BRANCH_ID', variant(BranchID), []);
//  DataModuleClient.Businesses.GotoBookmark(BranchBM);
  DataModuleClient.Sync_Businessdates;
end;

procedure TBusinessSetupF.ApplyTrackDatetoALLBtnClick(Sender: TObject);
begin
  DataModuleClient.Businesses.Locate('BRANCH_ID', variant(BranchID), []);
//  DataModuleClient.Businesses.GotoBookmark(BranchBM);
  DataModuleClient.BusinessesRef.First;
  while DataModuleClient.BusinessesRef.Eof = False do
    begin
    if DataModuleClient.BusinessesRefBRANCH_ID.Value <> DataModuleClient.BusinessesBRANCH_ID.value then
      begin
      DataModuleClient.BusinessesRef.Edit;
      DataModuleClient.BusinessesRefTRACKING_START.value := DataModuleClient.BusinessesTRACKING_START.value;
      DataModuleClient.BusinessesRefTRACKING_END.value := DataModuleClient.BusinessesTRACKING_END.value;
      DataModuleClient.BusinessesRef.Post;
      end;
    DataModuleClient.BusinessesRef.Next;
    end;    // while
end;

procedure TBusinessSetupF.TrackingstartdateExit(Sender: TObject);
begin
  if (DataModuleClient.BusinessesTRACKING_END.value = 0) or
    (DaySpan(DataModuleClient.BusinessesTRACKING_END.value, DataModuleClient.BusinessesTRACKING_START.value) > 366) then
    begin
    DataModuleClient.Businesses.edit;
    DataModuleClient.BusinessesTRACKING_END.value := IncYear(DataModuleClient.BusinessesTRACKING_START.value) - 1;
    DataModuleClient.Businesses.Post;
    end;
  DataModuleClient.ClientDatabase.Refresh(true);
  DataModuleClient.Businesses.Locate('BRANCH_ID', variant(BranchID), []);
//  DataModuleClient.Businesses.GotoBookmark(BranchBM);
  DataModuleClient.Sync_Businessdates;
  BackYearBtn.Enabled := True;
  AdvYearBtn.Enabled := True;
end;

procedure TBusinessSetupF.TrackingEndDateExit(Sender: TObject);
begin
  DataModuleClient.Sync_Businessdates;
end;

procedure TBusinessSetupF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (DataModuleClient.CashFlowDept.RecordCount > 0) then
    begin
    // update hidden department with the target and tracking dates
    DataModuleClient.CashFlowDept.Edit;
    DataModuleClient.CashFlowDeptCURRENTPLANSTART.Value := DataModuleClient.BusinessesTARGET_START.Value;
    Datamoduleclient.CashFlowDeptCURRENTPLANEND.Value := DataModuleClient.BusinessesTARGET_END.Value;
    DataModuleClient.CashFlowDeptCURRENTMONITORINGSTART.Value := DataModuleClient.BusinessesTRACKING_START.Value;
    DataModuleClient.CashFlowDeptCURRENTMONITORINGEND.Value := DataModuleClient.BusinessesTRACKING_END.Value;
    DataModuleClient.CashFlowDept.Post;
    end;
end;

procedure TBusinessSetupF.CxAccountGroupingBtnClick(Sender: TObject);
begin
// start query and lookup tables
  DataModuleClient.AccountsGrouping.Active := True;
  DataModuleClient.ExpenseGroups.Active := True;
// Call Window in Modal mode
  Application.CreateForm(TExpGroupingF, ExpGroupingF);
  ExpGroupingF.ShowModal;
// Free
  ExpGroupingF.Free;
// Close query and Lookup Tables.
  DataModuleClient.AccountsGrouping.Active := False;
  DataModuleClient.ExpenseGroups.Active := False;
end;

end.
