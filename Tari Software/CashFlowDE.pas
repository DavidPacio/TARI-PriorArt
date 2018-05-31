unit CashFlowDE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, auchtypes, DMClient, BusinessSetup, CashFlowEngine,
  ComCtrls, Spin, cxGridCustomTableView, cxGridTableView, cxClasses, cxControls,
  DMrep1U, cxGridCustomView, cxGridLevel, cxGrid, cxCustomData, cxDataStorage,
  cxGridBandedTableView, LGlobals, cxContainer, cxEdit, cxLabel, cxButtons,
  cxRadioGroup, cxGroupBox, DateUtils, cxStyles, cxGraphics, cxFilter,
  cxData, cxTextEdit, cxCurrencyEdit, cxCalendar, cxCheckBox,
  cxLookAndFeelPainters, cxDBLabel, ExtCtrls, cxLookAndFeels, dxSkinsCore,
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
  dxSkinscxPCPainter, Vcl.Menus;

type
  TCashFlowDEF = class(TForm)
    GRID: TcxGrid;
    GRIDBTVBalanceSheet: TcxGridBandedTableView;
    AccountGroup: TcxGridBandedColumn;
    AccountTitle: TcxGridBandedColumn;
    OpeningBalance: TcxGridBandedColumn;
    Balance1: TcxGridBandedColumn;
    Balance2: TcxGridBandedColumn;
    Balance3: TcxGridBandedColumn;
    Balance4: TcxGridBandedColumn;
    Balance5: TcxGridBandedColumn;
    Balance6: TcxGridBandedColumn;
    Balance7: TcxGridBandedColumn;
    Balance8: TcxGridBandedColumn;
    Balance9: TcxGridBandedColumn;
    Balance10: TcxGridBandedColumn;
    Balance11: TcxGridBandedColumn;
    Balance12: TcxGridBandedColumn;
    Balance13: TcxGridBandedColumn;
    ClosingBalance: TcxGridBandedColumn;
    GLBalanceSheet: TcxGridLevel;
    cxLabel2: TcxLabel;
    AssumptionsBtn: TcxButton;
    CloseBtn: TcxButton;
    cxButton2: TcxButton;
    cxGroupBox1: TcxGroupBox;
    EditARBtn: TcxButton;
    EditStockBtn: TcxButton;
    EditAPBtn: TcxButton;
    EditAEBtn: TcxButton;
    cxLabel15: TcxLabel;
    cxDBLabel4: TcxDBLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AssumptionsBtnClick(Sender: TObject);
    procedure GRIDBTVBalanceSheetDataControllerSummaryAfterSummary(
      ASender: TcxDataSummary);
    procedure cxButton2Click(Sender: TObject);
    procedure EditARBtnClick(Sender: TObject);
    procedure EditStockBtnClick(Sender: TObject);
    procedure EditAPBtnClick(Sender: TObject);
    procedure EditAEBtnClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
//    Summarysize : integer;
    Initialised : Boolean;
    ClosingIndex : integer;
//    ShowingBankOD : Boolean;
    procedure ProjectBalance(BSRec: TCashFlowRecPtr; NewBalance : Currency);
  public
    { Public declarations }
  end;

  TCashDataSource = class(TcxCustomDataSource)
  private
    FCashFlowEngine: TCashFlowEngine;
    FModified: boolean;
  protected
    function GetRecordCount: Integer; override;
    function GetDataBinding(AItemIndex: Integer): TcxGridItemDataBinding;
    Function GetItemHandle(AItemIndex: Integer): TcxDataItemHandle; override;
//    function IsNativeCompare: Boolean;
    function GetValue(ARecordHandle: TcxDataRecordHandle;
      AItemHandle: TcxDataItemHandle): Variant; override;
    procedure SetValue(ARecordHandle: TcxDataRecordHandle;
      AItemHandle: TcxDataItemHandle; const AValue: Variant); override;
  public
    constructor Create(ACashFE: TCashFlowEngine);
    destructor Destroy; override;
    property Modified: boolean read FModified;
  end;



var
  CashFlowDEF: TCashFlowDEF;

implementation

{$R *.dfm}

Uses DataCollector, CashFlowEdit, CashFlowJrnls;

procedure GenerateColumns(AGridTableView: TcxGridBandedTableView);
var
  I: Integer;
