unit PNLWhatIf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DMrep1U, LGlobals, StdCtrls, DataCollector, DMClient, auchtypes,
  cxTextEdit, cxDBEdit, cxControls, PastPeriodSelection,
  cxContainer, cxEdit, cxLabel, cxRadioGroup, cxMaskEdit, cxSpinEdit,
  cxSpinButton, cxCurrencyEdit, cxButtons, ExtCtrls, DetailExpenses,
  cxGroupBox, cxDBLabel, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinXmas2008Blue, Menus, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint;

type
  TPNLWhatIfF = class(TForm)
    Label73: TcxLabel;
    Label81: TcxLabel;
    Label58: TcxLabel;
    Label59: TcxLabel;
    Label60: TcxLabel;
    Label61: TcxLabel;
    Label63: TcxLabel;
    Label62: TcxLabel;
    Label82: TcxLabel;
    Label83: TcxLabel;
    Label64: TcxLabel;
    Label65: TcxLabel;
    Label66: TcxLabel;
    Label67: TcxLabel;
    Label68: TcxLabel;
    Label85: TcxLabel;
    Label84: TcxLabel;
    RGBase: TcxRadioGroup;
    RGScene: TcxRadioGroup;
    WIScenGPPC: TcxCurrencyEdit;
    WIScenGPPCSpin: TcxSpinButton;
    WIBaseSales: TcxCurrencyEdit;
    WIBaseGP: TcxCurrencyEdit;
    WIBaseGPPC: TcxCurrencyEdit;
    WIBaseSalesUnit: TcxCurrencyEdit;
    WIBaseGPUnit: TcxCurrencyEdit;
    WIBaseBilled: TcxCurrencyEdit;
    WIBasePotential: TcxCurrencyEdit;
    WIBaseProductivity: TcxCurrencyEdit;
    WIBaseTotalExp: TcxCurrencyEdit;
    WIBaseNetProfit: TcxCurrencyEdit;
    WIScenSales: TcxCurrencyEdit;
    WIScenGP: TcxCurrencyEdit;
    WIScenTotalExp: TcxCurrencyEdit;
    WIScenNetProfit: TcxCurrencyEdit;
    WIChangeSales: TcxCurrencyEdit;
    WIChangeGP: TcxCurrencyEdit;
    WIScenSalesUnit: TcxCurrencyEdit;
    WIScenSalesUnitSpin: TcxSpinButton;
    WIScenGPUnit: TcxCurrencyEdit;
    WIScenGPUnitSpin: TcxSpinButton;
    WIScenBilled: TcxCurrencyEdit;
    WIScenBilledSpin: TcxSpinButton;
    WIScenPotential: TcxCurrencyEdit;
    WIScenPotentialSpin: TcxSpinButton;
    WIScenProductivity: TcxCurrencyEdit;
    WIScenProductivitySpin: TcxSpinButton;
    WIChangeGPPC: TcxCurrencyEdit;
    WIChangeGPPCSpin: TcxSpinButton;
    WIChangeSalesUnit: TcxCurrencyEdit;
    WIChangeSalesUnitSpin: TcxSpinButton;
    WIChangeGPUnit: TcxCurrencyEdit;
    WIChangeGPUnitSpin: TcxSpinButton;
    WIChangeBilled: TcxCurrencyEdit;
    WIChangeBilledSpin: TcxSpinButton;
    WIChangePotential: TcxCurrencyEdit;
    WIChangePotentialSpin: TcxSpinButton;
    WIChangeProductivity: TcxCurrencyEdit;
    WIChangeProductivitySpin: TcxSpinButton;
    ResetBtn: TcxButton;
    ApplyToTargetsBtn: TcxButton;
    TargetExpensesBtn: TcxButton;
    CloseBtn: TcxButton;
    HourspdLblWI: TcxLabel;
    PeriodDatesLbl: TcxLabel;
    cxButton3: TcxButton;
    PriceChange: TcxCurrencyEdit;
    CostChange: TcxCurrencyEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    PriceChangeSpin: TcxSpinButton;
    CostChangeSpin: TcxSpinButton;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel14: TcxLabel;
    cxDBLabel3: TcxDBLabel;
    cxDBLabel4: TcxDBLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RGBaseClick(Sender: TObject);
    procedure RGSceneClick(Sender: TObject);
    procedure ResetBtnClick(Sender: TObject);
    procedure ApplyToTargetsBtnClick(Sender: TObject);
    procedure TargetExpensesBtnClick(Sender: TObject);
    procedure WIScenGPPCPropertiesChange(Sender: TObject);
    procedure WIChangeGPPCPropertiesChange(Sender: TObject);
    procedure WIScenSalesUnitPropertiesChange(Sender: TObject);
    procedure WIChangeSalesUnitPropertiesChange(Sender: TObject);
    procedure WIScenGPUnitPropertiesChange(Sender: TObject);
    procedure WIChangeGPUnitPropertiesChange(Sender: TObject);
    procedure WIScenBilledPropertiesChange(Sender: TObject);
    procedure WIChangeBilledPropertiesChange(Sender: TObject);
    procedure WIScenPotentialPropertiesChange(Sender: TObject);
    procedure WIChangePotentialPropertiesChange(Sender: TObject);
    procedure WIScenProductivityPropertiesChange(Sender: TObject);
    procedure WIChangeProductivityPropertiesChange(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
//    procedure WIScenGPPCSpinMouseDown(Sender: TObject;
//      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure cxButton3Click(Sender: TObject);
    procedure WIScenGPPCSpinPropertiesEditValueChanged(Sender: TObject);
    procedure WIScenSalesUnitSpinPropertiesEditValueChanged(
      Sender: TObject);
    procedure WIScenGPUnitSpinPropertiesEditValueChanged(Sender: TObject);
    procedure WIScenBilledSpinPropertiesEditValueChanged(Sender: TObject);
    procedure WIScenPotentialSpinPropertiesEditValueChanged(
      Sender: TObject);
    procedure WIScenProductivitySpinPropertiesEditValueChanged(
      Sender: TObject);
    procedure WIChangeGPPCSpinPropertiesEditValueChanged(Sender: TObject);
    procedure WIChangeSalesUnitSpinPropertiesEditValueChanged(
      Sender: TObject);
    procedure WIChangeGPUnitSpinPropertiesEditValueChanged(
      Sender: TObject);
    procedure WIChangeBilledSpinPropertiesEditValueChanged(
      Sender: TObject);
    procedure WIChangePotentialSpinPropertiesEditValueChanged(
      Sender: TObject);
    procedure WIChangeProductivitySpinPropertiesEditValueChanged(
      Sender: TObject);
    procedure PriceChangePropertiesEditValueChanged(Sender: TObject);
    procedure PriceChangeSpinPropertiesEditValueChanged(Sender: TObject);
    procedure CostChangePropertiesEditValueChanged(Sender: TObject);
    procedure cxSpinButton1PropertiesEditValueChanged(Sender: TObject);
    procedure WIScenSalesUnitEnter(Sender: TObject);
  private
    { Private declarations }
    CurrentScene: Integer;
    WhatifUpdate: boolean;
    isPriceMode : Boolean;
    PriceChangeAmount, CostChangeAmount : Currency;
    procedure WhatIfCalc(Account : integer);
    procedure setlabels2;
    procedure getBase;
    procedure PriceMode(Value : Boolean);
  public
    { Public declarations }
  end;

var
  PNLWhatIfF: TPNLWhatIfF;

implementation

{$R *.dfm}

procedure TPNLWhatIfF.FormCreate(Sender: TObject);
var
  J : integer;
begin
//  Color := GGLobals.FormColour;
  DMrep1.TariButtonList.GetImage(0, CloseBtn.Glyph);
  if DataModuleClient.DateRangers.RecordCount < 2 then
    cxButton3.Visible := False;
  FindPastDate;
  DataCollect.GetConsolidatedList(DataModuleClient.DepartmentsDEPT_ID.Value, ctNormal);
  if DataCollect.Planloaded = false then
    Begin
    DataCollect.psdate := DataModuleClient.DepartmentsCurrentPlanStart.value;
    DataCollect.pedate := DataModuleClient.DepartmentsCurrentPlanEnd.value;
    DataCollect.getPlanningData;
    end;

  GGlobals.DebugOut('PNL What If');
  CxLabel4.Caption := 'Targeting - What If Scenarios';
  setlabels2;

  // if we have a past balance use it
  WIScenTotalExp.Value := round(getListPlanBalance(getaccountlistindex(TOTALEXPENSES)));
  if WIScenTotalExp.Value = 0 then
    WIScenTotalExp.Value := round(getListPastBalance(getaccountlistindex(TOTALEXPENSES)));

  WIBaseTotalExp.Value := WIScenTotalExp.value;
  PricechangeAmount := 0;
  CostChangeAmount := 0;
  PriceChange.Value := 0;
  CostChange.Value := 0;
  PriceChangeSpin.Value := 0;
  CostChangeSpin.Value := 0;
  if DataModuleClient.DateRangers.RecordCount > 0 then
    begin
    RGBase.ItemIndex := 0;
//    TargetExpensesBtn.Visible := True;
    end
  else
    begin
    RGBase.ItemIndex := 1;
//    TargetExpensesBtn.Visible := False;
    end;
  // get and Set Base Balances
  getbase;
  // Set Scenario 1,2,3 from base if no balances exist.
  for j := 1 to 3 do    // Iterate
    begin
    if GetWIBalance(j, WISales) = 0 then
      begin
      SetWIBalance(J, WISales, GetWIBalance(WIBase, WISALES));
      SetWIBalance(J, WIGP, GetWIBalance(WIBase, WIGP));
      SetWIBalance(J, WIPOTENTIAL, GetWIBalance(WIBase, WIPOTENTIAL));
      SetWIBalance(J, WIBILLED, GetWIBalance(WIBase, WIBILLED));
      end;
    end;    // for
  // Set the Current Scenario
  CurrentScene := 1;
  RGScene.ItemIndex := CurrentScene - 1;

  // calculate results
  WhatIfCalc(WISALES);
  if (WIChangeSales.Value = 0) and (WIChangeGP.Value = 0) then
    PriceMode(True)
  else
    PriceMode(False);
end;

procedure TPNLWhatIfF.WhatIfCalc(Account : integer);
var
  j: integer;
//  TempBal: Currency;
  HoursMins : Currency;
  Laccount: Integer;
begin
  WhatIfUpdate := False;
  Laccount := Account;
  //
  if account > WIPROD then // A Percentage change has occurred
    begin
    if GetWIBalance(CurrentScene, Account) <> 0 then
      SetWIBalance(CurrentScene, Account - 10, GetWIBalance(WIBase, Account - 10) * (getWIBalance(CurrentScene, Account) + 100) / 100)
    else
      SetWIBalance(CurrentScene, Account - 10, GetWIBalance(WIBase, Account - 10));
    Laccount := Account - 10;
    end;
  // Use Laccount ONLY from now on
  if (Laccount = WIPOTENTIAL) or (Laccount = WIPROD) then
    begin
    if (GetWIbalance(CurrentScene, WIPotential) <> 0) and (GetWIBalance(CurrentScene, WIPROD) <> 0) then
      begin
      SetWIBalance(CurrentScene, WIBILLED, GetWIBalance(CurrentScene, WIPOTENTIAL) * GetWIBalance(CurrentScene, WIPROD) / 100);
      If GGlobals.unitRounding = 0 then
        begin
        SetWIBalance(CurrentScene, WIBILLED, round(GetWIBalance(CurrentScene, WIBILLED)));
        SetWIBalance(CurrentScene, WIPOTENTIAL, round(GetWIBalance(CurrentScene, WIPOTENTIAL)));
        end;
      end;
    if GetWIbalance(CurrentScene, WIPotential) = 0 then
      SetWIBalance(CurrentScene, WIPROD, 0);
    Laccount := WIGPU; // fall through to GPU
    end;
  // store the value of COGS
//  TempBal := GetWIBalance(CurrentScene, WISALES) - GetWIBalance(CurrentScene, WIGP);
  if (Laccount = WIGPU) or (Laccount = WIBILLED) then
    begin
    SetWIBalance(CurrentScene, WIGP, GetWIBalance(CurrentScene, WIBILLED) * GetWIBalance(CurrentScene, WIGPU));
//    if (Laccount = WIBilled) {or (RGSales.Itemindex = 1)} then
//      begin
      if GetWIBalance(CurrentScene, WIGPPC) <> 0 then
        SetWIBalance(CurrentScene, WISales, GetWIBalance(CurrentScene, WIGP) * 100 / GetWIBalance(CurrentScene, WIGPPC));
//      end
//    else
//      begin
//      SetWIBalance(CurrentScene, WISales, GetWIBalance(CurrentScene, WIGP) + tempbal);
//      if GetWIBalance(CurrentScene, WISales) <> 0 then
//        SetWIBalance(CurrentScene, WIGPPC, GetWIBalance(CurrentScene, WIGP) * 100 / GetWIBalance(CurrentScene, WISales));
//      end;
    end;
  if Laccount = WISU then
    begin
    SetWIBalance(CurrentScene, WISales, GetWIBalance(CurrentScene, WIBILLED) * GetWIBalance(CurrentScene, WISU));
//    if (RGSales.Itemindex = 1) then
      SetWIBalance(CurrentScene, WIGP, GetWIBalance(CurrentScene, WISALES) * GetWIBalance(CurrentScene, WIGPPC) / 100);
//    else
//      begin
//      SetWIBalance(CurrentScene, WIGP, GetWIBalance(CurrentScene, WISales) - tempbal);
//      if GetWIBalance(CurrentScene, WISales) <> 0 then
//        SetWIBalance(CurrentScene, WIGPPC, GetWIBalance(CurrentScene, WIGP) * 100 / GetWIBalance(CurrentScene, WISales));
//      end;
    end;
  if Laccount = WIGPPC then
    begin
//    if (RGSales.Itemindex = 1) then
//      begin
      if GetWIBalance(CurrentScene, WIGPPC) <> 0 then
        SetWIBalance(CurrentScene, WISales, GetWIBalance(CurrentScene, WIGP) * 100 / GetWIBalance(CurrentScene, WIGPPC));
//      end
//    else
//      SetWIBalance(CurrentScene, WIGP, GetWIBalance(CurrentScene, WISALES) * GetWIBalance(CurrentScene, WIGPPC) / 100);
    end;
  // Calculate 4 ratios
  if GetWIBalance(CurrentScene, WISales) <> 0 then
    SetWIBalance(CurrentScene, WIGPPC, GetWIBalance(CurrentScene, WIGP) * 100 / GetWIBalance(CurrentScene, WISales));
  if GetWIBalance(CurrentScene, WIBilled) <> 0 then
    SetWIBalance(CurrentScene, WISU, GetWIBalance(CurrentScene, WISales) / GetWIBalance(CurrentScene, WIBilled));
  if GetWIBalance(CurrentScene, WIBilled) <> 0 then
    SetWIBalance(CurrentScene, WIGPU, GetWIBalance(CurrentScene, WIGP) / GetWIBalance(CurrentScene, WIBilled));
  if GetWIBalance(CurrentScene, WIPotential) <> 0 then
    SetWIBalance(CurrentScene, WIPROD, GetWIBalance(CurrentScene, WIBilled) * 100 / GetWIBalance(CurrentScene, WIPotential));

  WIScenSales.value := Round(GetWIBalance(CurrentScene, WISales));
  WIScenGP.Value := round(GetWIBalance(CurrentScene, WIGP));
  WIScenPotential.Value := Round(GetWIBalance(CurrentScene, WIPotential) * 100) / 100;

  WIScenBilled.Value := Round(GetWIBalance(CurrentScene, WIBilled) * 100) / 100;

  WIScenGPPC.Value := round(getWIBalance(CurrentScene, WIGPPC) * 100) / 100;
  PriceChange.Value := PriceChangeAmount;
  CostChange.Value := CostChangeAmount;
  WIScenSalesUnit.Value := Round(getWIBalance(CurrentScene, WISU) * 100) / 100;
  WIScenGPUnit.Value := round(getWIBalance(CurrentScene, WIGPU) * 100) / 100;
  WIScenProductivity.Value := Round(getWIBalance(CurrentScene, WIPROD) * 100) / 100;

  WIScenSales.value := WIScenSales.value;
  WIScenGP.Value := WIScenGP.Value;
  WIScenPotentialSpin.Value := WIScenPotential.Value;

  WIScenBilledSpin.Value := WIScenBilled.Value;

  WIScenGPPCSpin.Value := WIScenGPPC.Value;
  PriceChangeSpin.Value := PriceChange.Value;
  CostChangeSpin.Value := CostChange.Value;
  WIScenSalesUnitSpin.Value := WIScenSalesUnit.Value;
  WIScenGPUnitSpin.Value := WIScenGPUnit.Value;
  WIScenProductivitySpin.Value := WIScenProductivity.Value;

  if (DataModuleClient.DepartmentsSINGULAR_UNITDESC.Value = 'Hour')
    and (WIScenProductivity.value > 0)
    and (WIScenProductivity.value < 100) then
    begin
    Hoursmins := 8 * WIScenProductivity.value / 100;
    HourspdLblWI.caption := 'Productive Hours per day = ' + inttostr(trunc(hoursmins)) + 'hr ' + inttostr(trunc(Hoursmins * 60) mod 60) + 'mins';
    end
  else
    HourspdLblWI.Caption := ' ';
  HourspdlblWI.Refresh;
  WIScenNetProfit.Value := round(GetWIBalance(CurrentScene, WIGP)) - WIScenTotalExp.Value;
  if WIScenNetProfit.Value >= 0 then
    WIScenNetProfit.Style.Color := $02EEFFAA
  else
    WIScenNetProfit.Style.Color := clRed;

  // Calculculate pc change
  for j := 10 to 17 do    // Iterate
    begin
    if getWIBalance(WIBase, j - 10) <> 0 then
      SetWIBalance(CurrentScene, J, (GetWIBalance(CurrentScene, j - 10) * 100 / GetWIBalance(WIBase, J - 10)) - 100)
    else
      SetWIBalance(CurrentScene, J, 0);
    end;
      // for
  WIChangeSales.value := GetWIBalance(CurrentScene, WISalesPCI);
  WIChangeGP.Value := GetWIBalance(CurrentScene, WIGPPCI);
  WIChangePotential.Value := Round(GetWIBalance(CurrentScene, WIPotentialPCI));
  WIChangeBilled.Value := Round(GetWIBalance(CurrentScene, WIBilledPCI) * 100) / 100;

  WIChangeGPPC.Value := Round(getWIBalance(CurrentScene, WIGPPCPCI) * 100) / 100;
  WIChangeSalesUnit.Value := Round(getWIBalance(CurrentScene, WISUPCI) * 100) / 100;
  WIChangeGPUnit.Value := Round(getWIBalance(CurrentScene, WIGPUPCI) * 100) / 100;
  WIChangeProductivity.Value := Round(getWIBalance(CurrentScene, WIPRODPCI) * 100) / 100;
  WhatIfUpdate := True;
end;



procedure TPNLWhatIfF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DataCollect.Planloaded = True then
    DataCollect.setPlanningData;
  DataCollect.ClearPlanDataList;
  DataCollect.ClearConsolidatedList;
//  Action := caFree;
  Close;
end;

procedure TPNLWhatIfF.setlabels2;
begin
  Label60.Caption := 'Gross Profit';
	Label63.Caption := 'Sales per ' + DataModuleClient.DepartmentsSINGULAR_UNITDESC.AsString;
	Label62.Caption := 'Gross Profit per ' + DataModuleClient.DepartmentsSINGULAR_UNITDESC.AsString + ' (TARI)';
	Label64.Caption := 'Billed ' + DataModuleClient.DepartmentsPLURAL_UNITDESC.AsString;
	Label65.Caption := 'Potential ' + DataModuleClient.DepartmentsPLURAL_UNITDESC.AsString;
  Label66.Caption := 'Activity Level (Productivity %)';
  if DataModuleClient.DepartmentsPLURAL_UNITDESC.Value = 'Hours' then
    begin
		Label65.Caption := 'Potential ' + DataModuleClient.DepartmentsPLURAL_UNITDESC.AsString + ' available to be sold';
    end;
end;

procedure TPNLWhatIfF.getBase;
var
  OldFormat : string;
begin
  if RGBase.itemindex  = 0 then
    begin
    OldFormat := DataModuleClient.DateRangersSTARTDATE.DisplayFormat;
    DataModuleClient.DateRangersSTARTDATE.DisplayFormat := GGlobals.GetDateFENH;
    DataModuleClient.DateRangersENDDATE.DisplayFormat := GGlobals.GetDateFENH;
    PeriodDatesLbl.Caption := DataModuleClient.DateRangersSTARTDATE.DisplayText + ' to ' + DataModuleClient.DateRangersENDDATE.DisplayText;
    DataModuleClient.DateRangersSTARTDATE.DisplayFormat := OldFormat;
    DataModuleClient.DateRangersENDDATE.DisplayFormat := OldFormat;
    SetWIBalance(WIBase, WISales, getListPastBalance(getaccountlistindex(SALES)));
    SetWIBalance(WIBase, WIGP, getListPastBalance(getaccountlistindex(GROSSPROFIT)));
    SetWIBalance(WIBase, WIPotential, getListPastBalance(getaccountlistindex(POTENTIAL)));
    SetWIBalance(WIBase, WIBilled, getListPastBalance(getaccountlistindex(BILLED)));
    WIBaseTotalExp.Value := getListPastBalance(getaccountlistindex(TOTALEXPENSES));
    end
  else
    begin
    OldFormat := DataModuleClient.DepartmentsCURRENTPLANSTART.DisplayFormat;
    DataModuleClient.DepartmentsCURRENTPLANSTART.DisplayFormat := GGlobals.GetDateFENH;
    DataModuleClient.DepartmentsCURRENTPLANEND.DisplayFormat := GGlobals.GetDateFENH;
    PeriodDatesLbl.Caption := DataModuleClient.DepartmentsCURRENTPLANSTART.DisplayText + ' to ' + DataModuleClient.DepartmentsCURRENTPLANEND.DisplayText;
    DataModuleClient.DepartmentsCURRENTPLANSTART.DisplayFormat := OldFormat;
    DataModuleClient.DepartmentsCURRENTPLANEND.DisplayFormat := OldFormat;
    SetWIBalance(WIBase, WISales, getListPlanBalance(getaccountlistindex(SALES)));
    SetWIBalance(WIBase, WIGP, getListPlanBalance(getaccountlistindex(GROSSPROFIT)));
    SetWIBalance(WIBase, WIPotential, getListPlanBalance(getaccountlistindex(POTENTIAL)));
    SetWIBalance(WIBase, WIBilled, getListPlanBalance(getaccountlistindex(BILLED)));
    WIBaseTotalExp.Value := getListPlanBalance(getaccountlistindex(TOTALEXPENSES));
    end;
  PeriodDatesLbl.Refresh;
  WIBaseSales.value := GetWIBalance(WIBase, WISales);
  WIBaseGP.Value := GetWIBalance(WIBase, WIGP);
  WIBasePotential.Value := GetWIBalance(WIBase, WIPotential);
  WIBaseBilled.Value := GetWIBalance(WIBase, WIBilled);

  if GetWIBalance(WIBase, WISales) <> 0 then
    SetWIBalance(WIBASE, WIGPPC, GetWIBalance(WIBase, WIGP) * 100 / GetWIBalance(WIBase, WISales))
  else
    SetWIBalance(WIBASE, WIGPPC, 0);
  if GetWIBalance(WIBase, WIBilled) <> 0 then
    SetWIBalance(WIBASE, WISU, GetWIBalance(WIBase, WISales) / GetWIBalance(WIBase, WIBilled))
  else
    SetWIBalance(WIBASE, WISU, 0);
  if GetWIBalance(WIBase, WIBilled) <> 0 then
    SetWIBalance(WIBASE, WIGPU, GetWIBalance(WIBase, WIGP) / GetWIBalance(WIBase, WIBilled))
  else
    SetWIBalance(WIBASE, WIGPU, 0);
  if GetWIBalance(WIBase, WIPotential) <> 0 then
    SetWIBalance(WIBASE, WIPROD, GetWIBalance(WIBase, WIBilled) * 100 / GetWIBalance(WIBase, WIPotential))
  else
    SetWIBalance(WIBASE, WIPROD, 0);
  WIBaseGPPC.Value := getWIBalance(WIBASE, WIGPPC);
  WIBaseSalesUnit.Value := getWIBalance(WIBASE, WISU);
  WIBaseGPUnit.Value := getWIBalance(WIBASE, WIGPU);
  WIBaseProductivity.Value := getWIBalance(WIBASE, WIPROD);
  WIBaseNetProfit.Value := GetWIBalance(WIBase, WIGP) - WIBaseTotalExp.Value;
  if WIBaseNetProfit.Value >= 0 then
    WIBaseNetProfit.Style.Color := $02EEFFAA
  else
    WIBaseNetProfit.Style.Color := clRed;
end;

procedure TPNLWhatIfF.RGBaseClick(Sender: TObject);
begin
//  if DataModuleClient.DateRangers.RecordCount > 1 then
//    begin
//    Application.CreateForm(TPastPeriodSelectionF, PastPeriodSelectionF);
//    PastPeriodSelectionF.ShowModal;
//    PastPeriodSelectionF.Free;
//    end;
  getbase;
  WhatIfCalc(WISALES);
end;

procedure TPNLWhatIfF.RGSceneClick(Sender: TObject);
begin
  CurrentScene := RGScene.itemIndex + 1;
  WhatIfCalc(WISALES);
end;

procedure TPNLWhatIfF.ResetBtnClick(Sender: TObject);
begin
  GGlobals.DebugOut('PNLWhatIF: Reset');
  SetWIBalance(CurrentScene, WISales, GetWIBalance(WIBase, WISALES));
  SetWIBalance(CurrentScene, WIGP, GetWIBalance(WIBase, WIGP));
  SetWIBalance(CurrentScene, WIPOTENTIAL, GetWIBalance(WIBase, WIPOTENTIAL));
  SetWIBalance(CurrentScene, WIBILLED, GetWIBalance(WIBase, WIBILLED));
  PricechangeAmount := 0;
  CostChangeAmount := 0;
  PriceChange.Value := 0;
  CostChange.Value := 0;
  PriceChangeSpin.Value := 0;
  CostChangeSpin.Value := 0;
  WhatIfCalc(WISALES);
  PriceMode(True);
end;

procedure TPNLWhatIfF.ApplyToTargetsBtnClick(Sender: TObject);
Var
  PeriodAdjustment : Currency;
  DaysPastPeriod, DaysTargetPeriod : integer;
begin
  GGlobals.DebugOut('PNL WhatIf: Apply to Targets');
  // If the Past period is not with in day in length of the Target period we adjust
  PeriodAdjustment := 1;
  if (RGBase.ItemIndex = 0) and (DataModuleClient.DateRangers.RecordCount > 0) then
    begin
    DaysPastPeriod := trunc(DataModuleClient.DateRangersENDDATE.Value - DataModuleClient.DateRangersSTARTDATE.value) + 1;
    DaysTargetPeriod := trunc(DataModuleClient.DepartmentsCURRENTPLANEND.Value - DataModuleClient.DepartmentsCURRENTPLANSTART.value) + 1;
    if ABS(DaysPastPeriod - DaysTargetPeriod) > 1 then
      PeriodAdjustment := DaysTargetPeriod / DaysPastPeriod;
    end;
  // Update or overwrite.
  if messagedlg('Do you wish to overwrite any existing Target data?' + #13#10
                + 'Press ''Yes'' button to initialise any data for the target period.' + #13#10
                + 'Press ''No'' button to simply adjust current totals.', mtinformation, [mbYes,mbNo], 0) = mrYES then
    begin
    setListPlanBalance(GetAccountListIndex(SALES), 0, True);
    setListPlanBalance(GetAccountListIndex(GROSSPROFIT), 0, True);
    setListPlanBalance(GetAccountListIndex(COGS), 0, True);
    setListPlanBalance(GetAccountListIndex(BILLED), 0, True);
    setListPlanBalance(GetAccountListIndex(POTENTIAL), 0, True);
    end;
  setListPlanBalance(GetAccountListIndex(SALES), GetWIBalance(CurrentSCene, WISales) * PeriodAdjustment, True);
  setListPlanBalance(GetAccountListIndex(GROSSPROFIT), GetWIBalance(CurrentSCene, WIGP) * PeriodAdjustment, True);
  setListPlanBalance(GetAccountListIndex(COGS), (GetWIBalance(CurrentSCene, WISALES) - GetWIBalance(CurrentSCene, WIGP)) * PeriodAdjustment, True);
  setListPlanBalance(GetAccountListIndex(BILLED), GetWIBalance(CurrentSCene, WIBilled) * PeriodAdjustment, True);
  setListPlanBalance(GetAccountListIndex(POTENTIAL), GetWIBalance(CurrentSCene, WIPotential) * PeriodAdjustment, True);
  if (getListPlanBalance(getaccountlistindex(TOTALEXPENSES)) = 0)
    and (WIScenTotalExp.value <> 0) then
    setListPlanBalance(GetAccountListIndex(TOTALEXPENSES), WIScenTotalExp.value  * PeriodAdjustment, True);
  if WIScenTotalExp.value = 0 then
    begin
    setListPlanBalance(GetAccountListIndex(TOTALEXPENSES), WIScenTotalExp.value * PeriodAdjustment, True);
    setListPlanBalance(GetAccountListIndex(NETOPERATINGPROFIT), GetWIBalance(CurrentSCene, WIGP) * PeriodAdjustment, True);
    setListPlanBalance(GetAccountListIndex(NETPROFIT), GetWIBalance(CurrentSCene, WIGP) * PeriodAdjustment, True);
    end;

  // set Total Expenses if <> Current Plan Total
  if RGBase.itemindex = 1 then
    begin
    getbase;
    WhatifCalc(WISALES);
    end;
end;

procedure TPNLWhatIfF.TargetExpensesBtnClick(Sender: TObject);
var
  idx : Integer;
  DateIdx : Variant;
begin
  DateIdx := DATAMODULECLIENT.DateRangersD_INDEX.Value;
  GGlobals.DebugOut('PNL WhatIf: Target Expenses');
  Screen.Cursor := crHourGlass;
  Application.CreateForm(TDetailExpensesF, DetailExpensesF);
  DataCollect.GetDetailedOptions(DataModuleClient.DepartmentsDEPT_ID.Value);
  Idx := strtoint(currtostr(DataCollect.detailedOptions[43]));
  if (idx < 4) or (Idx > 6) then
    idx := 4;
  DetailExpensesF.RGIndex.ItemIndex := idx;
  DATAMODULECLIENT.DateRangers.Locate('D_INDEX', DateIdx, []);
  DetailExpensesF.ShowModal;
  if DetailExpensesF.RGIndex.ItemIndex < 0 then
    DetailExpensesF.RGIndex.ItemIndex := 0;
  DataCollect.detailedOptions[43] := DetailExpensesF.RGIndex.ItemIndex;
  DetailExpensesF.Free;
  DataCollect.SetDetailedOptions(DataModuleClient.DepartmentsDEPT_ID.Value);
  WIScenTotalExp.Value := getListPlanBalance(getaccountlistindex(TOTALEXPENSES));
  WhatIfCalc(WISALES);
  screen.Cursor := crDefault;
end;

procedure TPNLWhatIfF.WIScenGPPCPropertiesChange(Sender: TObject);
var
  OldHandler: TNotifyEvent;
begin
  with WIScenGPPCSpin do
  begin
    OldHandler := Properties.OnEditValueChanged;
    Properties.OnEditValueChanged := nil;  // Reset event handler to prevent an endless loop
    Value := (Sender as TcxCurrencyEdit).Value;
    Properties.OnEditValueChanged := OldHandler;  // Restore event handler
  end;
  if WhatifUpdate then
    begin
    SetWIBalance(CurrentScene, WIGPPC, WIScenGPPC.value);
    WhatIfCalc(WIGPPC);
    End;
end;

procedure TPNLWhatIfF.WIChangeGPPCPropertiesChange(Sender: TObject);
var
  OldHandler: TNotifyEvent;
begin
  with WIChangeGPPCSpin do
  begin
    OldHandler := Properties.OnEditValueChanged;
    Properties.OnEditValueChanged := nil;  // Reset event handler to prevent an endless loop
    Value := (Sender as TcxCurrencyEdit).Value;
    Properties.OnEditValueChanged := OldHandler;  // Restore event handler
  end;
  if WhatifUpdate then
    begin
    SetWIBalance(CurrentScene, WIGPPCPCI, WIChangeGPPC.value);
    WhatIfCalc(WIGPPCPCI);
    End;
end;

procedure TPNLWhatIfF.WIScenSalesUnitPropertiesChange(Sender: TObject);
var
  OldHandler: TNotifyEvent;
begin
  with WIScenSalesUnitSpin do
  begin
    OldHandler := Properties.OnEditValueChanged;
    Properties.OnEditValueChanged := nil;  // Reset event handler to prevent an endless loop
    Value := (Sender as TcxCurrencyEdit).Value;
    Properties.OnEditValueChanged := OldHandler;  // Restore event handler
  end;
  if WhatifUpdate then
    begin
    SetWIBalance(CurrentScene, WISU, WIScenSalesUnit.value);
    WhatIfCalc(WISU);
    End;
end;

procedure TPNLWhatIfF.WIChangeSalesUnitPropertiesChange(Sender: TObject);
var
  OldHandler: TNotifyEvent;
begin
  with WIChangeSalesUnitSpin do
  begin
    OldHandler := Properties.OnEditValueChanged;
    Properties.OnEditValueChanged := nil;  // Reset event handler to prevent an endless loop
    Value := (Sender as TcxCurrencyEdit).Value;
    Properties.OnEditValueChanged := OldHandler;  // Restore event handler
  end;
  if WhatifUpdate then
    begin
    SetWIBalance(CurrentScene, WISUPCI, WIChangeSalesUnit.value);
    WhatIfCalc(WISUPCI);
    End;
end;

procedure TPNLWhatIfF.WIScenGPUnitPropertiesChange(Sender: TObject);
var
  OldHandler: TNotifyEvent;
begin
  with WIScenGPUnitSpin do
  begin
    OldHandler := Properties.OnEditValueChanged;
    Properties.OnEditValueChanged := nil;  // Reset event handler to prevent an endless loop
    Value := (Sender as TcxCurrencyEdit).Value;
    Properties.OnEditValueChanged := OldHandler;  // Restore event handler
  end;
  if WhatifUpdate then
    begin
    SetWIBalance(CurrentScene, WIGPU, WIScenGPUnit.value);
    WhatIfCalc(WIGPU);
    End;
end;

procedure TPNLWhatIfF.WIChangeGPUnitPropertiesChange(Sender: TObject);
var
  OldHandler: TNotifyEvent;
begin
  with WIChangeGPUnitSpin do
  begin
    OldHandler := Properties.OnEditValueChanged;
    Properties.OnEditValueChanged := nil;  // Reset event handler to prevent an endless loop
    Value := (Sender as TcxCurrencyEdit).Value;
    Properties.OnEditValueChanged := OldHandler;  // Restore event handler
  end;
  if WhatifUpdate then
    begin
    SetWIBalance(CurrentScene, WIGPUPCI, WIChangeGPUnit.value);
    WhatIfCalc(WIGPUPCI);
    End;
end;

procedure TPNLWhatIfF.WIScenBilledPropertiesChange(Sender: TObject);
var
  OldHandler: TNotifyEvent;
begin
  with WIScenBilledSpin do
  begin
    OldHandler := Properties.OnEditValueChanged;
    Properties.OnEditValueChanged := nil;  // Reset event handler to prevent an endless loop
    Value := (Sender as TcxCurrencyEdit).Value;
    Properties.OnEditValueChanged := OldHandler;  // Restore event handler
  end;
  if WhatifUpdate then
    begin
    if GGlobals.UnitRounding = 0 then WIScenBilled.value := round(WIScenBilled.value);
    SetWIBalance(CurrentScene, WIBilled, WIScenBilled.value);
    WhatIfCalc(WIBilled);
    End;
end;

procedure TPNLWhatIfF.WIChangeBilledPropertiesChange(Sender: TObject);
var
  OldHandler: TNotifyEvent;
begin
  with WIChangeBilledSpin do
  begin
    OldHandler := Properties.OnEditValueChanged;
    Properties.OnEditValueChanged := nil;  // Reset event handler to prevent an endless loop
    Value := (Sender as TcxCurrencyEdit).Value;
    Properties.OnEditValueChanged := OldHandler;  // Restore event handler
  end;
  if WhatifUpdate then
    begin
    SetWIBalance(CurrentScene, WIBilledPCI, WIChangeBilled.value);
    WhatIfCalc(WIBilledPCI);
    End;
end;

procedure TPNLWhatIfF.WIScenPotentialPropertiesChange(Sender: TObject);
var
  OldHandler: TNotifyEvent;
begin
  with WIScenPotentialSpin do
  begin
    OldHandler := Properties.OnEditValueChanged;
    Properties.OnEditValueChanged := nil;  // Reset event handler to prevent an endless loop
    Value := (Sender as TcxCurrencyEdit).Value;
    Properties.OnEditValueChanged := OldHandler;  // Restore event handler
  end;
  if WhatifUpdate then
    begin
    if GGlobals.UnitRounding = 0 then WIScenPotential.value := round(WIScenPotential.value);
    SetWIBalance(CurrentScene, WIPOTENTIAL, WIScenPotential.value);
    WhatIfCalc(WIPOTENTIAL);
    End;
end;

procedure TPNLWhatIfF.WIChangePotentialPropertiesChange(Sender: TObject);
var
  OldHandler: TNotifyEvent;
begin
  with WIChangePotentialSpin do
  begin
    OldHandler := Properties.OnEditValueChanged;
    Properties.OnEditValueChanged := nil;  // Reset event handler to prevent an endless loop
    Value := (Sender as TcxCurrencyEdit).Value;
    Properties.OnEditValueChanged := OldHandler;  // Restore event handler
  end;
  if WhatifUpdate then
    begin
    SetWIBalance(CurrentScene, WIPOTENTIALPCI, WIChangePotential.value);
    WhatIfCalc(WIPOTENTIALPCI);
    End;
end;

procedure TPNLWhatIfF.WIScenProductivityPropertiesChange(Sender: TObject);
var
  OldHandler: TNotifyEvent;
begin
  with WIScenProductivitySpin do
  begin
    OldHandler := Properties.OnEditValueChanged;
    Properties.OnEditValueChanged := nil;  // Reset event handler to prevent an endless loop
    Value := (Sender as TcxCurrencyEdit).Value;
    Properties.OnEditValueChanged := OldHandler;  // Restore event handler
  end;
  if WhatifUpdate then
    begin
    SetWIBalance(CurrentScene, WIPROD, WIScenProductivity.value);
    WhatIfCalc(WIPROD);
    End;
end;

procedure TPNLWhatIfF.WIChangeProductivityPropertiesChange(
  Sender: TObject);
var
  OldHandler: TNotifyEvent;
begin
  with WIChangeProductivitySpin do
  begin
    OldHandler := Properties.OnEditValueChanged;
    Properties.OnEditValueChanged := nil;  // Reset event handler to prevent an endless loop
    Value := (Sender as TcxCurrencyEdit).Value;
    Properties.OnEditValueChanged := OldHandler;  // Restore event handler
  end;
  if WhatifUpdate then
    begin
    SetWIBalance(CurrentScene, WIPRODPCI, WIChangeProductivity.value);
    WhatIfCalc(WIPRODPCI);
    End;
end;

procedure TPNLWhatIfF.CloseBtnClick(Sender: TObject);
begin
  If DataCollect.Planloaded = True then
    begin
    DataCollect.psdate := DataModuleClient.DepartmentsCURRENTPLANSTART.Value;
    DataCollect.pedate := DataModuleClient.DepartmentsCURRENTPLANEND.Value;
    DataCollect.AccountingFmt := False;
    DataCollect.CalcNetProfit;
    DataCollect.setPlanningData;
    end;
  DataCollect.ClearPlanDataList;
  DataCollect.ClearConsolidatedList;
  ModalResult := MrOK;
end;

{procedure TPNLWhatIfF.WIScenGPPCSpinMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TcxCurrencyEdit(TcxSpinButton(Sender).Associate).SetFocus;
end;
}
procedure TPNLWhatIfF.cxButton3Click(Sender: TObject);
begin
  if DataModuleClient.DateRangers.RecordCount > 1 then
    begin
    Application.CreateForm(TPastPeriodSelectionF, PastPeriodSelectionF);
    PastPeriodSelectionF.ShowModal;
    PastPeriodSelectionF.Free;
    end;
  RGBaseClick(Sender);
end;

procedure TPNLWhatIfF.WIScenGPPCSpinPropertiesEditValueChanged(
  Sender: TObject);
var
  OldHandler: TNotifyEvent;
begin
  with WIScenGPPC do
  begin
    OldHandler := Properties.OnEditValueChanged;
    Properties.OnEditValueChanged := nil;  // Reset event handler to prevent an endless loop
    Value := (Sender as TcxSpinButton).Value;
    Properties.OnEditValueChanged := OldHandler;  // Restore event handler
  end;
  SetWIBalance(CurrentScene, WIGPPC, WIScenGPPC.value);
  WhatIfCalc(WIGPPC);
end;

procedure TPNLWhatIfF.WIScenSalesUnitSpinPropertiesEditValueChanged(
  Sender: TObject);
var
  OldHandler: TNotifyEvent;
begin
  with WIScenSalesUnit do
  begin
    OldHandler := Properties.OnEditValueChanged;
    Properties.OnEditValueChanged := nil;  // Reset event handler to prevent an endless loop
    Value := (Sender as TcxSpinButton).Value;
    Properties.OnEditValueChanged := OldHandler;  // Restore event handler
  end;
  SetWIBalance(CurrentScene, WISU, WIScenSalesUnit.value);
  WhatIfCalc(WISU);
end;

procedure TPNLWhatIfF.WIScenGPUnitSpinPropertiesEditValueChanged(
  Sender: TObject);
var
  OldHandler: TNotifyEvent;
begin
  with WIScenGPUnit do
  begin
    OldHandler := Properties.OnEditValueChanged;
    Properties.OnEditValueChanged := nil;  // Reset event handler to prevent an endless loop
    Value := (Sender as TcxSpinButton).Value;
    Properties.OnEditValueChanged := OldHandler;  // Restore event handler
  end;
  SetWIBalance(CurrentScene, WIGPU, WIScenGPUnit.value);
  WhatIfCalc(WIGPU);
end;

procedure TPNLWhatIfF.WIScenBilledSpinPropertiesEditValueChanged(
  Sender: TObject);
var
  OldHandler: TNotifyEvent;
begin
  with WIScenBilled do
  begin
    OldHandler := Properties.OnEditValueChanged;
    Properties.OnEditValueChanged := nil;  // Reset event handler to prevent an endless loop
    if GGlobals.UnitRounding = 0 then
      Value := Round((Sender as TcxSpinButton).Value)
    else
      Value := (Sender as TcxSpinButton).Value;
    Properties.OnEditValueChanged := OldHandler;  // Restore event handler
  end;
  SetWIBalance(CurrentScene, WIBilled, WIScenBilled.value);
  WhatIfCalc(WIBilled);
end;

procedure TPNLWhatIfF.WIScenPotentialSpinPropertiesEditValueChanged(
  Sender: TObject);
var
  OldHandler: TNotifyEvent;
begin
  with WIScenPotential do
  begin
    OldHandler := Properties.OnEditValueChanged;
    Properties.OnEditValueChanged := nil;  // Reset event handler to prevent an endless loop
    if GGlobals.UnitRounding = 0 then
      Value := Round((Sender as TcxSpinButton).Value)
    else
      Value := (Sender as TcxSpinButton).Value;
    Properties.OnEditValueChanged := OldHandler;  // Restore event handler
  end;
  SetWIBalance(CurrentScene, WIPOTENTIAL, WIScenPotential.value);
  WhatIfCalc(WIPOTENTIAL);
end;

procedure TPNLWhatIfF.WIScenProductivitySpinPropertiesEditValueChanged(
  Sender: TObject);
var
  OldHandler: TNotifyEvent;
begin
  with WIScenProductivity do
  begin
    OldHandler := Properties.OnEditValueChanged;
    Properties.OnEditValueChanged := nil;  // Reset event handler to prevent an endless loop
    Value := (Sender as TcxSpinButton).Value;
    Properties.OnEditValueChanged := OldHandler;  // Restore event handler
  end;
  SetWIBalance(CurrentScene, WIPROD, WIScenProductivity.value);
  WhatIfCalc(WIPROD);
end;

procedure TPNLWhatIfF.WIChangeGPPCSpinPropertiesEditValueChanged(
  Sender: TObject);
var
  OldHandler: TNotifyEvent;
begin
  with WIChangeGPPC do
  begin
    OldHandler := Properties.OnEditValueChanged;
    Properties.OnEditValueChanged := nil;  // Reset event handler to prevent an endless loop
    Value := (Sender as TcxSpinButton).Value;
    Properties.OnEditValueChanged := OldHandler;  // Restore event handler
  end;
  SetWIBalance(CurrentScene, WIGPPCPCI, WIChangeGPPC.value);
  WhatIfCalc(WIGPPCPCI);
end;

procedure TPNLWhatIfF.WIChangeSalesUnitSpinPropertiesEditValueChanged(
  Sender: TObject);
var
  OldHandler: TNotifyEvent;
begin
  with WIChangeSalesUnit do
  begin
    OldHandler := Properties.OnEditValueChanged;
    Properties.OnEditValueChanged := nil;  // Reset event handler to prevent an endless loop
    Value := (Sender as TcxSpinButton).Value;
    Properties.OnEditValueChanged := OldHandler;  // Restore event handler
  end;
  SetWIBalance(CurrentScene, WISUPCI, WIChangeSalesUnit.value);
  WhatIfCalc(WISUPCI);
end;

procedure TPNLWhatIfF.WIChangeGPUnitSpinPropertiesEditValueChanged(
  Sender: TObject);
var
  OldHandler: TNotifyEvent;
begin
  with WIChangeGPUnit do
  begin
    OldHandler := Properties.OnEditValueChanged;
    Properties.OnEditValueChanged := nil;  // Reset event handler to prevent an endless loop
    Value := (Sender as TcxSpinButton).Value;
    Properties.OnEditValueChanged := OldHandler;  // Restore event handler
  end;
  SetWIBalance(CurrentScene, WIGPUPCI, WIChangeGPUnit.value);
  WhatIfCalc(WIGPUPCI);
end;

procedure TPNLWhatIfF.WIChangeBilledSpinPropertiesEditValueChanged(
  Sender: TObject);
var
  OldHandler: TNotifyEvent;
begin
  with WIChangeBilled do
  begin
    OldHandler := Properties.OnEditValueChanged;
    Properties.OnEditValueChanged := nil;  // Reset event handler to prevent an endless loop
    Value := (Sender as TcxSpinButton).Value;
    Properties.OnEditValueChanged := OldHandler;  // Restore event handler
  end;
  SetWIBalance(CurrentScene, WIBilledPCI, WIChangeBilled.value);
  WhatIfCalc(WIBilledPCI);
end;

procedure TPNLWhatIfF.WIChangePotentialSpinPropertiesEditValueChanged(
  Sender: TObject);
var
  OldHandler: TNotifyEvent;
begin
  with WIChangePotential do
  begin
    OldHandler := Properties.OnEditValueChanged;
    Properties.OnEditValueChanged := nil;  // Reset event handler to prevent an endless loop
    Value := (Sender as TcxSpinButton).Value;
    Properties.OnEditValueChanged := OldHandler;  // Restore event handler
  end;
  SetWIBalance(CurrentScene, WIPOTENTIALPCI, WIChangePotential.value);
  WhatIfCalc(WIPOTENTIALPCI);
end;

procedure TPNLWhatIfF.WIChangeProductivitySpinPropertiesEditValueChanged(
  Sender: TObject);
var
  OldHandler: TNotifyEvent;
begin
  with WIChangeProductivity do
  begin
    OldHandler := Properties.OnEditValueChanged;
    Properties.OnEditValueChanged := nil;  // Reset event handler to prevent an endless loop
    Value := (Sender as TcxSpinButton).Value;
    Properties.OnEditValueChanged := OldHandler;  // Restore event handler
  end;
  SetWIBalance(CurrentScene, WIPRODPCI, WIChangeProductivity.value);
  WhatIfCalc(WIPRODPCI);
end;

procedure TPNLWhatIfF.PriceChangePropertiesEditValueChanged(
  Sender: TObject);
var
  OldHandler: TNotifyEvent;
  Cogs : Currency;
begin
  with PriceChangeSpin do
  begin
    OldHandler := Properties.OnEditValueChanged;
    Properties.OnEditValueChanged := nil;  // Reset event handler to prevent an endless loop
    Value := (Sender as TcxCurrencyEdit).Value;
    PriceChangeAmount := Value;
    Properties.OnEditValueChanged := OldHandler;  // Restore event handler
  end;
  if WhatifUpdate then
    begin
    Cogs := getWIBalance(CurrentScene, WISALES) - getWIBalance(CurrentScene, WIGP);
    SetWIBalance(CurrentScene, WISALES, GetWIBalance(WIBase, WISales) * (1 + (Pricechange.Value/ 100)));
    SetWIBalance(CurrentScene, WIGP, GetWIBalance(CurrentScene, WISALES) - cogs); // force sync as Price mut be done first
    if getWIBalance(CurrentScene, WISALES) <> 0 then
      SetWIBalance(CurrentScene, WIGPPC, getWIBalance(CurrentScene, WIGP) * 100 / getWIBalance(CurrentScene, WISALES));
    WhatIfCalc(WIGPPC);
    end;
end;

procedure TPNLWhatIfF.PriceChangeSpinPropertiesEditValueChanged(
  Sender: TObject);
var
  OldHandler: TNotifyEvent;
  Cogs : Currency;
begin
  with PriceChange do
  begin
    OldHandler := Properties.OnEditValueChanged;
    Properties.OnEditValueChanged := nil;  // Reset event handler to prevent an endless loop
    Value := (Sender as TcxSpinButton).Value;
    PriceChangeAmount := Value;
    Properties.OnEditValueChanged := OldHandler;  // Restore event handler
  end;
  Cogs := getWIBalance(CurrentScene, WISALES) - getWIBalance(CurrentScene, WIGP);
  SetWIBalance(CurrentScene, WISALES, GetWIBalance(WIBase, WISales) * (1 + (Pricechange.Value/ 100)));
  SetWIBalance(CurrentScene, WIGP, GetWIBalance(CurrentScene, WISALES) - cogs); // force sync as Price mut be done first
  if getWIBalance(CurrentScene, WISALES) <> 0 then
    SetWIBalance(CurrentScene, WIGPPC, getWIBalance(CurrentScene, WIGP) * 100 / getWIBalance(CurrentScene, WISALES));
  WhatIfCalc(WIGPPC);
end;

procedure TPNLWhatIfF.CostChangePropertiesEditValueChanged(
  Sender: TObject);
var
  OldHandler: TNotifyEvent;
  Cogs : Currency;
begin
  with CostChangeSpin do
  begin
    OldHandler := Properties.OnEditValueChanged;
    Properties.OnEditValueChanged := nil;  // Reset event handler to prevent an endless loop
    Value := (Sender as TcxCurrencyEdit).Value;
    CostChangeAmount := Value;
    Properties.OnEditValueChanged := OldHandler;  // Restore event handler
  end;
  if WhatifUpdate then
    begin
    Cogs := getWIBalance(WIBase, WISALES) - getWIBalance(WIBase, WIGP);
    Cogs := Cogs * (1 + CostChange.Value / 100);
    SetWIBalance(CurrentScene, WIGP, getWIBalance(CurrentScene, WISALES) - cogs);
    if getWIBalance(CurrentScene, WISALES) <> 0 then
      SetWIBalance(CurrentScene, WIGPPC, getWIBalance(CurrentScene, WIGP) * 100 / getWIBalance(CurrentScene, WISALES));
    WhatIfCalc(WIGPPC);
    end;
end;

procedure TPNLWhatIfF.cxSpinButton1PropertiesEditValueChanged(
  Sender: TObject);
var
  OldHandler: TNotifyEvent;
  Cogs : Currency;
begin
  with CostChange do
  begin
    OldHandler := Properties.OnEditValueChanged;
    Properties.OnEditValueChanged := nil;  // Reset event handler to prevent an endless loop
    Value := (Sender as TcxSpinButton).Value;
    CostChangeAmount := Value;
    Properties.OnEditValueChanged := OldHandler;  // Restore event handler
  end;
  Cogs := getWIBalance(WIBase, WISALES) - getWIBalance(WIBase, WIGP);
  Cogs := Cogs * (1 + CostChange.Value / 100);
  SetWIBalance(CurrentScene, WIGP, getWIBalance(CurrentScene, WISALES) - cogs);
  if getWIBalance(CurrentScene, WISALES) <> 0 then
    SetWIBalance(CurrentScene, WIGPPC, getWIBalance(CurrentScene, WIGP) * 100 / getWIBalance(CurrentScene, WISALES));
  WhatIfCalc(WIGPPC);
end;

procedure TPNLWhatIfF.PriceMode(Value : Boolean);
begin
  if Value then
    begin
    ISPriceMode := True;
    WIScenGPPC.Style.Color := $02EEFFAA;
    WIScenGPPC.Properties.ReadOnly := True;
    WIScenGPPC.TabStop := False;
    WIChangeGPPC.Style.Color := $02EEFFAA;
    WIChangeGPPC.Properties.ReadOnly := True;
    WIChangeGPPC.TabStop := False;
    WIScenGPPCSpin.Visible := False;
    WIChangeGPPCSpin.Visible := False;
    PriceChange.Enabled := True;
    PriceChangeSpin.Visible := True;
    CostChange.Enabled := True;
    CostChangeSpin.Visible := True;
    Refresh;
    end
  else
    begin
    ISPriceMode := False;
    WIScenGPPC.Style.Color := clWindow;
    WIScenGPPC.Properties.ReadOnly := False;
    WIScenGPPC.TabStop := True;
    WIChangeGPPC.Style.Color := clWindow;
    WIChangeGPPC.Properties.ReadOnly := False;
    WIChangeGPPC.TabStop := True;
    WIScenGPPCSpin.Visible := True;
    WIChangeGPPCSpin.Visible := True;
    PriceChange.Enabled := False;
    PriceChangeSpin.Visible := False;
    CostChange.Enabled := False;
    CostChangeSpin.Visible := False;
    Refresh;
    end;
end;

procedure TPNLWhatIfF.WIScenSalesUnitEnter(Sender: TObject);
begin
  if isPriceMode then
    PriceMode(False);
end;

end.
