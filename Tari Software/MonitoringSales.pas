unit MonitoringSales;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	StdCtrls, Buttons, AuchTypes, LGlobals, cxCustomData, DMrep1U,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxControls,
  cxGridCustomView, cxGridLevel, cxGrid, cxDataStorage, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCurrencyEdit, cxLabel,
	cxButtons, cxCheckBox, cxDBEdit, inifiles, cxDBLabel,
  ExtCtrls, IB_Components, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxFilter,
  cxData, Menus, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TMonitoringSalesF = class(TForm)
    GridLevel1: TcxGridLevel;
    cxGrid1: TcxGrid;
    MSTableView: TcxGridTableView;
    MSPeriodDate: TcxGridColumn;
    MSNETSALES: TcxGridColumn;
    MSCOGSold: TcxGridColumn;
    MSPotentialUnits: TcxGridColumn;
    MSGROSSPROFIT: TcxGridColumn;
    MSGPPercentage: TcxGridColumn;
    MSBUnits: TcxGridColumn;
    MSGrossProfitRate: TcxGridColumn;
    MSPeriodInterval: TcxComboBox;
    cxLabel2: TcxLabel;
    SaveLastDateCB: TcxCheckBox;
    InvoiceDataBtn: TcxButton;
    CloseBtn: TcxButton;
    ImportBtn: TcxButton;
    cxLabel15: TcxLabel;
    cxDBLabel4: TcxDBLabel;
    cxLabel14: TcxLabel;
    cxDBLabel3: TcxDBLabel;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure InvoiceDataBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MSTableViewFocusedItemChanged(Sender: TcxCustomGridTableView;
      APrevFocusedItem, AFocusedItem: TcxCustomGridTableItem);
    procedure CloseBtnClick(Sender: TObject);
  private
    { Private declarations }
    OldMonitorSummary: currency;
    Initialised: Boolean;
    Formactive: Boolean;
    ComboBox1State: integer;
    CurrentRow : integer;
    procedure CalculateArray(Accountno: integer);
    procedure CalcDetail(PlanDataRec : TPlanDataRecPtr; OldMonitSummary : Currency; Currentrow, CurrentCol : integer);
    procedure DetailedCalc (var Parray: array of currency; AccountNo: integer);
    function GetPotentialValue: Currency;
//    function UpdateInterfaceIni: String;
    procedure SetLocalMonitoringPeriod;
  public
    { Public declarations }
    YearDates : Array[0 .. NUM_DAYSINYEAR + 7] of string;
    LatestPeriod : integer;
    Oldvalues, NewValues : array[0..MSEND - 1] of currency;
    RecordPtr: array[0..MSEND - 1] of TPlanDataRecPtr;
    NumofRows : Integer;
  protected
    LastRowEnd: Integer;
    LastColEnd: Integer;
  end;

  TMSDataSource = class(TcxCustomDataSource)
  private
    FModified: boolean;
  protected
    function GetRecordCount: Integer; override;
    function GetDataBinding(AItemIndex: Integer): TcxGridItemDataBinding;
    Function GetItemHandle(AItemIndex: Integer): TcxDataItemHandle; override;
    function IsNativeCompare: Boolean; override;
    function GetValue(ARecordHandle: TcxDataRecordHandle;
      AItemHandle: TcxDataItemHandle): Variant; override;
    procedure SetValue(ARecordHandle: TcxDataRecordHandle;
      AItemHandle: TcxDataItemHandle; const AValue: Variant); override;
  public
    constructor Create;
    destructor Destroy; override;
    property Modified: boolean read FModified;
  end;

var
  MonitoringSalesF: TMonitoringSalesF;
  Tempcurr : currency;
  SGroupName : String;

implementation

uses DMClient, DataCollector, MonitoringInvoices;
{$R *.DFM}

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
          0:
            DataBinding.ValueTypeClass := TcxstringValueType;
          1, 2, 3, 4, 5, 6, 7:
            DataBinding.ValueTypeClass := TcxCurrencyValueType;
        end;    // case
      end;
    end;    // for
