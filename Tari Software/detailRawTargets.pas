unit detailRawTargets;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LGlobals, Auchtypes, DMrep1U, StdCtrls, cxButtons, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxContainer, cxEdit, cxGroupBox, cxRadioGroup,
  cxCustomData, cxDataStorage, cxCheckBox, cxGridBandedTableView, DateUtils,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinXmas2008Blue, cxStyles, dxSkinscxPCPainter, cxFilter, cxData,
  cxTextEdit, cxCurrencyEdit, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  cxLabel;

Const

  DATECOL = 1;
  BILLEDCOL = 2;
  POTENTIALCOL = 3;
  PRODCOL = 4;
  SALEUNITCOL = 5;
  GPUNITCOL = 6;
  GPPCCOL = 7;
  OTHERCOL = 8;
  SALESCOL = 9;
  GPCOL = 10;
  LASTCOL = 11;

  MAXSALESUNIT = 50000;
  FIXBILLED = 0;
  FIXPOTENTIAL = 1;
  FIXSALES = 2;
  FIXGP = 3;
  FIXNOP = 4;
  FIXNP = 5;


type
  TDetailRawTargetsF = class(TForm)
    CloseBtn: TcxButton;
    RGIndex: TcxRadioGroup;
    cxGrid1: TcxGrid;
    cxGLTargets: TcxGridLevel;
    CalcSalesGPUP: TcxCheckBox;
    GRIDVRawTargets: TcxGridBandedTableView;
    BandGVDateCol: TcxGridBandedColumn;
    BandGVBilledCol: TcxGridBandedColumn;
    BandGVPotentialCol: TcxGridBandedColumn;
    BandGVProdCol: TcxGridBandedColumn;
    BandGVSaleUnitCol: TcxGridBandedColumn;
    BandGVGPUnitCol: TcxGridBandedColumn;
    BandGVGPPCCol: TcxGridBandedColumn;
    BandGVOtherCol: TcxGridBandedColumn;
    BandGVSalesCol: TcxGridBandedColumn;
    BandGCGPCol: TcxGridBandedColumn;
    SmartEditCB: TcxCheckBox;
    DeptLbl: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure RGIndexClick(Sender: TObject);
    procedure GRIDVRawTargetsDataControllerSummaryAfterSummary(
      ASender: TcxDataSummary);
    procedure GRIDVRawTargetsDataControllerRecordChanged(
      ADataController: TcxCustomDataController; ARecordIndex,
      AItemIndex: Integer);
    procedure GRIDVRawTargetsFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure GRIDVRawTargetsFocusedItemChanged(
      Sender: TcxCustomGridTableView; APrevFocusedItem,
      AFocusedItem: TcxCustomGridTableItem);
    procedure GRIDVRawTargetsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    DataUpdating : Boolean;
    procedure CalculateArray(Accountno: integer);
    procedure UpdateSeries(ArrayItem, AccountNo: Integer);
    procedure CalcAll(SelectedSeries, PeriodChanged: Integer; NewValue : Currency);
    function GetCalcMode : Boolean;
    procedure SetCalcMode(CalcUp: Boolean);
  public
    RecordPtr: array[1..LASTCOL - 1] of TPlanDataRecPtr;
    PeriodIndex : Integer;
    SeriesSize : integer;
    UpdateStart, UpdateEnd : Integer;
    Currentmin : Integer;
    Startpoint : TPoint;
    PointersPerPage : Integer;
    DecPrecision : Integer;
    AllowChartEdit : Boolean;
    Autocopy : Boolean;
    LastRecordIndex, LastItemIndex : Integer;
    AutocopyAmt : Currency;
  end;

  TTargetsDataSource = class(TcxCustomDataSource)
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
  DetailRawTargetsF: TDetailRawTargetsF;

  procedure GenerateColumns(AGridTableView: TcxGridTableView);

implementation

{$R *.dfm}

uses DataCollector, DMClient;

{ TTargetsDataSource }
constructor TTargetsDataSource.Create;
begin
  inherited Create;
end;

destructor TTargetsDataSource.Destroy;
begin
  inherited Destroy;
end;

function TTargetsDataSource.GetDataBinding(AItemIndex: Integer): TcxGridItemDataBinding;
begin
  Result := TcxCustomGridTableItem(DataController.GetItem(AItemIndex)).DataBinding;
end;


function TTargetsDataSource.GetRecordCount: Integer;
begin
  Result := DetailRawTargetsF.SeriesSize + 1;
end;

