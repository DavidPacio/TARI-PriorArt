unit UltimateWhatif;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LGlobals, DMrep1U, StdCtrls, cxButtons, cxLabel, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit, CashFlowEngine, Auchtypes,
  IdGlobal, cxRadioGroup, cxCheckBox, cxMaskEdit, cxSpinEdit, TeEngine,
  Series, Bar3D, ExtCtrls, TeeProcs, Chart, cxMemo, DataCollector, TeeComma,
  cxRichEdit, ppDB, ppModule, daDataModule, ppCtrls, ppPrnabl, ppClass,
  ppBands, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDBJIT, ppStrtch,
	ppRichTx, ppVar, cxGroupBox, cxLookAndFeelPainters, IOUtils,
  Menus, TeeEdit, TeExport, TeeJPeg, DateUtils, cxDBLabel, cxGraphics,
  cxLookAndFeels, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinXmas2008Blue, ppParameter, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint;
{
This unit uses GGlobals.licdir + Uniquename + *.tmp as a tempoary of client data levels.
There are current 8 records in the set (SALES, GROSSPROFIT, POTENTIAL, BILLED, ARDAYS, STOCKDAYS, APDAYS, AEDAYS)
As many sets as needed is controlled by the variable BKLevel.
Each Record can be accessed by its record offset and BKLevel.
Can change:
Price  X               |Pricing
Cogs                   |
AverageSale/GP           | UpSelling and Efficiency
Efficiency               |
Billed                     |  Volume and Productivity
Productivity               |
AR Days                      |  Assets Control
STock Days                   |
AP Days                        |  Credit Financing
AE Days                        |
}

Const
  // Triggers
  RSALES = 0;
  RGROSSPROFIT = 1;
  RPOTENTIAL = 2;
  RBILLED = 3;
  RARDAYS = 4;
  RSTOCKDAYS = 5;
  RAPDAYS = 6;
  RAEDAYS = 7;
  RLASTACCOUNT = 8;

  // GoalSeeking array
  CURRENTACTUAL = 0;
  CURRENTTARGET = 1;
  CURRENTVALUE = 2;
  CURRENTRESULT = 3;
  LOWVALUE = 4;
  LOWSET = 5;
  LOWRESULT = 6;
  HIGHVALUE = 7;
  HIGHRESULT = 8;
  HIGHSET = 9;
  ADJUSTMENTAMOUNT = 10;
  VALUEDIRECTION = 11;
  RESULTDIRECTION = 12;
  LARGEVALUEAMOUNT = 13;
  TOLERANCE = 14;
  LASTRESULT = 15;
  LASTVALUE = 16;
  HIGHGS = 17; // Number in Array
  // Drivers
  DR_PRICE = 0;
  DR_COSTS = 1;
  DR_AVESALE = 2;
  DR_AVEGP = 3;
  DR_BILLED = 4;
  DR_PRODUCTIVITY = 5;
  DR_ARDAYS = 6;
  DR_STOCK = 7;
  DR_APDAYS = 8;
  DR_AEDAYS = 9;
  DR_LAST = 10;

type

  TUltimatewhatifF = class(TForm)
    ActualNP: TcxCurrencyEdit;
    ActualCash: TcxCurrencyEdit;
    TargetNP: TcxCurrencyEdit;
    TargetCash: TcxCurrencyEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    DoGoalSeekBtn: TcxButton;
    ApplyTargetsBtn: TcxButton;
    CancelTargetsBtn: TcxButton;
    ResultNP: TcxCurrencyEdit;
    ResultCash: TcxCurrencyEdit;
    TargetRG: TcxRadioGroup;
    Chart1: TChart;
    BankSeries: TBar3DSeries;
    ProfitSeries: TBar3DSeries;
    PriceHL: TcxLabel;
    SellingPriceL: TcxLabel;
    PurchaseL: TcxLabel;
    AveSaleL: TcxLabel;
    SelectivityHL: TcxLabel;
    AveGPL: TcxLabel;
    VolumeHL: TcxLabel;
    BilledL: TcxLabel;
    ProductivityL: TcxLabel;
    ARDaysL: TcxLabel;
    SuppliersHL: TcxLabel;
    StockL: TcxLabel;
    APDaysL: TcxLabel;
    AEDaysL: TcxLabel;
    PriceSpin : TcxSpinEdit;
    PurchaseSpin: TcxSpinEdit;
    AveSaleUnitSpin: TcxSpinEdit;
    BilledSpin: TcxSpinEdit;
    ProductivitySpin: TcxSpinEdit;
    AveGPUnitSpin: TcxSpinEdit;
    ARDaysSpin: TcxSpinEdit;
    StockDaysSpin: TcxSpinEdit;
    APDaysSpin: TcxSpinEdit;
    AEDaysSpin: TcxSpinEdit;
    ShowNPCB: TcxCheckBox;
    ShowBankCB: TcxCheckBox;
    ShowMarksCB: TcxCheckBox;
    TeeCommander1: TTeeCommander;
    GSResultsRTF: TcxRichEdit;
    ManualRB: TcxRadioButton;
    GoalSeekRB: TcxRadioButton;
    AssetsHL: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    AveSaleBase: TcxLabel;
    AveGPBase: TcxLabel;
    BilledBase: TcxLabel;
    ProductivityBase: TcxLabel;
    ARDaysBase: TcxLabel;
    StockDaysBase: TcxLabel;
    APDaysBase: TcxLabel;
    AEDaysBase: TcxLabel;
    ResultNetSales: TcxCurrencyEdit;
    cxLabel5: TcxLabel;
    ResultGPPCL: TcxLabel;
    ResultGPPC: TcxCurrencyEdit;
    ppJITBasePipe: TppJITPipeline;
    ppGoalSeekReport: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    daDataModule1: TdaDataModule;
    Drivername: TppField;
    ActualBaseField: TppField;
    TargetField: TppField;
    CalculationType: TppField;
    BaseValueField: TppField;
    TargetValueField: TppField;
    PCChangeField: TppField;
    NPResultField: TppField;
    CashResultField: TppField;
    CalcountField: TppField;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    cxButton1: TcxButton;
    ppRichText1: TppRichText;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppRichText2: TppRichText;
    BusinessNameField: TppField;
    DeptNameField: TppField;
    TargetPeriodFields: TppField;
    ppDBText11: TppDBText;
    ppLabel2: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppManualReport: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBText15: TppDBText;
    ppLabel14: TppLabel;
    ppDBText16: TppDBText;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppRichText3: TppRichText;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppDBText17: TppDBText;
    ppLabel22: TppLabel;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDetailBand2: TppDetailBand;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppShape7: TppShape;
    ppRichText4: TppRichText;
    ppShape8: TppShape;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    daDataModule2: TdaDataModule;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel23: TppLabel;
    ppDBText14: TppDBText;
    ppDBText24: TppDBText;
    ppLabel24: TppLabel;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppLabel25: TppLabel;
    ActualNPBase: TppField;
    ActualCashBase: TppField;
    NetSales: TppField;
    NewGPPC: TppField;
    NewNP: TppField;
    NewCash: TppField;
    Bevel1: TBevel;
    RBText1: TppLabel;
    RBText2: TppLabel;
    PopupMenu1: TPopupMenu;
    PopupPrintChart: TMenuItem;
    PopupExportChart: TMenuItem;
    ChartPreviewer1: TChartPreviewer;
    Panel1: TPanel;
    cxLabel14: TcxLabel;
    cxDBLabel3: TcxDBLabel;
    procedure FormCreate(Sender: TObject);
    procedure ApplyTargetsBtnClick(Sender: TObject);
    procedure CancelTargetsBtnClick(Sender: TObject);
    procedure DoGoalSeekBtnClick(Sender: TObject);
    procedure PriceSpinPropertiesEditValueChnged(Sender: TObject);
    procedure ShowNPCBClick(Sender: TObject);
    procedure ShowBankCBClick(Sender: TObject);
    procedure ShowMarksCBClick(Sender: TObject);
    procedure ManualRBClick(Sender: TObject);
    procedure GoalSeekRBClick(Sender: TObject);
    procedure PurchaseSpinPropertiesEditValueChanged(Sender: TObject);
    procedure AveSaleUnitSpinPropertiesEditValueChanged(Sender: TObject);
    procedure AveGPUnitSpinPropertiesEditValueChanged(Sender: TObject);
    procedure BilledSpinPropertiesEditValueChanged(Sender: TObject);
    procedure ProductivitySpinPropertiesEditValueChanged(Sender: TObject);
    procedure ARDaysSpinPropertiesEditValueChanged(Sender: TObject);
    procedure StockDaysSpinPropertiesEditValueChanged(Sender: TObject);
    procedure APDaysSpinPropertiesEditValueChanged(Sender: TObject);
    procedure AEDaysSpinPropertiesEditValueChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function ppJITBasePipeGetFieldValue(aFieldName: String): Variant;
    procedure cxButton1Click(Sender: TObject);
    procedure PopupPrintChartClick(Sender: TObject);
    procedure PopupExportChartClick(Sender: TObject);
  private
    { Private declarations }
    BkLevel : integer;
    BKFileHandle : Integer;
    BKRecords : array[0..7] of TCashFlowRecPtr;
    BKFileName : String;
    BaseYTDValues : Array[0..RLASTACCOUNT - 1] of currency;
//    BSBals : Array[0..18] of currency;
//    BSBalsNew : Array[0..18] of currency;
    GSArray : array [0..(HIGHGS - 1)] of Currency;
    BaseBankBalance : TSummaryBalArray;
    BaseProfitBalance : TSummaryBalArray;
    BaseSales, BaseGP, BaseCogs : TDetailedBalArray;
//    RESULTARRAY : array[0..20] of Currency;
    BaseInfo : Boolean;
    SpinActive : Boolean;
    ReportList : TList;
    UWIRecPtr : TUltimateWIRecPtr;
		DriverNames : array[0..(DR_LAST - 1)] of string;
    DriverBase : array[0..(DR_LAST - 1)] of currency;
    procedure ResetGSarray;
    procedure SetPrice(SalesBase: Array of currency; PcChange : double);
    procedure SetPurchasePrice(CogsBase : Array of Currency; PcChange : double);
    procedure SetGPUNIT(Salesbase, GPBase : Array of currency; PCChange: Double);
    procedure SetBilled(Salesbase, GPBase, BilledBase : Array of currency; PCChange: Double);
    procedure SetProduct(Salesbase, GPBase, BilledBase : Array of currency; PCChange: Double);
    procedure SetARAverageDays(AveBase: Array of currency; PcChange : double);
    procedure SetStockAverageDays(AveBase: Array of currency; PcChange : double);
    procedure SetAPAverageDays(AveBase: Array of currency; PcChange : double);
    procedure SetAEAverageDays(AveBase: Array of currency; PcChange : double);
    procedure SetUpChart;
    procedure SetChartScale;
    procedure FixOtherAccounts;
    function AggrValue(ArraySize : Integer; Balances : array of Currency): Currency;
    procedure TeeCommander1NormalClick(Sender : TObject);
    procedure InitialiseForm;
    procedure GSPrice;
    procedure GSPurchase;
    procedure GSGPUnit;
    procedure GSBilled;
    procedure GSProductivity;
    procedure GSARDays;
    procedure GSStock;
    procedure GSAPDays;
    procedure GSAEDays;
    procedure SetBaseLabels;
    procedure EnableManualSpinners(Value : Boolean);
    procedure ShowCurrentResult;
    procedure SetSpinners;
    procedure CalculateManual;
    procedure ClearReportList;
    procedure SetDriverNames;
    procedure SetDriverBases;
    procedure BuildManualReportList;
  public
    { Public declarations }
    function CloseEnough: boolean;

    function SaveVitalAccounts: Boolean;
    function RestoreVitalAccounts: Boolean;
  end;

var
  UltimatewhatifF: TUltimatewhatifF;

implementation

uses DMClient;

{$R *.dfm}

procedure TUltimatewhatifF.FormCreate(Sender: TObject);
begin
//  Color := GGlobals.FormColour;
  DMrep1.TariButtonList.GetImage(0, ApplyTargetsBtn.Glyph);
  DMrep1.TariButtonList.GetImage(3, CancelTargetsBtn.Glyph);
	Caption := DatamoduleClient.BusinessDetailsBUSINESS_NAME.AsString + ' - ' + DataModuleClient.BusinessesBRANCH_NAME.AsString;
  if DataModuleClient.Departments.RecordCount = 1 then
    begin
		AveSaleL.Caption := 'Average Sale per ' + DataModuleClient.DepartmentsSINGULAR_UNITDESC.AsString;
		AveGPL.Caption := '*Average GP per ' + DataModuleClient.DepartmentsSINGULAR_UNITDESC.AsString;
		BilledL.Caption := 'Billed ' + DataModuleClient.DepartmentsPLURAL_UNITDESC.AsString;
    end
  else
    begin
    AveSaleL.Caption := 'Average Sale per Unit';
    AveGPL.Caption := '*Average GP per Unit';
    BilledL.Caption := 'Billed Units';
    end;
  if DataCollect.GetUserOption(OUSESTOCKDAYS, UOInteger) <> 0 then
    StockL.Caption := 'Stock Days'
  else
    StockL.Caption := 'Stockturns';
  TeeCommander1.Button3D.Visible := False;
  TeeCommander1.ButtonCopy.Visible := False;
  TeeCommander1.ButtonDepth.Visible := False;
  TeeCommander1.ButtonEdit.Visible := False;
  TeeCommander1.ButtonMove.Visible := False;
  TeeCommander1.ButtonPrint.Visible := False;
  TeeCommander1.ButtonSave.Visible := False;
  TeeCommander1.ButtonZoom.Visible := False;
  TeeCommander1.ButtonNormal.OnClick := TeeCommander1NormalClick;
  CashFe := TCashFlowEngine.Create(DataModuleClient.CashFlowDeptDEPT_ID.Value, DataModuleClient.CashFlowDeptCURRENTPLANSTART.value, DataModuleClient.CashFlowDeptCURRENTPLANEND.value, 4);
  Cashfe.CalculateAll;
  BKLevel := -1;
  BKRecords[RSALES] := Cashfe.salesRec;
  BKRecords[RGROSSPROFIT] := Cashfe.GPRec;
  BKRecords[RPOTENTIAL] := Cashfe.PotentialRec;
  BKRecords[RBILLED] := Cashfe.BilledRec;
  BKRecords[RARDAYS] := Cashfe.AR_DaysRec;
  BKRecords[RSTOCKDAYS] := Cashfe.Stock_DaysRec;
  BKRecords[RAPDAYS] := Cashfe.AP_DaysRec;
  BKRecords[RAEDAYS] := Cashfe.AE_DaysRec;
  ReportList := Tlist.Create;
  DataModuleClient.Departments.locate('DEPT_ID', DataModuleClient.DeptRefDEPT_ID.asVariant, []);
  SetDriverNames;
  InitialiseForm;
end;