end;

{ TInvoiceDataSource }
constructor TMSDataSource.Create;
begin
  inherited Create;
end;

destructor TMSDataSource.Destroy;
begin
  inherited Destroy;
end;

function TMSDataSource.GetDataBinding(AItemIndex: Integer): TcxGridItemDataBinding;
begin
  Result := TcxCustomGridTableItem(DataController.GetItem(AItemIndex)).DataBinding;
end;

function TMSDataSource.GetRecordCount: Integer;
begin
  Result := MonitoringSalesF.NumofRows;
end;

function TMSDataSource.GetValue(ARecordHandle: TcxDataRecordHandle; AItemHandle: TcxDataItemHandle): Variant;
var
  ADataBinding: TcxGridItemDataBinding;
  AccRec : TPlanDataRecPtr;
  AccSalesRec : TPlanDataRecPtr;
  SalesTotal : Currency;
begin
  ADataBinding := TcxGridItemDataBinding(AItemHandle);
//  if Integer(ARecordHandle) > 365 then Exit;
//    SalesTotal := 0;

  if Integer(ADataBinding.Data) = 0 then
    begin
    if MonitoringSalesF.MSPeriodInterval.itemindex = 0 then
      Result := MonitoringSalesF.YearDates[Integer(ARecordHandle)]
    else
      result := MonitoringSalesF.YearDates[SummaryPeriodIndexArray[Integer(ARecordHandle)]];
    end
  else
    begin
    AccRec := MonitoringSalesF.RecordPtr[Integer(ADataBinding.Data) - 1];
    AccSalesRec := MonitoringSalesF.RecordPtr[1]; // Sales
    if MonitoringSalesF.MSPeriodInterval.itemIndex = 0 then
      begin
      Result := Accrec.PlanDetail[Integer(ARecordHandle)];
      SalesTotal := AccSalesRec.PlanDetail[Integer(ARecordHandle)];
      end
    else
      begin
      Result := Accrec.PlanSummary[Integer(ARecordHandle)];
      SalesTotal := AccSalesRec.PlanSummary[Integer(ARecordHandle)];
      end;
    if (Result = 0) and (SalesTotal <> 0) and (Integer(ADataBinding.Data) = 5) then
      begin
      Result := MonitoringSalesF.GetPotentialValue;
      if MonitoringSalesF.MSPeriodInterval.itemIndex = 0 then
        Accrec.PlanDetail[Integer(ARecordHandle)] := Result
      else
        Accrec.PlanSummary[Integer(ARecordHandle)] := Result;
      MonitoringSalesF.CalcDetail(Accrec, 0, Integer(ARecordHandle), Integer(ADataBinding.Data));
      end;
    end;
end;

function TMSDataSource.IsNativeCompare: Boolean;
begin
  Result := True;
end;

procedure TMSDataSource.SetValue(ARecordHandle: TcxDataRecordHandle;
  AItemHandle: TcxDataItemHandle; const AValue: Variant);
var
  ADataBinding: TcxGridItemDataBinding;
  AccRec : TPlanDataRecPtr;
  OldAmount : Currency;
begin
  ADataBinding := TcxGridItemDataBinding(AItemHandle);
  if Integer(ADataBinding.Data) > 0 then
    begin
    AccRec := MonitoringSalesF.RecordPtr[Integer(ADataBinding.Data) - 1];
    if MonitoringSalesF.MSPeriodInterval.itemIndex = 0 then
      begin
      OldAmount := Accrec.PlanDetail[Integer(ARecordHandle)];
      Accrec.PlanDetail[Integer(ARecordHandle)] := Avalue;
      end
    else
      begin
      OldAmount := Accrec.PlanSummary[Integer(ARecordHandle)];
      Accrec.PlanSummary[Integer(ARecordHandle)] := Avalue;
      end;
    MonitoringSalesF.CalcDetail(Accrec, OldAmount, Integer(ARecordHandle), Integer(ADataBinding.Data));
    MonitoringSalesF.LastRowEnd := Integer(ARecordHandle);