function TTargetsDataSource.GetValue(ARecordHandle: TcxDataRecordHandle; AItemHandle: TcxDataItemHandle): Variant;
var
  ADataBinding: TcxGridItemDataBinding;
begin
  ADataBinding := TcxGridItemDataBinding(AItemHandle);
  // Switch if RGIndex > 0
  // ADataBinding.data is the Data Array
  // ArecordHandle - 1 is the array element
  if DetailRawTargetsF.RGIndex.ItemIndex = 0 then
    begin
    if Integer(ADataBinding.data) = DATECOL then
      result := formatDateTime(GGlobals.DateFENH, DataModuleClient.DepartmentsCurrentPlanStart.value + integer(ArecordHandle))
    else
      Result := TPlanDataRecPtr(DetailRawTargetsF.RecordPtr[Integer(ADataBinding.data)]).plandetail[integer(ArecordHandle)];
    end
  else
    begin
    if Integer(ADataBinding.data) = DATECOL then
      result := formatDateTime(GGlobals.DateFENH, DataModuleClient.DepartmentsCurrentPlanStart.value + SummaryPeriodIndexArray[integer(ArecordHandle)])
    else
      Result := TPlanDataRecPtr(DetailRawTargetsF.RecordPtr[Integer(ADataBinding.data)]).planSummary[integer(ArecordHandle)];
    end;
end;

function TTargetsDataSource.IsNativeCompare: Boolean;
begin
  Result := False;
end;

procedure TTargetsDataSource.SetValue(ARecordHandle: TcxDataRecordHandle;
  AItemHandle: TcxDataItemHandle; const AValue: Variant);
var
  ADataBinding: TcxGridItemDataBinding;
begin
  ADataBinding := TcxGridItemDataBinding(AItemHandle);
  DetailRawTargetsF.CalcAll(Integer(ADataBinding.data), Integer(ArecordHandle), Currency(AValue));
  DataChanged;
end;

function TTargetsDataSource.GetItemHandle(AItemIndex: Integer): TcxDataItemHandle;
begin
  Result := TcxDataItemHandle(GetDataBinding(AItemIndex));
end;

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
          1: DataBinding.ValueTypeClass := TcxStringValueType;
          2,3,4,5,6,7,8,9,10:
            DataBinding.ValueTypeClass := TcxCurrencyValueType;
        end;    // case
      end;
		end;    // for
end;

Procedure TDetailRawTargetsF.FormCreate(Sender: TObject);
begin
  Width := 1020;
  Height := 760;
//  Color := GGlobals.FormColour;
  DMrep1.TariButtonList.GetImage(0, CloseBtn.Glyph);
	Caption := 'Target Details - '  + DataModuleClient.BusinessesBRANCH_NAME.AsString;
  DeptLbl.Caption := 'Department: ' + DataModuleClient.DepartmentsREVENUE_GROUP_NAME.AsString;
  RecordPtr[BILLEDCOL] := PlanDataList.Items[getAccountListIndex(BILLED)];
  RecordPtr[POTENTIALCOL] := PlanDataList.Items[getAccountListIndex(POTENTIAL)];
  RecordPtr[PRODCOL] := PlanDataList.Items[getAccountListIndex(PRODUCTIVITY)];
  RecordPtr[SALEUNITCOL] := PlanDataList.Items[getAccountListIndex(SALESUNIT)];
  RecordPtr[GPUNITCOL] := PlanDataList.Items[getAccountListIndex(GPUNIT)];
  RecordPtr[GPPCCOL] := PlanDataList.Items[getAccountListIndex(GPPC)];
  RecordPtr[OTHERCOL] := PlanDataList.Items[getAccountListIndex(OTHERINCOME)];
  RecordPtr[SALESCOL] := PlanDataList.Items[getAccountListIndex(SALES)];
  RecordPtr[GPCOL] := PlanDataList.Items[getAccountListIndex(GROSSPROFIT)];
  AutoCopy := False;
  SmartEditCB.Checked := False;
  DataUpdating := False;
  GenerateColumns(GRIDVRawTargets);
  GRIDVRawTargets.DataController.CustomDataSource := TTargetsDataSource.Create;
  GRIDVRawTargets.DataController.CustomDataSource.DataChanged;
  GRIDVRawTargets.ViewData.Expand(true);
  FormResize(Self);
end;