procedure TUltimatewhatifF.InitialiseForm;
begin
	BKFileName := TPath.getTempFileName;
  if fileexists(BKFileName) then
    deletefile(BKFileName);
  BKFileHandle := fileCreate(BKFileName);
  ActualNP.Value := Round(CashFe.NetProfitAfterTax);
  TargetNP.Value := ActualNP.Value;
  ActualCash.Value := Round(CashFe.BankChange);
  TargetCash.Value := ActualCash.Value;
  SaveVitalAccounts;
  if Cashfe.BankisOD then
    move(Cashfe.BankODDataRec.PlanSummary, BaseBankBalance, sizeof(TSummaryBalArray))
  else
    move(Cashfe.BankDataRec.PlanSummary, BaseBankBalance, sizeof(TSummaryBalArray));
  BuildSummary(NETPROFIT, DataModuleClient.CashFlowDeptCURRENTPLANSTART.value, DataModuleClient.CashFlowDeptCURRENTPLANEND.value, Cashfe.NPAfterTax, BaseProfitBalance);
  BaseInfo := True;
  SetUpChart;
  BaseInfo := False;
  EnableManualSpinners(ManualRB.Checked);
  ShowCurrentResult;
  SetBaseLabels;
  FixOtherAccounts;
end;

procedure TUltimatewhatifF.SetUpChart;
var
  I : Integer;
  NewProfitBalance : TSummaryBalArray;
begin
  BuildSummary(NETPROFIT, DataModuleClient.CashFlowDeptCURRENTPLANSTART.value, DataModuleClient.CashFlowDeptCURRENTPLANEND.value, Cashfe.NPAfterTax, NewProfitBalance);
  for I := 0 to Chart1.Title.Text.Count - 1 do    // Iterate
    Chart1.Title.Text.Delete(0);
  if BaseInfo then
    Chart1.Title.Text.Add('Current Base Informatation')
  else
    Chart1.Title.Text.Add('Targeted Informatation with Change from Base');
  Chart1.Title.Text.Add(formatDateTime(GGlobals.GetDateFENH, Cashfe.psdate) + ' to ' + formatDateTime(GGlobals.GetDateFENH, Cashfe.psdate));

  for I := 0 to 11 do    // Iterate
    begin
    if I <= Cashfe.PeriodCount then
      begin
      if BaseInfo then
        begin
        BankSeries.YValue[I] := BaseBankBalance[I] - Cashfe.BankDataRec.OpeningBalance;
        BankSeries.OffsetValues.Items[I] := 0;
        if I = 0 then
          ProfitSeries.YValue[I] := BaseProfitBalance[I]
        else
          ProfitSeries.YValue[I] := BaseProfitBalance[I] + ProfitSeries.YValue[I - 1]; // No Profit for the first period
        ProfitSeries.OffsetValues.Items[I] := 0;
        end
      else
        begin
        if cashfe.BankisOD then
          BankSeries.YValue[I] := Cashfe.BankODDataRec.PlanSummary[I] - Cashfe.BankDataRec.OpeningBalance
        else
          BankSeries.YValue[I] := Cashfe.BankDataRec.PlanSummary[I] - Cashfe.BankDataRec.OpeningBalance;
        BankSeries.OffsetValues.Items[I] := BaseBankBalance[I] - Cashfe.BankDataRec.OpeningBalance; // - Cashfe.BankDataRec.PlanSummary[I - 1];
        if I = 0 then
          begin
          ProfitSeries.YValue[I] := NewProfitBalance[I];
          ProfitSeries.OffsetValues.Items[I] := BaseProfitBalance[I];
          end
        else
          begin
          ProfitSeries.YValue[I] := NewProfitBalance[I] + ProfitSeries.YValue[I - 1]; // No Profit for the first period
          ProfitSeries.OffsetValues.Items[I] := BaseProfitBalance[I] + ProfitSeries.OffsetValues.Items[I - 1]; // - Cashfe.NPAfterTax[I - 1];
          end;
        end;
      BankSeries.XValue[I] := Cashfe.psdate + SummaryPeriodIndexArray[I];
      BankSeries.XLabel[I] := FormatDateTime('dd-MMM', Cashfe.psdate + SummaryPeriodIndexArray[I]);
      ProfitSeries.XValue[I] := Cashfe.psdate + SummaryPeriodIndexArray[I];
      ProfitSeries.XLabel[I] := FormatDateTime('dd-MMM', Cashfe.psdate + SummaryPeriodIndexArray[I]);
      end
    else
      begin
      if BankSeries.XValues.Count > I then
        begin
        BankSeries.XValues.Delete(I);
        ProfitSeries.XValues.Delete(I);
        end;
      end;
    end;
  SetChartScale;
end;

function TUltimatewhatifF.CloseEnough: boolean;
var
  Temp, tempc : Currency;
begin
  Result := False;
  Temp := Abs(GSArray[CURRENTTARGET]) - abs(GSArray[CURRENTRESULT]);
  if abs(temp) < GSArray[TOLERANCE] then
    begin
    Result := True;
    exit;
    end;
  // To close in, the current result must be closer than the last if both are less than or greater than the target.
  // If the reult is closer don't change direction until it is exceeded. Then High and Low can be used to get closer.
  if GSArray[CURRENTTARGET] > GSArray[CURRENTACTUAL] then
    begin
    if (GSArray[CURRENTRESULT] < GSArray[CURRENTTARGET])
      and (GSarray[CURRENTRESULT] > GSArray[CURRENTACTUAL])
      and ((GSarray[LOWSET] = 0) or (GSArray[CURRENTRESULT] >= GSArray[LOWRESULT])) then
      begin
      GSArray[LOWSET] := 1;
      GSArray[LOWVALUE] := GSArray[CURRENTVALUE];
      GSArray[LOWRESULT] := GSArray[CURRENTRESULT];
      end
    else if (GSArray[CURRENTRESULT] > GSArray[CURRENTACTUAL])
        and (GSArray[CURRENTRESULT] > GSArray[CURRENTTARGET])
        and ((GSArray[HIGHSET] = 0) or (GSArray[CURRENTRESULT] <= GSArray[HIGHRESULT])) then
      begin
      GSArray[HIGHSET] := 1;
      GSArray[HIGHVALUE] := GSArray[CURRENTVALUE];
      GSArray[HIGHRESULT] := GSArray[CURRENTRESULT];
      end
    else
      begin
      GSArray[VALUEDIRECTION] := GSArray[VALUEDIRECTION] * -1;
      exit;
      end;
    if GSArray[CURRENTVALUE] = 1.0 then
      begin
      GSArray[CURRENTVALUE] := Abs(GSArray[CURRENTTARGET] - GSArray[CURRENTACTUAL]) / abs(GSArray[CURRENTRESULT] - GSArray[CURRENTACTUAL]);
      GSArray[LARGEVALUEAMOUNT] := GSArray[CURRENTVALUE] / 500; // the value might is as close as a tenth
      exit;
      end;
    if (GSArray[HIGHSET] = 0) and (GSArray[LOWSET] <> 0) then
      GSArray[CURRENTVALUE] := GSArray[CURRENTVALUE] + GSArray[LARGEVALUEAMOUNT];
    if (GSArray[LOWSET] = 0) AND (GSArray[HIGHSET] <> 0) then
      GSArray[CURRENTVALUE] := GSArray[CURRENTVALUE] - GSArray[LARGEVALUEAMOUNT];
    end
  else
    begin
    if (GSArray[CURRENTRESULT] < GSArray[CURRENTTARGET])
      and (GSarray[CURRENTRESULT] <= GSArray[CURRENTACTUAL])
      and ((GSarray[LOWSET] = 0) or (GSArray[CURRENTRESULT] > GSArray[LOWRESULT])) then
      begin
      GSArray[LOWSET] := 1;
      GSArray[LOWVALUE] := GSArray[CURRENTVALUE];
      GSArray[LOWRESULT] := GSArray[CURRENTRESULT];
      end
    else if (GSArray[CURRENTRESULT] <= GSArray[CURRENTACTUAL])
        and (GSArray[CURRENTRESULT] > GSArray[CURRENTTARGET])
        and ((GSArray[HIGHSET] = 0) or (GSArray[CURRENTRESULT] < GSArray[HIGHRESULT])) then
      begin
      GSArray[HIGHSET] := 1;
      GSArray[HIGHVALUE] := GSArray[CURRENTVALUE];
      GSArray[HIGHRESULT] := GSArray[CURRENTRESULT];
      end
    else
      begin
      GSArray[VALUEDIRECTION] := GSArray[VALUEDIRECTION] * -1;
      exit;
      end;
    if GSArray[CURRENTVALUE] = 1.0 then
      begin
      tempc := abs(GSArray[CURRENTACTUAL] - GSArray[CURRENTRESULT]);
      if tempc <> 0 then
        GSArray[CURRENTVALUE] := Abs(GSArray[CURRENTACTUAL] - GSArray[CURRENTTARGET]) / tempc
      else
        GSArray[CURRENTVALUE] := 1;
      GSArray[LARGEVALUEAMOUNT] := GSArray[CURRENTVALUE] / 500; // the value might is as close as a tenth
      exit;
      end;
    if (GSArray[HIGHSET] = 0) and (GSArray[LOWSET] <> 0) then
      GSArray[CURRENTVALUE] := GSArray[CURRENTVALUE] - GSArray[LARGEVALUEAMOUNT];
    if (GSArray[LOWSET] = 0) AND (GSArray[HIGHSET] <> 0) then
      GSArray[CURRENTVALUE] := GSArray[CURRENTVALUE] + GSArray[LARGEVALUEAMOUNT];
    end;
  if (GSArray[LOWSET] <> 0) AND (GSArray[HIGHSET] <> 0) then
    GSArray[CURRENTVALUE] := GSArray[LOWVALUE] +
    (GSArray[HIGHVALUE] - GSArray[LOWVALUE]) * Abs(GSArray[CURRENTTARGET] - GSArray[LOWRESULT]) / abs(GSArray[HIGHRESULT] - GSArray[LOWRESULT]);
//    GSArray[CURRENTVALUE] := (GSarray[HIGHVALUE] + GSarray[LOWVALUE]) / 2;
  GSArray[LASTRESULT] := GSArray[CURRENTRESULT];
end;

procedure TUltimatewhatifF.ResetGSarray;
var
  I: Integer;
begin
  for I := 0 to HIGHGS - 1 do    // Iterate
    GSarray[I] := 0;
end;

procedure TUltimatewhatifF.ApplyTargetsBtnClick(Sender: TObject);
begin
  Messagedlg('The changes to Price, Average Sale, Average GP or Productivity will not be saved.' + #13#10
              + 'These must be changed in Targeting Activity and Expenses.' + #13#10#13#10
              + 'Changes to Collection and Payments of Working Capital Items will be saved.', mtinformation, [mbOk], 0);
  CashFe.Destroy;
  FileClose(BkFileHandle);
  if fileexists(BKFileName) then
    deletefile(BKFileName);
  Close;
end;

procedure TUltimatewhatifF.CancelTargetsBtnClick(Sender: TObject);
begin
  Cashfe.SaveCashFlow := False;
  Cashfe.Destroy;
  FileClose(BkFileHandle);
  if fileexists(BKFileName) then
    deletefile(BKFileName);
  Close;
end;

procedure TUltimatewhatifF.GSPrice;
Var
  I: Integer;
  BaseSales : TDetailedBalArray;
  TempC: Currency;
  ResultOK : Boolean;
begin
// Save Changed Drivers
  SaveVitalAccounts;
  new(UWIRecPtr);
  UWIRecPtr.Drivername := DR_PRICE;
  move(Cashfe.salesRec.plandetail, basesales, sizeof(TDetailedBalArray));
  if TargetRG.ItemIndex = 0 then
    begin
    ResetGSarray;
    GSArray[LARGEVALUEAMOUNT] := 10; // PC or absolute
    if TargetNP.Value * 0.001 < 100 then
      GSArray[TOLERANCE] := TargetNP.Value * 0.001
    else
      GSArray[TOLERANCE] := 100;
    if GSArray[TOLERANCE] < 10 then
      GSArray[TOLERANCE] := 10;
    GSArray[CURRENTACTUAL] := ActualNP.Value;
    GSArray[CURRENTTARGET] := TargetNP.Value;
    tempC := TargetNP.value - abs(ActualNp.Value);
    if tempC > 0 then
      GSArray[VALUEDIRECTION] := 1
    else
      GSArray[VALUEDIRECTION] := -1;
    ResultOK := False;
    GSArray[CURRENTVALUE] := 1.00;
    GSArray[LASTVALUE] := GSArray[CURRENTVALUE];
    GSArray[LASTRESULT] := GSArray[CURRENTACTUAL];
    I := 0;
    while (ResultOK = False) and (I < 20) do
      begin
      SetPrice(Basesales, GSArray[CURRENTVALUE] * GSArray[VALUEDIRECTION]);
      Cashfe.CalculateAll;
      GSarray[CURRENTRESULT] := CashFe.NetProfitAfterTax;
      Inc(I);
      ResultOK := CloseEnough;
      end;    // while
		GSResultsRTF.Lines.Add(DriverNames[DR_PRICE] + ':' + #9
											 + CurrToStrF(GSArray[CURRENTVALUE] * Gsarray[VALUEDIRECTION], ffNumber, 2) + ' %'
                       + #9
                       + CurrToStrF(Cashfe.BankChange, ffCurrency, 0));
    UWIRecPtr.IsCashTarget := False;
    end
  else
    begin
    // now for cash target
    ResetGSarray;
    GSArray[LARGEVALUEAMOUNT] := 10; // PC or absolue
    if TargetCash.Value * 0.001 < 100 then
      GSArray[TOLERANCE] := TargetCash.Value * 0.001
    else
      GSArray[TOLERANCE] := 100;
    if GSArray[TOLERANCE] < 10 then
      GSArray[TOLERANCE] := 10;
    GSArray[CURRENTACTUAL] := ActualCASH.Value;
    GSArray[CURRENTTARGET] := TargetCASH.Value;
    tempC := TargetCASh.value - abs(ActualCASH.Value);
    if tempC > 0 then
      GSArray[VALUEDIRECTION] := 1
    else
      GSArray[VALUEDIRECTION] := -1;
    ResultOK := False;
    GSArray[CURRENTVALUE] := 1.00;
    GSArray[LASTVALUE] := GSArray[CURRENTVALUE];
    GSArray[LASTRESULT] := GSArray[CURRENTACTUAL];
    I := 0;
    while (ResultOK = False) and (I < 20) do
      begin
      SetPrice(Basesales, GSArray[CURRENTVALUE] * GSArray[VALUEDIRECTION]);
      Cashfe.CalculateAll;
      GSarray[CURRENTRESULT] := CashFe.BankChange;
      Inc(I);
      ResultOK := CloseEnough;
      end;    // while
      GSResultsRTF.Lines.Add(DriverNames[DR_PRICE] + ':' + #9
                       + CurrToStrF(GSArray[CURRENTVALUE] * Gsarray[VALUEDIRECTION], ffNumber, 2) + ' %'
                       + #9
                       + CurrToStrF(Cashfe.NetProfitAfterTax, ffCurrency, 0));
    UWIRecPtr.IsCashTarget := True;
    end;
  UWIRecPtr.BaseValue := 0;
  UWIRecPtr.ValueType := vtPercent2;
  UWIRecPtr.TargetValue := 0;
  UWIRecPtr.PCChange := GSArray[CURRENTVALUE] * GSArray[VALUEDIRECTION];
  UWIRecPtr.NPResult := Cashfe.NetProfitAfterTax;
  UWIRecPtr.CashResult := Cashfe.BankChange;
  UWIRecPtr.Cycles := I - 1;
  RestoreVitalAccounts;
  Cashfe.CalculateAll;
  ReportList.Add(UWIRecPtr);