//    DataChanged;
    end;
end;

function TMSDataSource.GetItemHandle(AItemIndex: Integer): TcxDataItemHandle;
begin
  Result := TcxDataItemHandle(GetDataBinding(AItemIndex));
end;

procedure TMonitoringSalesF.FormCreate(Sender: TObject);
var
  j, daysinyear : integer;
begin
//  Color := GGlobals.FormColour;
  DMrep1.TariButtonList.GetImage(0, CloseBtn.Glyph);
  Initialised := False;
  FormActive := False;
  DataModuleClient.LookupSummaryIntervals.First;
  MSPeriodInterval.Properties.Items.Clear;
  while DataModuleClient.LookupSummaryIntervals.eof = False do
    begin
		MSPeriodInterval.Properties.Items.Add(DataModuleClient.LookupSummaryIntervalsPeriod_Desc.AsString);
    DataModuleClient.LookupSummaryIntervals.Next;
    end;
	Caption := 'Tracking Sales - ' + DataModuleClient.BusinessDetailsBusiness_Name.AsString;
//  cxLabel1.Caption := convertAccelCharToAmpersand(DataModuleClient.DepartmentsRevenue_Group_Name.Value);
  DataCollect.GetConsolidatedList(DataModuleClient.DepartmentsDEPT_ID.Value, ctNormal);
  DataCollect.msdate := DataModuleClient.DepartmentsCURRENTMONITORINGSTART.value;
  DataCollect.medate := DataModuleClient.DepartmentsCURRENTMONITORINGEND.value;
  if DataCollect.Monitoringloaded = false then
    DataCollect.getMonitoringData;
  DataCollect.GetDetailedOptions(DataModuleClient.DepartmentsDEPT_ID.Value);
  // set up pointers to each array
  RecordPtr[MSSALES] := MonitoringDataList.Items[GetMonitoringSalesListIndex(SALES)];
  RecordPtr[MSCOGS] := MonitoringDataList.Items[GetMonitoringSalesListIndex(COGS)];
  RecordPtr[MSGP] := MonitoringDataList.Items[GetMonitoringSalesListIndex(GROSSPROFIT)];
  RecordPtr[MSGPPC] := MonitoringDataList.Items[GetMonitoringSalesListIndex(GPPC)];
  RecordPtr[MSPOTENTIAL] := MonitoringDataList.Items[GetMonitoringSalesListIndex(POTENTIAL)];
  RecordPtr[MSBILLED] := MonitoringDataList.Items[GetMonitoringSalesListIndex(BILLED)];
  RecordPtr[MSGPUNIT] := MonitoringDataList.Items[GetMonitoringSalesListIndex(GPUNIT)];
  tempcurr := RecordPtr[MSSALES].PlanDetail[0];
  MSPeriodInterval.ItemIndex := strtoint(currtostr(DataCollect.detailedOptions[50]));
  DaysinYear := trunc(DataModuleClient.DepartmentsCurrentMonitoringEnd.value) - trunc(DataModuleClient.DepartmentsCurrentMonitoringStart.value);
  if MSPeriodInterval.ItemIndex < 0 then
    MSPeriodInterval.ItemIndex := 0;
  if MSPeriodInterval.ItemIndex > 0 then
    NumOfRows :=  createSummaryIndex(MSPeriodInterval.ItemIndex, DataModuleClient.DepartmentsCurrentMonitoringStart.value, DataModuleClient.DepartmentsCurrentMonitoringEnd.value)
  else
    NumOfRows := DaysinYear + 1;
  LatestPeriod := 0;
  if DataCollect.detailedOptions[51] > 0 then
    begin
    LatestPeriod := Trunc(DataCollect.detailedOptions[51] - DataModuleClient.DepartmentsCurrentMonitoringStart.value);
    if (LatestPeriod < 0) or (LatestPeriod > DaysinYear) then
      LatestPeriod := 0;
    end;
  for j := 0 to DaysInYear do    // Iterate
		YearDates[j] := FormatDateTime(' dd mmm yyyy ', DataModuleClient.DepartmentsCurrentMonitoringStart.value + j);