procedure TDetailRawTargetsF.CalculateArray(Accountno: integer);
var
  PlanDataRec : TPlanDataRecPtr;
  PlanSalesRec : TPlanDataRecPtr;
  PlanGPRec : TPlanDataRecPtr;
  PlanBilledRec : TPlanDataRecPtr;
  PlanPotentialRec : TPlanDataRecPtr;
  PlanProdRec : TPlanDataRecPtr;
  PlanSalesUnitRec : TPlanDataRecPtr;
  PlanGPUnitRec : TPlanDataRecPtr;
  PlanGPPCRec : TPlanDataRecPtr;
  PlanExpRec : TPlanDataRecPtr;
  PlanOtherRec : TPlanDataRecPtr;
  PlanNOPRec : TPlanDataRecPtr;
  PlanNPRec : TPlanDataRecPtr;
  j: integer;
begin
  PlanDataRec := PlanDataList.Items[GetaccountListIndex(AccountNo)];
  PlanSalesRec := PlanDataList.Items[GetaccountListIndex(SALES)];
  PlanGPRec := PlanDataList.Items[GetaccountListIndex(GROSSPROFIT)];
  PlanBilledRec := PlanDataList.Items[GetaccountListIndex(BILLED)];
  PlanPotentialRec := PlanDataList.Items[GetaccountListIndex(POTENTIAL)];
  PlanProdRec := PlanDataList.Items[GetaccountListIndex(PRODUCTIVITY)];
  PlanSalesUnitRec := PlanDataList.Items[GetaccountListIndex(SALESUNIT)];
  PlanGPUnitRec := PlanDataList.Items[GetaccountListIndex(GPUNIT)];
  PlanGPPCRec := PlanDataList.Items[GetaccountListIndex(GPPC)];
  PlanExpRec := PlanDataList.Items[GetaccountListIndex(TOTALEXPENSES)];
  PlanOtherRec := PlanDataList.Items[GetaccountListIndex(OTHERINCOME)];
  PlanNOPRec := PlanDataList.Items[GetaccountListIndex(NETOPERATINGPROFIT)];
  PlanNPRec := PlanDataList.Items[GetaccountListIndex(NETPROFIT)];
  if Periodindex = 0 then
    begin
    if (Accountno = SALES) and (CalcSalesGPUP.Checked) then
      for j := UpdateStart to UpdateEnd do
        begin
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanDetail[j];
        if PlanGPPCRec.PlanDetail[j] <> 0 then
          PlanDataRec.PlanDetail[j] := PlanGPRec.Plandetail[j] * 100 / PlanGPPCRec.Plandetail[j]
        else
          PlanDataRec.PlanDetail[j] := 0;
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanDetail[j];
        end;
    if (Accountno = SALES) and (not CalcSalesGPUP.Checked) then
      for j := UpdateStart to UpdateEnd do
        begin
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanDetail[j];
        if PlanBilledRec.PlanDetail[j] <> 0 then
          PlanDataRec.PlanDetail[j] := PlanBilledRec.Plandetail[j] * PlanSalesunitRec.Plandetail[j]
        else
          PlanDataRec.PlanDetail[j] := 0;
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanDetail[j];
        end;
    if (Accountno = GROSSPROFIT) and (Not CalcSalesGPUP.Checked) then
      for j := UpdateStart to UpdateEnd do
        begin
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanDetail[j];
        if PlanGPPCRec.PlanDetail[j] <> 0 then
          PlanDataRec.PlanDetail[j] := PlanSalesRec.Plandetail[j] * PlanGPPCRec.Plandetail[j] / 100
        else
          PlanDataRec.PlanDetail[j] := 0;
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanDetail[j];
        end;
    if (Accountno = GROSSPROFIT) and (CalcSalesGPUP.Checked) then
      for j := UpdateStart to UpdateEnd do
        begin
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanDetail[j];
        if PlanBilledRec.PlanDetail[j] <> 0 then
          PlanDataRec.PlanDetail[j] := PlanBilledRec.Plandetail[j] * PlanGPUnitRec.Plandetail[j]
        else
          PlanDataRec.PlanDetail[j] := 0;
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanDetail[j];
        end;
    if Accountno = SALESUNIT then
      for j := UpdateStart to UpdateEnd do
        begin
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanDetail[j];
        if PlanBilledRec.PlanDetail[j] <> 0 then
          PlanDataRec.PlanDetail[j] := PlanSalesRec.Plandetail[j] / PlanBilledRec.Plandetail[j]
        else
          PlanDataRec.PlanDetail[j] := 0;
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanDetail[j];
        end;
    if Accountno = GPUNIT then
      for j := UpdateStart to UpdateEnd do    // Iterate
        begin
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanDetail[j];
        if PlanBilledRec.PlanDetail[j] <> 0 then
          PlanDataRec.PlanDetail[j] := PlanGPRec.Plandetail[j] / PlanBilledRec.Plandetail[j]
        else
          PlanDataRec.PlanDetail[j] := 0;
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanDetail[j];
        end;
    if Accountno = GPPC then
      for j := UpdateStart to UpdateEnd do    // Iterate
        begin
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanDetail[j];
        if PlanSalesRec.PlanDetail[j] <> 0 then
          PlanDataRec.PlanDetail[j] := PlanGPRec.Plandetail[j] * 100 / PlanSalesRec.Plandetail[j]
        else
          PlanDataRec.PlanDetail[j] := 0;
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanDetail[j];
        end;
    if Accountno = PRODUCTIVITY then
      for j := UpdateStart to UpdateEnd do    // Iterate
        begin
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanDetail[j];
        if PlanPotentialRec.PlanDetail[j] <> 0 then
          PlanDataRec.PlanDetail[j] := PlanBilledRec.Plandetail[j] * 100 / PlanPotentialRec.Plandetail[j]
        else
          PlanDataRec.PlanDetail[j] := 0;
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanDetail[j];
        end;
    if Accountno = BILLED then  // Calculate ONLY if we Have Potential Units
      for j := UpdateStart to UpdateEnd do    // Iterate
        begin
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanDetail[j];
        if PlanPotentialRec.PlanDetail[j] <> 0 then
          PlanDataRec.PlanDetail[j] := PlanProdRec.Plandetail[j] / 100 * PlanPotentialRec.Plandetail[j];
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanDetail[j];
        end;
    if Accountno = NETOPERATINGPROFIT then  // Also calculates NETWPROFIT
      for j := UpdateStart to UpdateEnd do    // Iterate
        begin
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanDetail[j];
        PlanNPRec.PlanTotal := PlanNPRec.PlanTotal - PlanNPRec.PlanDetail[j];
        PlanDataRec.PlanDetail[j] := PlanGPRec.Plandetail[j] - PlanExpRec.planDetail[j];
        PlanNPRec.PlanDetail[j] := PlanDataRec.Plandetail[j] + PlanOtherRec.planDetail[j];
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanDetail[j];
        PlanNPRec.PlanTotal := PlanNPRec.PlanTotal + PlanNPRec.PlanDetail[j];
        end;
    if Accountno = NETPROFIT then
      for j := UpdateStart to UpdateEnd do    // Iterate
        begin
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanDetail[j];
        PlanDataRec.PlanDetail[j] := PlanNOPRec.Plandetail[j] + PlanOtherRec.planDetail[j];
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanDetail[j];
        end;
    end
  else
    begin
    if (Accountno = SALES) and (CalcSalesGPUP.Checked) then
      for j := UpdateStart to UpdateEnd do
        begin
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanSummary[j];
        if PlanGPPCRec.PlanSummary[j] <> 0 then
          PlanDataRec.PlanSummary[j] := PlanGPRec.PlanSummary[j] * 100 / PlanGPPCRec.PlanSummary[j]
        else
          PlanDataRec.PlanSummary[j] := 0;
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanSummary[j];
        end;
    if (Accountno = SALES) and (not CalcSalesGPUP.Checked) then
      for j := UpdateStart to UpdateEnd do
        begin
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanSummary[j];
        if PlanBilledRec.PlanSummary[j] <> 0 then
          PlanDataRec.PlanSummary[j] := PlanBilledRec.PlanSummary[j] * PlanSalesunitRec.PlanSummary[j]
        else
          PlanDataRec.PlanSummary[j] := 0;
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanSummary[j];
        end;
    if (Accountno = GROSSPROFIT) and (Not CalcSalesGPUP.Checked) then
      for j := UpdateStart to UpdateEnd do
        begin
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanSummary[j];
        if PlanGPPCRec.PlanSummary[j] <> 0 then
          PlanDataRec.PlanSummary[j] := PlanSalesRec.PlanSummary[j] * PlanGPPCRec.PlanSummary[j] / 100
        else
          PlanDataRec.PlanSummary[j] := 0;
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanSummary[j];
        end;
    if (Accountno = GROSSPROFIT) and (CalcSalesGPUP.Checked) then
      for j := UpdateStart to UpdateEnd do
        begin
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanSummary[j];
        if PlanBilledRec.PlanSummary[j] <> 0 then
          PlanDataRec.PlanSummary[j] := PlanBilledRec.PlanSummary[j] * PlanGPUnitRec.PlanSummary[j]
        else
          PlanDataRec.PlanSummary[j] := 0;
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanSummary[j];
        end;
    if Accountno = SALESUNIT then
      for j := UpdateStart to UpdateEnd do    // Iterate
        begin
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanSummary[j];
        if PlanBilledRec.PlanSummary[j] <> 0 then
          PlanDataRec.PlanSummary[j] := PlanSalesRec.PlanSummary[j] / PlanBilledRec.PlanSummary[j]
        else
          PlanDataRec.PlanSummary[j] := 0;
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanSummary[j];
        end;
    if Accountno = GPUNIT then
      for j := UpdateStart to UpdateEnd do    // Iterate
        begin
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanSummary[j];
        if PlanBilledRec.PlanSummary[j] <> 0 then
          PlanDataRec.PlanSummary[j] := PlanGPRec.PlanSummary[j] / PlanBilledRec.PlanSummary[j]
        else
          PlanDataRec.PlanSummary[j] := 0;
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanSummary[j];
        end;
    if Accountno = GPPC then
      for j := UpdateStart to UpdateEnd do    // Iterate
        begin
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanSummary[j];
        if PlanSalesRec.PlanSummary[j] <> 0 then
          PlanDataRec.PlanSummary[j] := PlanGPRec.PlanSummary[j] * 100 / PlanSalesRec.PlanSummary[j]
        else
          PlanDataRec.PlanSummary[j] := 0;
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanSummary[j];
        end;
    if Accountno = PRODUCTIVITY then
      for j := UpdateStart to UpdateEnd do    // Iterate
        begin
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanSummary[j];
        if PlanPotentialRec.PlanSummary[j] <> 0 then
          PlanDataRec.PlanSummary[j] := PlanBilledRec.PlanSummary[j] * 100 / PlanPotentialRec.PlanSummary[j]
        else
          PlanDataRec.PlanSummary[j] := 0;
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanSummary[j];
        end;
    if Accountno = BILLED then  // Calculate ONLY if we Have Potential Units
      for j := UpdateStart to UpdateEnd do    // Iterate
        begin
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanSummary[j];
        if PlanPotentialRec.PlanSummary[j] <> 0 then
          PlanDataRec.PlanSummary[j] := PlanProdRec.PlanSummary[j] / 100 * PlanPotentialRec.PlanSummary[j];
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanSummary[j];
        end;
    if Accountno = NETOPERATINGPROFIT then  // Also calculates NETWPROFIT
      for j := UpdateStart to UpdateEnd do    // Iterate
        begin
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanSummary[j];
        PlanNPRec.PlanTotal := PlanNPRec.PlanTotal - PlanNPRec.PlanSummary[j];
        PlanDataRec.PlanSummary[j] := PlanGPRec.PlanSummary[j] - PlanExpRec.PlanSummary[j];
        PlanNPRec.PlanSummary[j] := PlanDataRec.PlanSummary[j] + PlanOtherRec.PlanSummary[j];
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanSummary[j];
        PlanNPRec.PlanTotal := PlanNPRec.PlanTotal + PlanNPRec.PlanSummary[j];
        end;
    if Accountno = NETPROFIT then
      for j := UpdateStart to UpdateEnd do    // Iterate
        begin
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanSummary[j];
        PlanDataRec.PlanSummary[j] := PlanNOPRec.PlanSummary[j] + PlanOtherRec.PlanSummary[j];
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanSummary[j];
        end;
    end;