end;

procedure TUltimatewhatifF.GSPurchase;
Var
  I: Integer;
  Basecogs : TDetailedBalArray;
  TempC: Currency;
  ResultOK : Boolean;
begin
// Purchase Price
// Save Changed Drivers
  SaveVitalAccounts;
  new(UWIRecPtr);
  UWIRecPtr.Drivername := DR_COSTS;
  for I := 0 to Trunc(Cashfe.pedate) - Trunc(CashFe.psdate) do    // Iterate
    BaseCogs[I] := Cashfe.salesRec.PlanDetail[I] - Cashfe.GPrec.PlanDetail[I];

  if TargetRG.ItemIndex = 0 then
    begin
    ResetGSarray;
    GSArray[LARGEVALUEAMOUNT] := 10; // PC or absolue
    if TargetNP.Value * 0.001 < 100 then
      GSArray[TOLERANCE] := TargetNP.Value * 0.001
    else
      GSArray[TOLERANCE] := 100;
    if GSArray[TOLERANCE] < 10 then
      GSArray[TOLERANCE] := 10;
    GSArray[CURRENTACTUAL] := ActualNP.Value;
    GSArray[CURRENTTARGET] := TargetNP.Value;
    tempC := TargetNP.value - abs(ActualNp.Value);
    if tempC > 0 then
      GSArray[VALUEDIRECTION] := 1
    else
      GSArray[VALUEDIRECTION] := -1;
    ResultOK := False;
    GSArray[CURRENTVALUE] := 1.00;
    GSArray[LASTVALUE] := GSArray[CURRENTVALUE];
    GSArray[LASTRESULT] := GSArray[CURRENTACTUAL];
    I := 0;
    while (ResultOK = False) and (I < 20) do
      begin
      SetPurchasePrice(BaseCogs, GSArray[CURRENTVALUE] * GSArray[VALUEDIRECTION]);
      Cashfe.CalculateAll;
      GSarray[CURRENTRESULT] := CashFe.NetProfitAfterTax;
      Inc(I);
      ResultOK := CloseEnough;
      end;    // while
    GSResultsRTF.Lines.Add('Purchase Cost:' + #9
                       + CurrToStrF(GSArray[CURRENTVALUE] * Gsarray[VALUEDIRECTION], ffNumber, 2) + ' %'
                       + #9
                       + CurrToStrF(Cashfe.BankChange, ffCurrency, 0));
    UWIRecPtr.IsCashTarget := False;
    end
  else
    begin
    // now for cash target
    ResetGSarray;
    GSArray[LARGEVALUEAMOUNT] := 10; // PC or absolue
    if TargetCash.Value * 0.001 < 100 then
      GSArray[TOLERANCE] := TargetCash.Value * 0.001
    else
      GSArray[TOLERANCE] := 100;
    if GSArray[TOLERANCE] < 10 then
      GSArray[TOLERANCE] := 10;
    GSArray[CURRENTACTUAL] := ActualCASH.Value;
    GSArray[CURRENTTARGET] := TargetCASH.Value;
    tempC := TargetCASh.value - abs(ActualCASH.Value);
    if tempC > 0 then
      GSArray[VALUEDIRECTION] := 1
    else
      GSArray[VALUEDIRECTION] := -1;
    ResultOK := False;
    GSArray[CURRENTVALUE] := 1.00;
    GSArray[LASTVALUE] := GSArray[CURRENTVALUE];
    GSArray[LASTRESULT] := GSArray[CURRENTACTUAL];
    I := 0;
    while (ResultOK = False) and (I < 20) do
      begin
      SetPurchasePrice(BaseCogs, GSArray[CURRENTVALUE] * GSArray[VALUEDIRECTION]);
      Cashfe.CalculateAll;
      GSarray[CURRENTRESULT] := CashFe.BankChange;
      Inc(I);
      ResultOK := CloseEnough;
      end;    // while
      GSResultsRTF.Lines.Add('Purchase Cost:' + #9
                       + CurrToStrF(GSArray[CURRENTVALUE] * Gsarray[VALUEDIRECTION], ffNumber, 2) + ' %'
                       + #9
                       + CurrToStrF(Cashfe.NetProfitAfterTax, ffCurrency, 0));
    UWIRecPtr.IsCashTarget := True;
    end;
  UWIRecPtr.BaseValue := 0;
  UWIRecPtr.TargetValue := 0;
  UWIRecPtr.ValueType := vtPercent2;
  UWIRecPtr.PCChange := GSArray[CURRENTVALUE] * GSArray[VALUEDIRECTION];
  UWIRecPtr.NPResult := Cashfe.NetProfitAfterTax;
  UWIRecPtr.CashResult := Cashfe.BankChange;
  UWIRecPtr.Cycles := I - 1;
  RestoreVitalAccounts;
  Cashfe.CalculateAll;
  ReportList.Add(UWIRecPtr);
end;

procedure TUltimatewhatifF.GSGPUnit;
Var
  I: Integer;
  BaseSales : TDetailedBalArray;
  BaseGP : TDetailedBalArray;
  TempC, BaseValue, Basevalue2: Currency;
  ResultOK : Boolean;
begin
// Purchase Price
// Save Changed Drivers
  SaveVitalAccounts;
  new(UWIRecPtr);
  for I := 0 to Trunc(Cashfe.pedate) - Trunc(CashFe.psdate) do    // Iterate
    begin
    BaseSales[I] := Cashfe.salesRec.PlanDetail[I];
    BaseGP[I] := Cashfe.GPrec.PlanDetail[I];
    end;
  BaseValue := AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.SalesRec.PlanDetail )
                / AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.BilledRec.PlanDetail );
  BaseValue2 := AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.GPRec.PlanDetail )
                / AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.BilledRec.PlanDetail );
  if TargetRG.ItemIndex = 0 then
    begin
    ResetGSarray;
    GSArray[LARGEVALUEAMOUNT] := 10; // PC or absolue
    if TargetNP.Value * 0.001 < 100 then
      GSArray[TOLERANCE] := TargetNP.Value * 0.001
    else
      GSArray[TOLERANCE] := 100;
    if GSArray[TOLERANCE] < 10 then
      GSArray[TOLERANCE] := 10;
    GSArray[CURRENTACTUAL] := ActualNP.Value;
    GSArray[CURRENTTARGET] := TargetNP.Value;
    tempC := TargetNP.value - abs(ActualNp.Value);
    if tempC > 0 then
      GSArray[VALUEDIRECTION] := 1
    else
      GSArray[VALUEDIRECTION] := -1;
    ResultOK := False;
    GSArray[CURRENTVALUE] := 1.00;
    GSArray[LASTVALUE] := GSArray[CURRENTVALUE];
    GSArray[LASTRESULT] := GSArray[CURRENTACTUAL];
    I := 0;
    while (ResultOK = False) and (I < 20) do
      begin
      SetGPUNIT(BaseSales, BaseGP, GSArray[CURRENTVALUE] * GSArray[VALUEDIRECTION]);
      Cashfe.CalculateAll;
      GSarray[CURRENTRESULT] := CashFe.NetProfitAfterTax;
      Inc(I);
      ResultOK := CloseEnough;
      end;    // while
    TempC := AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.SalesRec.PlanDetail )
                / AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.BilledRec.PlanDetail );
    GSResultsRTF.Lines.Add('Average Sale:' + #9
                       + CurrToStrF(GSArray[CURRENTVALUE] * Gsarray[VALUEDIRECTION], ffNumber, 2) + ' %'
                       + #9
                       + CurrToStrF(Cashfe.BankChange, ffCurrency, 0));
    if DataModuleClient.Departments.RecordCount = 1 then
			GSResultsRTF.Lines.Add('(Sales ' + CurrToStrF(TempC, ffCurrency, 2) + ' ' + 'per ' + DataModuleClient.DepartmentsSINGULAR_UNITDESC.AsString + ')')
    else
      GSResultsRTF.Lines.Add('(Sales ' + CurrToStrF(TempC, ffCurrency, 2) + ' ' + 'per Unit)');
    UWIRecPtr.Drivername := DR_AVESALE;
    UWIRecPtr.IsCashTarget := False;
    UWIRecPtr.BaseValue := BaseValue;
    UWIRecPtr.TargetValue := TempC;
    UWIRecPtr.ValueType := vtCurrency2;
    UWIRecPtr.PCChange := GSArray[CURRENTVALUE] * GSArray[VALUEDIRECTION];
    UWIRecPtr.NPResult := Cashfe.NetProfitAfterTax;
    UWIRecPtr.CashResult := Cashfe.BankChange;
    UWIRecPtr.Cycles := I - 1;
    ReportList.Add(UWIRecPtr);
    TempC := AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.GPRec.PlanDetail )
                / AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.BilledRec.PlanDetail );
    GSResultsRTF.Lines.Add('Average GP:' + #9
                       + CurrToStrF(GSArray[CURRENTVALUE] * Gsarray[VALUEDIRECTION], ffNumber, 2) + ' %'
                       + #9
                       + CurrToStrF(Cashfe.BankChange, ffCurrency, 0));
    if DataModuleClient.Departments.RecordCount = 1 then
			GSResultsRTF.Lines.Add('(GP ' + CurrToStrF(TempC, ffCurrency, 2) + ' ' + 'per ' + DataModuleClient.DepartmentsSINGULAR_UNITDESC.AsString + ')')
    else
      GSResultsRTF.Lines.Add('(GP ' + CurrToStrF(TempC, ffCurrency, 2) + ' ' + 'per Unit)');
    new(UWIRecPtr);
    UWIRecPtr.Drivername := DR_AVEGP;
    UWIRecPtr.BaseValue := BaseValue2;
    UWIRecPtr.TargetValue := TempC;
    UWIRecPtr.ValueType := vtCurrency2;
    UWIRecPtr.IsCashTarget := False;
    end
  else
    begin
    // now for cash target
    ResetGSarray;
    GSArray[LARGEVALUEAMOUNT] := 10; // PC or absolue
    if TargetCash.Value * 0.001 < 100 then
      GSArray[TOLERANCE] := TargetCash.Value * 0.001
    else
      GSArray[TOLERANCE] := 100;
    if GSArray[TOLERANCE] < 10 then
      GSArray[TOLERANCE] := 10;
    GSArray[CURRENTACTUAL] := ActualCASH.Value;
    GSArray[CURRENTTARGET] := TargetCASH.Value;
    tempC := TargetCASh.value - abs(ActualCASH.Value);
    if tempC > 0 then
      GSArray[VALUEDIRECTION] := 1
    else
      GSArray[VALUEDIRECTION] := -1;
    ResultOK := False;
    GSArray[CURRENTVALUE] := 1.00;
    GSArray[LASTVALUE] := GSArray[CURRENTVALUE];
    GSArray[LASTRESULT] := GSArray[CURRENTACTUAL];
    I := 0;
    while (ResultOK = False) and (I < 20) do
      begin
      SetGPUNIT(BaseSales, BaseGP, GSArray[CURRENTVALUE] * GSArray[VALUEDIRECTION]);
      Cashfe.CalculateAll;
      GSarray[CURRENTRESULT] := CashFe.BankChange;
      Inc(I);
      ResultOK := CloseEnough;
      end;    // while
    TempC := AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.SalesRec.PlanDetail )
                / AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.BilledRec.PlanDetail );
    GSResultsRTF.Lines.Add('Average Sale:' + #9
                       + CurrToStrF(GSArray[CURRENTVALUE] * Gsarray[VALUEDIRECTION], ffNumber, 2) + ' %'
                       + #9
                       + CurrToStrF(Cashfe.NetProfitAfterTax, ffCurrency, 0));
    if DataModuleClient.Departments.RecordCount = 1 then
			GSResultsRTF.Lines.Add('(Sales ' + CurrToStrF(TempC, ffCurrency, 2) + ' ' + 'per ' + DataModuleClient.DepartmentsSINGULAR_UNITDESC.AsString + ')')
    else
      GSResultsRTF.Lines.Add('(Sales ' + CurrToStrF(TempC, ffCurrency, 2) + ' ' + 'per Unit)');
    UWIRecPtr.Drivername := DR_AVESALE;
    UWIRecPtr.IsCashTarget := True;
    UWIRecPtr.BaseValue := BaseValue;
    UWIRecPtr.TargetValue := TempC;
    UWIRecPtr.ValueType := vtCurrency2;
    UWIRecPtr.PCChange := GSArray[CURRENTVALUE] * GSArray[VALUEDIRECTION];
    UWIRecPtr.NPResult := Cashfe.NetProfitAfterTax;
    UWIRecPtr.CashResult := Cashfe.BankChange;
    UWIRecPtr.Cycles := I - 1;
    ReportList.Add(UWIRecPtr);
    TempC := AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.GPRec.PlanDetail )
                / AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.BilledRec.PlanDetail );
    GSResultsRTF.Lines.Add('Average GP:' + #9
                       + CurrToStrF(GSArray[CURRENTVALUE] * Gsarray[VALUEDIRECTION], ffNumber, 2) + ' %'
                       + #9
                       + CurrToStrF(Cashfe.NetProfitAfterTax, ffCurrency, 0));
    if DataModuleClient.Departments.RecordCount = 1 then
			GSResultsRTF.Lines.Add('(GP ' + CurrToStrF(TempC, ffCurrency, 2) + ' ' + 'per ' + DataModuleClient.DepartmentsSINGULAR_UNITDESC.AsString + ')')
    else
      GSResultsRTF.Lines.Add('(GP ' + CurrToStrF(TempC, ffCurrency, 2) + ' ' + 'per Unit)');
    new(UWIRecPtr);
    UWIRecPtr.Drivername := DR_AVEGP;
    UWIRecPtr.BaseValue := BaseValue2;
    UWIRecPtr.TargetValue := TempC;
    UWIRecPtr.ValueType := vtCurrency2;
    UWIRecPtr.IsCashTarget := True;
    end;
  UWIRecPtr.PCChange := GSArray[CURRENTVALUE] * GSArray[VALUEDIRECTION];
  UWIRecPtr.NPResult := Cashfe.NetProfitAfterTax;
  UWIRecPtr.CashResult := Cashfe.BankChange;
  UWIRecPtr.Cycles := I - 1;
  RestoreVitalAccounts;
  Cashfe.CalculateAll;
  ReportList.Add(UWIRecPtr);
