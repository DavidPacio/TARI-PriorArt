unit MonitoringOtherIncome;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Auchtypes, DMrep1U, LGlobals, cxDataStorage, cxCurrencyEdit,
  cxButtons, cxCheckBox, cxMaskEdit, cxDropDownEdit, cxTextEdit, cxDBEdit,
  cxContainer, cxEdit, cxLabel, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxControls, cxGridCustomView, cxGridLevel, cxGrid, cxCustomData,
  dateUtils, cxDBLabel, ExtCtrls, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxFilter, cxData, Menus, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint;

type
  TMonitoringOtherIncomeF = class(TForm)
    OtherIncomeGL: TcxGridLevel;
    cxGrid1: TcxGrid;
    OtherIncomeTV: TcxGridTableView;
    DateCol: TcxGridColumn;
    AmountCOL: TcxGridColumn;
    cxLabel2: TcxLabel;
    MSPeriodInterval: TcxComboBox;
    SaveLastDateCB: TcxCheckBox;
    CloseBtn: TcxButton;
    cxLabel3: TcxLabel;
    TotalFTECOL: TcxGridColumn;
    ProdFTECOL: TcxGridColumn;
    cxDBLabel4: TcxDBLabel;
    cxLabel14: TcxLabel;
    cxDBLabel3: TcxDBLabel;
    cxLabel15: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
  private
    LastRowEnd: Integer;
    LatestPeriod: Integer;
//    LastColEnd: Integer;
    ComboBox1State: Integer;
    initialised: boolean;
    YearDates : Array[0 .. NUM_DAYSINYEAR] of string;
    MonitorOIDataRec : TPlanDataRecPtr;
    MonitorFTEDataRec : TPlanDataRecPtr;
    MonitorPFTEDataRec : TPlanDataRecPtr;
    NumofRows : Integer;