end;

procedure TDetailRawTargetsF.CalcAll(SelectedSeries, PeriodChanged: Integer; NewValue : Currency);
var
  I, J : Integer;
  FixedAccounts : array[0..FIXNP] of Integer;
  AccNo : integer;
begin
  for I := 0 to FIXNP do    // Iterate - initialise this array, for BILLED, POTENTIAL, SALES, GP, NOP, NP
    FixedAccounts[I] := 0;
  if RGindex.ItemIndex = 0 then
    begin
    RecordPtr[SelectedSeries].Plantotal := RecordPtr[SelectedSeries].Plantotal - RecordPtr[SelectedSeries].PlanDetail[PeriodChanged];
    RecordPtr[SelectedSeries].PlanDetail[PeriodChanged] := NewValue;
    RecordPtr[SelectedSeries].Plantotal := RecordPtr[SelectedSeries].Plantotal + RecordPtr[SelectedSeries].PlanDetail[PeriodChanged];
    end
  else
    begin
    RecordPtr[SelectedSeries].Plantotal := RecordPtr[SelectedSeries].Plantotal - RecordPtr[SelectedSeries].PlanSummary[PeriodChanged];
    RecordPtr[SelectedSeries].PlanSummary[PeriodChanged] := NewValue;
    RecordPtr[SelectedSeries].Plantotal := RecordPtr[SelectedSeries].Plantotal + RecordPtr[SelectedSeries].PlanSummary[PeriodChanged];
    UpdateSeries(PeriodChanged, RecordPtr[SelectedSeries].AccountNo);
    end;
  if SelectedSeries = BILLEDCOL then // Billed
    begin
    if GetCalcMode then
      begin
      CalculateArray(GROSSPROFIT);
      CalculateArray(SALES);
      CalculateArray(SALESUNIT);
      end
    else
      begin
      CalculateArray(SALES);
      CalculateArray(GROSSPROFIT);
      CalculateArray(GPUNIT);
      end;
    CalculateArray(NETOPERATINGPROFIT);
    CalculateArray(PRODUCTIVITY);
    FixedAccounts[FIXSALES] := 1;
    FixedAccounts[FIXGP] := 1;
    FixedAccounts[FIXNOP] := 1;
    FixedAccounts[FIXNP] := 1;
    end;
  if (SelectedSeries = POTENTIALCOL) or (SelectedSeries = PRODCOL) then // Potential or Productivity
    begin
    CalculateArray(BILLED);
    if GetCalcMode then
      begin
      CalculateArray(GROSSPROFIT);
      CalculateArray(SALES);
      CalculateArray(SALESUNIT);
      end
    else
      begin
      CalculateArray(SALES);
      CalculateArray(GROSSPROFIT);
      CalculateArray(GPUNIT);
      end;
    CalculateArray(NETOPERATINGPROFIT);
    FixedAccounts[FIXBILLED] := 1;
    FixedAccounts[FIXSALES] := 1;
    FixedAccounts[FIXGP] := 1;
    FixedAccounts[FIXNOP] := 1;
    FixedAccounts[FIXNP] := 1;
    end;
  if SelectedSeries = SALEUNITCOL then // Sales per Unit
    begin
    SetCalcMode(False);
    CalculateArray(SALES);
    CalculateArray(GROSSPROFIT);
    CalculateArray(GPUNIT);
    CalculateArray(NETOPERATINGPROFIT);
    FixedAccounts[FIXSALES] := 1;
    FixedAccounts[FIXGP] := 1;
    FixedAccounts[FIXNOP] := 1;
    FixedAccounts[FIXNP] := 1;
    end;
  if SelectedSeries = GPUNITCOL then // GP per Unit
    begin
    SetCalcMode(True);
    CalculateArray(GROSSPROFIT);
    CalculateArray(SALES);
    CalculateArray(SALESUNIT);
    CalculateArray(NETOPERATINGPROFIT);
    FixedAccounts[FIXSALES] := 1;
    FixedAccounts[FIXGP] := 1;
    FixedAccounts[FIXNOP] := 1;
    FixedAccounts[FIXNP] := 1;
    end;
  if SelectedSeries = GPPCCOL then // GPPC
    begin
    if GetCalcMode then
      begin
      CalculateArray(SALES);
      CalculateArray(SALESUNIT);
      FixedAccounts[FIXSALES] := 1;
      end
    else
      begin
      CalculateArray(GROSSPROFIT);
      CalculateArray(GPUNIT);
      CalculateArray(NETOPERATINGPROFIT);
      FixedAccounts[FIXGP] := 1;
      FixedAccounts[FIXNOP] := 1;
      FixedAccounts[FIXNP] := 1;
      end;
    end;
  if SelectedSeries = GPPCCOL then // GPPC
    begin
    CalculateArray(NETPROFIT);
    FixedAccounts[FIXNOP] := 1;
    end;
  if Periodindex > 0 then
    begin
    for I := 0 to FIXNP do    // Iterate
      begin
      Accno := POTENTIAL;
      if FixedAccounts[I] > 0 then
        begin
          case I of    //
          FIXPOTENTIAL: Accno := POTENTIAL;
          FIXBILLED: Accno := BILLED;
          FIXSALES: Accno := SALES;
          FIXGP: Accno := GROSSPROFIT;
          FIXNOP: Accno := NETOPERATINGPROFIT;
          FIXNP: Accno := NETPROFIT;
          end;    // case
        for J := UpdateStart to UpdateEnd do    // Iterate
          UpdateSeries(J, Accno);
        end;
      end;    // for
    end;