begin
  for I := 0 to AGridTableView.ColumnCount - 1 do    // Iterate
    begin
    with AGridTableView.Columns[I] do
      begin

       DataBinding.Data := Pointer(Tag);
        case tag of    //
          0, 1:
            DataBinding.ValueTypeClass := TcxStringValueType;
          2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16:
            DataBinding.ValueTypeClass := TcxCurrencyValueType;
        end;    // case
      if Tag = 2 then // opening balance
        Caption := formatdateTime(Gglobals.DateFENH, DataModuleClient.CashFlowDeptCURRENTPLANSTART.value - 1);
      if tag = 99 then
        Caption := formatdateTime(Gglobals.DateFENH, Cashfe.pedate);
      if (tag > 2) then
        begin
        if ((tag - 3) < (Cashfe.PeriodCount - 1)) then
          Caption := formatdateTime(Gglobals.DateFENH, Cashfe.psdate + SummaryPeriodIndexArray[Tag - 3])
        else
          if tag <> 99 then
            visible := false;
        end;
      end;
    end;    // for
end;

procedure TCashFlowDEF.FormCreate(Sender: TObject);
begin
//  color := GGlobals.FormColour;
  DMrep1.TariButtonList.GetImage(0, CloseBtn.Glyph);
  if DaysBetween(DataModuleClient.BusinessesTARGET_END.AsDateTime, DataModuleClient.BusinessesTARGET_START.AsDateTime) < 31 then
    begin
    Messagedlg('Please set Target Dates that are at least 31 days apart' + #13#10 + 'and ensure Sales and Expense targets have been established.', mtwarning, [mbOK], 0);
    close;
    end;
  CashFe := TCashFlowEngine.Create(DataModuleClient.CashFlowDeptDEPT_ID.Value, DataModuleClient.CashFlowDeptCURRENTPLANSTART.value, DataModuleClient.CashFlowDeptCURRENTPLANEND.value, 4);
  ClosingIndex := CashFe.PeriodCount - 1;
  // set period to monthly  = 4
  Initialised := False;
  Cashfe.CalculateAll;
  Initialised := True;
  GenerateColumns(GRIDBTVBalanceSheet);
  GRIDBTVBalanceSheet.DataController.CustomDataSource := TCashDataSource.Create(Cashfe);
  GRIDBTVBalanceSheet.DataController.CustomDataSource.DataChanged;
  GRIDBTVBalanceSheet.ViewData.Expand(true);
  FormResize(Self);
end;

procedure TCashFlowDEF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  GetOpeningBalances;
  cashfe.SaveCashFlow := True;
  CashFe.Destroy;
end;

procedure TCashFlowDEF.AssumptionsBtnClick(Sender: TObject);
var
  UseStockDays : Boolean;
begin
  // record what it was before we edit
  if DataCollect.GetUserOption(OUSESTOCKDAYS, UOInteger) <> 0 then
    UseStockDays := True
  else
    UseStockDays := False;
  SelectedType := stCashFlow;
  Application.CreateForm(TBusinessSetupF, BusinessSetupF);
  BusinessSetupF.showmodal;
  // recalculate stockturn in case of change before calculateall
  if BusinessSetupF.UsesStockDaysCHECK.Checked <> UseStockDays Then
    begin
    CashFe.calculateStockturn(0, CashFe.PeriodCount - 1);
    Cashfe.BuildBSDetail(Cashfe.Stock_DaysRec);
    end;
  // same applies to AR_Days, AP_Days and AE_Days
  BusinessSetupF.free;
  Initialised := False;
  Cashfe.CalculateAll;
  Initialised := True;
  GRIDBTVBalanceSheet.DataController.CustomDataSource.DataChanged;
end;


procedure TCashFlowDEF.ProjectBalance(BSRec: TCashFlowRecPtr; NewBalance : Currency);
//var
//  i: Integer;
begin
  case BSRec.Accountno of    //
    CASH_AT_BANK,  BANK_OVERDRAFT:
      begin
      Cashfe.UpdateBSBalance(BSREC, NewBalance, False);
      CashFe.ProcessCash;
      end;
    CASH_MAN_FUND, MARKETSEC, OTHER_CURRENT_ASSETS,
    NON_DEP_ASSETS, DEP_ASSETS, INTANG_ASSETS, TAX_CASH_TIMING,
    INC_TAX_PAYABLE, DIVIDENDS_PAYABLE, OTHER_CURRENT_LIAB, LOANS:
     Cashfe.UpdateBSBalance(BSREC, NewBalance, False);
    ACCOUNT_REC:
      begin
      if NewBalance <> 0 then
        begin
        CashFe.UpdateBSBalance(BSRec, NewBalance, True);
        CashFe.calculateBSDays(0, (CashFe.PeriodCount - 1), cfReceivables);
        end
      else
        begin
        CashFe.ARDataRec.OpeningBalance := 0;
//        for I := 0 to CashFe.PeriodCount - 1 do    // Iterate
//          cashfe.AR_DaysRec.PlanSummary[I] := 0;
        end;
      CashFe.BuildBSDetail(CashFe.AR_DaysRec);
      CashFe.ProcessAccountsReceivable;
      CashFe.ProcessTax;
      CashFe.ProcessCash;
      end;
    STOCK:
      begin
      if NewBalance <> 0 then
        begin
        CashFe.UpdateBSBalance(CashFe.StockDataRec, NewBalance, True);
        Cashfe.defineStockturn;
//        CashFe.calculateStockturn(0, (CashFe.PeriodCount - 1));
        end
      else
        begin
        CashFe.StockDataRec.OpeningBalance := 0;
//        for I := 0 to CashFe.PeriodCount - 1 do    // Iterate
//          cashfe.Stock_DaysRec.PlanSummary[I] := 0;
        end;
      CashFe.BuildBSDetail(CashFe.StockDataRec);
      CashFe.ProcessStock;
      CashFe.ProcessAccountsPayable;
      CashFe.ProcessTax;
      CashFe.ProcessCash;
      end;
    ACCOUNT_PAY:
      begin
      if NewBalance <> 0 then
        begin
        CashFe.UpdateBSBalance(CashFe.APDataRec, NewBalance, True);
        CashFe.calculateBSDays(0, (CashFe.PeriodCount - 1), cfPayables);
        end
      else
        begin
        CashFe.APDataRec.OpeningBalance := 0;
//        for I := 0 to CashFe.PeriodCount - 1 do    // Iterate
//          cashfe.AP_DaysRec.PlanSummary[I] := 0;
        end;
      CashFe.BuildBSDetail(CashFe.AP_DaysRec);
      CashFe.ProcessAccountsPayable;
      CashFe.ProcessTax;
      CashFe.ProcessCash;
      end;
    ACCRUED_EXPENSES:
      begin
      if NewBalance <> 0 then
        begin
        CashFe.UpdateBSBalance(CashFe.AEDataRec, NewBalance, True);
        CashFe.calculateBSDays(0, (CashFe.PeriodCount - 1), cfAccruedExpenses);
        end
      else
        begin
        CashFe.AEDataRec.OpeningBalance := 0;
//        for I := 0 to CashFe.PeriodCount - 1 do    // Iterate
//          cashfe.AE_DaysRec.PlanSummary[I] := 0;
        end;
      CashFe.BuildBSDetail(CashFe.AE_DaysRec);
      CashFe.ProcessAccruedExpenses;
      CashFe.ProcessTax;
      CashFe.ProcessCash;
      end;
    TAX_PAYABLE:
      begin
      BSRec.OpeningBalance := NewBalance;
      CashFe.ProcessTax;
      CashFe.ProcessCash;
      end;
  end;    // case
  if (BSrec.Accountno = CASH_AT_BANK) or (BSRec.Accountno = BANK_OVERDRAFT) then
    cashFe.CheckBank;
end;

{ TCashDataSource }
constructor TCashDataSource.Create(ACashFe: TCashFlowEngine);
begin
  inherited Create;
  FCashFlowEngine := ACashfe;
end;

destructor TCashDataSource.Destroy;
begin
  inherited Destroy;
end;

function TCashDataSource.GetDataBinding(AItemIndex: Integer): TcxGridItemDataBinding;
begin
  Result := TcxCustomGridTableItem(DataController.GetItem(AItemIndex)).DataBinding;
end;

function TCashDataSource.GetRecordCount: Integer;
begin
  Result := 18; //FCashFlowEngine.InvoiceCount;
end;

function TCashDataSource.GetValue(ARecordHandle: TcxDataRecordHandle; AItemHandle: TcxDataItemHandle): Variant;
var
  ADataBinding: TcxGridItemDataBinding;
  CashfeRec : TCashFlowRecPtr;
begin
  ADataBinding := TcxGridItemDataBinding(AItemHandle);
  CashFerec := FCashFlowEngine.CashFlowList[Integer(ARecordHandle)];
  case Integer(ADataBinding.Data) of    //
    0: Result := CashfeRec.AccountGroup;
    1: Result := CashFeRec.AccountTitle;
    2: Result := CashFeRec.OpeningBalance;
    99: Result := CashFeRec.PlanSummary[FCashFlowEngine.PeriodCount - 1];
  else
       Result := CashFeRec.PlanSummary[Integer(ADataBinding.Data) - 3];
  end;    // case
end;

procedure TCashDataSource.SetValue(ARecordHandle: TcxDataRecordHandle;
  AItemHandle: TcxDataItemHandle; const AValue: Variant);
var
  ADataBinding: TcxGridItemDataBinding;
  CashfeRec : TCashFlowRecPtr;
  TValue : Currency;
begin
  ADataBinding := TcxGridItemDataBinding(AItemHandle);
  CashFerec := FCashFlowEngine.CashFlowList[Integer(ARecordHandle)];
  if (CashFe.BankisOD) and (CashFErec.Accountno = CASH_AT_BANK) then
    begin
    Messagedlg('Currently TARI thinks you have a Bank Overdraft' + #13#10 +
    'based on the closing balance.' + #13#10 +
    'Please edit the ''Bank Overdraft'' account using a minus sign.', mtWarning, [mbOK], 0);
    exit;
    end;
  if (Not CashFe.BankisOD) and (CashFErec.Accountno = BANK_OVERDRAFT) then
    begin
    Messagedlg('Currently TARI doesn''t think you have a Bank Overdraft' + #13#10 +
    'based on the closing balance.' + #13#10 +
    'Please edit the ''Cash at Bank'' account using a minus sign.', mtWarning, [mbOK], 0);
    exit;
    end;
  if Integer(ADataBinding.Data) = 2 then    //
    begin
    TValue := AValue;
    if CashfeRec.OpeningBalance <> TValue then
      begin
      // now calculate the full balances for the period
      CashFlowDEF.ProjectBalance(CashFerec, TValue);
//      DataChanged;
      end;
    end;
end;

function TCashDataSource.GetItemHandle(AItemIndex: Integer): TcxDataItemHandle;
begin
  Result := TcxDataItemHandle(GetDataBinding(AItemIndex));
end;

procedure TCashFlowDEF.GRIDBTVBalanceSheetDataControllerSummaryAfterSummary(
  ASender: TcxDataSummary);
var
  I: Integer;
  j: Integer;
  Rowindex: integer;
  AGroups: TcxDataControllerGroups;
begin
// calculate Equity here
  Rowindex := -1;
  Agroups := ASender.DataController.Groups;
  for J := 1 to GRIDBTVBalanceSheet.ColumnCount - 1 do    // Iterate
    begin
    for I := 0 to Agroups.ChildCount[Rowindex] - 1 do    // Iterate
      begin
      if I = 0 then
        Asender.FooterSummaryValues[J] := Asender.GroupSummaryValues[Agroups.ChildDataGroupIndex[Rowindex, I], J + 1]
      else
        begin
        if I mod 2 = 1 then
          Asender.FooterSummaryValues[J] := Asender.FooterSummaryValues[J] - Asender.GroupSummaryValues[Agroups.ChildDataGroupIndex[Rowindex, I], J + 1]
        else
          Asender.FooterSummaryValues[J] := Asender.FooterSummaryValues[J] + Asender.GroupSummaryValues[Agroups.ChildDataGroupIndex[Rowindex, I], J + 1]
        end;
      end;    // for
    end;    // for
end;

procedure TCashFlowDEF.cxButton2Click(Sender: TObject);
begin
  Application.CreateForm(TCashFlowJrnlsF, CashFlowJrnlsF);
  CashFlowJrnlsF.showmodal;
  CashFlowJrnlsF.free;
  Initialised := False;
  Cashfe.CalculateAll;
  Initialised := True;
  GRIDBTVBalanceSheet.DataController.CustomDataSource.DataChanged;
end;

procedure TCashFlowDEF.EditARBtnClick(Sender: TObject);
begin
  CFType := cfReceivables;
  Application.CreateForm(TCashFlowEditF, CashFlowEditF);
  CashFlowEditF.showmodal;
  CashFlowEditF.free;
  GRIDBTVBalanceSheet.DataController.CustomDataSource.DataChanged;
end;

procedure TCashFlowDEF.EditStockBtnClick(Sender: TObject);
begin
  CFType := cfStock;
  Application.CreateForm(TCashFlowEditF, CashFlowEditF);
  CashFlowEditF.showmodal;
  CashFlowEditF.free;
  GRIDBTVBalanceSheet.DataController.CustomDataSource.DataChanged;
end;

procedure TCashFlowDEF.EditAPBtnClick(Sender: TObject);
begin
  CFType := cfPayables;
  Application.CreateForm(TCashFlowEditF, CashFlowEditF);
  CashFlowEditF.showmodal;
  CashFlowEditF.free;
  GRIDBTVBalanceSheet.DataController.CustomDataSource.DataChanged;
end;

procedure TCashFlowDEF.EditAEBtnClick(Sender: TObject);
begin
  CFType := cfAccruedExpenses;
  Application.CreateForm(TCashFlowEditF, CashFlowEditF);
  CashFlowEditF.showmodal;
  CashFlowEditF.free;
  GRIDBTVBalanceSheet.DataController.CustomDataSource.DataChanged;
end;

procedure TCashFlowDEF.FormResize(Sender: TObject);
begin
  Width := Screen.Width;
  grid.Width := 769 + Width - 795;
  CloseBtn.Left := width - 123;
  // Height could expand the vertical is needed
  AssumptionsBtn.Top := Height - 87;
  cxGroupBox1.Top := Height - 99;
  cxButton2.Top := Height - 87;
  CloseBtn.Top := Height - 87;
  GRID.Height := 401 + Height - 595;
end;

end.