//  ComboBox1Change(Sender);
  Initialised := True;
  LastColEnd := 0;
  LastRowEnd := 0;
  if DataModuleClient.DepartmentsSingular_UnitDesc.value = 'Hour' then
		MSPotentialUnits.Caption := 'Available '+ DataModuleClient.DepartmentsPlural_UnitDesc.AsString
  else
		MSPotentialUnits.Caption := 'Potential '+ DataModuleClient.DepartmentsPlural_UnitDesc.AsString;
	MSBUnits.Caption := 'Billed '+ DataModuleClient.DepartmentsPlural_UnitDesc.AsString;
//  if GGlobals.UnitRounding = 0 then
//    begin
//    TcxCurrencyEditProperties(MSPotentialUnits.Properties).DecimalPlaces := 0;
//    TcxCurrencyEditProperties(MSPotentialUnits.Properties).DisplayFormat := ',0;-,0';
//    TcxCurrencyEditProperties(MSBunits.Properties).DecimalPlaces := 0;
//    TcxCurrencyEditProperties(MSBUnits.Properties).DisplayFormat := ',0;-,0';
//    end
//  else
//    begin
    TcxCurrencyEditProperties(MSPotentialUnits.Properties).DecimalPlaces := 1;
    TcxCurrencyEditProperties(MSPotentialUnits.Properties).DisplayFormat := ',0.0;-,0.0';
    TcxCurrencyEditProperties(MSBunits.Properties).DecimalPlaces := 1;
    TcxCurrencyEditProperties(MSBUnits.Properties).DisplayFormat := ',0.0;-,0.0';
//    end;
  GenerateColumns(MSTableView);
  MSTableView.DataController.CustomDataSource := TMSDataSource.Create;
  ComboBox1Change(Sender);
  if fileexists(GGlobals.BaseDir + 'TARIInterface.ini') then
    ImportBtn.Visible := True
  else
    ImportBtn.Visible := False;
end;

procedure TMonitoringSalesF.ComboBox1Change(Sender: TObject);
var
  j: Integer;
  daysinyear: integer;
  SummaryPtr : TPlanDataRecPtr;
begin
  if Initialised then
    begin
    daysinyear := trunc(DataModuleClient.DepartmentsCurrentMonitoringEnd.value) - trunc(DataModuleClient.DepartmentsCurrentMonitoringStart.value);
    CalculateArray(GPUNIT);
    CalculateArray(GPPC);
    ComboBox1State := MSPeriodInterval.ItemIndex;
    if MSPeriodInterval.ItemIndex > 0 then
      NumOfRows :=  createSummaryIndex(MSPeriodInterval.ItemIndex, DataModuleClient.DepartmentsCurrentMonitoringStart.value, DataModuleClient.DepartmentsCurrentMonitoringEnd.value)
    else
      NumOfRows := DaysinYear + 1;
    for j := 0 to (MONITORSALESLIST - 1) do    // Iterate
      begin
      SummaryPtr := MonitoringDataList.Items[GetMonitoringSalesListIndex(MonitoringSalesAccounts[j])];
      BuildSummary(SummaryPtr.Accountno, DataModuleClient.DepartmentsCURRENTMONITORINGSTART.Value, DataModuleClient.DepartmentsCURRENTMONITORINGEND.Value, SummaryPtr.PlanDetail, SummaryPtr.PlanSummary);
    end;    // for
    CalculateArray(GPUNIT);
    CalculateArray(GPPC);
//    OvcTable3.SetActiveCell(1, 1);
//    BuilddateArray;
    MSTableView.DataController.BeginFullUpdate;
    MSTableView.DataController.CustomDataSource.DataChanged;
    MSTableView.DataController.EndFullUpdate;
    end;
end;

