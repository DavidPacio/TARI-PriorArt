unit TargetingProfit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons, cxPC,
  cxControls, DMrep1U, cxTextEdit, cxDBEdit, ExtCtrls, DMCLient, Datacollector,
  LGlobals, cxCurrencyEdit, cxMaskEdit, cxDropDownEdit, auchtypes,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridCustomView,
  cxGridLevel, cxGrid, cxCustomData, cxDataStorage, Buttons,
  cxGroupBox, cxDBLabel, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxPCdxBarPopupMenu, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxFilter, cxData, Menus, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TTargetingProfitF = class(TForm)
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    NextFinishBtn: TcxButton;
    PrevBtn: TcxButton;
    CancelBtn: TcxButton;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxPNLGrid1Level1: TcxGridLevel;
    cxPNLGrid1: TcxGrid;
    cxPNLGrid1TableView1: TcxGridTableView;
    cxPNLGrid1TableView1Title: TcxGridColumn;
    cxPNLGrid1TableView1SubTitle: TcxGridColumn;
    ColPastAmount: TcxGridColumn;
    ColTarget: TcxGridColumn;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    LA: TcxLabel;
    Label11: TcxLabel;
    LB: TcxLabel;
    Label12: TcxLabel;
    LC: TcxLabel;
    Label14: TcxLabel;
    LD: TcxLabel;
    Label13: TcxLabel;
    LE: TcxLabel;
    Label18: TcxLabel;
    LF: TcxLabel;
    Label15: TcxLabel;
    LG: TcxLabel;
    Label19: TcxLabel;
    LH: TcxLabel;
    Label16: TcxLabel;
    LI: TcxLabel;
    Label17: TcxLabel;
    Label36: TcxLabel;
    Label37: TcxLabel;
    ActivityPastSales: TcxCurrencyEdit;
    ActivityPastGP: TcxCurrencyEdit;
    PastFTE: TcxCurrencyEdit;
    PastFTEProduction: TcxCurrencyEdit;
    PastPotUnits: TcxCurrencyEdit;
    PastUnitsSold: TcxCurrencyEdit;
    PastProd: TcxCurrencyEdit;
    PastSaleUnit: TcxCurrencyEdit;
    PastGPUnit: TcxCurrencyEdit;
    PastSalesFTE: TcxCurrencyEdit;
    PastGPFTE: TcxCurrencyEdit;
    HoursperdayLbl: TcxLabel;
    HelpTotalFteBtn: TcxButton;
    HelpPotentialUnitsBtn: TcxButton;
    HelpPotentialHoursBtn: TcxButton;
    cxGroupBox1: TcxGroupBox;
    PastInvoicesBn: TcxButton;
    cxLabel7: TcxLabel;
    HelpProdFTEBtn: TcxButton;
    cxButton1: TcxButton;
    cxButton3: TcxButton;
    cxPNLGrid1TableView1PastPC: TcxGridColumn;
    cxPNLGrid1TableView1TargetPC: TcxGridColumn;
    TargetExpensesBtn: TcxButton;
    ActivityPlanSales: TcxCurrencyEdit;
    ActivityPlanGP: TcxCurrencyEdit;
    PlanFTE: TcxCurrencyEdit;
    PlanFTEProduction: TcxCurrencyEdit;
    PlanPotUnits: TcxCurrencyEdit;
    PlanBilledUnits: TcxCurrencyEdit;
    PlanProd: TcxCurrencyEdit;
    PlanSalesUnit: TcxCurrencyEdit;
    PlanGPUnit: TcxCurrencyEdit;
    PlanSalesFTE: TcxCurrencyEdit;
    PlanGPFTE: TcxCurrencyEdit;
    cxButton2: TcxButton;
    cxLabel4: TcxLabel;
    ARILabel: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel14: TcxLabel;
    cxDBLabel3: TcxDBLabel;
    cxDBLabel4: TcxDBLabel;
    procedure NextFinishBtnClick(Sender: TObject);
    procedure PrevBtnClick(Sender: TObject);
    procedure cxPageControl1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure HelpTotalFteBtnClick(Sender: TObject);
    procedure HelpPotentialUnitsBtnClick(Sender: TObject);
    procedure HelpPotentialHoursBtnClick(Sender: TObject);
    procedure PastInvoicesBnClick(Sender: TObject);
    procedure HelpProdFTEBtnClick(Sender: TObject);
    procedure cxTabSheet2Show(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure TargetExpensesBtnClick(Sender: TObject);
    procedure PlanFTEExit(Sender: TObject);
    procedure PlanPotUnitsExit(Sender: TObject);
    procedure PlanBilledUnitsExit(Sender: TObject);
    procedure PlanProdExit(Sender: TObject);
    procedure PlanSalesUnitExit(Sender: TObject);
    procedure PlanGPUnitExit(Sender: TObject);
    procedure PlanFTEProductionExit(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxTabSheet2Exit(Sender: TObject);
    procedure cxTabSheet1Show(Sender: TObject);
  private
    { Private declarations }
    CancelPressed: Boolean;
    cxCurrencyUpdate : Boolean;
    procedure calculatePlanData(AccountNo: integer);
    procedure SetPeriodLabel;
    procedure Finish;
    procedure setlabels;
    procedure getplanactivitybalances;
    procedure setplanactivitybalances;
    procedure CalculatePlanActivity(accountno : integer);
//    procedure CalcNetProfit;
  public
    { Public declarations }
  end;

  TPNLDataSource = class(TcxCustomDataSource)
  private
    FPNLLIST: TList;
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
    constructor Create(APNLList: TList);
    destructor Destroy; override;
    property Modified: boolean read FModified;
  end;


var
  TargetingProfitF: TTargetingProfitF;

implementation

uses HelpTotalFte, HelpPotentialUnits, HelpPotentialHours,
  Invoices, HelpProdFTE, PastPeriodSelection, detailExpenses, detailTargets;

{$R *.dfm}

procedure GenerateColumns(AGridTableView: TcxGridTableView);
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
          2, 3, 4, 5:
            DataBinding.ValueTypeClass := TcxCurrencyValueType;
        end;    // case
      end;
    end;    // for
end;

{ TPNLDataSource }
constructor TPNLDataSource.Create(APNLList: TList);
begin
  inherited Create;
  FPNLLIST := APNLList;
end;

destructor TPNLDataSource.Destroy;
begin
  inherited Destroy;
end;

function TPNLDataSource.GetDataBinding(AItemIndex: Integer): TcxGridItemDataBinding;
begin
  Result := TcxCustomGridTableItem(DataController.GetItem(AItemIndex)).DataBinding;
end;

function TPNLDataSource.GetRecordCount: Integer;
begin
  Result := 7;
end;

function TPNLDataSource.GetValue(ARecordHandle: TcxDataRecordHandle; AItemHandle: TcxDataItemHandle): Variant;
var
  ADataBinding: TcxGridItemDataBinding;
  PNLRec : TPlanDataRecPtr;
begin
  ADataBinding := TcxGridItemDataBinding(AItemHandle);
  PNLRec := FPNLLIST[Integer(ARecordHandle)];
  case Integer(ADataBinding.Data) of    //
    0: Result := PNLRec.AccountTitle;
    1: Result := PNLRec.AccountSubTitle;
    2:  begin
        if DataModuleClient.DateRangersD_Index.value > 0 then
          Result := Round(PNLRec.PastBalances[DataModuleClient.DateRangersD_Index.value - 1])
        else
          Result := 0;
        end;
    3: Result := Round(PNLRec.PastResultPc * 100) / 100;
    4: Result := Round(PNLRec.PlanTotal);
    5: Result := Round(PNLRec.PlanTotalPc * 100) / 100;
  end;    // case
end;

procedure TPNLDataSource.SetValue(ARecordHandle: TcxDataRecordHandle;
  AItemHandle: TcxDataItemHandle; const AValue: Variant);
var
  ADataBinding: TcxGridItemDataBinding;
  PNLRec : TPlanDataRecPtr;
begin
  ADataBinding := TcxGridItemDataBinding(AItemHandle);
  PNLREc := FPNLLIST[Integer(ARecordHandle)];
  if Integer(ADataBinding.Data) = 4 then    //
    begin
    if (PNLRec.Accountno <> TOTALEXPENSES)  then
      PNLRec.PlanTotal := AValue
    else
      begin
      if PNLRec.PlanTotal <> AValue then
        showmessage('Change Target Expenses using the Target Expenses Button');
      end;
    TargetingProfitF.calculatePlanData(PNLRec.Accountno);
    DataChanged;
    end;
end;

function TPNLDataSource.GetItemHandle(AItemIndex: Integer): TcxDataItemHandle;
begin
  Result := TcxDataItemHandle(GetDataBinding(AItemIndex));
end;

procedure TTargetingProfitF.NextFinishBtnClick(Sender: TObject);
begin
  if cxPageControl1.ActivePageIndex < (cxPageControl1.PageCount - 1) then
    begin
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
    CancelPressed := False;
    Finish;
    end;
end;

procedure TTargetingProfitF.Finish;
begin
  if Not CancelPressed then
    begin
    if DataCollect.Planloaded = True then
      begin
      DataCollect.psdate := DataModuleClient.DepartmentsCURRENTPLANSTART.Value;
      DataCollect.pedate := DataModuleClient.DepartmentsCURRENTPLANEND.Value;
      DataCollect.AccountingFmt := False;
      DataCollect.CalcNetProfit;
      setPlanActivityBalances;
      DataCollect.setPlanningData;
      end;
    end;
  DataCollect.ClearPlanDataList;
  DataCollect.ClearPlanExpDataList;
  DataCollect.ClearConsolidatedList;
  Close;
end;

procedure TTargetingProfitF.PrevBtnClick(Sender: TObject);
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

procedure TTargetingProfitF.cxPageControl1Change(Sender: TObject);
begin
  if cxPageControl1.ActivePageIndex = 0 then
    PrevBtn.Enabled := False
  else
    PrevBtn.Enabled := True;
  if cxPageControl1.ActivePageIndex = 1 then
    ARILabel.Visible := True
  else
    ARILabel.Visible := False;
end;

procedure TTargetingProfitF.calculatePlanData(AccountNo: integer);
var
  tempbal, PastTempBal : Currency;
  cn : integer;
begin
  case Accountno of
    SALES:
      begin
      if GetListPlanBalance(GetAccountListIndex(SALES)) = 0 then
        begin
        setListPlanBalance(getAccountListIndex(SALES), 0, True);
        end;
      end;
    COGS:
      begin
      if GetListPlanBalance(GetAccountListIndex(COGS)) = 0 then
        begin
        setListPlanBalance(getAccountListIndex(COGS), 0, True);
        end;
      end;
    GROSSPROFIT:
      begin
      tempbal := GetListPlanBalance(GetAccountListIndex(COGS));
      if (tempbal = 0) and (GetListPlanBalance(GetAccountListIndex(SALES)) <> 0) then
        begin
        tempbal :=  Round(GetListPlanBalance(GetAccountListIndex(SALES)) - GetListPlanBalance(GetAccountListIndex(GROSSPROFIT)));
        setListPlanBalance(getAccountListIndex(COGS), tempbal, True);
        end;
      end;
    TOTALEXPENSES:;
    NETOPERATINGPROFIT:
      begin
      tempbal := GetListPlanBalance(GetAccountListIndex(TOTALEXPENSES));
      if tempbal = 0 then
        begin
        tempbal :=  Round(GetListPlanBalance(GetAccountListIndex(GROSSPROFIT)) - GetListPlanBalance(GetAccountListIndex(NETOPERATINGPROFIT)));
        setListPlanBalance(getAccountListIndex(TOTALEXPENSES), tempbal, True);
        end;
      end;
    OTHERINCOME:;
    NETPROFIT:
      begin
      tempbal := GetListPlanBalance(GetAccountListIndex(OTHERINCOME));
      if tempbal = 0 then
        begin
        tempbal :=  Round(GetListPlanBalance(GetAccountListIndex(NETPROFIT)) - GetListPlanBalance(GetAccountListIndex(NETOPERATINGPROFIT)));
        setListPlanBalance(getAccountListIndex(OTHERINCOME), tempbal, True);
        end;
      end;
  end;
    // set the main balances
  tempbal := Round(GetListPlanBalance(GetAccountListIndex(SALES))) - Round(GetListPlanBalance(GetAccountListIndex(COGS)));
  setListPlanBalance(getAccountListIndex(GROSSPROFIT), tempbal, False);
  tempbal := Round(tempbal) - Round(GetListPlanBalance(GetAccountListIndex(TOTALEXPENSES)));
  setListPlanBalance(getAccountListIndex(NETOPERATINGPROFIT), tempbal, True);
  tempbal := tempbal + Round(GetListPlanBalance(GetAccountListIndex(OTHERINCOME)));
  setListPlanBalance(getAccountListIndex(NETPROFIT), tempbal, True);
  // set Percentage to Sales
  cn := 0;
  tempbal := GetListPlanBalance(GetAccountListIndex(SALES));
  Pasttempbal := GetListPastBalance(GetAccountListIndex(SALES));
  repeat
    if tempbal <> 0 then
      TPlanDataRecPtr(PlanDataList.Items[cn]).PlanTotalpc := GetListPlanBalance(cn) * 100 / tempbal
    else
      TPlanDataRecPtr(PlanDataList.Items[cn]).PlanTotalpc := 0;
    if Pasttempbal <> 0 then
      TPlanDataRecPtr(PlanDataList.Items[cn]).PastResultpc := GetListPastBalance(cn) * 100 / Pasttempbal
    else
      TPlanDataRecPtr(PlanDataList.Items[cn]).PastResultpc := 0;
    inc(cn);
  until  TPlanDataRecPtr(PlanDataList.Items[cn - 1]).accountno = NETPROFIT;
end;

procedure TTargetingProfitF.FormCreate(Sender: TObject);
var
  I : Integer;
  tmpstr : string;
begin
//  color := GGlobals.FormColour;
  DMrep1.TariButtonList.GetImage(2, PrevBtn.Glyph);
  DMrep1.TariButtonList.GetImage(3, CancelBtn.Glyph);
  DMrep1.TariButtonList.GetImage(1, NextFinishBtn.Glyph);
  if DataModuleClient.DateRangers.RecordCount < 2 then
    begin
    cxButton1.Visible := False;
    cxButton3.Visible := False;
    end;
	Caption := 'Past Information - ' + DataModuleClient.BusinessDetailsBUSINESS_NAME.AsString;
  for I := 0 to cxPageControl1.PageCount - 1 do    // Iterate
    cxPageControl1.Pages[I].Color := GGlobals.FormColour;
  cxPageControl1.ActivePage := cxTabSheet1;
  cxPageControl1Change(Sender);
  tmpstr := DataModuleClient.DepartmentsCurrentPlanStart.AsString;

  DataCollect.GetConsolidatedList(DataModuleClient.DepartmentsDEPT_ID.Value, ctNormal);
  if DataCollect.Planloaded = false then
    Begin
    DataCollect.psdate := DataModuleClient.DepartmentsCurrentPlanStart.value;
    DataCollect.pedate := DataModuleClient.DepartmentsCurrentPlanEnd.value;
    DataCollect.getPlanningData;
    end;
//  tmpstr := DataModuleClient.DepartmentsCurrentPlanStart.AsString;
  GenerateColumns(cxPNLGrid1TableView1);
  cxPNLGrid1TableView1.DataController.CustomDataSource := TPNLDataSource.Create(PlanDataList);
  DataModuleClient.DateRangersStartDate.DisplayFormat := GGlobals.GetDateFENH;
  DataModuleClient.DateRangersEndDate.DisplayFormat := GGlobals.GetDateFENH;
  DataModuleClient.DepartmentsCurrentPlanStart.DisplayFormat := GGlobals.GetDateFENH;
  DataModuleClient.DepartmentsCurrentPlanEnd.DisplayFormat := GGlobals.GetDateFENH;
//  tmpstr := DataModuleClient.DepartmentsCurrentPlanStart.AsString;
  SetPeriodLabel;
end;

procedure TTargetingProfitF.SetPeriodLabel;
begin
  if cxPageControl1.ActivePage = cxTabsheet1 then
    begin
    ColPastAmount.Caption := 'Past Period ' + DataModuleClient.DateRangersStartDate.DisplayText + ' to ' +
    DataModuleClient.DateRangersEndDate.DisplayText;
    colTarget.Caption := 'Target Amount ' + DataModuleClient.DepartmentsCurrentPlanStart.DisplayText + ' to ' +
    DataModuleClient.DepartmentsCurrentPlanEnd.DisplayText;
    calculatePlanData(SALES);
    cxPNLGrid1TableView1.DataController.CustomDataSource.DataChanged;
    end;
  if cxPageControl1.ActivePage = cxTabsheet2 then
    begin
    cxlabel7.caption := DataModuleClient.DateRangersStartDate.DisplayText + ' to ' +
      DataModuleClient.DateRangersEndDate.DisplayText;
    cxlabel4.caption := DataModuleClient.DepartmentsCurrentPlanStart.DisplayText + ' to ' +
    DataModuleClient.DepartmentsCurrentPlanEnd.DisplayText;
    cxLabel7.Refresh;
    cxLabel4.Refresh;
    getplanactivitybalances;
    end;
end;

procedure TTargetingProfitF.getplanactivitybalances;
var
  Hoursmins, UnitsSold, UnitsPot, PastProdFTE, PastOther, PlanProdFTE, PlanOther : Currency;
begin
  cxCurrencyUpdate := True;
  ActivityPastSales.Value := getListPastBalance(getaccountlistindex(SALES));
  ActivityPastGP.Value := getListPastBalance(getaccountlistindex(GROSSPROFIT));
  unitsSold := getListPastBalance(getaccountlistindex(BILLED));
  unitsPot := getListPastBalance(getaccountlistindex(POTENTIAL));
  PastProdFTE := getListPastBalance(getaccountlistindex(FTEPROD));
  PastOTHER := getListPastBalance(getaccountlistindex(FTEOTHER));
  PastFTE.value := PastOther;
  PastFTEProduction.Value := PastProdFTE;
  PastPotUnits.Value := round(UnitsPot * 100) / 100;
  PastUnitsSold.Value := round(unitsSold * 100) / 100;
  PastSaleUnit.Value := 0;
  PastGPUnit.Value := 0;
  if UnitsSold <> 0 then
    begin
    PastSaleUnit.value := round((ActivityPastSales.value / UnitsSold) * 100) /100;
    PastGPUnit.value := round((ActivityPastGP.value / UnitsSold) * 100) / 100;
    end;
  if (UnitsPot <> 0) and (UnitsSold <> 0) then
    PastProd.value := Round((UnitsSold  * 100 / UnitsPot) * 100) / 100
  else
    PastProd.value := 0;
  PastSalesFTE.Value := 0;
  PastGPFTE.Value := 0;
  if PastOther <> 0 then
    begin
    PastSalesFTE.Value := ActivityPastSales.Value / PastOther;
    PastGPFTE.Value := ActivityPastGP.Value / PastOther;
    end;

  ActivityPlanSales.Value := getListPlanBalance(getaccountlistindex(SALES));
  ActivityPlanGP.Value := getListPlanBalance(getaccountlistindex(GROSSPROFIT));
  unitsSold := getListPlanBalance(getaccountlistindex(BILLED));
  unitsPot := getListPlanBalance(getaccountlistindex(POTENTIAL));
  PlanProdFTE := getListPlanBalance(getaccountlistindex(FTEPROD));
  PlanOTHER := getListPlanBalance(getaccountlistindex(FTEOTHER));
  PlanFTE.value := PlanOther;
  PlanFTEProduction.Value := PlanProdFTE;
  PlanPotUnits.Value := round(UnitsPot * 100) / 100;
  PlanBilledUnits.Value := round(unitsSold * 100) / 100;
  PlanSalesUnit.Value := 0;
  PlanGPUnit.Value := 0;
  if UnitsSold <> 0 then
    begin
    PlanSalesUnit.value := round((ActivityPlanSales.value / UnitsSold) * 100) /100;
    PlanGPUnit.value := round((ActivityPlanGP.value / UnitsSold) * 100) / 100;
    end;
  if (UnitsPot <> 0) and (UnitsSold <> 0) then
    PlanProd.value := Round((UnitsSold  * 100 / UnitsPot) * 100) / 100
  else
    PlanProd.value := 0;
  PlanSalesFTE.Value := 0;
  PlanGPFTE.Value := 0;
  if PlanOther <> 0 then
    begin
    PlanSalesFTE.Value := ActivityPlanSales.Value / PlanOther;
    PlanGPFTE.Value := ActivityPlanGP.Value / PlanOther;
    end;

  HoursperdayLbl.Caption := ' ';
  if (PlanProd.value > 0) then
    begin
    Hoursmins := PlanBilledUnits.value  * 8 / PlanPotUnits.value;
    HoursperdayLbl.caption := '= ' + inttostr(trunc(hoursmins)) + 'hr ' + inttostr(trunc(Hoursmins * 60) mod 60) + 'mins';
    end;
  HoursperdayLbl.Refresh;
  cxCurrencyUpdate := False;
end;


procedure TTargetingProfitF.setlabels;
var
  Base: Integer;
begin
  Base := 72;
  if (DataModuleClient.DepartmentsSingular_UnitDesc.value = 'Hour') or
    (DataModuleClient.DepartmentsPlural_UnitDesc.value = 'Hours')then
    begin
    LI.Visible := True;
    Label13.visible := True;
    PastFTEProduction.visible := True;
    PastFTEProduction.TabStop := True;
//    PastFteProduction.CanFocus := True;
    HelpProdFteBtn.Visible := True;
    HelpTotalFteBtn.Visible := True;
    HelpPotentialHoursBtn.Visible := True;
    HelpPotentialUnitsBtn.Visible := False;
    HelpPotentialHoursBtn.Visible := True;
    // This is the default setting but we must ensure that all controls are in the correct order.
    Label18.Top := Base + 129;
    PastPotUnits.Top := base + 128;
    PlanPotUnits.Top := base + 128;
    Label15.Top := Base + 161;
    PastUnitsSold.top := Base + 160;
    PlanBilledUnits.top := Base + 160;
    Label19.top := Base + 193;
    HoursperdayLbl.Top := Base + 193;
    PastProd.Top := Base + 192;
    PlanProd.Top := Base + 192;
    Label16.Top := Base + 225;
    PastSaleUnit.Top := Base + 224;
    PlanSalesUnit.Top := Base + 224;
    Label17.top := Base + 257;
    PastGPUnit.top := base + 256;
    PlanGPUnit.top := base + 256;
    PlanFteProduction.TabOrder := 44;
    PlanPotUnits.TabOrder := 45;
    PlanBilledUnits.TabOrder := 46;
    PlanProd.TabOrder := 47;
    PlanSalesUnit.TabOrder := 48;
    PLanGPUnit.tabOrder := 49;

		Label15.Caption := 'Actual ' + DataModuleClient.DepartmentsPlural_UnitDesc.AsString
			+ ' Sold = B / I';
		Label16.Caption := 'Average Sales (Revenue) per ' + DataModuleClient.DepartmentsSingular_UnitDesc.AsString
      + ' = A / F';
    Label19.Caption := '% Activity Level = F / E';
		Label17.Caption := '*Average Gross Profit (Contribution) per ' + DataModuleClient.DepartmentsSingular_UnitDesc.AsString + ' = B / F';
    HoursperdayLbl.Visible := true;
    end
  else
    begin
// This is not the default
    LI.Visible := False;
    Label13.visible := False;
    PastFTEProduction.visible := False;
    PastFTEProduction.TabStop := False;
    HelpProdFteBtn.Visible := False;
    HelpPotentialHoursBtn.Visible := False;
    HelpPotentialUnitsBtn.Visible := True;
    Label18.Top := Base + 97;
    PastPotUnits.Top := base + 96;
    PlanPotUnits.Top := base + 96;
    Label15.Top := Base + 129;
    PastUnitsSold.top := Base + 128;
    PlanBilledUnits.top := Base + 128;
    Label19.top := Base + 161;
    HoursperdayLbl.Top := Base + 161;
    PastProd.Top := Base + 160;
    PlanProd.Top := Base + 160;
    Label16.Top := Base + 193;
    PastSaleUnit.Top := Base + 192;
    PlanSalesUnit.Top := Base + 192;
    Label17.top := Base + 225;
    PastGPUnit.top := base + 224;
    PlanGPUnit.top := base + 224;
    PlanPotUnits.TabOrder := 45;
    PlanBilledUnits.TabOrder := 46;
    PlanProd.TabOrder := 47;
    PLanSalesUnit.TabOrder := 48;
    PlanGPUnit.tabOrder := 49;
		Label15.Caption := 'Number of ' + DataModuleClient.DepartmentsPlural_UnitDesc.AsString
			+ ' Made or sold = A / G';
		Label16.Caption := 'Average Sales (Revenue) per ' + DataModuleClient.DepartmentsSingular_UnitDesc.AsString + ' = A / E';
    Label19.Caption := '% Activity Level = E / D';
		Label17.Caption := 'Average Gross Profit (Contribution) per ' + DataModuleClient.DepartmentsSingular_UnitDesc.AsString + ' = B / E';
    HoursperdayLbl.Visible := False;
    end;
	Label18.Caption := 'Potential ' + DataModuleClient.DepartmentsPlural_UnitDesc.AsString;
end;


procedure TTargetingProfitF.CancelBtnClick(Sender: TObject);
begin
  CancelPressed := True;
  finish;
end;

procedure TTargetingProfitF.HelpTotalFteBtnClick(Sender: TObject);
begin
  GGlobals.DebugOut('Plan: FTE HElp');
  Application.CreateForm(THelpTotalFteF, HelpTotalFteF);
  HelpTotalFTEF.showmodal;
  HelpTotalFTEF.free;
end;

procedure TTargetingProfitF.HelpPotentialUnitsBtnClick(Sender: TObject);
begin
  GGlobals.DebugOut('Plan: Past Potential Units Help');
  Application.CreateForm(THelpPotentialUnitsF, HelpPotentialUnitsF);
  HelpPotentialUnitsF.showmodal;
  HelpPotentialUnitsF.free;
end;

procedure TTargetingProfitF.HelpPotentialHoursBtnClick(Sender: TObject);
begin
  GGlobals.DebugOut('Plan: Target Potential Hours Help');
  Application.CreateForm(THelpPotentialHoursF, HelpPotentialHoursF);
  HelpPotentialHoursF.showmodal;
  cxCurrencyUpdate := True;
  if HelpPotentialHoursF.UserSelected <> 0 then
    PlanPotUnits.value := PlanFTEProduction.value * HelpPotentialHoursF.UserSelected;
  if GGlobals.UnitRounding = 0 then PlanPotUnits.value := Round(PlanPotUnits.value);
  cxCurrencyUpdate := False;
  HelpPotentialHoursF.free;
end;

procedure TTargetingProfitF.PastInvoicesBnClick(Sender: TObject);
var
  UnitsSold : Currency;
begin
  GGlobals.DebugOut('Plan: Plan Invoices HElp');
  LocalInvType := PlanInv;
  LocalStartDate := DataModuleClient.DepartmentsCurrentPlanStart.Value;
  LocalEndDate := DataModuleClient.DepartmentsCurrentPlanEnd.Value;
  Application.CreateForm(TInvoicesF, InvoicesF);

  InvoicesF.ShowModal;
  if InvoiceRate > 0 then
    begin
    if not cxCurrencyUpdate then
      begin
      if InvoiceRate  <> 0 then
        UnitsSold := ActivityPlanGP.value / InvoiceRate
      else
        unitssold := 0;
      if GGlobals.UnitRounding = 0 then
        UnitsSold := round(UnitsSold);
      setListPlanBalance(getaccountlistindex(BILLED), UnitsSold, True);
      getplanactivitybalances;
      end;
    end;
    InvoicesF.free;
end;

procedure TTargetingProfitF.HelpProdFTEBtnClick(Sender: TObject);
begin
  GGlobals.DebugOut('Plan: Plan Prod FTE Help');
  Application.CreateForm(THelpProdFTEF, HelpProdFTEF);
  HelpProdFTEF.showmodal;
  HelpProdFTEF.free;
end;

procedure TTargetingProfitF.setplanactivitybalances;
begin
  SetListPlanBalance(getaccountlistindex(SALES), ActivityPlanSales.Value, True);
  SetListPlanBalance(getaccountlistindex(GROSSPROFIT), ActivityPlanGP.Value, True);
  SetListPlanBalance(getaccountlistindex(POTENTIAL), PlanPotUnits.Value, True);
  SetListPlanBalance(getaccountlistindex(BILLED), PlanBilledUnits.Value, True);
  setListPlanBalance(getaccountlistindex(FTEOTHER), PlanFTE.Value, True);
  setListPlanBalance(getaccountlistindex(FTEPROD), PlanFTEProduction.Value, True);
  DataCollect.psdate := DataModuleClient.DepartmentsCURRENTPLANSTART.Value;
  DataCollect.pedate := DataModuleClient.DepartmentsCURRENTPLANEND.Value;
  DataCollect.AccountingFmt := False;
  DataCollect.CalcNetProfit;
end;

{
procedure TTargetingProfitF.CalcNetProfit;
var
  daysinyear: integer;
  j: integer;
  TCOGS, TNOP, TNP : currency;
  PlanSalesDataRec : TPlanDataRecPtr;
  PlanCogsDataRec : TPlanDataRecPtr;
  PlanGPDataRec : TPlanDataRecPtr;
  PlanExpDataRec : TPlanDataRecPtr;
  PlanNOPDataRec : TPlanDataRecPtr;
  PlanOtherDataRec : TPlanDataRecPtr;
  PlanNPDataRec : TPlanDataRecPtr;
begin
  PlanSalesDataRec := PlanDataList.Items[GetAccountListIndex(SALES)];
  PlanCogsDataRec := PlanDataList.Items[GetAccountListIndex(COGS)];
  PlanGPDataRec := PlanDataList.Items[GetAccountListIndex(GROSSPROFIT)];
  PlanExpDataRec := PlanDataList.Items[GetAccountListIndex(TOTALEXPENSES)];
  PlanNOPDataRec := PlanDataList.Items[GetAccountListIndex(NETOPERATINGPROFIT)];
  PlanOtherDataRec := PlanDataList.Items[GetAccountListIndex(OTHERINCOME)];
  PlanNPDataRec := PlanDataList.Items[GetAccountListIndex(NETPROFIT)];

  daysinyear := trunc(DataModuleClient.DepartmentsCurrentPlanEnd.value) - trunc(DataModuleClient.DepartmentsCurrentPlanStart.value);
  TCOGS := 0;
  TNOP := 0;
  TNP := 0;
  for j := 0 to daysinyear do    // Iterate
    begin
    PlanCogsDataRec.PlanDetail[j] := PlanSalesDataRec.PlanDetail[j] - PlanGPDataRec.PlanDetail[j];
    TCOGS := TCOGS + PlanCogsDataRec.PlanDetail[j];
    PlanNOPDataRec.PlanDetail[j] := PlanGPDataRec.PlanDetail[j] - PlanExpDataRec.PlanDetail[j];
    TNOP := TNOP + PlanNopDataRec.PlanDetail[j];
    PlanNPDataRec.PlanDetail[j] := PlanNOPDataRec.PlanDetail[j] + PlanOtherDataRec.PlanDetail[j];
    TNP := TNP + PlanNPDataRec.PlanDetail[j];
    PlanCogsDataRec.PlanTotal := TCOGS;
    PlanNOPDataRec.PlanTotal := TNOP;
    PlanNPDataRec.PlanTotal := TNP;
    end;    // for
end;
}
procedure TTargetingProfitF.cxTabSheet2Show(Sender: TObject);
begin
  GGlobals.DebugOut('Plan: Targeting activity Page 2');
  setlabels;
  FindPastDate;
  cxlabel7.caption := DataModuleClient.DateRangersStartDate.DisplayText + ' to ' +
    DataModuleClient.DateRangersEndDate.DisplayText;
  cxlabel4.caption := DataModuleClient.DepartmentsCurrentPlanStart.DisplayText + ' to ' +
  DataModuleClient.DepartmentsCurrentPlanEnd.DisplayText;
  cxLabel7.Refresh;
  cxLabel4.Refresh;
  getplanactivitybalances;
end;

procedure TTargetingProfitF.cxButton1Click(Sender: TObject);
begin
  if DataModuleClient.DateRangers.RecordCount > 1 then
    begin
    Application.CreateForm(TPastPeriodSelectionF, PastPeriodSelectionF);
    PastPeriodSelectionF.ShowModal;
    PastPeriodSelectionF.Free;
    end;
  SetPeriodlabel;
end;

procedure TTargetingProfitF.TargetExpensesBtnClick(Sender: TObject);
var
  idx : Integer;
begin
  GGlobals.DebugOut('Targeting Profit: Target Expenses');
  Screen.Cursor := crHourGlass;
  Application.CreateForm(TDetailExpensesF, DetailExpensesF);
  DataCollect.GetDetailedOptions(DataModuleClient.DepartmentsDEPT_ID.Value);
  Idx := strtoint(currtostr(DataCollect.detailedOptions[43]));
  if (idx < 4) or (Idx > 6) then
    idx := 4;
  DetailExpensesF.RGIndex.ItemIndex := idx;
  DetailExpensesF.ShowModal;
  if DetailExpensesF.RGIndex.ItemIndex < 0 then
    DetailExpensesF.RGIndex.ItemIndex := 0;
  DataCollect.detailedOptions[43] := DetailExpensesF.RGIndex.ItemIndex;
  DetailExpensesF.Free;
  DataCollect.SetDetailedOptions(DataModuleClient.DepartmentsDEPT_ID.Value);
  // Calculate NP
  setListPlanBalance(GetAccountListIndex(NETOPERATINGPROFIT),
                     Round(GetListPlanBalance(GetAccountListIndex(GROSSPROFIT))
                     - GetListPlanBalance(getAccountListIndex(TOTALEXPENSES))), True);
  setListPlanBalance(GetAccountListIndex(NETPROFIT),
                     Round(GetListPlanBalance(GetAccountListIndex(NETOPERATINGPROFIT))
                     - GetListPlanBalance(getAccountListIndex(OTHERINCOME))), True);

  cxPNLGrid1TableView1.DataController.CustomDataSource.DataChanged;
  screen.Cursor := crDefault;
end;

procedure TTargetingProfitF.CalculatePlanActivity(accountno : integer);
var
  Hoursmins : Currency;
begin
  cxCurrencyUpdate := True;
  if GGlobals.UnitRounding = 0 then
    begin
    PlanBilledUnits.value := round(PlanBilledUnits.value);
    end;

  case accountno of    //
    SALES:
      begin
      if PlanBilledUnits.value <> 0 then
        begin
        PlanSalesUnit.value := ActivityPlanSales.value / PlanBilledUnits.value;
        PlanGPUnit.value := ActivityPlanGP.value / PlanBilledUnits.value;
        end;
      end;
    BILLED:
      begin
      if PlanGPUnit.value <> 0 then
        PlanBilledUnits.Value := ActivityPlanGP.value / PlanGPUnit.value;
      if GGlobals.UnitRounding = 0 then
        begin
        PlanBilledUnits.Value := Round(PlanBilledUnits.Value);
        PlanPotUnits.Value := Round(PlanPotUnits.Value);
        end;
      CalculatePlanActivity(SALES);
      end;
    POTENTIAL:
      begin
      if (PlanPotUnits.value <> 0) and (PlanProd.value <> 0) then
        PlanBilledUnits.value := PlanPotUnits.value * PlanProd.Value / 100;
      end;
    PRODUCTIVITY:
      Begin
      if PlanProd.value <> 0 then
        PlanBilledUnits.value := PlanProd.value * PlanPotUnits.value / 100;
      if GGlobals.UnitRounding = 0 then
        begin
        PlanBilledUnits.Value := Round(PlanBilledUnits.Value);
        PlanPotUnits.Value := Round(PlanPotUnits.Value);
        end;
      if PlanBilledUnits.value <> 0 then
        begin
        PlanSalesUnit.value := ActivityPlanSales.value / PlanBilledUnits.value;
        PlanGPUnit.value := ActivityPlanGP.value / PlanBilledUnits.value;
        end;
      end;
  end;    // case
  HoursperdayLbl.caption := '';
  if (PlanPotUnits.Value <> 0) and (PlanBilledUnits.value <> 0) then
    PlanProd.value := PlanBilledUnits.value  * 100 / PlanPotUnits.value
  else
    PlanProd.value := 0;
  if (PlanProd.value > 0) then //and (PlanProd.value < 75)
    begin
    Hoursmins := PlanBilledUnits.value  * 8 / PlanPotUnits.value;
    HoursperdayLbl.caption := '= ' + inttostr(trunc(hoursmins)) + 'hr ' + inttostr(trunc(Hoursmins * 60) mod 60) + 'mins';
    end;
  cxCurrencyUpdate := False;
end;

procedure TTargetingProfitF.PlanFTEExit(Sender: TObject);
begin
  if Not cxCurrencyUpdate then
    begin
    PlanSalesFTE.Value := 0;
    PlanGPFTE.Value := 0;
    if PlanFTE.Value <> 0 then
      begin
      PlanSalesFTE.Value := ActivityPlanSales.Value / PlanFTE.Value;
      PlanGPFTE.Value := ActivityPlanGP.Value / PlanFTE.Value;
      end;
    end;
end;

procedure TTargetingProfitF.PlanPotUnitsExit(Sender: TObject);
begin
  if Not cxCurrencyUpdate then
    begin
    CalculatePlanActivity(SALES);
    end;
end;

procedure TTargetingProfitF.PlanBilledUnitsExit(Sender: TObject);
begin
  if Not cxCurrencyUpdate then
    begin
    CalculatePlanActivity(SALES);
    end;
end;

procedure TTargetingProfitF.PlanProdExit(Sender: TObject);
begin
  if Not cxCurrencyUpdate then
    begin
    CalculatePlanActivity(PRODUCTIVITY);
    end;
end;

procedure TTargetingProfitF.PlanSalesUnitExit(Sender: TObject);
var
  fGPPC : Currency;
begin
  if Not cxCurrencyUpdate then
    begin
    if ActivityPlanSales.Value <> 0 then
      fGPPC := ActivityPlanGP.value * 100 / ActivityPlanSales.Value
    else
      fGPPC := 0;
    if PlanSalesUnit.Value <> 0 then
      begin
      ActivityPlanSales.value := PlanSalesUnit.Value * PlanBilledUnits.Value;
      if fGPPC <> 0 then
        ActivityPlanGP.value := ActivityPlanSales.Value * fGPPC / 100;
      CalculatePlanActivity(SALES);
      end;
    end;
end;

procedure TTargetingProfitF.PlanGPUnitExit(Sender: TObject);
begin
  if Not cxCurrencyUpdate then
    begin
    if PlanBilledUnits.Value <> 0 then
      ActivityPlanGP.value := PlanBilledUnits.Value * PlanGPUnit.Value;
    CalculatePlanActivity(BILLED);
    end;
end;

procedure TTargetingProfitF.PlanFTEProductionExit(Sender: TObject);
begin
  if Not cxCurrencyUpdate then
    begin
    setListPlanBalance(getaccountlistindex(FTEPROD), PlanFTEProduction.Value, True);
    end;
end;

procedure TTargetingProfitF.cxButton2Click(Sender: TObject);
var
  Idx : Integer;
begin
  // Before we go there, we MUST have Sales, Gross Profit and Billed UNITS > 0
  if (ActivityPlanSales.Value = 0) or
      (ActivityPlanGP.Value = 0) or
      (PlanBilledUnits.Value = 0)  then
		begin
    Messagedlg('Sales, Gross Profit and Billed Units must all have values before these details can be targeted', mtWarning, [mbOK], 0);
    exit;
    end;

  setPlanActivityBalances;
  // start window with modal show
  Application.CreateForm(TDetailTargetsF, DetailTargetsF);
	DetailTargetsF.SingularTitle := DataModuleClient.DepartmentsSINGULAR_UNITDESC.AsString;
  DetailTargetsF.PluralTitle := DataModuleClient.DepartmentsPLURAL_UNITDESC.AsString;
  DataCollect.GetDetailedOptions(DataModuleClient.DepartmentsDEPT_ID.Value);
  Idx := strtoint(currtostr(DataCollect.detailedOptions[41]));
  if (idx < 1) or (Idx > 6) then
    idx := 1;
  DetailTargetsF.RGIndex.ItemIndex := idx;
  Idx := strtoint(currtostr(DataCollect.detailedOptions[42])) + 1;
  if (idx < 1) or (idx > 14) then
    idx := 0;
  DetailTargetsF.SetCheckedAccount(idx); // zero Based
  DetailTargetsF.SetCalcMode(strtoint(currtostr(DataCollect.detailedOptions[43])) = 1);
  DetailTargetsF.ShowModal;
  if DetailTargetsF.RGIndex.ItemIndex < 0 then
    DetailTargetsF.RGIndex.ItemIndex := 0;
  DataCollect.detailedOptions[41] := DetailTargetsF.RGIndex.ItemIndex;
  if DetailTargetsF.getCheckedaccount < 1 then
    DataCollect.detailedOptions[42] := 1
  else
    DataCollect.detailedOptions[42] := DetailTargetsF.getCheckedaccount - 1; // Zero Based
  if DetailTargetsF.GetCalcMode then
    DataCollect.detailedOptions[43] := 1
  else
    DataCollect.detailedOptions[43] := 0;
  DataCollect.SetDetailedOptions(DataModuleClient.DepartmentsDEPT_ID.Value);
  DetailTargetsF.Free;
  getplanactivitybalances;
  calculatePlanActivity(SALES);
end;

procedure TTargetingProfitF.cxTabSheet2Exit(Sender: TObject);
begin
  setPlanActivityBalances;
end;

procedure TTargetingProfitF.cxTabSheet1Show(Sender: TObject);
begin
  FindPastDate;
  ColPastAmount.Caption := 'Past Period ' + DataModuleClient.DateRangersStartDate.DisplayText + ' to ' +
  DataModuleClient.DateRangersEndDate.DisplayText;
  colTarget.Caption := 'Target Amount ' + DataModuleClient.DepartmentsCurrentPlanStart.DisplayText + ' to ' +
  DataModuleClient.DepartmentsCurrentPlanEnd.DisplayText;
  calculatePlanData(SALES);
  cxPNLGrid1TableView1.DataController.CustomDataSource.DataChanged;
end;

end.