end;

procedure TUltimatewhatifF.GSBilled;
Var
  I: Integer;
  BaseSales, BaseGP, BaseBilled : TDetailedBalArray;
  TempC: Currency;
  ResultOK : Boolean;
begin
// Purchase Price
// Save Changed Drivers
  SaveVitalAccounts;
  new(UWIRecPtr);
  UWIRecPtr.Drivername := DR_BILLED;

  for I := 0 to Trunc(Cashfe.pedate) - Trunc(CashFe.psdate) do    // Iterate
    begin
    BaseSales[I] := Cashfe.salesRec.PlanDetail[I];
    BaseGP[I] := Cashfe.GPrec.PlanDetail[I];
    BaseBilled[I] := Cashfe.billedRec.PlanDetail[I];
    end;
  UWIRecPtr.BaseValue := AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.BilledRec.PlanDetail);
  if TargetRG.ItemIndex = 0 then
    begin
    ResetGSarray;
    GSArray[LARGEVALUEAMOUNT] := 10; // PC or absolue
    if TargetNP.Value * 0.001 < 100 then
      GSArray[TOLERANCE] := TargetNP.Value * 0.001
    else
      GSArray[TOLERANCE] := 100;
    if GSArray[TOLERANCE] < 10 then
      GSArray[TOLERANCE] := 10;
    GSArray[CURRENTACTUAL] := ActualNP.Value;
    GSArray[CURRENTTARGET] := TargetNP.Value;
    tempC := TargetNP.value - abs(ActualNp.Value);
    if tempC > 0 then
      GSArray[VALUEDIRECTION] := 1
    else
      GSArray[VALUEDIRECTION] := -1;
    ResultOK := False;
    GSArray[CURRENTVALUE] := 1.00;
    GSArray[LASTVALUE] := GSArray[CURRENTVALUE];
    GSArray[LASTRESULT] := GSArray[CURRENTACTUAL];
    I := 0;
    while (ResultOK = False) and (I < 20) do
      begin
      SetBilled(BaseSales, BaseGP, BaseBilled, GSArray[CURRENTVALUE] * GSArray[VALUEDIRECTION]);
      Cashfe.CalculateAll;
      GSarray[CURRENTRESULT] := CashFe.NetProfitAfterTax;
      Inc(I);
      ResultOK := CloseEnough;
      end;    // while
    TempC := AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.BilledRec.PlanDetail);
    GSResultsRTF.Lines.Add(DriverNames[DR_BILLED] + ':' + #9
                       + CurrToStrF(GSArray[CURRENTVALUE] * Gsarray[VALUEDIRECTION], ffNumber, 2) + ' %'
                       + #9
                       + CurrToStrF(Cashfe.BankChange, ffCurrency, 0));
    if DataModuleClient.Departments.RecordCount = 1 then
			GSResultsRtf.Lines.Add('(' + CurrToStrF(tempc, ffNumber, 0) + ' ' + DataModuleClient.DepartmentsPLURAL_UNITDESC.AsString + ')')
    else
      GSResultsRtf.Lines.Add('(' + CurrToStrF(tempc, ffNumber, 0) + ' Units)');
    UWIRecPtr.IsCashTarget := False;
    UWIRecPtr.TargetValue := TempC;
    end
  else
    begin
    // now for cash target
    ResetGSarray;
    GSArray[LARGEVALUEAMOUNT] := 10; // PC or absolue
    if TargetCash.Value * 0.001 < 100 then
      GSArray[TOLERANCE] := TargetCash.Value * 0.001
    else
      GSArray[TOLERANCE] := 100;
    if GSArray[TOLERANCE] < 10 then
      GSArray[TOLERANCE] := 10;
    GSArray[CURRENTACTUAL] := ActualCASH.Value;
    GSArray[CURRENTTARGET] := TargetCASH.Value;
    tempC := TargetCASh.value - abs(ActualCASH.Value);
    if tempC > 0 then
      GSArray[VALUEDIRECTION] := 1
    else
      GSArray[VALUEDIRECTION] := -1;
    ResultOK := False;
    GSArray[CURRENTVALUE] := 1.00;
    GSArray[LASTVALUE] := GSArray[CURRENTVALUE];
    GSArray[LASTRESULT] := GSArray[CURRENTACTUAL];
    I := 0;
    while (ResultOK = False) and (I < 20) do
      begin
      SetBilled(BaseSales, BaseGP, BaseBilled, GSArray[CURRENTVALUE] * GSArray[VALUEDIRECTION]);
      Cashfe.CalculateAll;
      GSarray[CURRENTRESULT] := CashFe.BankChange;
      Inc(I);
      ResultOK := CloseEnough;
      end;    // while
    TempC := AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.BilledRec.PlanDetail);
    GSResultsRTF.Lines.Add(DriverNames[DR_BILLED] + ':' + #9
                       + CurrToStrF(GSArray[CURRENTVALUE] * Gsarray[VALUEDIRECTION], ffNumber, 2) + ' %'
                       + #9
                       + CurrToStrF(Cashfe.NetProfitAfterTax, ffCurrency, 0));
    if DataModuleClient.Departments.RecordCount = 1 then
			GSResultsRtf.Lines.Add('(' + CurrToStrF(tempc, ffNumber, 0) + ' ' + DataModuleClient.DepartmentsPLURAL_UNITDESC.AsString + ')')
    else
      GSResultsRtf.Lines.Add('(' + CurrToStrF(tempc, ffNumber, 0) + ' Units)');
    UWIRecPtr.IsCashTarget := True;
    UWIRecPtr.TargetValue := TempC;
    end;
  UWIRecPtr.ValueType := vtNumeric0;
  UWIRecPtr.PCChange := GSArray[CURRENTVALUE] * GSArray[VALUEDIRECTION];
  UWIRecPtr.NPResult := Cashfe.NetProfitAfterTax;
  UWIRecPtr.CashResult := Cashfe.BankChange;
  UWIRecPtr.Cycles := I - 1;
  RestoreVitalAccounts;
  Cashfe.CalculateAll;
  ReportList.Add(UWIRecPtr);
end;

procedure TUltimatewhatifF.GSProductivity;
Var
  I: Integer;
  BaseSales, BaseGP, BaseBilled : TDetailedBalArray;
  TempC: Currency;
  ResultOK : Boolean;
begin
// Purchase Price
// Save Changed Drivers
  SaveVitalAccounts;
  new(UWIRecPtr);
  UWIRecPtr.Drivername := DR_PRODUCTIVITY;
  Move(Cashfe.salesRec.PlanDetail, BaseSales, sizeof(TDetailedBalArray));
  Move(Cashfe.GPRec.PlanDetail, BaseGP, sizeof(TDetailedBalArray));
  Move(Cashfe.BilledRec.PlanDetail, BaseBilled, sizeof(TDetailedBalArray));
  tempc := AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.PotentialRec.PlanDetail);
  if tempc <> 0 then
    UWIRecPtr.BaseValue := AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.BilledRec.PlanDetail) * 100 / tempc;
  if TargetRG.ItemIndex = 0 then
    begin
    ResetGSarray;
    GSArray[LARGEVALUEAMOUNT] := 10; // PC or absolue
    if TargetNP.Value * 0.001 < 100 then
      GSArray[TOLERANCE] := TargetNP.Value * 0.001
    else
      GSArray[TOLERANCE] := 100;
    if GSArray[TOLERANCE] < 10 then
      GSArray[TOLERANCE] := 10;
    GSArray[CURRENTACTUAL] := ActualNP.Value;
    GSArray[CURRENTTARGET] := TargetNP.Value;
    tempC := TargetNP.value - abs(ActualNp.Value);
    if tempC > 0 then
      GSArray[VALUEDIRECTION] := 1
    else
      GSArray[VALUEDIRECTION] := -1;
    ResultOK := False;
    GSArray[CURRENTVALUE] := 1.00;
    GSArray[LASTVALUE] := GSArray[CURRENTVALUE];
    GSArray[LASTRESULT] := GSArray[CURRENTACTUAL];
    I := 0;
    while (ResultOK = False) and (I < 20) do
      begin
      SetProduct(BaseSales, BaseGP, BaseBilled, GSArray[CURRENTVALUE] * GSArray[VALUEDIRECTION]);
      Cashfe.CalculateAll;
      GSarray[CURRENTRESULT] := CashFe.NetProfitAfterTax;
      Inc(I);
      ResultOK := CloseEnough;
      end;    // while
    TempC := AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.PotentialRec.PlanDetail);
    if tempc <> 0 then
      TempC := AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.BilledRec.PlanDetail) * 100 / tempc;
    GSResultsRTF.Lines.Add(DriverNames[DR_PRODUCTIVITY] + ':' + #9
                       + CurrToStrF(GSArray[CURRENTVALUE] * Gsarray[VALUEDIRECTION], ffNumber, 2) + ' %'
                       + #9
                       + CurrToStrF(Cashfe.BankChange, ffCurrency, 0));
    GSResultsRtf.Lines.Add('(' + CurrToStrF(tempc, ffNumber, 2) + ' %)');
    UWIRecPtr.IsCashTarget := False;
    UWIRecPtr.TargetValue := TempC;
    end
  else
    begin
    // now for cash target
    ResetGSarray;
    GSArray[LARGEVALUEAMOUNT] := 10; // PC or absolue
    if TargetCash.Value * 0.001 < 100 then
      GSArray[TOLERANCE] := TargetCash.Value * 0.001
    else
      GSArray[TOLERANCE] := 100;
    if GSArray[TOLERANCE] < 10 then
      GSArray[TOLERANCE] := 10;
    GSArray[CURRENTACTUAL] := ActualCASH.Value;
    GSArray[CURRENTTARGET] := TargetCASH.Value;
    tempC := TargetCASh.value - abs(ActualCASH.Value);
    if tempC > 0 then
      GSArray[VALUEDIRECTION] := 1
    else
      GSArray[VALUEDIRECTION] := -1;
    ResultOK := False;
    GSArray[CURRENTVALUE] := 1.00;
    GSArray[LASTVALUE] := GSArray[CURRENTVALUE];
    GSArray[LASTRESULT] := GSArray[CURRENTACTUAL];
    I := 0;
    while (ResultOK = False) and (I < 20) do
      begin
      SetProduct(BaseSales, BaseGP, BaseBilled, GSArray[CURRENTVALUE] * GSArray[VALUEDIRECTION]);
      Cashfe.CalculateAll;
      GSarray[CURRENTRESULT] := CashFe.BankChange;
      Inc(I);
      ResultOK := CloseEnough;
      end;    // while
    TempC := AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.PotentialRec.PlanDetail);
    if tempc <> 0 then
      TempC := AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.BilledRec.PlanDetail) * 100 / tempc;
    GSResultsRTF.Lines.Add(DriverNames[DR_PRODUCTIVITY] + ':' + #9
                       + CurrToStrF(GSArray[CURRENTVALUE] * Gsarray[VALUEDIRECTION], ffNumber, 2) + ' %'
                       + #9
                       + CurrToStrF(Cashfe.NetProfitAfterTax, ffCurrency, 0));
    GSResultsRtf.Lines.Add('(' + CurrToStrF(tempc, ffNumber, 2) + ' %)');
    UWIRecPtr.IsCashTarget := True;
    UWIRecPtr.TargetValue := TempC;
    end;
  UWIRecPtr.ValueType := vtPercent2;
  UWIRecPtr.PCChange := GSArray[CURRENTVALUE] * GSArray[VALUEDIRECTION];
  UWIRecPtr.NPResult := Cashfe.NetProfitAfterTax;
  UWIRecPtr.CashResult := Cashfe.BankChange;
  UWIRecPtr.Cycles := I - 1;
  RestoreVitalAccounts;
  Cashfe.CalculateAll;
  ReportList.Add(UWIRecPtr);
end;

procedure TUltimatewhatifF.GSARDays;
Var
  I : Integer;
  BaseDays : TDetailedBalArray;
  AveDays, TempC: Currency;
  ResultOK : Boolean;
begin
// Purchase Price
// Save Changed Drivers
  AveDays := AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.AR_DaysRec.PlanDetail) / (Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate));
  if (AveDays = 0) then exit;

  if TargetRG.ItemIndex = 1 then
    begin
    SaveVitalAccounts;
    new(UWIRecPtr);
    UWIRecPtr.Drivername := DR_ARDAYS;
    UWIRecPtr.IsCashTarget := True;
    UWIRecPtr.BaseValue := AveDays;
    move(Cashfe.AR_DaysRec.PlanDetail, basedays, sizeof(TDetailedBalArray));
    ResetGSarray;
    GSArray[LARGEVALUEAMOUNT] := 10; // PC or absolue
    if Targetcash.Value * 0.001 < 100 then
      GSArray[TOLERANCE] := Targetcash.Value * 0.001
    else
      GSArray[TOLERANCE] := 100;
    if GSArray[TOLERANCE] < 10 then
      GSArray[TOLERANCE] := 10;
    GSArray[CURRENTACTUAL] := ActualCash.Value;
    GSArray[CURRENTTARGET] := TargetCash.Value;
    tempC := TargetCash.value - abs(ActualCash.Value);
    if tempC > 0 then
      GSArray[VALUEDIRECTION] := -1
    else
      GSArray[VALUEDIRECTION] := 1;
    ResultOK := False;
    // we always try for 50% to see is that will be more than we need
    GSArray[CURRENTVALUE] := 50; //trunc(AveDays / 2);
    GSArray[LASTVALUE] := GSArray[CURRENTVALUE];
    GSArray[LASTRESULT] := GSArray[CURRENTACTUAL];
    I := 0;
    while (ResultOK = False) and (I < 30) do
      begin
      SetARAverageDays(BaseDays, GSArray[CURRENTVALUE] * GSArray[VALUEDIRECTION]);
      Cashfe.CalculateAll;
      GSarray[CURRENTRESULT] := CashFe.BankChange;
      Inc(I);
      ResultOK := CloseEnough;
      end;    // while
    GGlobals.DebugOut('AR - ' + inttostr(I) + ' Times');
    GSResultsRTF.Lines.Add(DriverNames[DR_ARDAYS] + '.');
    GSResultsRTF.Lines.Add(#9
                     + CurrToStrF(GSArray[CURRENTVALUE] * Gsarray[VALUEDIRECTION], ffNumber, 2) + ' %'
                     + #9
                     + CurrToStrF(Cashfe.NetProfitAfterTax, ffCurrency, 0));
    AveDays := AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.AR_DaysRec.PlanDetail) / (Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate));
    GSResultsRtf.Lines.Add('(' + CurrToStrF(AveDays, ffNumber, 1) + ' Days)');
    UWIRecPtr.TargetValue := AveDays;
    UWIRecPtr.ValueType := vtNumeric1;
    UWIRecPtr.PCChange := GSArray[CURRENTVALUE] * GSArray[VALUEDIRECTION];
    UWIRecPtr.NPResult := Cashfe.NetProfitAfterTax;
    UWIRecPtr.CashResult := Cashfe.BankChange;
    UWIRecPtr.Cycles := I - 1;
    RestoreVitalAccounts;
    Cashfe.CalculateAll;
    ReportList.Add(UWIRecPtr);
    end;