procedure TMonitoringSalesF.CalculateArray(Accountno: integer);
var
  PlanDataRec : TPlanDataRecPtr;
  j: integer;
begin
  PlanDataRec := MonitoringDataList.Items[GetMonitoringSalesListIndex(AccountNo)];
  if ComboBox1State = 0 then
    begin
    if Accountno = GPUNIT then
      for j := 0 to NumOfRows - 1 do    // Iterate
        if RecordPtr[MSBILLED].PlanDetail[j] <> 0 then
          PlanDataRec.PlanDetail[j] := RecordPtr[MSGP].Plandetail[j] / RecordPtr[MSBILLED].Plandetail[j]
        else
          PlanDataRec.PlanDetail[j] := 0;
    if Accountno = GPPC then
      for j := 0 to NumofRows - 1 do    // Iterate
        if RecordPtr[MSSALES].PlanDetail[j] <> 0 then
          PlanDataRec.PlanDetail[j] := RecordPtr[MSGP].Plandetail[j] * 100 / RecordPtr[MSSALES].Plandetail[j]
        else
          PlanDataRec.PlanDetail[j] := 0;
    end
  else
    begin
    if Accountno = GPUNIT then
      for j := 0 to NumOfRows - 1 do    // Iterate
        if RecordPtr[MSBILLED].PlanSummary[j] <> 0 then
          PlanDataRec.PlanSummary[j] := RecordPtr[MSGP].PlanSummary[j] / RecordPtr[MSBILLED].PlanSummary[j]
        else
          PlanDataRec.PlanSummary[j] := 0;
    if Accountno = GPPC then
      for j := 0 to NumofRows - 1 do    // Iterate
        if RecordPtr[MSSALES].PlanSummary[j] <> 0 then
          PlanDataRec.PlanSummary[j] := RecordPtr[MSGP].PlanSummary[j] * 100 / RecordPtr[MSSALES].PlanSummary[j]
        else
          PlanDataRec.PlanSummary[j] := 0;
    end;
end;

procedure TMonitoringSalesF.CalcDetail(PlanDataRec : TPlanDataRecPtr; OldMonitSummary : Currency; Currentrow, CurrentCol : integer);
var
  j: Integer;
//  PlanDataRec : TPlanDataRecPtr;
  temparray : TDetailedBalArray;
  fromperiod, toperiod{, CurrentRow, CurrentCol} : integer;
begin
//  CurrentRow := OvcTable3.activeRow;
//  CurrentCol := OvcTable3.activeCol;
//  PlanDataRec := MonitoringDataList.Items[GetMonitoringSalesListIndex(MonitoringSalesInput[CurrentCol - 2])];
  if ComboBox1State <= 0 then
    begin
    // Get current values
    for j := 0 to (MSEND - 1) do    // Iterate
      Oldvalues[j] := RecordPtr[j].PlanDetail[CurrentRow];
    // copy as New values
    move(Oldvalues, newValues, sizeof(Currency) * MSEND);
    // place old value
    OldValues[CurrentCol - 1] := OldMonitorSummary;
    // calculate values
    DetailedCalc(newValues, PlanDataRec.accountNo);
    // set new values
    for j := 0 to (MSEND - 1) do    // Iterate
      begin
      if Oldvalues[j] <> Newvalues[j] then
        begin
        RecordPtr[j].PlanDetail[CurrentRow] := newvalues[j];
        if RecordPtr[j].accountNo < SALESUNIT then
          RecordPtr[j].PlanTotal := RecordPtr[j].PlanTotal + Newvalues[j] - oldvalues[j];
        end;
      end;    // for
    end
  else
    begin
    if CurrentRow < 1 then
      fromperiod := 0
    else
      fromperiod := SummaryPeriodIndexArray[Currentrow - 1] + 1;
    toperiod := SummaryPeriodIndexArray[CurrentRow];
    // Get current values
    for j := 0 to (MSEND - 1) do    // Iterate
      Oldvalues[j] := RecordPtr[j].PlanSummary[CurrentRow];
    // copy as New values
    move(Oldvalues, newValues, sizeof(Currency) * MSEND);
    // place old value
    OldValues[CurrentCol - 1] := OldMonitorSummary;
    // calculate values
    DetailedCalc(newValues, PlanDataRec.accountNo);
    // set new values
    for j := 0 to (MSEND - 1) do    // Iterate
      begin
      RecordPtr[j]^.PlanSummary[CurrentRow] := newvalues[j];
      if RecordPtr[j].accountNo < SALESUNIT then
        begin
        UpdateFromSummaryBalances(RecordPtr[j].Plandetail, temparray,
          newvalues[j], fromperiod, toperiod, RecordPtr[j].Accountno);
        RecordPtr[j].PlanTotal := RecordPtr[j].PlanTotal + Newvalues[j] - oldvalues[j];
        end;
      end;
    end;