end;

procedure TDetailRawTargetsF.UpdateSeries(ArrayItem, AccountNo: Integer);
var
  PlanDataRec : TPlanDataRecPtr;
  temparray : TDetailedBalArray;
  fromperiod, toperiod, Rounding : integer;
begin
  PlanDataRec := PlanDataList.Items[GetaccountListIndex(AccountNo)];
  if ArrayItem = 0 then
    begin
    fromperiod := 0;
    toperiod := SummaryPeriodIndexArray[ArrayItem];
    end
  else
    begin
    fromperiod := SummaryPeriodIndexArray[ArrayItem - 1] + 1;
    toperiod := SummaryPeriodIndexArray[ArrayItem];
    end;
  // Force Update of PlanDetail for this account
  if PlanDataRec.accountNo < SALESUNIT then
    begin
    DataCollect.psdate := DataModuleClient.DepartmentsCurrentPlanStart.value;
    DataCollect.pedate := DataModuleClient.DepartmentsCurrentPlanEnd.value;
    move(PlanDataRec.Plandetail, temparray, sizeof(TDetailedBalArray));
    Rounding := 1;
    if (PlanDataRec.accountNo = SALES) or
       (PlanDataRec.accountNo = GROSSPROFIT) then
      Rounding := 0;
    DataCollect.updateArray(PlanDataRec.Plandetail,
                  DaysBetween(IncDay(DataCollect.psdate, fromperiod), DataCollect.psdate),
                  DaysBetween(IncDay(DataCollect.psdate, toperiod), DataCollect.psdate),
                   PlanDataRec.PlanSummary[ArrayItem], Rounding);
    end;
