unit TargetActivity;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons, cxPC,
  cxControls, DMrep1U, cxTextEdit, cxDBEdit, ExtCtrls, DMCLient, Datacollector,
  LGlobals, cxCurrencyEdit, cxMaskEdit, cxDropDownEdit, auchtypes,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridCustomView,
  cxGridLevel, cxGrid, cxCustomData, cxDataStorage, EPGfxCmp, Buttons,
  cxGroupBox;

type
  TPastInformationF = class(TForm)
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    NextFinishBtn: TcxButton;
    PrevBtn: TcxButton;
    CancelBtn: TcxButton;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxButton2: TcxButton;
    cxPNLGrid1Level1: TcxGridLevel;
    cxPNLGrid1: TcxGrid;
    cxPNLGrid1TableView1: TcxGridTableView;
    cxPNLGrid1TableView1Title: TcxGridColumn;
    cxPNLGrid1TableView1SubTitle: TcxGridColumn;
    cxPNLGrid1TableView1Amount: TcxGridColumn;
    cxPNLGrid1TableView1percent: TcxGridColumn;
    cxLabel4: TcxLabel;
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
    WorkBackBtn: TcxButton;
    PastInvoicesBn: TcxButton;
    cxLabel7: TcxLabel;
    HelpProdFTEBtn: TcxButton;
    cxButton1: TcxButton;
    cxButton3: TcxButton;
    procedure NextFinishBtnClick(Sender: TObject);
    procedure PrevBtnClick(Sender: TObject);
    procedure cxPageControl1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure PastFTEExit(Sender: TObject);
    procedure PastPotUnitsExit(Sender: TObject);
    procedure PastUnitsSoldExit(Sender: TObject);
    procedure PastProdExit(Sender: TObject);
    procedure PastSaleUnitExit(Sender: TObject);
    procedure PastGPUnitExit(Sender: TObject);
    procedure HelpTotalFteBtnClick(Sender: TObject);
    procedure HelpPotentialUnitsBtnClick(Sender: TObject);
    procedure HelpPotentialHoursBtnClick(Sender: TObject);
    procedure PastInvoicesBnClick(Sender: TObject);
    procedure WorkBackBtnClick(Sender: TObject);
    procedure cxTabSheet2Exit(Sender: TObject);
    procedure HelpProdFTEBtnClick(Sender: TObject);
    procedure cxTabSheet2Show(Sender: TObject);
    procedure PastFTEProductionExit(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
    CancelPressed: Boolean;
    cxCurrencyUpdate : Boolean;
    procedure calculatePastData(AccountNo: integer);
    procedure SetPeriodLabel;
    procedure Finish;
    procedure setlabels;
    procedure getpastactivitybalances;
    procedure setpastactivitybalances;
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
  PastInformationF: TPastInformationF;

implementation

uses DIYPlanExpenses, HelpTotalFte, HelpPotentialUnits, HelpPotentialHours,
  Invoices, Workback, HelpProdFTE, PastPeriodSelection;

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
          2, 3:
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
    0: Result := StrPas(PNLRec.AccountTitle);
    1: Result := strPas(PNLRec.AccountSubTitle);
    2: Result := PNLRec.PastBalances[DataModuleClient.DateRangersD_Index.value - 1];
    3: Result := PNLRec.PastResultPc;
  end;    // case
end;

procedure TPNLDataSource.SetValue(ARecordHandle: TcxDataRecordHandle;
  AItemHandle: TcxDataItemHandle; const AValue: Variant);
var
  ADataBinding: TcxGridItemDataBinding;
  PNLRec : TPlanDataRecPtr;
  TValue : Currency;
begin
  ADataBinding := TcxGridItemDataBinding(AItemHandle);
  PNLREc := FPNLLIST[Integer(ARecordHandle)];
  if Integer(ADataBinding.Data) = 2 then    //
    begin
    PNLRec.PastBalances[DataModuleClient.DateRangersD_Index.value - 1] := AValue;
    PastInformationF.calculatePastData(PNLREC.Accountno);
    DataChanged;
    end;
end;

function TPNLDataSource.GetItemHandle(AItemIndex: Integer): TcxDataItemHandle;
begin
  Result := TcxDataItemHandle(GetDataBinding(AItemIndex));
end;

procedure TPastInformationF.NextFinishBtnClick(Sender: TObject);
begin
  if cxPageControl1.ActivePageIndex < (cxPageControl1.PageCount - 1) then
    begin
    cxPageControl1.ActivePageIndex := cxPageControl1.ActivePageIndex + 1;
    if cxPageControl1.ActivePageIndex = (cxPageControl1.PageCount - 1) then
      NextFinishBtn.Caption := 'Finish'
    else
      NextFinishBtn.Caption := 'Next';
    end
  else
    begin
    CancelPressed := False;
    Finish;
    end;
end;

procedure TPastInformationF.Finish;
begin
  if Not CancelPressed then
    begin
    if DataCollect.Planloaded = True then
      DataCollect.setPlanningData;
    end;
  DataCollect.ClearPlanDataList;
  DataCollect.ClearPlanExpDataList;
  DataCollect.ClearConsolidatedList;
  Close;
end;

procedure TPastInformationF.PrevBtnClick(Sender: TObject);
begin
  if cxPageControl1.ActivePageIndex = (cxPageControl1.PageCount - 1) then
    NextFinishBtn.Caption := 'Next';
 if cxPageControl1.ActivePageIndex > 0 then
  cxPageControl1.ActivePageIndex := cxPageControl1.ActivePageIndex - 1;
end;

procedure TPastInformationF.cxPageControl1Change(Sender: TObject);
begin
if cxPageControl1.ActivePageIndex = 0 then
  PrevBtn.Enabled := False
else
  PrevBtn.Enabled := True;
//SetPeriodLabel;
end;

procedure TPastInformationF.calculatePastData(AccountNo: integer);
var
  tempbal : Currency;
  cn : integer;
begin
  case Accountno of
    SALES:;
    GROSSPROFIT:
      begin
      tempbal := GetListPastBalance(GetAccountListIndex(COGS));
      if tempbal = 0 then
        begin
        tempbal :=  GetListPastBalance(GetAccountListIndex(SALES))
         - TPlanDataRecPtr(PlanDataList.Items[GetAccountListIndex(GROSSPROFIT)]).PastBalances[DataModuleClient.DateRangersD_Index.Value - 1];
        setListPastBalance(getAccountListIndex(COGS), tempbal);
        end;
      end;
    COGS:
      Begin
      tempbal :=  GetListPastBalance(GetAccountListIndex(SALES))
      - TPlanDataRecPtr(PlanDataList.Items[GetAccountListIndex(COGS)]).PastBalances[DataModuleClient.DateRangersD_Index.value - 1];
      setListPastBalance(getAccountListIndex(GROSSPROFIT), tempbal);
      end;
    TOTALEXPENSES:
      begin
      tempbal :=  GetListPastBalance(GetAccountListIndex(GROSSPROFIT))
      - TPlanDataRecPtr(PlanDataList.Items[GetAccountListIndex(TOTALEXPENSES)]).PastBalances[DataModuleClient.DateRangersD_Index.value - 1];
      setListPastBalance(getAccountListIndex(NETOPERATINGPROFIT), tempbal);
      End;
    NETOPERATINGPROFIT:
      begin
      tempbal := GetListPastBalance(GetAccountListIndex(TOTALEXPENSES));
      if tempbal = 0 then
        begin
        tempbal :=  GetListPastBalance(GetAccountListIndex(GROSSPROFIT))
        - TPlanDataRecPtr(PlanDataList.Items[GetAccountListIndex(NETOPERATINGPROFIT)]).PastBalances[DataModuleClient.DateRangersD_Index.value - 1];
        setListPastBalance(getAccountListIndex(TOTALEXPENSES), tempbal);
        end;
      end;
    OTHERINCOME:;
    NETPROFIT:
      begin
      tempbal := GetListPastBalance(GetAccountListIndex(OTHERINCOME));
      if tempbal = 0 then
        begin
        tempbal :=  TPlanDataRecPtr(PlanDataList.Items[GetAccountListIndex(NETPROFIT)]).PastBalances[DataModuleClient.DateRangersD_Index.value - 1]
        - GetListPastBalance(GetAccountListIndex(NETOPERATINGPROFIT));
        setListPastBalance(getAccountListIndex(OTHERINCOME), tempbal);
        end;
      end;
  end;
    // set the main balances
  tempbal := GetListPastBalance(GetAccountListIndex(SALES)) - GetListPastBalance(GetAccountListIndex(COGS));
  setListPastBalance(getAccountListIndex(GROSSPROFIT), tempbal);
  tempbal := tempbal - GetListPastBalance(GetAccountListIndex(TOTALEXPENSES));
  setListPastBalance(getAccountListIndex(NETOPERATINGPROFIT), tempbal);
  tempbal := tempbal + GetListPastBalance(GetAccountListIndex(OTHERINCOME));
  setListPastBalance(getAccountListIndex(NETPROFIT), tempbal);
  // set Percentage to Sales
  cn := 0;
  tempbal := GetListPastBalance(GetAccountListIndex(SALES));
  repeat
    if tempbal <> 0 then
      TPlanDataRecPtr(PlanDataList.Items[cn]).PastResultpc := GetListPastBalance(cn) * 100 / tempbal
    else
      TPlanDataRecPtr(PlanDataList.Items[cn]).PastResultpc := 0;
    inc(cn);
  until  TPlanDataRecPtr(PlanDataList.Items[cn - 1]).accountno = NETPROFIT;
//  LoadPastPnl;
end;

procedure TPastInformationF.FormCreate(Sender: TObject);
var
  I : Integer;
begin
  color := GGlobals.FormColour;
  if DataModuleClient.DateRangers.RecordCount < 2 then
    begin
    cxButton1.Visible := False;
    cxButton3.Visible := False;
    end;
  Caption := 'Past Information - ' + DataModuleClient.BusinessDetailsBUSINESS_NAME.Value;
  for I := 0 to cxPageControl1.PageCount - 1 do    // Iterate
    cxPageControl1.Pages[I].Color := GGlobals.FormColour;
  cxPageControl1.ActivePage := cxTabSheet1;
  cxPageControl1Change(Sender);

  DataCollect.GetConsolidatedList(False);
  if DataCollect.Planloaded = false then
    Begin
    DataCollect.getPlanningData;
    end;
  GenerateColumns(cxPNLGrid1TableView1);
  cxPNLGrid1TableView1.DataController.CustomDataSource := TPNLDataSource.Create(PlanDataList);

  SetPeriodLabel;
end;

procedure TPastInformationF.cxButton2Click(Sender: TObject);
begin
  GGlobals.DebugOut('Plan: Past Expenses');
  DetailedExpensesPast := True;
  screen.Cursor := crHourGlass;
  Application.CreateForm(TDIYPlanExpensesF, DIYPlanExpensesF);
  DIYPlanExpensesF.Showmodal;
  DIYPlanExpensesF.free;
end;

procedure TPastInformationF.SetPeriodLabel;
begin
  if cxPageControl1.ActivePage = cxTabsheet1 then
    begin
    calculatePastData(SALES);
    cxPNLGrid1TableView1.DataController.CustomDataSource.DataChanged;
    DataModuleClient.DateRangersSTARTDATE.DisplayFormat := GGlobals.GetDateFENH;
    DataModuleClient.DateRangersENDDATE.DisplayFormat := GGlobals.GetDateFENH;
    cxlabel4.caption := DataModuleClient.DateRangersStartDate.DisplayText + ' to ' +
      DataModuleClient.DateRangersEndDate.DisplayText;
    cxLabel4.Refresh;
    cxLabel4.Refresh;
    end;
  if cxPageControl1.ActivePage = cxTabsheet2 then
    begin
    DataModuleClient.DateRangersSTARTDATE.DisplayFormat := GGlobals.GetDateFENH;
    DataModuleClient.DateRangersENDDATE.DisplayFormat := GGlobals.GetDateFENH;
    cxlabel7.caption := DataModuleClient.DateRangersStartDate.DisplayText + ' to ' +
      DataModuleClient.DateRangersEndDate.DisplayText;
    cxLabel7.Refresh;
    getpastactivitybalances;
    end;
end;

procedure TPastInformationF.getpastactivitybalances;
var
  Hoursmins, UnitsSold, UnitsPot, PastProdFTE, PastOther : Currency;
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
  HoursperdayLbl.Caption := ' ';
  if (PastProd.value > 0) then
    begin
    Hoursmins := PastUnitsSold.value  * 8 / PastPotUnits.value;
    HoursperdayLbl.caption := '= ' + inttostr(trunc(hoursmins)) + 'hr ' + inttostr(trunc(Hoursmins * 60) mod 60) + 'mins';
    end;
  HoursperdayLbl.Refresh;
  PastSalesFTE.Value := 0;
  PastGPFTE.Value := 0;
  if PastOther <> 0 then
    begin
    PastSalesFTE.Value := ActivityPastSales.Value / PastOther;
    PastGPFTE.Value := ActivityPastGP.Value / PastOther;
    end;
  cxCurrencyUpdate := False;
end;


procedure TPastInformationF.setlabels;
var
  Base: Integer;
begin
  Base := 72;
  if (DataModuleClient.DepartmentsSingular_UnitDesc.value = 'Hour') or
    (DataModuleClient.DepartmentsPlural_UnitDesc.value = 'Hours')then
    begin
// This is the default setting but we must ensure that all controls are in the correct order.
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
    Label18.Top := Base + 129;
    PastPotUnits.Top := base + 128;
    Label15.Top := Base + 161;
    PastUnitsSold.top := Base + 160;
    Label19.top := Base + 193;
    HoursperdayLbl.Top := Base + 193;
    PastProd.Top := Base + 192;
    Label16.Top := Base + 225;
    PastSaleUnit.Top := Base + 224;
    Label17.top := Base + 257;
    PastGPUnit.top := base + 256;
    PastFteProduction.TabOrder := 25;
    PastPotUnits.TabOrder := 26;
    PastUnitsSold.TabOrder := 27;
    PastProd.TabOrder := 28;
    PastSaleUnit.TabOrder := 29;
    PastGPUnit.tabOrder := 30;

    Label15.Caption := 'Actual ' + DataModuleClient.DepartmentsPlural_UnitDesc.value
      + ' Sold = B / I';
    Label16.Caption := 'Average Sales (Revenue) per ' + DataModuleClient.DepartmentsSingular_UnitDesc.value
      + ' = A / F';
    Label19.Caption := '% Activity Level = F / E';
    Label17.Caption := 'Average Gross Profit (Contribution) per ' + DataModuleClient.DepartmentsSingular_UnitDesc.value + ' = B / F';
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
    Label15.Top := Base + 129;
    PastUnitsSold.top := Base + 128;
    Label19.top := Base + 161;
    HoursperdayLbl.Top := Base + 161;
    PastProd.Top := Base + 160;
    Label16.Top := Base + 193;
    PastSaleUnit.Top := Base + 192;
    Label17.top := Base + 225;
    PastGPUnit.top := base + 224;
    PastPotUnits.TabOrder := 26;
    PastUnitsSold.TabOrder := 27;
    PastProd.TabOrder := 28;
    PastSaleUnit.TabOrder := 29;
    PastGPUnit.tabOrder := 30;
    Label15.Caption := 'Number of ' + DataModuleClient.DepartmentsPlural_UnitDesc.value
      + ' Made or sold = A / G';
    Label16.Caption := 'Average Sales (Revenue) per ' + DataModuleClient.DepartmentsSingular_UnitDesc.value + ' = A / E';
    Label19.Caption := '% Activity Level = E / D';
    Label17.Caption := 'Average Gross Profit (Contribution) per ' + DataModuleClient.DepartmentsSingular_UnitDesc.value + ' = B / E';
    HoursperdayLbl.Visible := False;
    end;
  Label18.Caption := 'Potential ' + DataModuleClient.DepartmentsPlural_UnitDesc.value;
end;


procedure TPastInformationF.CancelBtnClick(Sender: TObject);
begin
  CancelPressed := True;
  finish;
end;

procedure TPastInformationF.PastFTEExit(Sender: TObject);
begin
  if not cxCurrencyUpdate then
    begin
    setListPastBalance(getaccountlistindex(FTEOTHER), PastFTE.Value);
    getpastactivitybalances;
    end;

{  if PastFTE.Value <> 0 then
    begin
    PastSalesFTE.Value := ActivityPastSales.Value / PastFTE.Value;
    PastGPFTE.Value := ActivityPastGP.Value / PastFTE.Value;
    end;
}
end;

procedure TPastInformationF.PastPotUnitsExit(Sender: TObject);
begin
  if not cxCurrencyUpdate then
    begin
    setListPastBalance(getaccountlistindex(POTENTIAL), PastPotUnits.value);
    getpastactivitybalances;
    end;
end;

procedure TPastInformationF.PastUnitsSoldExit(Sender: TObject);
var
  unitsSold : currency;
begin
  if not cxCurrencyUpdate then
    begin
    UnitsSold := PastUnitsSold.Value;
    if GGlobals.UnitRounding = 0 then
      UnitsSold := round(UnitsSold);
    setListPastBalance(getaccountlistindex(BILLED), UnitsSold);
    getpastactivitybalances;
    end;
end;

procedure TPastInformationF.PastProdExit(Sender: TObject);
var
  tempbal, unitssold, potunits : currency;
begin
  if not cxCurrencyUpdate then
    begin
    tempbal := PastProd.Value;
    Potunits := getListPastBalance(getaccountlistindex(POTENTIAL));
    if tempbal <> 0 then
      UnitsSold := PotUnits * tempbal / 100;
    if GGlobals.UnitRounding = 0 then
      begin
      UnitsSold := round(UnitsSold);
      PotUnits := round(PotUnits);
      end;
    setListPastBalance(getaccountlistindex(BILLED), UnitsSold);
    getpastactivitybalances;
    end;
end;

procedure TPastInformationF.PastSaleUnitExit(Sender: TObject);
var
  unitsale, unitssold : currency;
begin
  if not cxCurrencyUpdate then
    begin
    unitsale := PastSaleUnit.value;
    if UnitSale <> 0 then
      UnitsSold := ActivityPastSales.Value / unitsale;
    setListPastBalance(getaccountlistindex(BILLED), UnitsSold);
    getpastactivitybalances;
    end;
end;

procedure TPastInformationF.PastGPUnitExit(Sender: TObject);
var
  unitGP, unitssold : currency;
begin
  if not cxCurrencyUpdate then
    begin
    UnitGP := PastGPUnit.value;
    if UnitGP <> 0 then
      UnitsSold := ActivityPastGP.value / UnitGP;
    if GGlobals.UnitRounding = 0 then
      UnitsSold := round(UnitsSold);
    setListPastBalance(getaccountlistindex(BILLED), UnitsSold);
    getpastactivitybalances;
    PastFte.SetFocus;
    end;
end;

procedure TPastInformationF.HelpTotalFteBtnClick(Sender: TObject);
begin
  GGlobals.DebugOut('Plan: FTE HElp');
  Application.CreateForm(THelpTotalFteF, HelpTotalFteF);
  HelpTotalFTEF.showmodal;
  HelpTotalFTEF.free;
end;

procedure TPastInformationF.HelpPotentialUnitsBtnClick(Sender: TObject);
begin
  GGlobals.DebugOut('Plan: Past Potential Units Help');
  Application.CreateForm(THelpPotentialUnitsF, HelpPotentialUnitsF);
  HelpPotentialUnitsF.showmodal;
  HelpPotentialUnitsF.free;
end;

procedure TPastInformationF.HelpPotentialHoursBtnClick(Sender: TObject);
begin
  GGlobals.DebugOut('Plan: Past Potential Hours Help');
  Application.CreateForm(THelpPotentialHoursF, HelpPotentialHoursF);
  HelpPotentialHoursF.showmodal;
  cxCurrencyUpdate := True;
  if HelpPotentialHoursF.UserSelected <> 0 then
    PastPotUnits.value := PastFTEProduction.value * HelpPotentialHoursF.UserSelected;
  if GGlobals.UnitRounding = 0 then PastPotUnits.value := Round(PastPotUnits.value);
  cxCurrencyUpdate := False;
  HelpPotentialHoursF.free;
end;

procedure TPastInformationF.PastInvoicesBnClick(Sender: TObject);
var
  UnitsSold : Currency;
begin
  GGlobals.DebugOut('Plan: Past Invoices HElp');
  LocalInvType := AnalysisInv;
  LocalStartDate := DataModuleClient.DateRangersStartDate.Value;
  LocalEndDate := DataModuleClient.DateRangersEndDate.Value;
  Application.CreateForm(TInvoicesF, InvoicesF);

//  InvoicesF.setUnitsDesc(AComboBox1.Items[AComboBox1.Itemindex], AComboBox2.Items[AComboBox2.Itemindex]);
  InvoicesF.ShowModal;
  if InvoiceRate > 0 then
    begin
    if not cxCurrencyUpdate then
      begin
      if InvoiceRate  <> 0 then
        UnitsSold := ActivityPastGP.value / InvoiceRate;
      if GGlobals.UnitRounding = 0 then
        UnitsSold := round(UnitsSold);
      setListPastBalance(getaccountlistindex(BILLED), UnitsSold);
      getpastactivitybalances;
      end;
    end;
    InvoicesF.free;
end;

procedure TPastInformationF.WorkBackBtnClick(Sender: TObject);
var
  j : integer;
  UnitsSold : currency;
  WBBalances : TPastBalances;
begin
  GGlobals.DebugOut('Plan: Past WB HElp');
  WBData[0] := getListPastBalance(getaccountlistindex(SALES));
  WBData[1] := getListPastBalance(getaccountlistindex(GROSSPROFIT));
  for j := 2 to WORKBACKLIST - 1
    do begin   // Iterate
    DataCollect.GetPastBalances(WBBalances, WorkBackAccounts[j]);
    WBData[j] := WBBalances[DataModuleClient.DateRangersD_Index.value - 1];
  end;
  Application.CreateForm(TWorkBackF, WorkBackF);
  if WorkBackF.ShowModal = mrOK then
  begin
    if (WBData[LABOURHOURS] > 0) then
    begin
      UnitsSold := WBData[LABOURHOURS];
      if GGlobals.UnitRounding = 0 then UnitsSold := round(UnitsSold);
      setListPastBalance(getaccountlistindex(BILLED), UnitsSold);
      getpastactivitybalances;
      for j := 2 to WORKBACKLIST - 1 do
      begin   // Iterate
        DataCollect.setPastBalance(@WBData[j], WorkBackAccounts[j]);
      end;
    end;
  end;
  WorkBackF.free;
end;

procedure TPastInformationF.cxTabSheet2Exit(Sender: TObject);
begin
  setPastActivityBalances;
end;

procedure TPastInformationF.HelpProdFTEBtnClick(Sender: TObject);
begin
  GGlobals.DebugOut('Plan: Plan Prod FTE Help');
  Application.CreateForm(THelpProdFTEF, HelpProdFTEF);
  HelpProdFTEF.showmodal;
  HelpProdFTEF.free;
end;

procedure TPastInformationF.setpastactivitybalances;
begin
{  cxCurrencyUpdate := True;
  setListPastBalance(getaccountlistindex(BILLED), PastUnitsSold.Value);
  setListPastBalance(getaccountlistindex(POTENTIAL), PastPotUnits.value);
  setListPastBalance(getaccountlistindex(FTEPROD), PastFTEProduction.Value);
  setListPastBalance(getaccountlistindex(FTEOTHER), PastFTE.Value);
  cxCurrencyUpdate := False;
}
end;

procedure TPastInformationF.cxTabSheet2Show(Sender: TObject);
begin
  GGlobals.DebugOut('Plan: Enter Page 4');
  cxLabel5.Caption := 'Pinpointing Activity and Contribution';
  setlabels;
  cxlabel7.caption := DataModuleClient.DateRangersStartDate.DisplayText + ' to ' +
    DataModuleClient.DateRangersEndDate.DisplayText;
  cxLabel7.Refresh;
  getpastactivitybalances;
end;

procedure TPastInformationF.PastFTEProductionExit(Sender: TObject);
begin
  setListPastBalance(getaccountlistindex(FTEPROD), PastFTEProduction.Value);
end;

procedure TPastInformationF.cxButton1Click(Sender: TObject);
begin
  if DataModuleClient.DateRangers.RecordCount > 1 then
    begin
    Application.CreateForm(TPastPeriodSelectionF, PastPeriodSelectionF);
    PastPeriodSelectionF.ShowModal;
    PastPeriodSelectionF.Free;
    end;
  SetPeriodlabel;
end;

end.