end;

procedure TUltimatewhatifF.GSStock;
Var
  I : Integer;
  BaseDays : TDetailedBalArray;
  AveDays, TempC: Currency;
  ResultOK, StockisDays : Boolean;
begin
  AveDays := AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.Stock_DaysRec.PlanDetail) / (Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate));
  if (AveDays = 0) then exit;

  if TargetRG.ItemIndex = 1 then
    begin
    SaveVitalAccounts;
    if DataCollect.GetUserOption(OUSESTOCKDAYS, UOInteger) <> 0 then
      StockisDays := true
    else
      StockisDays := False;
    new(UWIRecPtr);
    UWIRecPtr.Drivername := DR_STOCK;
    UWIRecPtr.BaseValue := AveDays;
    move(Cashfe.Stock_DaysRec.PlanDetail, basedays, sizeof(TDetailedBalArray));
    ResetGSarray;
    GSArray[LARGEVALUEAMOUNT] := 10; // PC or absolue
    if Targetcash.Value * 0.001 < 100 then
      GSArray[TOLERANCE] := Targetcash.Value * 0.001
    else
      GSArray[TOLERANCE] := 100;
    if GSArray[TOLERANCE] < 10 then
      GSArray[TOLERANCE] := 10;
    GSArray[CURRENTACTUAL] := ActualCash.Value;
    GSArray[CURRENTTARGET] := TargetCash.Value;
    tempC := TargetCash.value - abs(ActualCash.Value);

    if ((tempC > 0) and (StockisDays = False))  or ((tempC < 0) and (StockisDays = True))then
      GSArray[VALUEDIRECTION] := 1
    else
      GSArray[VALUEDIRECTION] := -1;
    ResultOK := False;
    // we always try for 50% to see is that will be more than we need
    GSArray[CURRENTVALUE] := 50; //trunc(AveDays / 2);
    GSArray[LASTVALUE] := GSArray[CURRENTVALUE];
    GSArray[LASTRESULT] := GSArray[CURRENTACTUAL];
    i := 0;
    while (ResultOK = False) and (I < 30) do
      begin
      SetStockAverageDays(BaseDays, GSArray[CURRENTVALUE] * GSArray[VALUEDIRECTION]);
      Cashfe.CalculateAll;
      GSarray[CURRENTRESULT] := CashFe.BankChange;
      Inc(I);
      ResultOK := CloseEnough;
      end;    // while
    GGlobals.DebugOut('AR - ' + inttostr(I) + ' Times');
    GSResultsRTF.Lines.Add(DriverNames[DR_STOCK] + '.');
    GSResultsRTF.Lines.Add(#9
                      + CurrToStrF(GSArray[CURRENTVALUE] * Gsarray[VALUEDIRECTION], ffNumber, 2) + ' %'
                      + #9
                      + CurrToStrF(Cashfe.NetProfitAfterTax, ffCurrency, 0));
    AveDays := AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.Stock_DaysRec.PlanDetail) / (Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate));
    if (StockisDays) then
      GSResultsRtf.Lines.Add('(' + CurrToStrF(AveDays, ffNumber, 1) + ' Days)')
    else
      GSResultsRtf.Lines.Add('(' + CurrToStrF(AveDays, ffNumber, 1) + ' Turns)');
    UWIRecPtr.ValueType := vtNumeric1;
    UWIRecPtr.IsCashTarget := True;
    UWIRecPtr.TargetValue := AveDays;
    UWIRecPtr.PCChange := GSArray[CURRENTVALUE] * GSArray[VALUEDIRECTION];
    UWIRecPtr.NPResult := Cashfe.NetProfitAfterTax;
    UWIRecPtr.CashResult := Cashfe.BankChange;
    UWIRecPtr.Cycles := I - 1;
    RestoreVitalAccounts;
    Cashfe.CalculateAll;
    ReportList.Add(UWIRecPtr);
    end;
end;

procedure TUltimatewhatifF.GSAPDays;
Var
  I: Integer;
  BaseDays : TDetailedBalArray;
  AveDays : Currency;
  ResultOK : Boolean;
begin
// Purchase Price
// Save Changed Drivers
  AveDays := AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.AP_DaysRec.PlanDetail) / (Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate));
  if (AveDays = 0) then exit;

  if TargetRG.ItemIndex = 1 then
    begin
    SaveVitalAccounts;
    new(UWIRecPtr);
    UWIRecPtr.Drivername := DR_APDAYS;
    UWIRecPtr.BaseValue := AveDays;
    move(Cashfe.AP_DaysRec.PlanDetail, basedays, sizeof(TDetailedBalArray));
    ResetGSarray;
    GSArray[LARGEVALUEAMOUNT] := 10; // PC or absolue
    if Targetcash.Value * 0.001 < 100 then
      GSArray[TOLERANCE] := Targetcash.Value * 0.001
    else
      GSArray[TOLERANCE] := 100;
    if GSArray[TOLERANCE] < 10 then
      GSArray[TOLERANCE] := 10;
    GSArray[CURRENTACTUAL] := ActualCash.Value;
    GSArray[CURRENTTARGET] := TargetCash.Value;
    if TargetCash.value > ActualCash.Value then
      GSArray[VALUEDIRECTION] := 1
    else
      GSArray[VALUEDIRECTION] := -1;
    ResultOK := False;
    // we always try for 50% to see is that will be more than we need
    GSArray[CURRENTVALUE] := 50; //trunc(AveDays / 2);
    GSArray[LASTVALUE] := GSArray[CURRENTVALUE];
    GSArray[LASTRESULT] := GSArray[CURRENTACTUAL];
    I := 0;
    while (ResultOK = False) and (I < 30) do
      begin
      SetAPAverageDays(BaseDays, GSArray[CURRENTVALUE] * GSArray[VALUEDIRECTION]);
      Cashfe.CalculateAll;
      GSarray[CURRENTRESULT] := CashFe.BankChange;
//      if ((GSArray[VALUEDIRECTION] > 0) and (GSarray[CURRENTRESULT] < TargetCash.Value))
//         OR ((GSArray[VALUEDIRECTION] < 0) and (GSarray[CURRENTRESULT] > TargetCash.Value)) then
//         ResultOK := True
//      else
//        begin
        Inc(I);
        ResultOK := CloseEnough;
//        end;
      end;    // while
    GGlobals.DebugOut('AP - ' + inttostr(I) + ' Times');
    GSResultsRTF.Lines.Add(DriverNames[DR_APDAYS] + '.');
    GSResultsRTF.Lines.Add(#9
                      + CurrToStrF(GSArray[CURRENTVALUE] * Gsarray[VALUEDIRECTION], ffNumber, 2) + ' %'
                      + #9
                      + CurrToStrF(Cashfe.NetProfitAfterTax, ffCurrency, 0));
    AveDays := AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.AP_DaysRec.PlanDetail) / (Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate));
    GSResultsRtf.Lines.Add('(' + CurrToStrF(AveDays, ffNumber, 1) + ' Days)');
    UWIRecPtr.ValueType := vtNumeric1;
    UWIRecPtr.IsCashTarget := True;
    UWIRecPtr.TargetValue := AveDays;
    UWIRecPtr.PCChange := GSArray[CURRENTVALUE] * GSArray[VALUEDIRECTION];
    UWIRecPtr.NPResult := Cashfe.NetProfitAfterTax;
    UWIRecPtr.CashResult := Cashfe.BankChange;
    UWIRecPtr.Cycles := I - 1;
    RestoreVitalAccounts;
    Cashfe.CalculateAll;
    ReportList.Add(UWIRecPtr);
    end;
end;

procedure TUltimatewhatifF.GSAEDays;
Var
  I: Integer;
  BaseDays : TDetailedBalArray;
  AveDays, TempC: Currency;
  ResultOK : Boolean;
begin
// Purchase Price
// Save Changed Drivers
  AveDays := AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.AE_DaysRec.PlanDetail) / (Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate));

  if TargetRG.ItemIndex = 1 then
    begin
    if (AveDays = 0) or
      (Cashfe.AEDataRec.PlanSummary[Cashfe.PeriodCount - 1] < (TargetCash.Value - ActualCash.Value))
      then exit;
    SaveVitalAccounts;
    new(UWIRecPtr);
    UWIRecPtr.Drivername := DR_AEDAYS;
    UWIRecPtr.BaseValue := AveDays;
    move(Cashfe.AE_DaysRec.PlanDetail, basedays, sizeof(TDetailedBalArray));
    ResetGSarray;
    GSArray[LARGEVALUEAMOUNT] := 10; // PC or absolue
    if Targetcash.Value * 0.001 < 100 then
      GSArray[TOLERANCE] := Targetcash.Value * 0.001
    else
      GSArray[TOLERANCE] := 100;
    if GSArray[TOLERANCE] < 10 then
      GSArray[TOLERANCE] := 10;
    GSArray[CURRENTACTUAL] := ActualCash.Value;
    GSArray[CURRENTTARGET] := TargetCash.Value;
    tempC := TargetCash.value - abs(ActualCash.Value);
    if tempC > 0 then
      GSArray[VALUEDIRECTION] := 1
    else
      GSArray[VALUEDIRECTION] := -1;
    ResultOK := False;
    // we always try for 50% to see is that will be more than we need
    GSArray[CURRENTVALUE] := 50; //trunc(AveDays / 2);
    GSArray[LASTVALUE] := GSArray[CURRENTVALUE];
    GSArray[LASTRESULT] := GSArray[CURRENTACTUAL];
    I := 0;
    while (ResultOK = False) and (I < 30) do
      begin
      SetAEAverageDays(BaseDays, GSArray[CURRENTVALUE] * GSArray[VALUEDIRECTION]);
      Cashfe.CalculateAll;
      GSarray[CURRENTRESULT] := CashFe.BankChange;
//      if ((GSArray[VALUEDIRECTION] > 0) and (GSarray[CURRENTRESULT] > TargetCash.Value))
//         OR ((GSArray[VALUEDIRECTION] < 0) and (GSarray[CURRENTRESULT] < TargetCash.Value)) then
//         ResultOK := True
//      else
//        begin
        Inc(I);
        ResultOK := CloseEnough;
//        end;
      end;    // while
    GGlobals.DebugOut('AE - ' + inttostr(I) + ' Times');
    GSResultsRTF.Lines.Add(DriverNames[DR_AEDAYS] + '.');
    GSResultsRTF.Lines.Add(#9
                      + CurrToStrF(GSArray[CURRENTVALUE] * Gsarray[VALUEDIRECTION], ffNumber, 2) + ' %'
                      + #9
                      + CurrToStrF(Cashfe.NetProfitAfterTax, ffCurrency, 0));
    AveDays := AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.AE_DaysRec.PlanDetail) / (Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate));
    GSResultsRtf.Lines.Add('(' + CurrToStrF(AveDays, ffNumber, 1) + ' Days)');
    UWIRecPtr.ValueType := vtNumeric1;
    UWIRecPtr.IsCashTarget := True;
    UWIRecPtr.TargetValue := AveDays;
    UWIRecPtr.PCChange := GSArray[CURRENTVALUE] * GSArray[VALUEDIRECTION];
    UWIRecPtr.NPResult := Cashfe.NetProfitAfterTax;
    UWIRecPtr.CashResult := Cashfe.BankChange;
    UWIRecPtr.Cycles := I - 1;
    RestoreVitalAccounts;
    Cashfe.CalculateAll;
    ReportList.Add(UWIRecPtr);
    end;
end;

procedure TUltimatewhatifF.DoGoalSeekBtnClick(Sender: TObject);
begin
// set the screen cursor while we do this
  screen.Cursor := crHourGlass;
  GSResultsRTF.Lines.Clear;
  if ReportList.Count > 0 then
    ClearReportList;
