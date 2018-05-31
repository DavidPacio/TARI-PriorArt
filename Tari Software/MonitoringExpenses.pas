unit MonitoringExpenses;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, auchtypes, cxCustomData, DMrep1U, LGlobals,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView, cxClasses,
  cxControls, cxGridCustomView, cxGridLevel, cxGrid, cxButtons, cxCheckBox,
  cxMaskEdit, cxDropDownEdit, cxTextEdit, cxDBEdit, cxContainer, cxEdit,
  cxLabel, cxCurrencyEdit, cxDataStorage, cxDBLabel, ExtCtrls, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinXmas2008Blue,
  Menus, cxStyles, dxSkinscxPCPainter, cxFilter, cxData, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint;

type
    TMonitoringExpensesF = class(TForm)
    cxLabel2: TcxLabel;
    MSPeriodInterval: TcxComboBox;
    SaveLastDateCB: TcxCheckBox;
    CloseBtn: TcxButton;
    MEGL: TcxGridLevel;
    cxGrid1: TcxGrid;
    MEBANDTV: TcxGridBandedTableView;
    MEBANDTVDate: TcxGridBandedColumn;
    MEBANDTVAmount: TcxGridBandedColumn;
    cxLabel3: TcxLabel;
    MPeriodLbl: TcxLabel;
    cxLabel15: TcxLabel;
    cxDBLabel4: TcxDBLabel;
    cxLabel14: TcxLabel;
    cxDBLabel3: TcxDBLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
		procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    Formactive: boolean;
    OldCellValue: Currency;
    Initialised: boolean;
    LatestPeriod: Integer;
    LastColumn: Integer;
    ComboBox1State: Integer;
    YearDates : Array[0 .. NUM_DAYSINYEAR] of string;
    NumofRows : Integer;
    procedure CalcDetail(rownum, colnum : integer);
    { Private declarations }
  public
    { Public declarations }
  end;

  TMEDataSource = class(TcxCustomDataSource)
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
  MonitoringExpensesF: TMonitoringExpensesF;

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
        if tag = 0 then
          DataBinding.ValueTypeClass := TcxstringValueType
        else
          begin
          DataBinding.ValueTypeClass := TcxCurrencyValueType;
          TcxCurrencyEditProperties(Properties).Alignment.Horz := taRightJustify;
          TcxCurrencyEditProperties(Properties).Alignment.Vert := taVCenter;
          TcxCurrencyEditProperties(Properties).DecimalPlaces := 0;
          TcxCurrencyEditProperties(Properties).DisplayFormat := ',0;-,0';
          end;
      end;
    end;    // for
end;

{ TMEDataSource }
constructor TMEDataSource.Create;
begin
  inherited Create;
end;

destructor TMEDataSource.Destroy;
begin
  inherited Destroy;
end;

function TMEDataSource.GetDataBinding(AItemIndex: Integer): TcxGridItemDataBinding;
begin
  Result := TcxCustomGridTableItem(DataController.GetItem(AItemIndex)).DataBinding;
end;

function TMEDataSource.GetRecordCount: Integer;
begin
  Result := MonitoringExpensesF.NumofRows;
end;

function TMEDataSource.GetValue(ARecordHandle: TcxDataRecordHandle; AItemHandle: TcxDataItemHandle): Variant;
var
  ADataBinding: TcxGridItemDataBinding;
  AccRec : TPlanDataRecPtr;
begin
  ADataBinding := TcxGridItemDataBinding(AItemHandle);
  if Integer(ADataBinding.Data) = 0 then
    begin
    if MonitoringExpensesF.MSPeriodInterval.itemindex = 0 then
      Result := MonitoringExpensesF.YearDates[Integer(ARecordHandle)]
    else
      result := MonitoringExpensesF.YearDates[SummaryPeriodIndexArray[Integer(ARecordHandle)]];
    end
  else
    begin
    AccRec := MonitoringExpDataList.items[Integer(ADataBinding.Data) - 1];
    if MonitoringExpensesF.MSPeriodInterval.itemIndex = 0 then
      Result := round(Accrec.PlanDetail[Integer(ARecordHandle)])
    else
      Result := round(Accrec.PlanSummary[Integer(ARecordHandle)]);
    end;
end;

function TMEDataSource.IsNativeCompare: Boolean;
begin
  Result := True;
end;

procedure TMEDataSource.SetValue(ARecordHandle: TcxDataRecordHandle;
  AItemHandle: TcxDataItemHandle; const AValue: Variant);
var
  ADataBinding: TcxGridItemDataBinding;
  AccRec : TPlanDataRecPtr;