//    procedure buildOIsummary;
    procedure CalcDetail(Var Barray :array of currency; NewSummary : Currency; Currentrow, CurrentCol : integer; Overwrite : boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

  TOIDataSource = class(TcxCustomDataSource)
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
  MonitoringOtherIncomeF: TMonitoringOtherIncomeF;

implementation

uses DMClient, DataCollector;

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
        if Tag = 0 then
          DataBinding.ValueTypeClass := TcxstringValueType
        else
          DataBinding.ValueTypeClass := TcxCurrencyValueType;
      end;
    end;    // for
end;

{ TInvoiceDataSource }
constructor TOIDataSource.Create;
begin
  inherited Create;
end;

destructor TOIDataSource.Destroy;
begin
  inherited Destroy;
end;

function TOIDataSource.GetDataBinding(AItemIndex: Integer): TcxGridItemDataBinding;
begin
  Result := TcxCustomGridTableItem(DataController.GetItem(AItemIndex)).DataBinding;
end;

function TOIDataSource.GetRecordCount: Integer;
begin
  Result := MonitoringOtherIncomeF.NumofRows;
end;

function TOIDataSource.GetValue(ARecordHandle: TcxDataRecordHandle; AItemHandle: TcxDataItemHandle): Variant;
var
  ADataBinding: TcxGridItemDataBinding;
begin
  ADataBinding := TcxGridItemDataBinding(AItemHandle);
  if Integer(ADataBinding.Data) = 0 then
    begin
    if MonitoringOtherIncomeF.MSPeriodInterval.itemindex = 0 then
        Result := MonitoringOtherIncomeF.YearDates[Integer(ARecordHandle)]
      else
        result := MonitoringOtherIncomeF.YearDates[SummaryPeriodIndexArray[Integer(ARecordHandle)]];
    end
  else
    begin
    if MonitoringOtherIncomeF.MSPeriodInterval.itemIndex = 0 then
      begin
      if Integer(ADataBinding.Data) = 1 then
        Result := MonitoringOtherIncomeF.MonitorOIDataRec.PlanDetail[Integer(ARecordHandle)];
      if Integer(ADataBinding.Data) = 2 then
        Result := MonitoringOtherIncomeF.MonitorFTEDataRec.PlanDetail[Integer(ARecordHandle)];
      if Integer(ADataBinding.Data) = 3 then
        Result := MonitoringOtherIncomeF.MonitorPFTEDataRec.PlanDetail[Integer(ARecordHandle)];
      end
    else
      begin
//      if Integer(ARecordHandle) = 0 then
//        DaysInPeriod := SummaryPeriodIndexArray[Integer(ARecordHandle)] + 1
//      else
//        DaysInPeriod := SummaryPeriodIndexArray[Integer(ARecordHandle)] - SummaryPeriodIndexArray[Integer(ARecordHandle)- 1];
      if Integer(ADataBinding.Data) = 1 then
        Result := MonitoringOtherIncomeF.MonitorOIDataRec.PlanSummary[Integer(ARecordHandle)];
      if Integer(ADataBinding.Data) = 2 then
        Result := MonitoringOtherIncomeF.MonitorFTEDataRec.PlanSummary[Integer(ARecordHandle)];
      if Integer(ADataBinding.Data) = 3 then
        Result := MonitoringOtherIncomeF.MonitorPFTEDataRec.PlanSummary[Integer(ARecordHandle)];
      end;
    end;
end;

function TOIDataSource.IsNativeCompare: Boolean;
begin
  Result := True;
end;

procedure TOIDataSource.SetValue(ARecordHandle: TcxDataRecordHandle;
  AItemHandle: TcxDataItemHandle; const AValue: Variant);
var
  ADataBinding: TcxGridItemDataBinding;
  dataupdated : boolean;
  DaysInPeriod : Integer;
begin
  ADataBinding := TcxGridItemDataBinding(AItemHandle);
  DataUpdated := False;
  if Integer(ADataBinding.Data) = 1 then
    begin
    if MonitoringOtherIncomeF.MSPeriodInterval.itemIndex = 0 then
      begin
      MonitoringOtherIncomeF.MonitorOIDataRec.PlanDetail[Integer(ARecordHandle)] := Avalue;
      end
    else
      begin
      MonitoringOtherIncomeF.MonitorOIDataRec.PlanSummary[Integer(ARecordHandle)] := Avalue;
      MonitoringOtherIncomeF.CalcDetail(MonitoringOtherIncomeF.MonitorOIDataRec.PlanDetail, Currency(AValue), Integer(ARecordHandle), Integer(ADataBinding.Data), False);
      end;
    dataupdated := True;
    end;
  if Integer(ADataBinding.Data) = 2 then
    begin
    if MonitoringOtherIncomeF.MSPeriodInterval.itemIndex = 0 then
      begin
      MonitoringOtherIncomeF.MonitorFTEDataRec.PlanDetail[Integer(ARecordHandle)] := Avalue;
      end
    else
      begin
      if Integer(ARecordHandle) = 0 then
        DaysInPeriod := SummaryPeriodIndexArray[Integer(ARecordHandle)] + 1
      else
        DaysInPeriod := SummaryPeriodIndexArray[Integer(ARecordHandle)] - SummaryPeriodIndexArray[Integer(ARecordHandle)- 1];
      MonitoringOtherIncomeF.MonitorFTEDataRec.PlanSummary[Integer(ARecordHandle)] := Avalue;
      MonitoringOtherIncomeF.CalcDetail(MonitoringOtherIncomeF.MonitorFTEDataRec.PlanDetail, (Currency(AValue) * DaysInPeriod), Integer(ARecordHandle), Integer(ADataBinding.Data), True);
      end;
    dataupdated := True;
    end;
  if Integer(ADataBinding.Data) = 3 then
    begin
    if MonitoringOtherIncomeF.MSPeriodInterval.itemIndex = 0 then
      begin
      MonitoringOtherIncomeF.MonitorPFTEDataRec.PlanDetail[Integer(ARecordHandle)] := Avalue;
      end
    else
      begin
      if Integer(ARecordHandle) = 0 then
        DaysInPeriod := SummaryPeriodIndexArray[Integer(ARecordHandle)] + 1
      else
        DaysInPeriod := SummaryPeriodIndexArray[Integer(ARecordHandle)] - SummaryPeriodIndexArray[Integer(ARecordHandle)- 1];
      MonitoringOtherIncomeF.MonitorPFTEDataRec.PlanSummary[Integer(ARecordHandle)] := Avalue;
      MonitoringOtherIncomeF.CalcDetail(MonitoringOtherIncomeF.MonitorPFTEDataRec.PlanDetail, (Currency(AValue) * DaysInPeriod), Integer(ARecordHandle), Integer(ADataBinding.Data), True);
      end;
    dataupdated := True;
    end;
  if DataUpdated then
    MonitoringOtherIncomeF.LastRowEnd := Integer(ARecordHandle);
end;

function TOIDataSource.GetItemHandle(AItemIndex: Integer): TcxDataItemHandle;
begin
  Result := TcxDataItemHandle(GetDataBinding(AItemIndex));
end;

procedure TMonitoringOtherIncomeF.FormCreate(Sender: TObject);
var
  j: Integer;
  daysinYear : integer;
begin
//  Color := GGlobals.FormColour;
  DMrep1.TariButtonList.GetImage(0, CloseBtn.Glyph);
  Initialised := False;
  DataModuleClient.LookupSummaryIntervals.First;
  MSPeriodInterval.Properties.Items.Clear;
  while DataModuleClient.LookupSummaryIntervals.eof = False do
    begin
		MSPeriodInterval.Properties.Items.Add(DataModuleClient.LookupSummaryIntervalsPeriod_Desc.AsString);
    DataModuleClient.LookupSummaryIntervals.Next;
    end;
	Caption := 'Tracking Other Income - ' + DataModuleClient.BusinessesBranch_Name.AsString;
  DataCollect.GetConsolidatedList(DataModuleClient.DepartmentsDEPT_ID.Value, ctNormal);
  DataCollect.msdate := DataModuleClient.DepartmentsCURRENTMONITORINGSTART.value;
  DataCollect.medate := DataModuleClient.DepartmentsCURRENTMONITORINGEND.value;
  new(MonitorOIDatarec);
  new(MonitorFTEDatarec);
  new(MonitorPFTEDatarec);
  FillChar(MonitorOIDatarec^, sizeof(TPlanDataRecType), #0);
	FillChar(MonitorFTEDatarec^, sizeof(TPlanDataRecType), #0);
  FillChar(MonitorPFTEDatarec^, sizeof(TPlanDataRecType), #0);
  // Get Account Titles
  MonitorOIDataRec.Accountno := OTHERINCOME;
  MonitorFTEDataRec.Accountno := FTEOTHER;
  MonitorPFTEDataRec.Accountno := FTEPROD;
  if not DataCollect.LocateAccountTitle(OTHERINCOME) then
    MonitorOIDatarec.AccountTitle := ''
  else
    MonitorOIDatarec.AccountTitle := DATAMODULECLIENT.AccountDetailsACCOUNT_TITLE.AsString;
  DataCollect.psdate := DataModuleClient.DepartmentsCurrentMonitoringStart.value;
  DataCollect.pedate := DataModuleClient.DepartmentsCurrentMonitoringEnd.value;
  //OTHER INCOME
  if not DataCollect.getBalances(MonitorOIDataRec.PlanDetail, OTHERINCOME, False, ctNormal) then
    MonitorOIDataRec.PlanTotal := 0
  else
    move(MonitorOIDataRec.PlanDetail, MonitorOIDatarec.PlanDetaildisk, sizeof(TDetailedBalArray));
  MonitorOIDataRec.PlanTotal := DataCollect.GetTotalBalance(
          MonitorOIDataRec^.PlanDetail,
          double(DataCollect.psdate),
          double(DataCollect.psdate),
          double(DataCollect.pedate));
  // FTE OTHER
  if not DataCollect.getBalances(MonitorFTEDataRec.PlanDetail, FTEOTHER, False, ctNormal) then
    MonitorFTEDataRec.PlanTotal := 0
  else
    move(MonitorFTEDataRec.PlanDetail, MonitorFTEDatarec.PlanDetaildisk, sizeof(TDetailedBalArray));
  MonitorFTEDataRec.PlanTotal := DataCollect.GetTotalBalance(
          MonitorFTEDataRec^.PlanDetail,
          double(DataCollect.psdate),
          double(DataCollect.psdate),
          double(DataCollect.pedate));
  // FTE PROD
  if not DataCollect.getBalances(MonitorPFTEDataRec.PlanDetail, FTEPROD, False, ctNormal) then
    MonitorPFTEDataRec.PlanTotal := 0
  else
    move(MonitorPFTEDataRec.PlanDetail, MonitorPFTEDatarec.PlanDetaildisk, sizeof(TDetailedBalArray));
  MonitorPFTEDataRec.PlanTotal := DataCollect.GetTotalBalance(
          MonitorPFTEDataRec^.PlanDetail,
          double(DataCollect.psdate),
          double(DataCollect.psdate),
          double(DataCollect.pedate));

  DataCollect.GetDetailedOptions(DataModuleClient.DepartmentsDEPT_ID.Value);
  MSPeriodInterval.ItemIndex := strtoint(currtostr(DataCollect.detailedOptions[54]));
  DaysinYear := trunc(DataModuleClient.DepartmentsCurrentMonitoringEnd.value) - trunc(DataModuleClient.DepartmentsCurrentMonitoringStart.value);
  if MSPeriodInterval.ItemIndex < 0 then
    MSPeriodInterval.ItemIndex := 0;
  LatestPeriod := 0;
  if DataCollect.detailedOptions[55] > 0 then
    begin
    LatestPeriod := Trunc(DataCollect.detailedOptions[55] - DataModuleClient.DepartmentsCurrentMonitoringStart.value);
    if (LatestPeriod < 0) or (LatestPeriod > DaysinYear) then
      LatestPeriod := 0;
    end;
  for j := 0 to DaysInYear do    // Iterate
    YearDates[j] := FormatDateTime(' dd mmm yyyy ', DataModuleClient.DepartmentsCurrentMonitoringStart.value + j);
  Initialised := True;
  GenerateColumns(OtherIncomeTV);
  OtherIncomeTV.DataController.CustomDataSource := TOIDataSource.Create;
  ComboBox1Change(Sender);
end;

procedure TMonitoringOtherIncomeF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DataCollect.psdate := DataModuleClient.DepartmentsCurrentMonitoringStart.value;
  DataCollect.pedate := DataModuleClient.DepartmentsCurrentMonitoringEnd.value;
//  if MSPeriodInterval.ItemIndex > 1 then
  // OTHER INCOME
  if CompareMem(pointer(@MonitorOIDataRec.PlanDetail), Pointer(@MonitorOIDataRec.PlanDetailDisk), Sizeof(currency) * NUM_DAYSINYEAR) = False
    then DataCollect.setBalances(MonitorOIDataRec.PlanDetail, DataModuleClient.DepartmentsDept_Id.Value, MonitorOIDatarec.Accountno, False);
  // OTHER FTE
  if CompareMem(pointer(@MonitorFTEDataRec.PlanDetail), Pointer(@MonitorFTEDataRec.PlanDetailDisk), Sizeof(currency) * NUM_DAYSINYEAR) = False
    then DataCollect.setBalances(MonitorFTEDataRec.PlanDetail, DataModuleClient.DepartmentsDept_Id.Value, MonitorFTEDatarec.Accountno, False);
  // PROD FTE
  if CompareMem(pointer(@MonitorPFTEDataRec.PlanDetail), Pointer(@MonitorPFTEDataRec.PlanDetailDisk), Sizeof(currency) * NUM_DAYSINYEAR) = False
    then DataCollect.setBalances(MonitorPFTEDataRec.PlanDetail, DataModuleClient.DepartmentsDept_Id.Value, MonitorPFTEDatarec.Accountno, False);
  DataCollect.DetailedOptions[54] := MSPeriodInterval.ItemIndex;
  if SaveLastDateCB.checked then
    begin
    if ComboBox1State = 0 then
      DataCollect.DetailedOptions[55] := DataModuleClient.DepartmentsCurrentMonitoringStart.value + + OtherIncomeTV.Controller.FocusedRowIndex
    else
      DataCollect.DetailedOptions[55] := DataModuleClient.DepartmentsCurrentMonitoringStart.value + SummaryPeriodIndexArray[OtherIncomeTV.Controller.FocusedRowIndex];
    end
  else
    DataCollect.DetailedOptions[55] := 0;
  DataCollect.SetDetailedOptions(DataModuleClient.DepartmentsDEPT_ID.Value);
  dispose(MonitorOIDataRec);
  dispose(MonitorFTEDataRec);
  dispose(MonitorPFTEDataRec);
  DataCollect.ClearConsolidatedList;
end;

procedure TMonitoringOtherIncomeF.CalcDetail(Var Barray :array of currency; NewSummary : Currency; Currentrow, CurrentCol : integer; Overwrite : boolean);
var
  fromperiod, toperiod: integer;
begin
  if CurrentRow < 1 then
    fromperiod := 0
  else
    fromperiod := SummaryPeriodIndexArray[Currentrow - 1] + 1;
  toperiod := SummaryPeriodIndexArray[CurrentRow];
  DataCollect.psdate := DataModuleClient.DepartmentsCurrentMonitoringStart.value;
  DataCollect.pedate := DataModuleClient.DepartmentsCurrentMonitoringEnd.value;
  if Overwrite then
    DataCollect.updateArray(Barray,
                  DaysBetween(IncDay(DataCollect.psdate, fromperiod), DataCollect.psdate),
                  DaysBetween(IncDay(DataCollect.psdate, toperiod), DataCollect.psdate),
                  0, 1);

  DataCollect.updateArray(Barray,
                  DaysBetween(IncDay(DataCollect.psdate, fromperiod), DataCollect.psdate),
                  DaysBetween(IncDay(DataCollect.psdate, toperiod), DataCollect.psdate),
                  NewSummary, 1);
end;

procedure TMonitoringOtherIncomeF.ComboBox1Change(Sender: TObject);
var
  daysinyear: integer;
//  J : Integer;
begin
  if Initialised then
    begin
    daysinyear := trunc(DataModuleClient.DepartmentsCurrentMonitoringEnd.value) - trunc(DataModuleClient.DepartmentsCurrentMonitoringStart.value);
    ComboBox1State := MSPeriodInterval.ItemIndex;
    if MSPeriodInterval.ItemIndex > 0 then
      NumOfRows :=  createSummaryIndex(MSPeriodInterval.ItemIndex, DataModuleClient.DepartmentsCurrentMonitoringStart.value, DataModuleClient.DepartmentsCurrentMonitoringEnd.value)
    else
      NumOfRows := DaysinYear + 1;
    BuildSummary(MonitorOIDataRec.Accountno, DataModuleClient.DepartmentsCurrentMonitoringStart.value, DataModuleClient.DepartmentsCurrentMonitoringEnd.value, MonitorOIDataRec.PlanDetail, MonitorOIDataRec.PlanSummary);
    BuildSummary(MonitorFTEDataRec.Accountno, DataModuleClient.DepartmentsCurrentMonitoringStart.value, DataModuleClient.DepartmentsCurrentMonitoringEnd.value, MonitorFTEDataRec.PlanDetail, MonitorFTEDataRec.PlanSummary);
    BuildSummary(MonitorPFTEDataRec.Accountno, DataModuleClient.DepartmentsCurrentMonitoringStart.value, DataModuleClient.DepartmentsCurrentMonitoringEnd.value, MonitorPFTEDataRec.PlanDetail, MonitorPFTEDataRec.PlanSummary);
    OtherIncomeTV.DataController.CustomDataSource.DataChanged;
    end;
end;

{
procedure TMonitoringOtherIncomeF.buildOIsummary;
var
  daysinyear: Integer;
  k: Integer;
  j: Integer;
  Startdate, Enddate : TDateTime;
begin
  k := 0;
  StartDate := DataModuleClient.DepartmentsCurrentMonitoringStart.value;
  Enddate := DataModuleClient.DepartmentsCurrentMonitoringEnd.value;
  // initialise the Summary Array
  fillchar(MonitorOIDataRec^.PlanSummary, sizeof(TSummaryBalArray), #0);
  // Calculate the days in period
  daysinyear := trunc(EndDate) - trunc(StartDate);
  MonitorOIDataRec.PlanTotal := 0;
  for j := 0 to DaysInYear do    // Iterate
    begin
    MonitorOIDataRec.PlanSummary[k] := MonitorOIDataRec.PlanSummary[k] + MonitorOIDataRec.PlanDetail[j];
    MonitorOIDataRec.PlanTotal := MonitorOIDataRec.PlanTotal + MonitorOIDataRec.PlanDetail[j];
    if (SummaryPeriodIndexArray[k] = j)
      then begin
      inc(k);
    end;    // while
  end;    // for
end;
}
end.