end;

function TDetailRawTargetsF.GetCalcMode : Boolean;
begin
  Result := CalcSalesGPUP.Checked;
end;

procedure TDetailRawTargetsF.SetCalcMode(CalcUp: Boolean);
begin
  if CalcUp then
    CalcSalesGPUP.Checked := True
  else
    CalcSalesGPUP.Checked := False;
end;

procedure TDetailRawTargetsF.RGIndexClick(Sender: TObject);
var
  j: Integer;
  PlanDataRec: TPlanDataRecPtr;
begin
  UpdateStart := 0;
  CalculateArray(SALESUNIT);
  CalculateArray(GPUNIT);
  CalculateArray(GPPC);
  CalculateArray(PRODUCTIVITY);
  SeriesSize := trunc(DataModuleClient.DepartmentsCurrentPlanEnd.value) - trunc(DataModuleClient.DepartmentsCurrentPlanStart.value);
  if RGIndex.ItemIndex > 0 then
    SeriesSize :=  createSummaryIndex(RGIndex.ItemIndex, DataModuleClient.DepartmentsCurrentPlanStart.value, DataModuleClient.DepartmentsCurrentPlanEnd.value) - 1;
  for j := 0 to DETAILEDPLANLIST - 1 do    // Iterate
    begin
    PlanDataRec := PlanDataList.items[GetaccountListIndex(DetailedPlan[j])];
    BuildSummary(PlanDataRec.Accountno, DataModuleClient.DepartmentsCurrentPlanStart.value, DataModuleClient.DepartmentsCurrentPlanEnd.value, PlanDataRec.PlanDetail, PlanDataRec.PlanSummary);
    end;    // for
  // Record the latest State to ensure it get saved correctly
  PeriodIndex := RGIndex.ItemIndex;
  UpdateStart := 0;
  UpDateEnd := SeriesSize;
  CalculateArray(SALESUNIT);
  CalculateArray(GPUNIT);
  CalculateArray(GPPC);
  CalculateArray(PRODUCTIVITY);
  GRIDVRawTargets.DataController.CustomDataSource.DataChanged;