end;

procedure TMonitoringSalesF.DetailedCalc (var Parray: array of currency; AccountNo: integer);
begin
  case Accountno of    //
    SALES, COGS: Parray[MSGP] := Parray[MSSALES] - Parray[MSCOGS];
    GROSSPROFIT: Parray[MSCOGS] := Parray[MSSALES] - Parray[MSGP];
    GPPC:       begin
                Parray[MSGP] := Parray[MSSALES] * Parray[MSGPPC] /100;
                Parray[MSCOGS] := Parray[MSSALES] - Parray[MSGP];
              end;
  end;    // case
  // Calculate 2 ratios
  if Parray[MSSALES] <> 0 then
    Parray[MSGPPC] := Parray[MSGP] * 100 / Parray[MSSALES]
  else
    Parray[MSGPPC] := 0;
  if Parray[MSBILLED] <> 0 then
    Parray[MSGPUNIT] := Parray[MSGP] / Parray[MSBILLED]
  else
    Parray[MSGPUNIT] := 0;
end;

procedure TMonitoringSalesF.FormActivate(Sender: TObject);
var
  J : Integer;
begin
  FormActive := True;
  cxGrid1.SetFocus;
  if LatestPeriod > 0 then
    Begin
    if ComboBox1State = 0 then
      MSTableView.Controller.FocusedRowIndex := LatestPeriod
    else
      begin
      for j := 0 to NumOfRows - 1 do
        begin
        if (SummaryPeriodIndexArray[j + 1] > LatestPeriod) and
          (SummaryPeriodIndexArray[j] <= LatestPeriod) then
          begin
          MSTableView.Controller.FocusedRowIndex := J;
          break;
          end;
        end;
      end;
    MSTableView.Controller.MakeFocusedRecordVisible;
    LatestPeriod := 0;
    end;
end;

procedure TMonitoringSalesF.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  j : Integer;
begin
  screen.Cursor := crHourGlass;
  DataCollect.DetailedOptions[50] := MSPeriodInterval.ItemIndex;
  if SaveLastDateCB.checked then
    begin
    if ComboBox1State = 0 then
      DataCollect.DetailedOptions[51] :=
        DataModuleClient.DepartmentsCurrentMonitoringStart.value + MSTableView.Controller.FocusedRowIndex
    else
      DataCollect.DetailedOptions[51] :=
      DataModuleClient.DepartmentsCurrentMonitoringStart.value + SummaryPeriodIndexArray[MSTableView.Controller.FocusedRowIndex];
    end
  else
    DataCollect.DetailedOptions[51] := 0;
  MSTableView.DataController.CustomDataSource.Destroy;
  DataCollect.SetDetailedOptions(DataModuleClient.DepartmentsDEPT_ID.Value);
  if DataCollect.Monitoringloaded = True then
    DataCollect.SetMonitoringData;
  DataCollect.clearMonitoringDataList;
  for j := 0 to (MSEND - 1) do    // Iterate
    RecordPtr[j] := nil;
  DataCollect.ClearConsolidatedList;
end;