begin
  ADataBinding := TcxGridItemDataBinding(AItemHandle);
  if Integer(ADataBinding.Data) > 0 then
    begin
    AccRec := MonitoringExpDataList.items[Integer(ADataBinding.Data) - 1];
    if MonitoringExpensesF.MSPeriodInterval.itemIndex = 0 then
      begin
      MonitoringExpensesF.OldCellValue := Accrec.PlanDetail[Integer(ARecordHandle)];
      Accrec.PlanDetail[Integer(ARecordHandle)] := Avalue;
      end
    else
      begin
      MonitoringExpensesF.OldCellValue := Accrec.PlanSummary[Integer(ARecordHandle)];
      Accrec.PlanSummary[Integer(ARecordHandle)] := Avalue;
      end;
    MonitoringExpensesF.CalcDetail(Integer(ARecordHandle), Integer(ADataBinding.Data));
//    DataChanged;
    end;
end;

function TMEDataSource.GetItemHandle(AItemIndex: Integer): TcxDataItemHandle;
begin
  Result := TcxDataItemHandle(GetDataBinding(AItemIndex));
end;

procedure TMonitoringExpensesF.FormCreate(Sender: TObject);
var
  DaysinYear: Integer;
  J: Integer;
  MonitorDataRec : TPlanDataRecPtr;
  NewTVAmount: TcxGridBandedColumn;
begin
  Initialised := False;
//  Color := GGlobals.FormColour;
  DMrep1.TariButtonList.GetImage(0, CloseBtn.Glyph);
  Formactive := False;
  DataModuleClient.LookupSummaryIntervals.First;
  MSPeriodInterval.Properties.Items.Clear;
  while DataModuleClient.LookupSummaryIntervals.eof = False do
    begin
		MSPeriodInterval.Properties.Items.Add(DataModuleClient.LookupSummaryIntervalsPeriod_Desc.AsString);
    DataModuleClient.LookupSummaryIntervals.Next;
    end;
	Caption := 'Tracking Expenses Data Entry - ' + DataModuleClient.BusinessesBranch_Name.AsString;
  DataCollect.GetConsolidatedList(DataModuleClient.DepartmentsDEPT_ID.Value, ctNormal);
  DataCollect.msdate := DataModuleClient.DepartmentsCURRENTMONITORINGSTART.value;
  DataCollect.medate := DataModuleClient.DepartmentsCURRENTMONITORINGEND.value;
  MPeriodLbl.Caption := FormatDateTime('dd-MMM-yy', DataModuleClient.DepartmentsCurrentMonitoringStart.value) +  ' to ' +
    FormatDateTime('dd-MMM-yy', DataModuleClient.DepartmentsCurrentMonitoringEnd.value);
  DataCollect.getMonitoringExpData;
  DataCollect.GetDetailedOptions(DataModuleClient.DepartmentsDEPT_ID.Value);
  for J := 0 to MonitoringExpDataList.count - 1 do
    begin
    MonitorDataRec := MonitoringExpDataList.items[J];
    if J = 0 then
      MEBANDTVAmount.Caption := MonitorDataRec.AccountTitle
    else
      begin
      NewTVAmount := MEBANDTV.CreateColumn;
      NewTVAmount.HeaderAlignmentHorz := taCenter;
      NewTVAmount.HeaderAlignmentVert := vaCenter;
      NewTVAmount.Options.Filtering := False;
      NewTVAmount.Options.Grouping := False;
      NewTVAmount.Options.IncSearch := False;
      NewTVAmount.Options.Moving := False;
      NewTVAmount.Options.VertSizing := False;
      NewTVAmount.Options.Sorting := False;
      NewTVAmount.Position.BandIndex := 1;
      NewTVAmount.MinWidth := 116;
      NewTVAmount.Tag := J + 1;
      NewTVAmount.PropertiesClass := TcxCurrencyEditProperties;
      if J < (MonitoringExpDataList.count - 1) then
        NewTVAmount.Caption := MonitorDataRec.AccountTitle
      else
        begin
        NewTVAmount.Options.Editing := False;
        NewTVAmount.Options.Focusing := False;
        NewTVAmount.Caption := 'Total Expenses';
        end;
      end;
    end;
  LastColumn := MonitoringExpDataList.count;
  // Get Account Titles
  MSPeriodInterval.ItemIndex := strtoint(currtostr(DataCollect.DetailedOptions[52]));
  DaysinYear := trunc(DataModuleClient.DepartmentsCurrentMonitoringEnd.value) - trunc(DataModuleClient.DepartmentsCurrentMonitoringStart.value);
  if MSPeriodInterval.ItemIndex < 0 then
    MSPeriodInterval.ItemIndex := 0;
  LatestPeriod := 0;
  if DataCollect.DetailedOptions[53] > 0 then
    begin
    LatestPeriod := Trunc(DataCollect.DetailedOptions[53] - DataModuleClient.DepartmentsCurrentMonitoringStart.value);
    if (LatestPeriod < 0) or (LatestPeriod > DaysinYear) then
      LatestPeriod := 0;
    end;
  for j := 0 to DaysInYear do    // Iterate
		YearDates[j] := FormatDateTime(' dd mmm yyyy ', DataModuleClient.DepartmentsCurrentMonitoringStart.value + j);
  Initialised := True;
  GenerateColumns(MEBANDTV);
  MEBANDTV.DataController.CustomDataSource := TMEDataSource.Create;
  ComboBox1Change(Sender);