//  SetTotals;
end;

procedure TDetailRawTargetsF.GRIDVRawTargetsDataControllerSummaryAfterSummary(
  ASender: TcxDataSummary);
begin
// Calculate Prod %
  if ASender.FooterSummaryValues[1] <> 0 then
    Asender.FooterSummaryValues[2] := Asender.FooterSummaryValues[0] * 100 /Asender.FooterSummaryValues[1];
// Calculate Sales Unit Rate
  if Asender.FooterSummaryValues[0] <> 0 then
    Asender.FooterSummaryValues[3] := Asender.FooterSummaryValues[7] / Asender.FooterSummaryValues[0];
// Calculate GP Unit Rate
  if Asender.FooterSummaryValues[0] <> 0 then
    Asender.FooterSummaryValues[4] := Asender.FooterSummaryValues[8] / Asender.FooterSummaryValues[0];
// Calculate GP %
  if ASender.FooterSummaryValues[7] <> 0 then
    Asender.FooterSummaryValues[5] := Asender.FooterSummaryValues[8] * 100 /Asender.FooterSummaryValues[7];
// Calculate Prod %
end;

procedure TDetailRawTargetsF.GRIDVRawTargetsDataControllerRecordChanged(
  ADataController: TcxCustomDataController; ARecordIndex,
  AItemIndex: Integer);