procedure TMonitoringSalesF.SetLocalMonitoringPeriod;
var
  fromperiod, toperiod, CurrentRow : integer;
begin
  CurrentRow :=  MSTableView.Controller.FocusedRowIndex;
  if CurrentRow < 0 then
    CurrentRow := 0;
  if ComboBox1State <= 0 Then
    begin
    FromPeriod := CurrentRow;
    ToPeriod := CurrentRow;
    end
  else
    begin
    if CurrentRow < 1 then
      fromperiod := 0
    else
      fromperiod := SummaryPeriodIndexArray[Currentrow - 1] + 1;
    toperiod := SummaryPeriodIndexArray[CurrentRow];
    end;
  LocalStartDate := DataModuleClient.DepartmentsCurrentMonitoringStart.Value + Fromperiod;
  LocalEndDate := DataModuleClient.DepartmentsCurrentMonitoringStart.Value + ToPeriod;
end;

procedure TMonitoringSalesF.InvoiceDataBtnClick(Sender: TObject);
var
  j : integer;
begin
  screen.Cursor := crHourGlass;
  SetLocalMonitoringPeriod;
  CurrentRow :=  MSTableView.Controller.FocusedRowIndex;
  LocalInvType := MonitorInv;
  DataModuleClient.ActualInvoiceDetails.IndexName := 'PK_ACTUAL_INVOICE_DETAILS';
  DataModuleClient.SetInvoiceFilter(Integer(LocalInvType), LocalStartDate, LocalEndDate);
  DataModuleClient.InvoiceType := LocalInvType;
  Application.CreateForm(TMonitoringInvoicesF, MonitoringInvoicesF);
  for j := 0 to (MSEND - 1) do    // Iterate
    Monitorvalues[j] := 0;

	MonitoringInvoicesF.setUnitsDesc(DataModuleClient.DepartmentsSingular_UnitDesc.AsString, DataModuleClient.DepartmentsPlural_UnitDesc.AsString);
  MonitoringInvoicesF.Showmodal;

  ComboBox1Change(Sender);
  MSTableView.Controller.FocusedRowIndex := CurrentRow;
  MonitoringInvoicesF.free;
  DataModuleClient.InvoiceType := AnalysisInv;
  DataModuleClient.ActualInvoiceDetails.IndexName := 'INVDEPTIDX';
  screen.Cursor := crDefault;
end;

procedure TMonitoringSalesF.FormShow(Sender: TObject);
begin
  screen.Cursor := crDefault;
end;


function TMonitoringSalesF.GetPotentialValue: Currency;
var
  PotentialBal : TDetailedBalArray;
  fromperiod, toperiod, CurrentRow : integer;
begin
  CurrentRow :=  MSTableView.Controller.FocusedRowIndex;
  if CurrentRow < 0 then
    CurrentRow := 0;
  if ComboBox1State <= 0 Then
    begin
    FromPeriod := CurrentRow;
    ToPeriod := CurrentRow;
    end
  else
    begin
    if CurrentRow < 1 then
      fromperiod := 0
    else
      fromperiod := SummaryPeriodIndexArray[Currentrow - 1] + 1;
    toperiod := SummaryPeriodIndexArray[CurrentRow];
    end;
  DataCollect.psDate := DataModuleClient.DepartmentsCurrentMonitoringStart.Value + Fromperiod;
  DataCollect.peDate := DataModuleClient.DepartmentsCurrentMonitoringStart.Value + ToPeriod;
  DataCollect.GetBalances(PotentialBal, POTENTIAL, True, ctNormal);
  Result := DataCollect.GetTotalBalance(PotentialBal,
                                        double(DataCollect.psDate),
                                        double(DataCollect.psDate),
                                        double(DataCollect.peDate));
end;


procedure TMonitoringSalesF.MSTableViewFocusedItemChanged(
  Sender: TcxCustomGridTableView; APrevFocusedItem,
  AFocusedItem: TcxCustomGridTableItem);
begin
// here we check to see if we are inserting
end;

procedure TMonitoringSalesF.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

end.