//  GSResultsRTF.SelectAll;
  GSResultsRTF.Paragraph.TabCount := 2;
  GSResultsRTF.Paragraph.Tab[0] := 110;
  GSResultsRTF.Paragraph.Tab[1] := 155;
  if TargetRG.ItemIndex = 0 then
    begin
    GSresultsRTF.SelAttributes.Style := [fsBold];
    GSResultsRTF.Lines.Add('            *** NET PROFIT AFTER TAX *** ');
    GSresultsRTF.SelAttributes.Style := [];
    GSResultsRTF.Lines.Add('Base Net Profit: ' + #9 + CurrToStrF(ActualNP.Value, ffCurrency, 0));
    GSResultsRTF.Lines.Add('Target Net Profit: ' + #9 + CurrToStrF(TargetNP.Value, ffCurrency, 0));
    GSResultsRTF.Lines.Add('');
    GSResultsRTF.Lines.Add(#9 + '+/- %' + #9 + 'Bank Change');
    end // YTD Net Profit
  else
    begin
    GSresultsRTF.SelAttributes.Style := [fsBold];
    GSResultsRTF.Lines.Add('          *** BANK BALANCE CHANGE *** ');
    GSresultsRTF.SelAttributes.Style := [];
    GSResultsRTF.Lines.Add('Base Bank Change: ' + #9 + CurrToStrF(ActualCash.Value, ffCurrency, 0));
    GSResultsRTF.Lines.Add('Target Bank Change: ' + #9 + CurrToStrF(TargetCash.Value, ffCurrency, 0));
    GSResultsRTF.Lines.Add('');
    GSResultsRTF.Lines.Add(#9 + '+/- %' + #9 + 'YTD Net Profit');
    end;
//  GSResultsRTF.Properties.Alignment := taRightJustify;
  GSPrice;
  GSPurchase;
  GSGPUnit;
  GSBilled;
  GSProductivity;
  GSARDays;
  GSStock;
  GSAPDays;
  GSAEDays;
  screen.Cursor := crDefault;
end;

function TUltimatewhatifF.AggrValue(ArraySize : Integer; Balances : array of Currency): Currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to ArraySize do    // Iterate
    Result := Result + Balances[I];
end;

procedure TUltimatewhatifF.SetPrice(SalesBase: Array of currency; PcChange : double);
var
  I: Integer;
  LCogs : Currency;
begin
{  Formula:  I = % Increase
    Increase Sales := Sales * (1 + I/100)
    New GPPC := 100 - (100 - GPPC)/(1 + I/100)
}
  for I := 0 to Trunc(Cashfe.pedate) - Trunc(CashFe.psdate) do    // Iterate
    begin
    Lcogs := Cashfe.SalesRec.Plandetail[I] - Cashfe.GPrec.Plandetail[I];
    Cashfe.salesRec.PlanDetail[I] := Round(SalesBase[I] * (1 + PCChange / 100));
    Cashfe.GPrec.PlanDetail[I] := Cashfe.salesRec.PlanDetail[I] - Lcogs;
    end;    // for
  FixOtherAccounts;
end;

procedure TUltimatewhatifF.SetPurchasePrice(CogsBase : Array of Currency; PcChange : double);
var
  I: Integer;
  LCogs : Currency;
begin
  for I := 0 to Trunc(Cashfe.pedate) - Trunc(CashFe.psdate) do    // Iterate
    begin
    Lcogs := Round(CogsBase[I] * (1 + PCChange / 100));
    Cashfe.GPrec.PlanDetail[I] := Cashfe.salesRec.PlanDetail[I] - Lcogs;
    end;    // for
  FixOtherAccounts;
end;

procedure TUltimatewhatifF.SetGPUNIT(Salesbase, GPBase : Array of currency; PCChange: Double);
var
  I: Integer;
  CurrentGPPC, CurrentGPRate : Currency;
begin
  for I := 0 to Trunc(Cashfe.pedate) - Trunc(CashFe.psdate) do    // Iterate
    begin
    if SalesBase[I] <> 0 then
      CurrentGPPC := GPBase[I] * 100 / SalesBase[I]
    else
      currenTGPPC := 0;
    if Cashfe.BilledRec.PlanDetail[I] <> 0 then
      CurrentGPRate := GPBase[I] / Cashfe.BilledRec.PlanDetail[I]
    else
      CurrentGPRate := 0;
    if CurrentGPRate <> 0 then
      begin
      CurrentGPRATE := CurrentGPRATE * (1 + PCChange / 100);
      Cashfe.GPrec.PlanDetail[I] := Round(CurrentGPRate * Cashfe.BilledRec.PlanDetail[I]);
      if CurrentGPPC <> 0 then
        Cashfe.salesRec.PlanDetail[I] := Round(Cashfe.GPrec.PlanDetail[I] * 100 / CurrentGPPC);
      end;
    end;    // for
  FixOtherAccounts;
end;

procedure TUltimatewhatifF.SetBilled(Salesbase, GPBase, BilledBase : Array of currency; PCChange: Double);
var
  I: Integer;
  CurrentGPPC, CurrentGPRate : Currency;
begin
  for I := 0 to Trunc(Cashfe.pedate) - Trunc(CashFe.psdate) do    // Iterate
    begin
    if SalesBase[I] <> 0 then
      CurrentGPPC := GPBase[I] * 100 / SalesBase[I]
    else
      currenTGPPC := 0;
    if BilledBase[I] <> 0 then
      CurrentGPRate := GPBase[I] / BilledBase[I]
    else
      CurrentGPRate := 0;
    if CurrentGPRate <> 0 then
      begin
      CashFe.BilledRec.PlanDetail[I] := BilledBase[I] * (1 + PCChange / 100);
      Cashfe.GPrec.PlanDetail[I] := Round(CurrentGPRate * CashFe.BilledRec.PlanDetail[I]);
      if CurrentGPPC <> 0 then
        Cashfe.salesRec.PlanDetail[I] := Round(Cashfe.GPrec.PlanDetail[I] * 100 / CurrentGPPC);
      end;
    end;    // for
  FixOtherAccounts;
end;

procedure TUltimatewhatifF.SetProduct(Salesbase, GPBase, BilledBase : Array of currency; PCChange: Double);
var
  I: Integer;
  CurrentGPPC, CurrentGPRate, CurrentProductivity : Currency;
begin
  for I := 0 to Trunc(Cashfe.pedate) - Trunc(CashFe.psdate) do    // Iterate
    begin
    if SalesBase[I] <> 0 then
      CurrentGPPC := GPBase[I] * 100 / SalesBase[I]
    else
      currenTGPPC := 0;
    if BilledBase[I] <> 0 then
      CurrentGPRate := GPBase[I] / BilledBase[I]
    else
      CurrentGPRate := 0;
    if Cashfe.PotentialRec.PlanDetail[I] <> 0 then
      CurrentProductivity := BilledBase[I] * 100 / Cashfe.PotentialRec.PlanDetail[I]
    else
      CurrentProductivity := 0;
    if CurrentProductivity <> 0 then
      begin
      CurrentProductivity := CurrentProductivity * (1 + PCChange / 100);
      CashFe.BilledRec.PlanDetail[I] := Cashfe.PotentialRec.PlanDetail[I] * CurrentProductivity / 100;
      Cashfe.GPrec.PlanDetail[I] := Round(CurrentGPRate * CashFe.BilledRec.PlanDetail[I]);
      if CurrentGPPC <> 0 then
        Cashfe.salesRec.PlanDetail[I] := Round(Cashfe.GPrec.PlanDetail[I] * 100 / CurrentGPPC);
      end;
    end;    // for
  FixOtherAccounts;
end;

procedure TUltimatewhatifF.SetARAverageDays(AveBase: Array of currency; PcChange : double);
var
  I: Integer;
begin
  for I := 0 to Trunc(Cashfe.pedate) - Trunc(CashFe.psdate) do    // Iterate
    begin
    CashFe.AR_DaysRec.PlanDetail[I] := Avebase[I] * (1 + PCChange / 100);
    if CashFe.AR_DaysRec.PlanDetail[I] < 0 then
      CashFe.AR_DaysRec.PlanDetail[I] := 0;
    end;
  Cashfe.BuildBSSummary(Cashfe.AR_DaysRec);
end;

procedure TUltimatewhatifF.SetStockAverageDays(AveBase: Array of currency; PcChange : double);
var
  I: Integer;
begin
  for I := 0 to Trunc(Cashfe.pedate) - Trunc(CashFe.psdate) do    // Iterate
    begin
    CashFe.Stock_DaysRec.PlanDetail[I] := Avebase[I] * (1 + PCChange / 100);
    if CashFe.Stock_DaysRec.PlanDetail[I] < 0 then
      CashFe.Stock_DaysRec.PlanDetail[I] := 0;
    end;
  Cashfe.BuildBSSummary(Cashfe.Stock_DaysRec);
end;

procedure TUltimatewhatifF.SetAPAverageDays(AveBase: Array of currency; PcChange : double);
var
  I: Integer;
begin
  for I := 0 to Trunc(Cashfe.pedate) - Trunc(CashFe.psdate) do    // Iterate
    Begin
    CashFe.AP_DaysRec.PlanDetail[I] := Avebase[I] * (1 + PCChange / 100);
    if CashFe.AP_DaysRec.PlanDetail[I] < 0 then
      CashFe.AP_DaysRec.PlanDetail[I] := 0;
    end;
  Cashfe.BuildBSSummary(Cashfe.AP_DaysRec);
end;

procedure TUltimatewhatifF.SetAEAverageDays(AveBase: Array of currency; PcChange : double);
var
  I: Integer;
begin
  for I := 0 to Trunc(Cashfe.pedate) - Trunc(CashFe.psdate) do    // Iterate
    Begin
    CashFe.AE_DaysRec.PlanDetail[I] := Avebase[I] * (1 + PCChange / 100);
    if CashFe.AE_DaysRec.PlanDetail[I] < 0 then
      CashFe.AE_DaysRec.PlanDetail[I] := 0;
    end;
  Cashfe.BuildBSSummary(Cashfe.AE_DaysRec);
end;

function TUltimatewhatifF.SaveVitalAccounts: Boolean;
var
  I: Integer;
begin
  Inc(BKLevel); // increment
//  if not assigned(UWISales[BkLevel]) then
  FileSeek(BKFileHandle, Sizeof(TDetailedBalArray) * BkLevel * (RLASTACCOUNT), 0);
  for I := 0 to RLASTACCOUNT - 1 do    // Iterate
    FileWrite(BKFileHandle, TcashFlowRecPtr(BKRecords[I]).PlanDetail, Sizeof(TDetailedBalArray));
  result := True;
end;

function TUltimatewhatifF.RestoreVitalAccounts: Boolean;
var
  I : integer;
begin
  if BkLevel > -1 then
    begin
    for I := 0 to RLASTACCOUNT - 1 do    // Iterate
      begin
      FileSeek(BKFileHandle, Sizeof(TDetailedBalArray) * BkLevel * (RLASTACCOUNT) + (I * Sizeof(TDetailedBalArray)), 0);
      FileRead(BKFileHandle, TcashFlowRecPtr(BKRecords[I]).PlanDetail, Sizeof(TDetailedBalArray));
      end;
    // Now Calculate the following
    Cashfe.BuildBSSummary(Cashfe.AR_DaysRec);
    Cashfe.BuildBSSummary(Cashfe.Stock_DaysRec);
    Cashfe.BuildBSSummary(Cashfe.AP_DaysRec);
    Cashfe.BuildBSSummary(Cashfe.AE_DaysRec);
    FixOtherAccounts;
    end;
  result := False;
end;

procedure TUltimatewhatifF.FixOtherAccounts;
var
  I : Integer;
begin
  for I := 0 to Trunc(Cashfe.pedate) - Trunc(CashFe.psdate) do    // Iterate
    begin
    // GPPC
    if CashFe.SalesRec.PlanDetail[I] <> 0 then
      CashFe.GPPCRec.PlanDetail[I] := CashFe.GPRec.PlanDetail[I] * 100 / CashFe.SalesRec.PlanDetail[I];
    // NOP
    CashFe.NOPRec.PlanDetail[I] := CashFe.GPRec.PlanDetail[I] -  Cashfe.TotalexpensesRec.PlanDetail[I];
    // NP
    Cashfe.NPRec.PlanDetail[I] := CashFe.NOPRec.PlanDetail[I] + Cashfe.OTHERIncomeRec.PlanDetail[I];
    // SALESUNIT
    if Cashfe.BilledRec.PlanDetail[I] <> 0 then
      CashFe.SalesUnitRec.PlanDetail[I] := CashFe.SalesRec.PlanDetail[I] / Cashfe.BilledRec.PlanDetail[I];
    // GPUNIT
    if Cashfe.BilledRec.PlanDetail[I] <> 0 then
      CashFe.GPUnitRec.PlanDetail[I] := CashFe.GPRec.PlanDetail[I] / Cashfe.BilledRec.PlanDetail[I];
    // PRODUCTIVITY
    if CashFe.PotentialRec.PlanDetail[I] <> 0 then
      Cashfe.ProdRec.PlanDetail[I] := Cashfe.BilledRec.PlanDetail[I] * 100 / CashFe.PotentialRec.PlanDetail[I];
    end;    // for
end;

procedure TUltimatewhatifF.PriceSpinPropertiesEditValueChnged(
  Sender: TObject);
begin
  if SpinActive then
    begin
    SetPrice(Basesales, PriceSpin.Value);
    Cashfe.CalculateAll;
    SetUpChart;
    ShowCurrentResult;
    SetSpinners;
    end;
end;

procedure TUltimatewhatifF.SetChartScale;
var
  MaxValue, MinValue : Double;
  I: Integer;
begin
  MaxValue := -99999999;
  MinValue := 999999999;
  for I := 0 to Cashfe.PeriodCount do    // Iterate
    begin
    if ProfitSeries.Visible then
      begin
      if ProfitSeries.YValue[I] > MaxValue then
        MaxValue := ProfitSeries.YValue[I];
      if ProfitSeries.YValue[I] < MinValue then
        MinValue := ProfitSeries.YValue[I];
      if ProfitSeries.OffsetValues.Items[I] > MaxValue then
        MaxValue := ProfitSeries.OffsetValues.Items[I];
      if ProfitSeries.OffsetValues.Items[I] < MinValue then
        MinValue := ProfitSeries.OffsetValues.Items[I];
      end;
    if BankSeries.Visible then
      begin
      if BankSeries.YValue[I] > MaxValue then
        MaxValue := BankSeries.YValue[I];
      if BankSeries.OffsetValues.Items[I] > MaxValue then
        MaxValue := BankSeries.OffsetValues.Items[I];
      if BankSeries.YValue[I] < MinValue then
        MinValue := BankSeries.YValue[I];
      if BankSeries.OffsetValues.Items[I] < MinValue then
        MinValue := BankSeries.OffsetValues.Items[I];
      end;
    end;    // for
  Chart1.LeftAxis.Maximum := Maxvalue;
  Chart1.LeftAxis.Minimum := MinValue;
end;

procedure TUltimatewhatifF.ShowNPCBClick(Sender: TObject);
begin
  ProfitSeries.Visible := ShowNPCB.Checked;
  SetChartScale;
end;

procedure TUltimatewhatifF.ShowBankCBClick(Sender: TObject);
begin
  BankSeries.Visible := ShowBankCB.Checked;
  SetChartScale;
end;

procedure TUltimatewhatifF.ShowMarksCBClick(Sender: TObject);
begin
  BankSeries.Marks.Visible := ShowMarksCB.Checked;
  ProfitSeries.Marks.Visible := ShowMarksCB.Checked;
end;

procedure TUltimatewhatifF.TeeCommander1NormalClick(Sender: TObject);
begin
  Chart1.View3DOptions.Elevation := 345;
  Chart1.View3DOptions.Rotation := 345;
  Chart1.View3DOptions.OrthoAngle := 40;
  Chart1.View3DOptions.Perspective := 15;
  Chart1.Chart3DPercent := 25;
  Chart1.View3DOptions.HorizOffset := 0;
  Chart1.View3DOptions.VertOffset := 0;
  Chart1.View3D := True;
  Chart1.View3DOptions.Orthogonal := True;
end;

procedure TUltimatewhatifF.ManualRBClick(Sender: TObject);
var
  I : Integer;
  PeriodSize : Integer;
begin
//
  EnableManualSpinners(True);
  SpinActive := True;
  DoGoalSeekBtn.Enabled := False;
  Move(Cashfe.SalesRec.PlanDetail, BaseSales, Sizeof(TDetailedBalArray));
  Move(Cashfe.GPRec.PlanDetail, BaseGP, Sizeof(TDetailedBalArray));
  SaveVitalAccounts;
  FixOtherAccounts;
  // Record and display Base Values - Used for Report
  PeriodSize := Trunc(Cashfe.pedate) - Trunc(CashFe.psdate);
  for I := 0 to RLASTACCOUNT - 1 do    // Iterate
    BaseYTDValues[I] := AggrValue(PeriodSize, TcashFlowRecPtr(BKRecords[I]).PlanDetail);
  // Yearly totals are used for all adjustment calculations
  SetDriverBases;
end;

procedure TUltimatewhatifF.GoalSeekRBClick(Sender: TObject);
begin
  if Messagedlg('Dow you wish to save the Manual Calculations'
             + #13#10 + 'and make them your new base for Goal Seeking?'
             + #13#10 + 'If you click the No Button, your Manual Calculations'
             + #13#10 + 'will be lost!', MtWarning, [MbYes, MbNo], 0) = MrNo then
    RestoreVitalAccounts
  else
    begin
    // Save the Current Calculations and reload as if the Form was just opened.
    // Save Cashflow to DB
    Cashfe.SaveCashFlowData;
    FileClose(BkFileHandle);
    if fileexists(BKFileName) then
      deletefile(BKFileName);
    InitialiseForm;
    end;
  EnableManualSpinners(False);
  DoGoalSeekBtn.Enabled := True;
end;

procedure TUltimatewhatifF.SetBaseLabels;
var
  TempC, TempSales, TempBilled : Currency;
begin
  TempSales := AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.SalesRec.PlanDetail);
  TempBilled := AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.BilledRec.PlanDetail);
  TempC := Round(TempSales * 100 / TempBilled) / 100;
  AveSaleUnitSpin.Value := TempC;
  AveSaleBase.Caption := CurrToStrF(TempC, ffCurrency, 2);
  TempC := Round(AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.GPRec.PlanDetail) * 100
                / TempBilled) / 100;
  AveGPUnitSpin.Value := TempC;
  AveGPBase.Caption := CurrToStrF(Tempc, ffCurrency, 2);
  BilledSpin.Value := Round(TempBilled * 100) / 100;
  BilledBase.Caption := CurrToStrF(BilledSpin.Value, ffNumber, 2);
  tempc := AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.PotentialRec.PlanDetail);
  if tempc <> 0 then
    TempC := Round(TempBilled * 100 / tempc * 100) / 100;
  ProductivitySpin.Value := TempC;
  ProductivityBase.Caption := CurrToStrF(TempC, ffNumber, 2) + ' %';
  TempC := Round(AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.AR_DaysRec.PlanDetail )
                / (Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate)) * 10) / 10;
  ARDaysSpin.Value := Tempc;
  ARDaysBase.Caption := CurrToStrF(TempC , ffNumber, 1);
  TempC := Round(AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.Stock_DaysRec.PlanDetail )
                / (Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate)) * 10) / 10;
  StockDaysSpin.Value := Tempc;
  StockDaysBase.Caption := CurrToStrF(TempC, ffNumber, 1);
  TempC := Round(AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.AP_DaysRec.PlanDetail )
                / (Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate)) * 10) / 10;
  APDaysSpin.Value := Tempc;
  APDaysBase.Caption := CurrToStrF(tempC, ffNumber, 1);
  TempC := Round(AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.AE_DaysRec.PlanDetail )
                / (Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate)) * 10) / 10;
  AEDaysSpin.Value := Tempc;
  AEDaysBase.Caption := CurrToStrF(TempC, ffNumber, 1);
