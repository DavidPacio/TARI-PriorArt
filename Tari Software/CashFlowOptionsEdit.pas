unit CashFlowOptionsEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, bmpPanel, StdCtrls, ACurrencyEdit, DMClient, Buttons,
  wwSpeedButton, wwDBNavigator, wwclearpanel, Grids, Wwdbigrd, Wwdbgrid,
  ExpenseAccEdit, DataCollector, Auchtypes, CashFlowEngine;

type
  TCashFlowOptionsEditF = class(TForm)
    bmpPanel1: TbmpPanel;
    Panel1: TPanel;
    Label1: TLabel;
    TaxRateSales: TACurrencyEdit;
    TaxRateMaterialsStock: TACurrencyEdit;
    TaxRateSubCon: TACurrencyEdit;
    TaxRateExpenses: TACurrencyEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel2: TPanel;
    FirstDay: TComboBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    FirstMonth: TComboBox;
    TaxPaymentRB: TRadioGroup;
    TaxMethodRB: TRadioGroup;
    BankODCB: TCheckBox;
    Label9: TLabel;
    ODInterest: TACurrencyEdit;
    Label10: TLabel;
    Panel3: TPanel;
    Label11: TLabel;
    PeriodCB: TComboBox;
    Label12: TLabel;
    wwDBGrid1: TwwDBGrid;
    wwDBNavigator1: TwwDBNavigator;
    wwDBNavigator1First: TwwNavButton;
    wwDBNavigator1Prior: TwwNavButton;
    wwDBNavigator1Next: TwwNavButton;
    wwDBNavigator1Last: TwwNavButton;
    wwDBNavigator1Insert: TwwNavButton;
    wwDBNavigator1Delete: TwwNavButton;
    wwDBNavigator1Edit: TwwNavButton;
    wwDBNavigator1Post: TwwNavButton;
    wwDBNavigator1Cancel: TwwNavButton;
    wwDBNavigator1Refresh: TwwNavButton;
    Label13: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ARAverage: TASCurrencyEdit;
    Label14: TLabel;
    StockAverage: TASCurrencyEdit;
    APAverage: TASCurrencyEdit;
    AccruedAverage: TASCurrencyEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    UsesStockDaysCHECK: TCheckBox;
    BitBtn3: TBitBtn;
    TaxPaidDay: TASCurrencyEdit;
    Label19: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure wwDBGrid1RowChanged(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    NoSave : Boolean;
    Initialised : Boolean;
    CurrentGroupIndex : Integer;
    NewGroupIndex : Integer;
    procedure LoadOptions;
    procedure SaveOptions;
  public
    { Public declarations }
  end;

var
  CashFlowOptionsEditF: TCashFlowOptionsEditF;

implementation

{$R *.dfm}

procedure TCashFlowOptionsEditF.BitBtn2Click(Sender: TObject);
begin
  Application.CreateForm(TExpenseAccEditF, ExpenseAccEditF);
  ExpenseAccEditF.ShowModal;
  ExpenseAccEditF.Free;
end;

procedure TCashFlowOptionsEditF.FormCreate(Sender: TObject);
begin
  NoSave := False;
  Initialised := False;
  if DataModuleClient.DeptOptions.RecordCount = 0 then
    DataModuleClient.Deptoptions.Insert;
  // get options
  DataModuleClient.LookupSummaryIntervals.First;
  PeriodCB.Items.Clear;
  while DataModuleClient.LookupSummaryIntervals.eof = False
    do begin
    PeriodCB.Items.Add(DataModuleClient.LookupSummaryIntervalsPeriod_Desc.value);
    DataModuleClient.LookupSummaryIntervals.Next;
  end;
  LoadOptions;
end;

procedure TCashFlowOptionsEditF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Not NoSave then
    begin
    SaveOptions;
    end;
end;

procedure TCashFlowOptionsEditF.BitBtn3Click(Sender: TObject);
begin
  NoSave := True;
end;

procedure TCashFlowOptionsEditF.wwDBGrid1RowChanged(Sender: TObject);
begin
  if Initialised then
    begin
    NewGroupIndex := DataModuleClient.DeptOptionsOPTION_GROUP_ID.Value;
    SaveOptions;
    LoadOptions;
    end;
end;

procedure TCashFlowOptionsEditF.LoadOptions;
begin
  PeriodCB.ItemIndex := DataCollect.GetUserOption(OPERIODSIZE, UOInteger);
  PeriodCB.ItemIndex := 4;
  if DataCollect.GetUserOption(OUSESTOCKDAYS, UOInteger) <> 0 then
    UsesStockDaysCHECK.Checked := True
  else
    UsesStockDaysCHECK.Checked := False;
  ARAverage.Value := DataCollect.GetUserOption(OARDAYSAVERAGE, UOCurrency);
  StockAverage.Value := DataCollect.GetUserOption(OSTOCKAVERAGE, UOCurrency);
  APAverage.Value := DataCollect.GetUserOption(OAPDAYSAVERAGE, UOCurrency);
  AccruedAverage.Value := DataCollect.GetUserOption(OAEDAYSAVERAGE, UOCurrency);
  TaxRateSales.Value := DataCollect.GetUserOption(OTAXRATE_SALES, UOCurrency);
  TaxRateMaterialsStock.Value := DataCollect.GetUserOption(OTAXRATE_STOCK, UOCurrency);
  TaxRateSubCon.Value := DataCollect.GetUserOption(OTAXRATE_SUBCON, UOCurrency);
  TaxRateExpenses.Value := DataCollect.GetUserOption(OTAXRATE_EXPENSES, UOCurrency);
  TaxPaymentRB.ItemIndex := DataCollect.GetUserOption(OTAXPAYMENTQUARTERLY, UOInteger);
  TaxMethodRB.ItemIndex := DataCollect.GetUserOption(OTAXACCOUNTINGMETHOD, UOInteger);
  TaxPaidDay.Value := DataCollect.GetUserOption(OTAXPAIDDAY, UOInteger);
  FirstDay.ItemIndex := DataCollect.GetUserOption(OFIRSTDAY, UOInteger);
  FirstMonth.ItemIndex := DataCollect.GetUserOption(OFIRSTMONTH, UOInteger);
  if DataCollect.GetUserOption(OBANKACCOUNTLIABILITY, UOInteger) <> 0 then
    BankODCB.Checked := True
  else
    BankODCB.Checked := False;
  ODInterest.Value := DataCollect.GetUserOption(OOVERDRAFTRATE, UOCurrency);
end;

procedure TCashFlowOptionsEditF.SaveOptions;
var
  BValue : Variant;
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
  DataCollect.setUserOption(OARDAYSAVERAGE, UOCurrency, ARAverage.Value);
  DataCollect.SetUserOption(OSTOCKAVERAGE, UOCurrency, StockAverage.Value);
  DataCollect.setUserOption(OAPDAYSAVERAGE, UOCurrency, APAverage.Value);
  DataCollect.SetUserOption(OAEDAYSAVERAGE, UOCurrency, AccruedAverage.Value);
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
  initialised := True;
end;

procedure TCashFlowOptionsEditF.FormActivate(Sender: TObject);
begin
  Initialised := True;
  CurrentGroupIndex := DataModuleClient.DeptOptionsOPTION_GROUP_ID.Value;
  NewGroupIndex := CurrentGroupIndex;
end;

end.