end;

procedure TMonitoringExpensesF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  screen.Cursor := crHourGlass;
  DataCollect.DetailedOptions[52] := MSPeriodInterval.ItemIndex;
  if SaveLastDateCB.checked then
    begin
    if ComboBox1State = 0 then
      DataCollect.DetailedOptions[53] := DataModuleClient.DepartmentsCurrentMonitoringStart.value + MEBANDTV.Controller.FocusedRowIndex
    else
      DataCollect.DetailedOptions[53] := DataModuleClient.DepartmentsCurrentMonitoringStart.value + SummaryPeriodIndexArray[MEBANDTV.Controller.FocusedRowIndex];
    end
  else
    DataCollect.DetailedOptions[53] := 0;
  DataCollect.SetDetailedOptions(DataModuleClient.DepartmentsDEPT_ID.Value);
  if DataCollect.MonitoringExploaded = True then
    DataCollect.SetMonitoringExpData;
  DataCollect.clearMonitorExpDataList;
  DataCollect.ClearConsolidatedList;
  Close;
end;

procedure TMonitoringExpensesF.ComboBox1Change(Sender: TObject);
var
  j: Integer;
  daysinyear: integer;
  SummaryPtr : TPlanDataRecPtr;
begin
  if Initialised then
    begin
    daysinyear := trunc(DataModuleClient.DepartmentsCurrentMonitoringEnd.value) - trunc(DataModuleClient.DepartmentsCurrentMonitoringStart.value);
    ComboBox1State := MSPeriodInterval.ItemIndex;
    if MSPeriodInterval.ItemIndex > 0 then
      NumOfRows :=  createSummaryIndex(MSPeriodInterval.ItemIndex, DataModuleClient.DepartmentsCurrentMonitoringStart.value, DataModuleClient.DepartmentsCurrentMonitoringEnd.value)
    else
      NumOfRows := DaysinYear + 1;
    for J := 0 to MonitoringExpDataList.count - 1 do
      begin
      SummaryPtr := MonitoringExpDataList.Items[J];
      BuildSummary(SummaryPtr.Accountno, DataModuleClient.DepartmentsCurrentMonitoringStart.value, DataModuleClient.DepartmentsCurrentMonitoringEnd.value, SummaryPtr.PlanDetail, SummaryPtr.PlanSummary);
      end;    // for
    MEBANDTV.DataController.CustomDataSource.DataChanged;
    end;
end;

procedure TMonitoringExpensesF.CalcDetail(rownum, colnum : integer);
var
  I: Integer;
  j: Integer;
  MonitorDataRec : TPlanDataRecPtr;
  MonitorTEDataRec : TPlanDataRecPtr;
  SummaryPtr : TPlanDataRecPtr;
  temparray : TDetailedBalArray;
  fromperiod, toperiod : integer;
begin
  MonitorDataRec := MonitoringExpDataList.Items[Colnum - 1];
  MonitorTEDataRec := MonitoringExpDataList.Items[MonitoringExpDataList.count - 1];
  if ComboBox1State = 0 then
    begin
    Fromperiod := Rownum - 1;
    Toperiod := rownum - 1;
    end
  else
    begin
    if Rownum < 1 then
      fromperiod := 0
    else
      fromperiod := SummaryPeriodIndexArray[rownum - 1] + 1;
    toperiod := SummaryPeriodIndexArray[Rownum];
    if OldCellvalue <> MonitorDataRec.PlanSummary[rownum] then
      begin
      UpdateFromSummaryBalances(MonitorDataRec.Plandetail,   temparray,
        MonitorDataRec.PlanSummary[Rownum], fromperiod, toperiod, MonitorDataRec.Accountno);
      end;
    end;
  for I := fromperiod to toperiod do    // Iterate
    MonitorTEDataRec.PlanDetail[I] := 0;
  for J := 0 to MonitoringExpDataList.count - 2 do    // Iterate
    begin
    MonitorDataRec := MonitoringExpDataList.Items[j];
    for I := fromperiod to toperiod do    // Iterate
      MonitorTEDataRec.PlanDetail[I] := MonitorTEDataRec.PlanDetail[I] + MonitorDataRec.PlanDetail[I];
    end;    // for
  for J := 0 to MonitoringExpDataList.count - 1 do
    begin
    SummaryPtr := MonitoringExpDataList.Items[j];
    BuildSummary(SummaryPtr.Accountno, DataModuleClient.DepartmentsCurrentMonitoringStart.value, DataModuleClient.DepartmentsCurrentMonitoringEnd.value, SummaryPtr.PlanDetail, SummaryPtr.PlanSummary);
    end;
end;

procedure TMonitoringExpensesF.FormActivate(Sender: TObject);
begin
 Formactive := True;
end;

procedure TMonitoringExpensesF.FormShow(Sender: TObject);
begin
  screen.Cursor := crDefault;
end;

end.