end;

procedure TUltimatewhatifF.SetSpinners;
var
  TempSales, TempBilled, tempc : Currency;
begin
  SpinActive := False;
  TempSales := AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.SalesRec.PlanDetail);
  TempBilled := AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.BilledRec.PlanDetail);

  AveSaleUnitSpin.Value := Round(TempSales * 100 / TempBilled) / 100;
  AveGPUnitSpin.Value := Round(AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.GPRec.PlanDetail) * 100
                / TempBilled) / 100;
  BilledSpin.Value := Round(TempBilled * 100) / 100;
  tempc := AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.PotentialRec.PlanDetail);
  if tempc <> 0 then
    ProductivitySpin.Value := Round(TempBilled * 100 / tempc * 100) / 100;
  ARDaysSpin.Value := Round(AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.AR_DaysRec.PlanDetail )
                / (Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate)) * 10) / 10;
  StockDaysSpin.Value := Round(AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.Stock_DaysRec.PlanDetail )
                / (Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate)) * 10) / 10;
  APDaysSpin.Value := Round(AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.AP_DaysRec.PlanDetail )
                / (Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate)) * 10) / 10;
  AEDaysSpin.Value := Round(AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.AE_DaysRec.PlanDetail )
                / (Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate)) * 10) / 10;
  SpinActive := True;
end;

procedure TUltimatewhatifF.EnableManualSpinners(Value : Boolean);
begin
  PriceSpin.Enabled := Value;
  PurchaseSpin.Enabled := Value;
  AveSaleUnitSpin.Enabled := Value;
  AveGPUnitSpin.Enabled := Value;
  BilledSpin.Enabled := Value;
  ProductivitySpin.Enabled := Value;
  ARDaysSpin.Enabled := Value;
  StockDaysSpin.Enabled := Value;
  APDaysSpin.Enabled := Value;
  AEDaysSpin.Enabled := Value;
end;

procedure TUltimatewhatifF.ShowCurrentResult;
begin
  ResultNP.Value := Cashfe.NetProfitAfterTax;
  ResultCash.Value := Cashfe.BankChange;
  ResultNetSales.Value := AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.SalesRec.PlanDetail);
  if ResultNetSales.Value <> 0 then
    ResultGPPC.Value := AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.GPRec.PlanDetail) * 100 / ResultNetSales.Value;
end;

procedure TUltimatewhatifF.PurchaseSpinPropertiesEditValueChanged(
  Sender: TObject);
var
  I : Integer;
begin
  if SpinActive then
    begin
    for I := 0 to Trunc(Cashfe.pedate) - Trunc(CashFe.psdate) do    // Iterate
      BaseCogs[I] := BaseSales[I] - BaseGP[I];
    SetPurchasePrice(BaseCogs, PurchaseSpin.Value);
    Cashfe.CalculateAll;
    SetUpChart;
    ShowCurrentResult;
    SetSpinners;
    end;
end;

procedure TUltimatewhatifF.AveSaleUnitSpinPropertiesEditValueChanged(
  Sender: TObject);
var
  I : Integer;
  NewTotal : Currency;
begin
  if SpinActive then
    begin
    for I := 0 to Trunc(Cashfe.pedate) - Trunc(CashFe.psdate) do    // Iterate
      begin
      if Cashfe.salesRec.PlanDetail[I] <> 0 then
        CashFe.GPPCRec.PlanDetail[i] := Cashfe.GPRec.PlanDetail[I] * 100 / Cashfe.salesRec.PlanDetail[I]
      else
        CashFe.GPPCRec.PlanDetail[i] := 0;
      end;
    // Find out the new Sales Figure
    NewTotal := AveSaleUnitSpin.Value * BilledSpin.Value;
    DataCollect.updateArray(Cashfe.SalesRec.PlanDetail,
                  0,
                  DaysBetween(Cashfe.pedate, Cashfe.psdate),
                  NewTotal, 2);
    for I := 0 to Trunc(Cashfe.pedate) - Trunc(CashFe.psdate) do    // Iterate
      begin
      if CashFe.GPPCRec.PlanDetail[i] <> 0 then
        Cashfe.GPRec.PlanDetail[I] := Round(Cashfe.salesRec.PlanDetail[I] * CashFe.GPPCRec.PlanDetail[i]) / 100;
      end;    // for
    CalculateManual;
    end;
end;

procedure TUltimatewhatifF.AveGPUnitSpinPropertiesEditValueChanged(
  Sender: TObject);
var
  I : Integer;
  NewTotal : Currency;
begin
  if SpinActive then
    begin
    for I := 0 to Trunc(Cashfe.pedate) - Trunc(CashFe.psdate) do    // Iterate
      begin
      if Cashfe.salesRec.PlanDetail[I] <> 0 then
        CashFe.GPPCRec.PlanDetail[i] := Cashfe.GPRec.PlanDetail[I] * 100 / Cashfe.salesRec.PlanDetail[I]
      else
        CashFe.GPPCRec.PlanDetail[i] := 0;
      end;
    // Find out the new Gross Profit Figure
    NewTotal := AveGPUnitSpin.Value * BilledSpin.Value;
    DataCollect.updateArray(Cashfe.GPRec.PlanDetail,
                  0,
                  DaysBetween(Cashfe.pedate, Cashfe.psdate),
                  NewTotal, 2);
    for I := 0 to Trunc(Cashfe.pedate) - Trunc(CashFe.psdate) do    // Iterate
      begin
      if CashFe.GPPCRec.PlanDetail[i] <> 0 then
        Cashfe.SalesRec.PlanDetail[I] := Round(Cashfe.GPRec.PlanDetail[I] * 10000 / CashFe.GPPCRec.PlanDetail[i]) / 100;
      end;    // for
    CalculateManual;
    end;
end;

procedure TUltimatewhatifF.BilledSpinPropertiesEditValueChanged(
  Sender: TObject);
var
  I : Integer;
  CurrentGPPC, CurrentGPRate : Currency;
  OldBilled : TDetailedBalArray;
begin
  if SpinActive then
    begin
    // Find out the current agre SaleUnit value
//    move();
    Move(Cashfe.BilledRec.PlanDetail, OldBilled, sizeof(TDetailedBalArray));
    DataCollect.updateArray(Cashfe.BilledRec.PlanDetail,
                  0,
                  DaysBetween(Cashfe.pedate, Cashfe.psdate),
                  BilledSpin.Value, 2);
    for I := 0 to Trunc(Cashfe.pedate) - Trunc(CashFe.psdate) do    // Iterate
      begin
      if Cashfe.salesRec.PlanDetail[I] <> 0 then
        CurrentGPPC := Cashfe.GPRec.PlanDetail[I] * 100 / Cashfe.salesRec.PlanDetail[I]
      else
        currenTGPPC := 0;
      if Oldbilled[I] <> 0 then
        CurrentGPRate := Cashfe.GPRec.PlanDetail[I] / OldBilled[I]
      else
        CurrentGPRate := 0;
      Cashfe.GPRec.PlanDetail[I] := CurrentGPRate * Cashfe.BilledRec.PlanDetail[I];
      if CurrentGPPC <> 0 then
        Cashfe.SalesRec.PlanDetail[I] := Round(Cashfe.GPRec.PlanDetail[I] * 10000 / CurrentGPPC) / 100;
      end;    // for
    CalculateManual;
    end;
end;

procedure TUltimatewhatifF.CalculateManual;
begin
    FixOtherAccounts;
    Cashfe.CalculateAll;
    SetUpChart;
    ShowCurrentResult;
    SetSpinners;
end;

procedure TUltimatewhatifF.ProductivitySpinPropertiesEditValueChanged(
  Sender: TObject);
var
  I : Integer;
  NewTotal, CurrentGPPC, CurrentGPRate : Currency;
  OldBilled : TDetailedBalArray;
begin
  if SpinActive then
    begin
    // Find out the current agre SaleUnit value
//    move();
    Move(Cashfe.BilledRec.PlanDetail, OldBilled, sizeof(TDetailedBalArray));
    NewTotal := AggrValue(Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate), Cashfe.PotentialRec.PlanDetail) * ProductivitySpin.value / 100;
    DataCollect.updateArray(Cashfe.BilledRec.PlanDetail,
                  0,
                  DaysBetween(Cashfe.pedate, Cashfe.psdate),
                  NewTotal, 2);
    for I := 0 to Trunc(Cashfe.pedate) - Trunc(CashFe.psdate) do    // Iterate
      begin
      if Cashfe.salesRec.PlanDetail[I] <> 0 then
        CurrentGPPC := Cashfe.GPRec.PlanDetail[I] * 100 / Cashfe.salesRec.PlanDetail[I]
      else
        currenTGPPC := 0;
      if Oldbilled[I] <> 0 then
        CurrentGPRate := Cashfe.GPRec.PlanDetail[I] / OldBilled[I]
      else
        CurrentGPRate := 0;
      Cashfe.GPRec.PlanDetail[I] := CurrentGPRate * Cashfe.BilledRec.PlanDetail[I];
      if CurrentGPPC <> 0 then
        Cashfe.SalesRec.PlanDetail[I] := Round(Cashfe.GPRec.PlanDetail[I] * 10000 / CurrentGPPC) / 100;
      end;    // for
    CalculateManual;
    end;
end;

procedure TUltimatewhatifF.ARDaysSpinPropertiesEditValueChanged(
  Sender: TObject);
var
  NewTotal : Currency;
begin
  if SpinActive then
    begin
    NewTotal := (Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate)) * ARDaysSpin.Value;
    DataCollect.updateArray(Cashfe.AR_DaysRec.PlanDetail,
                  0,
                  DaysBetween(Cashfe.pedate, Cashfe.psdate),
                  NewTotal, 4);
    Cashfe.BuildBSSummary(Cashfe.AR_DaysRec);
    CalculateManual;
    end;
end;

procedure TUltimatewhatifF.StockDaysSpinPropertiesEditValueChanged(
  Sender: TObject);
var
  NewTotal : Currency;
begin
  if SpinActive then
    begin
    NewTotal := (Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate)) * StockDaysSpin.Value;
    DataCollect.updateArray(Cashfe.Stock_DaysRec.PlanDetail,
                  0,
                  DaysBetween(Cashfe.pedate, Cashfe.psdate),
                  NewTotal, 4);
    Cashfe.BuildBSSummary(Cashfe.Stock_DaysRec);
    CalculateManual;
    end;
end;

procedure TUltimatewhatifF.APDaysSpinPropertiesEditValueChanged(
  Sender: TObject);
var
  NewTotal : Currency;
begin
  if SpinActive then
    begin
    NewTotal := (Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate)) * APDaysSpin.Value;
    DataCollect.updateArray(Cashfe.AP_DaysRec.PlanDetail,
                  0,
                  DaysBetween(Cashfe.pedate, Cashfe.psdate),
                  NewTotal, 4);
    Cashfe.BuildBSSummary(Cashfe.AP_DaysRec);
    CalculateManual;
    end;
end;

procedure TUltimatewhatifF.AEDaysSpinPropertiesEditValueChanged(
  Sender: TObject);
var
  NewTotal : Currency;
begin
  if SpinActive then
    begin
    NewTotal := (Trunc(Cashfe.pedate) - Trunc(Cashfe.psdate)) * AEDaysSpin.Value;
    DataCollect.updateArray(Cashfe.AE_DaysRec.PlanDetail,
                  0,
                  DaysBetween(Cashfe.pedate, Cashfe.psdate),
                  NewTotal, 4);
    Cashfe.BuildBSSummary(Cashfe.AE_DaysRec);
    CalculateManual;
    end;
end;

procedure TUltimatewhatifF.ClearReportList;
var
  index : integer;
begin
  for index := 0 to ReportList.Count - 1 do
    begin
    UWIRecPtr := TUltimateWIRecPtr(ReportList.Items[index]);
    dispose(UWIRecPtr);
    end;
  ReportList.clear;
end;

procedure TUltimatewhatifF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ClearReportList;
  ReportList.Destroy;
end;

function TUltimatewhatifF.ppJITBasePipeGetFieldValue(
  aFieldName: String): Variant;