begin
  if (SmartEditCB.Checked) and (Not DataUpdating) then
    begin
    LastRecordIndex := ARecordIndex;
    LastItemIndex := AItemIndex;
    end;
end;

procedure TDetailRawTargetsF.GRIDVRawTargetsFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var
  NewValue : currency;
  I : Integer;

begin
  for I := 0 to Sender.ItemCount - 1 do
    begin
    if Sender.Items[I].Focused then
      break;
    end;
  if (LastRecordIndex <> AFocusedRecord.Index) then
    begin
    if (LastRecordIndex = AFocusedRecord.Index - 1)
        and (SmartEditCB.Checked)
        and (Not DataUpdating)
        and (Sender.Items[I].Index = LastItemIndex) then
      begin
      if RGIndex.ItemIndex = 0 then
        begin
        AutoCopyAmt := TPlanDataRecPtr(DetailRawTargetsF.RecordPtr[LastItemIndex + 1]).plandetail[LastRecordIndex + 1];
        NewValue := TPlanDataRecPtr(DetailRawTargetsF.RecordPtr[LastItemIndex + 1]).plandetail[LastRecordIndex];
        end
      else
        begin
        AutoCopyAmt := TPlanDataRecPtr(DetailRawTargetsF.RecordPtr[LastItemIndex + 1]).planSummary[LastRecordIndex + 1];
        NewValue := TPlanDataRecPtr(DetailRawTargetsF.RecordPtr[LastItemIndex + 1]).planSummary[LastRecordIndex];
        end;
      AutoCopy := True;
      CalcAll(LastItemIndex + 1, LastRecordIndex + 1, NewValue);
      DataUpdating := True;
      LastRecordIndex := AFocusedRecord.Index; // Current Focus.index changes during DataChanged Procedure
      GRIDVRawTargets.DataController.CustomDataSource.DataChanged;
      end
    else
      AutoCopy := False;
    if Not DataUpdating then   // Not the first pass after DataChanged ^
      LastRecordIndex := AFocusedRecord.Index;
    DataUpdating := False;
    end;
  if Sender.Items[I].Index <> LastItemIndex then
    begin
    LastItemIndex := Sender.Items[I].Index;
    AutoCopy := False;
    end;
end;

procedure TDetailRawTargetsF.GRIDVRawTargetsFocusedItemChanged(
  Sender: TcxCustomGridTableView; APrevFocusedItem,
  AFocusedItem: TcxCustomGridTableItem);
begin
  LastItemIndex := AFocusedItem.Index;
end;

procedure TDetailRawTargetsF.GRIDVRawTargetsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) and (SmartEditCB.Checked) and (AutoCopy) and (Not DataUpdating)then
    begin
    AutoCopy := False;
    CalcAll(LastItemIndex + 1, LastRecordIndex, AutoCopyAmt);
    DataUpdating := True;
    GRIDVRawTargets.DataController.CustomDataSource.DataChanged;
    DataUpdating := False;
    end;
end;

procedure TDetailRawTargetsF.FormResize(Sender: TObject);
var
  I: Integer;
  GridWidthCols : Integer;
begin
//  Find Out the width of the columns
  GridWidthCols := 0;
  for I := 0 to ComponentCount - 1 do    // Iterate
    begin
    if (Components[I] is TCxgridBandedColumn) then
      GridWidthCols := GridWidthCols + TCxgridBandedColumn(Components[I]).Width;
    end;    // for
  GridWidthCols := GridWidthCols + 40;
  if cxGrid1.Width <= (GridWidthCols + 5) then
    begin
    GridWidthCols := GridWidthCols  - cxGrid1.Width;
//    if Screen.Width < (Width + GridWidthCols) then
//      GridWidthCols := Screen.Width - Width;
    cxgrid1.Width := cxGrid1.Width + GridWidthCols;
    CloseBtn.Left := CloseBtn.Left + GridWidthCols;
    Width := Width + GridWidthCols;
    end;
  // Height could expand the vertical is needed
  RGIndex.Top := Height - 147;
  CalcSalesGPUP.Top := Height - 139;
  SmartEditCB.Top := Height - 107;
  CloseBtn.Top := Height - 83;
  cxGrid1.Height := 401 + Height - 595;
end;

procedure TDetailRawTargetsF.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := True;
end;

end.