begin
  // set pointer to the currentRecord
  if ppJITBasePipe.RecordIndex > 0 then
    UWIRecPtr := TUltimateWIRecPtr(ReportList.Items[ppJITBasePipe.RecordIndex - 1]);
  if AFieldName = 'BusinessName' then
    Result := DataModuleClient.BusinessDetailsBUSINESS_NAME.Value;
  if aFieldName = 'DeptName' then
    Result := DataModuleClient.BusinessesBRANCH_NAME.Value;
  if aFieldName = 'TargetPeriod' then
    Result := 'Target Period: ' + DataModuleClient.CashFlowDeptCURRENTPLANSTART.AsString + ' to ' + DataModuleClient.CashFlowDeptCURRENTPLANEND.AsString;
  if aFieldName = 'ActualNPBase' then
    Result := ActualNP.Value;
  if aFieldName = 'ActualCashBase' then
    Result := ActualCash.Value;
  if aFieldName = 'NewNP' then
    Result := ResultNP.Value;
  if aFieldName = 'NewCash' then
    Result := ResultCash.Value;
  if aFieldName = 'NetSales' then
    Result := ResultNetSales.Value;
  if aFieldName = 'NewGPPC' then
    Result := ResultGPPC.Value;
  if aFieldName = 'ActualBase' then
    begin
    if TargetRG.ItemIndex = 0 then
      result := ActualNP.Value
    else
      Result := ActualCash.Value;
    end;
  if aFieldName = 'TargetField' then
    begin
    if TargetRG.ItemIndex = 0 then
      result := TargetNP.Value
    else
      Result := TargetCash.Value;
    end;
  if aFieldName = 'CalcType' then
    begin
    if TargetRG.ItemIndex = 0 then
      result := 'Goal Seeking Result For Net Profit'
    else
      Result := 'Goal Seeking Result For Cash Change';
    end;
  if aFieldName = 'DriverName' then
    Result := DriverNames[UWIRecPtr.Drivername];
  if (aFieldName = 'Basevalue') then
    begin
    if (UWIRecPtr.BaseValue <> 0) then
     begin
      if UWIRecPtr.ValueType = vtCurrency0 then
        Result := CurrToStrF(UWIRecPtr.BaseValue, ffCurrency, 0);
      if UWIRecPtr.ValueType = vtCurrency1 then
        Result := CurrToStrF(UWIRecPtr.BaseValue, ffCurrency, 1);
      if UWIRecPtr.ValueType = vtCurrency2 then
        Result := CurrToStrF(UWIRecPtr.BaseValue, ffCurrency, 2);
      if UWIRecPtr.ValueType = vtNumeric0 then
        Result := CurrToStrF(UWIRecPtr.BaseValue, ffNumber, 0);
      if UWIRecPtr.ValueType = vtNumeric1 then
        Result := CurrToStrF(UWIRecPtr.BaseValue, ffNumber, 1);
      if UWIRecPtr.ValueType = vtNumeric2 then
        Result := CurrToStrF(UWIRecPtr.BaseValue, ffNumber, 2);
      if UWIRecPtr.ValueType = vtPercent0 then
        Result := CurrToStrF(UWIRecPtr.BaseValue, ffNumber, 0) + ' %';
      if UWIRecPtr.ValueType = vtPercent1 then
        Result := CurrToStrF(UWIRecPtr.BaseValue, ffNumber, 1) + ' %';
      if UWIRecPtr.ValueType = vtPercent2 then
        Result := CurrToStrF(UWIRecPtr.BaseValue, ffNumber, 2) + ' %';
      end
    else
      Result := '';
    end;
  if (aFieldName = 'TargetValue') then
    begin
    if (UWIRecPtr.TargetValue <> 0) then
      begin
      if UWIRecPtr.ValueType = vtCurrency0 then
        Result := CurrToStrF(UWIRecPtr.TargetValue, ffCurrency, 0);
      if UWIRecPtr.ValueType = vtCurrency1 then
        Result := CurrToStrF(UWIRecPtr.TargetValue, ffCurrency, 1);
      if UWIRecPtr.ValueType = vtCurrency2 then
        Result := CurrToStrF(UWIRecPtr.TargetValue, ffCurrency, 2);
      if UWIRecPtr.ValueType = vtNumeric0 then
        Result := CurrToStrF(UWIRecPtr.TargetValue, ffNumber, 0);
      if UWIRecPtr.ValueType = vtNumeric1 then
        Result := CurrToStrF(UWIRecPtr.TargetValue, ffNumber, 1);
      if UWIRecPtr.ValueType = vtNumeric2 then
        Result := CurrToStrF(UWIRecPtr.TargetValue, ffNumber, 2);
      if UWIRecPtr.ValueType = vtPercent0 then
        Result := CurrToStrF(UWIRecPtr.TargetValue, ffNumber, 0) + ' %';
      if UWIRecPtr.ValueType = vtPercent1 then
        Result := CurrToStrF(UWIRecPtr.TargetValue, ffNumber, 1) + ' %';
      if UWIRecPtr.ValueType = vtPercent2 then
        Result := CurrToStrF(UWIRecPtr.TargetValue, ffNumber, 2) + ' %';
      end
    else
      Result := '';
    end;
  if aFieldName = 'PCChange' then
    Result := UWIRecPtr.PCChange;
  if aFieldName = 'NPResult' then
    Result := UWIRecPtr.NPResult;
  if aFieldName = 'CashResult' then
    Result := UWIRecPtr.CashResult;
  if aFieldName = 'CalcCount' then
    Result := UWIRecPtr.Cycles;
end;

procedure TUltimatewhatifF.cxButton1Click(Sender: TObject);
begin
  if not GoalSeekRB.Checked then
    BuildManualReportList;
  if ReportList.Count = 0 then
    exit;
  ppJITBasePipe.RecordCount := ReportList.Count;
  if GoalSeekRB.Checked then
    begin
		ppGoalSeekReport.PrinterSetup.DocumentName := DataModuleClient.BusinessDetailsBusiness_Name.AsString + ' - Ultimate What If (Goal Seek).pdf';
    ppGoalSeekReport.TextFileName := GGlobals.Basedir + 'Reports\' + ppGoalSeekReport.PrinterSetup.DocumentName;
    ppGoalSeekReport.PreviewFormSettings.WindowState := wsMaximized;
    ppGoalSeekReport.Print;
    end
  else
    begin
		ppManualReport.PrinterSetup.DocumentName := DataModuleClient.BusinessDetailsBusiness_Name.AsString + ' - Ultimate What If (Manual).pdf';
    ppManualReport.TextFileName := GGlobals.Basedir + 'Reports\' + ppManualReport.PrinterSetup.DocumentName;
    ppManualReport.PreviewFormSettings.WindowState := wsMaximized;
    ppManualReport.Print;
    end;
end;

procedure TUltimatewhatifF.SetDriverNames;
begin
  DriverNames[DR_PRICE] := 'Price';
  DriverNames[DR_COSTS] := 'Stock & Materials Costs';
  if DataModuleClient.Departments.RecordCount = 1 then
    begin
		DriverNames[DR_AVESALE] := 'Sales per ' + DataModuleClient.DepartmentsSINGULAR_UNITDESC.AsString;
		DriverNames[DR_AVEGP] := 'Gross Profit per ' + DataModuleClient.DepartmentsSINGULAR_UNITDESC.AsString;
		DriverNames[DR_BILLED] := 'Billed ' + DataModuleClient.DepartmentsPLURAL_UNITDESC.AsString;
    end
  else
    begin
    DriverNames[DR_AVESALE] := 'Sales per Unit';
    DriverNames[DR_AVEGP] := 'Gross Profit per Unit';
    DriverNames[DR_BILLED] := 'Billed Units';
    end;
  DriverNames[DR_PRODUCTIVITY] := 'Productivity';
  DriverNames[DR_ARDAYS] := 'Accounts Receivable Days';
  if DataCollect.GetUserOption(OUSESTOCKDAYS, UOInteger) <> 0 then
    DriverNames[DR_STOCK] := 'Stock Days'
  else
    DriverNames[DR_STOCK] := 'Stockturns';
  DriverNames[DR_APDAYS] := 'Accounts Payable Days';
  DriverNames[DR_AEDAYS] := 'Accrued Expenses Days';
end;

procedure TUltimatewhatifF.SetDriverBases;
begin
  DriverBase[DR_PRICE] := PriceSpin.Value;
  DriverBase[DR_COSTS] := PurchaseSpin.value;
  DriverBase[DR_AVESALE] := AveSaleUnitSpin.value;
  DriverBase[DR_AVEGP] := AveGPUnitSpin.Value;
  DriverBase[DR_BILLED] := BilledSpin.value;
  DriverBase[DR_PRODUCTIVITY] := ProductivitySpin.Value;
  DriverBase[DR_ARDAYS] := ARDaysSpin.Value;
  DriverBase[DR_STOCK] := StockDaysSpin.Value;
  DriverBase[DR_APDAYS] := APDaysSpin.Value;
  DriverBase[DR_AEDAYS] := AEDaysSpin.Value;
end;

procedure TUltimatewhatifF.BuildManualReportList;
begin
  GSResultsRTF.Lines.Clear;
  if ReportList.Count > 0 then
    ClearReportList;
  if DriverBase[DR_PRICE] <> PriceSpin.Value then
    begin
    new(UWIRecPtr);
    UWIRecPtr.Drivername := DR_PRICE;
    UWIRecPtr.IsCashTarget := True;
    UWIRecPtr.BaseValue := 0;
    UWIRecPtr.TargetValue := 0;
    UWIRecPtr.ValueType := vtPercent2;
    UWIRecPtr.PCChange := PriceSpin.Value;
    ReportList.Add(UWIRecPtr);
    end;
  if DriverBase[DR_COSTS] <> PurchaseSpin.value then
    begin
    new(UWIRecPtr);
    UWIRecPtr.Drivername := DR_COSTS;
    UWIRecPtr.IsCashTarget := True;
    UWIRecPtr.BaseValue := 0;
    UWIRecPtr.TargetValue := 0;
    UWIRecPtr.ValueType := vtPercent2;
    UWIRecPtr.PCChange := PurchaseSpin.Value;
    ReportList.Add(UWIRecPtr);
    end;
  if DriverBase[DR_AVESALE] <> AveSaleUnitSpin.value then
    begin
    new(UWIRecPtr);
    UWIRecPtr.Drivername := DR_AVESALE;
    UWIRecPtr.IsCashTarget := True;
    UWIRecPtr.ValueType := vtCurrency2;
    UWIRecPtr.BaseValue := DriverBase[DR_AVESALE];
    UWIRecPtr.TargetValue := AveSaleUnitSpin.Value;
    UWIRecPtr.PCChange := Round(((AveSaleUnitSpin.Value - DriverBase[DR_AVESALE]) * 100 / DriverBase[DR_AVESALE]) * 100) / 100;
    ReportList.Add(UWIRecPtr);
    end;
  if DriverBase[DR_AVEGP] <> AveGPUnitSpin.Value then
    begin
    new(UWIRecPtr);
    UWIRecPtr.Drivername := DR_AVEGP;
    UWIRecPtr.IsCashTarget := True;
    UWIRecPtr.ValueType := vtCurrency2;
    UWIRecPtr.BaseValue := DriverBase[DR_AVEGP];
    UWIRecPtr.TargetValue := AveGPUnitSpin.Value;
    UWIRecPtr.PCChange := Round(((AveGPUnitSpin.Value - DriverBase[DR_AVEGP]) * 100 / DriverBase[DR_AVEGP]) * 100) / 100;
    ReportList.Add(UWIRecPtr);
    end;
  if DriverBase[DR_BILLED] <> BilledSpin.value then
    begin
    new(UWIRecPtr);
    UWIRecPtr.Drivername := DR_BILLED;
    UWIRecPtr.IsCashTarget := True;
    UWIRecPtr.ValueType := vtNumeric1;
    UWIRecPtr.BaseValue := DriverBase[DR_BILLED];
    UWIRecPtr.TargetValue := BilledSpin.Value;
    UWIRecPtr.PCChange := Round(((BilledSpin.Value - DriverBase[DR_BILLED]) * 100 / DriverBase[DR_BILLED]) * 100) / 100;
    ReportList.Add(UWIRecPtr);
    end;
  if DriverBase[DR_PRODUCTIVITY] <> ProductivitySpin.Value then
    begin
    new(UWIRecPtr);
    UWIRecPtr.Drivername := DR_PRODUCTIVITY;
    UWIRecPtr.IsCashTarget := True;
    UWIRecPtr.ValueType := vtPercent2;
    UWIRecPtr.BaseValue := DriverBase[DR_PRODUCTIVITY];
    UWIRecPtr.TargetValue := ProductivitySpin.Value;
    UWIRecPtr.PCChange := Round(((ProductivitySpin.Value - DriverBase[DR_PRODUCTIVITY]) * 100 / DriverBase[DR_PRODUCTIVITY]) * 100) / 100;
    ReportList.Add(UWIRecPtr);
    end;
  if DriverBase[DR_ARDAYS] <> ARDaysSpin.Value then
    begin
    new(UWIRecPtr);
    UWIRecPtr.Drivername := DR_ARDAYS;
    UWIRecPtr.IsCashTarget := True;
    UWIRecPtr.ValueType := vtNumeric1;
    UWIRecPtr.BaseValue := DriverBase[DR_ARDAYS];
    UWIRecPtr.TargetValue := ARDaysSpin.Value;
    UWIRecPtr.PCChange := Round(((ARDaysSpin.Value - DriverBase[DR_ARDAYS]) * 100 / DriverBase[DR_ARDAYS]) * 100) / 100;
    ReportList.Add(UWIRecPtr);
    end;
  if DriverBase[DR_STOCK] <> StockDaysSpin.Value then
    begin
    new(UWIRecPtr);
    UWIRecPtr.Drivername := DR_STOCK;
    UWIRecPtr.IsCashTarget := True;
    UWIRecPtr.ValueType := vtNumeric1;
    UWIRecPtr.BaseValue := DriverBase[DR_STOCK];
    UWIRecPtr.TargetValue := StockDaysSpin.Value;
    UWIRecPtr.PCChange := Round(((StockDaysSpin.Value - DriverBase[DR_STOCK]) * 100 / DriverBase[DR_STOCK]) * 100) / 100;
    ReportList.Add(UWIRecPtr);
    end;
  if DriverBase[DR_APDAYS] <> APDaysSpin.Value then
    begin
    new(UWIRecPtr);
    UWIRecPtr.Drivername := DR_APDAYS;
    UWIRecPtr.IsCashTarget := True;
    UWIRecPtr.ValueType := vtNumeric1;
    UWIRecPtr.BaseValue := DriverBase[DR_APDAYS];
    UWIRecPtr.TargetValue := APDaysSpin.Value;
    UWIRecPtr.PCChange := Round(((APDaysSpin.Value - DriverBase[DR_APDAYS]) * 100 / DriverBase[DR_APDAYS]) * 100) / 100;
    ReportList.Add(UWIRecPtr);
    end;
  if DriverBase[DR_AEDAYS] <> AEDaysSpin.Value then
    begin
    new(UWIRecPtr);
    UWIRecPtr.Drivername := DR_AEDAYS;
    UWIRecPtr.IsCashTarget := True;
    UWIRecPtr.ValueType := vtNumeric1;
    UWIRecPtr.BaseValue := DriverBase[DR_AEDAYS];
    UWIRecPtr.TargetValue := AEDaysSpin.Value;
    UWIRecPtr.PCChange := Round(((AEDaysSpin.Value - DriverBase[DR_AEDAYS]) * 100 / DriverBase[DR_AEDAYS]) * 100) / 100;
    ReportList.Add(UWIRecPtr);
    end;
end;

procedure TUltimatewhatifF.PopupPrintChartClick(Sender: TObject);
begin
  ChartPreviewer1.Execute;
end;

procedure TUltimatewhatifF.PopupExportChartClick(Sender: TObject);
begin
//  TeePlaceWatermark := True;
//  TeeExport(self, Chart1);
end;

end.

