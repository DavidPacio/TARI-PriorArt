unit detailExpensesBK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, StdCtrls, ComCtrls,
  Buttons, ImaPoint, auchTypes, BubbleCh,
  TeeTools, TeePageNumTool, ChartmanualDE, ChartHistory, Math,
  cxControls, cxContainer, cxEdit, cxRadioGroup, DMrep1U, LGlobals,
  cxLabel, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxGridCustomView, cxGrid, cxCustomData, cxDataStorage, cxGroupBox,
  cxButtons, Businesssetup, TeExport, TeeJPeg, TeeEdit, Menus, DateUtils;

Const
  MAXSALESUNIT = 50000;
  FIXBILLED = 0;
  FIXPOTENTIAL = 1;
  FIXSALES = 2;
  FIXGP = 3;
  FIXNOP = 4;
  FIXNP = 5;

type
  TDetailExpensesF = class(TForm)
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    ChartTool1: TPageNumTool;
    UpDown1: TUpDown;
    RGIndex: TcxRadioGroup;
    cxLabel1: TcxLabel;
    cxGrid1: TcxGrid;
    cxGridExpenseTableView1: TcxGridTableView;
    cxGridExpenseTableView1Title: TcxGridColumn;
    cxGridExpenseTableView1Amount: TcxGridColumn;
    cxGridExpenseTableView1Column3: TcxGridColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGroupBox1: TcxGroupBox;
    cxLabel2: TcxLabel;
    UndoBtn: TcxButton;
    HelpBtn: TcxButton;
    CloseBtn: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    DeptLbl: TcxLabel;
    PopupMenu1: TPopupMenu;
    PopupPrintChart: TMenuItem;
    PopupExportChart: TMenuItem;
    ChartPreviewer1: TChartPreviewer;
    TransferBtn: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure Chart1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure RGIndexClick(Sender: TObject);
    procedure HelpBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Chart1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure UndoBtnClick(Sender: TObject);
//    procedure TotalExpensesLEDClick(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure FormShow(Sender: TObject);
    procedure cxGridExpenseTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure CloseBtnClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure PopupPrintChartClick(Sender: TObject);
    procedure PopupExportChartClick(Sender: TObject);
    procedure TransferBtnClick(Sender: TObject);
  private
    { Private declarations }
    LeftMouseDown : Boolean;
    SelectedSeries : Integer;
    UpdateStart, UpdateEnd : Integer;
    DateIdx : Variant;
    function GrabManualValue(currX : Integer): Currency;
    procedure BuildSeries;
    procedure SaveArrayHistory;
    function RoundValue(Balance: double; Decimalplaces : Integer): Double;
//    procedure CalculateArray(Accountno: integer);
    procedure BuilddateArray;
    procedure SetAccount;
//    Function GetUnitTitle(AccountNo : Integer): string;
//    procedure SetTotals;
    procedure UpdateSeries(ArrayItem, AccountNo: Integer);
    procedure CalcAll;
    function FindNearestX(XValue: double) : integer;
    function CalcMax(Arrayitem : integer): double;
    function CalcMin(Arrayitem : integer): double;
    procedure AccountChanged(AccountNo: Integer; Newvalue : variant);
  public
    { Public declarations }
    SingularTitle, PluralTitle : string;
    DefPeriod, DefAccount : Integer;
//    function GetCheckedAccount: integer;
//    Procedure SetCheckedAccount(Idx : integer);
  end;

  TExpenseDataSource = class(TcxCustomDataSource)
  private
    FEXPLIST: TList;
    FModified: boolean;
  protected
    function GetRecordCount: Integer; override;
    function GetDataBinding(AItemIndex: Integer): TcxGridItemDataBinding;
    Function GetItemHandle(AItemIndex: Integer): TcxDataItemHandle; override;
    function GetValue(ARecordHandle: TcxDataRecordHandle;
      AItemHandle: TcxDataItemHandle): Variant; override;
    procedure SetValue(ARecordHandle: TcxDataRecordHandle;
      AItemHandle: TcxDataItemHandle; const AValue: Variant); override;
  public
    constructor Create(AEXPList: TList);
    destructor Destroy; override;
    property Modified: boolean read FModified;
  end;

var
  DetailExpensesF: TDetailExpensesF;
  RecordPtr: TPlanDataRecPtr;
  TotalExpensesRec : TPlanDataRecPtr;
//  initialized : Boolean;
  PeriodIndex : Integer;
  SeriesSize : integer;
  Currentmin : Integer;
  Startpoint : TPoint;
  Lhistory : TCustomHist;
  ChartDates : TDateTimeArray;
  PointersPerPage : Integer;
  DecPrecision : Integer;
  AllowChartEdit : Boolean;

implementation

uses DataCollector, DMClient, PastPeriodSelection;

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
          0:
            DataBinding.ValueTypeClass := TcxStringValueType;
          1, 2:
            DataBinding.ValueTypeClass := TcxCurrencyValueType;
        end;    // case
      end;
    end;    // for
end;

{ TExpenseDataSource }
constructor TExpenseDataSource.Create(AEXPList: TList);
begin
  inherited Create;
  FEXPLIST := AEXPList;
end;

destructor TExpenseDataSource.Destroy;
begin
  inherited Destroy;
end;

function TExpenseDataSource.GetDataBinding(AItemIndex: Integer): TcxGridItemDataBinding;
begin
  Result := TcxCustomGridTableItem(DataController.GetItem(AItemIndex)).DataBinding;
end;

function TExpenseDataSource.GetRecordCount: Integer;
begin
  Result := FExplist.Count;
end;

function TExpenseDataSource.GetValue(ARecordHandle: TcxDataRecordHandle; AItemHandle: TcxDataItemHandle): Variant;
var
  ADataBinding: TcxGridItemDataBinding;
  EXPRec : TPlanDataRecPtr;
begin
  ADataBinding := TcxGridItemDataBinding(AItemHandle);
  EXPRec := FEXPLIST[Integer(ARecordHandle)];
  case Integer(ADataBinding.Data) of    //
    0: Result := EXPRec.AccountTitle;
    1:  Begin
        if DataModuleClient.DateRangersD_Index.value > 0 then
          Result := Round(EXPRec.PastBalances[DataModuleClient.DateRangersD_Index.value - 1])
        else
          Result := 0;
        end;
    2: Result := Round(EXPRec.PlanTotal);
  end;    // case
end;

procedure TExpenseDataSource.SetValue(ARecordHandle: TcxDataRecordHandle;
  AItemHandle: TcxDataItemHandle; const AValue: Variant);
var
  ADataBinding: TcxGridItemDataBinding;
  EXPRec : TPlanDataRecPtr;
begin
  ADataBinding := TcxGridItemDataBinding(AItemHandle);
  EXPREc := FEXPLIST[Integer(ARecordHandle)];
  if Integer(ADataBinding.Data) = 2 then    //
    begin
    DetailExpensesF.AccountChanged(Exprec.Accountno, AValue);
    EXPRec.PlanTotal := aValue;
//    DataChanged;
    end;
end;

function TExpenseDataSource.GetItemHandle(AItemIndex: Integer): TcxDataItemHandle;
begin
  Result := TcxDataItemHandle(GetDataBinding(AItemIndex));
end;

procedure TDetailExpensesF.FormCreate(Sender: TObject);
begin
  Color := GGlobals.FormColour;
  DMrep1.TariButtonList.GetImage(0, CloseBtn.Glyph);
  DateIdx := DATAMODULECLIENT.DateRangersD_INDEX.Value;
  Width := 1020;
  Height := 760;
//  Initialized := False;
  Caption := 'Target Expense Details - '  + DataModuleClient.BusinessesBRANCH_NAME.value;
  DeptLbl.Caption := 'Department: ' + DataModuleClient.DepartmentsREVENUE_GROUP_NAME.Value;
  Chart1.BottomAxis.DateTimeFormat := 'dd' + #13 + 'MMM';
  Series2.Clear;
  LeftMouseDown := False;
  Lhistory := TCustomHist.Create;
  Lhistory.UnDoButton := UndoBtn;
  DataModuleClient.DateRangersStartDate.DisplayFormat := GGlobals.GetDateFSTD;
  DataModuleClient.DateRangersEndDate.DisplayFormat := GGlobals.GetDateFSTD;
  DataModuleClient.DepartmentsCurrentPlanStart.DisplayFormat := GGlobals.GetDateFSTD;
  DataModuleClient.DepartmentsCurrentPlanEnd.DisplayFormat := GGlobals.GetDateFSTD;
  DATAMODULECLIENT.DateRangers.Locate('D_INDEX', DateIdx, []);
  cxGridExpenseTableView1Amount.Caption := 'Past Period ' + DataModuleClient.DateRangersStartDate.DisplayText + ' to ' +
  DataModuleClient.DateRangersEndDate.DisplayText;
  cxGridExpenseTableView1Column3.Caption := 'Target Amount ' + DataModuleClient.DepartmentsCurrentPlanStart.DisplayText + ' to ' +
  DataModuleClient.DepartmentsCurrentPlanEnd.DisplayText;
  TotalExpensesRec := PlanDataList.Items[GetAccountListIndex(TOTALEXPENSES)];
  DataCollect.psdate := DataModuleClient.DepartmentsCurrentPlanStart.value;
  DataCollect.pedate := DataModuleClient.DepartmentsCurrentPlanEnd.value;
  DataCollect.getPlanningExpData(False);
  SelectedSeries := 0;
  GenerateColumns(cxGridExpenseTableView1);
  cxGridExpenseTableView1.DataController.CustomDataSource := TExpenseDataSource.Create(PlanExpDataList);
  cxGridExpenseTableView1.DataController.CustomDataSource.DataChanged;
  DATAMODULECLIENT.DateRangers.Locate('D_INDEX', DateIdx, []);
end;

procedure TDetailExpensesF.BuildSeries;
var
  I: Integer;
begin
  Series1.Clear;
  Chart1.Title.Text.Clear;
  if SelectedSeries = -1 then // TOTAL EXPENSES
    begin
    AllowChartEdit := False;
    Recordptr := TotalExpensesRec;
    end
  else
    RecordPtr :=  PlanExpDataList.Items[SelectedSeries];
//  SetTotals;
  Chart1.Title.Text.add(Recordptr.AccountTitle);
  LHistory.InitializeHistory(HISTORYSIZE, SeriesSize + 1);
  if SeriesSize > 16 then
    begin
    UpDown1.Enabled := True;
    Chart1.MaxPointsPerPage := 16;
    end
  else
    begin
    UpDown1.Enabled := False;
    Chart1.MaxPointsPerPage := 0;
    end;
  for I := 0 to SeriesSize do    // Iterate
    begin
//    Tempstr := FormatDateTime('dd' + #13 + 'MMM', ChartDates[I]);
    if RGIndex.ItemIndex = 0 then
      Series1.AddXY(ChartDates[I], RoundValue(RecordPtr.PlanDetail[I], Decprecision), FormatDateTime('dd' + #13 + 'MMM', ChartDates[I]), clTeeColor)
    else
      Series1.AddXY(ChartDates[I], RoundValue(RecordPtr.planSummary[I], Decprecision), FormatDateTime('dd' + #13 + 'MMM', ChartDates[I]), clTeeColor);
    end;    // for
  SetAccount;
end;

procedure TDetailExpensesF.Chart1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
Var
  I: Integer;
  XValue, XValue1 : Double;
  YValue, YValue1, ValueDiff : Double;
  PointColor : TColor;
  PercentChange : Double;
begin
  if button = mbRight then // Adjust new maximum and minimum vales for the current chart series
    begin
    SetAccount;
    end;
if AllowChartEdit then
  begin
  if (ssAlt in Shift) and (not (ssCtrl in Shift)) then
    begin
    if Startpoint.X = 0 then
      begin
      StartPoint.X := X;
      if ssShift in Shift then
        YValue := GrabManualValue(X)
      else
        YValue := Series1.YScreenToValue(Y);
      XValue := Round(Series1.XScreenToValue(x));
      if Yvalue > Series1.YValue[FindNearestX(xValue)] then
        PointColor := clgreen
      else
        PointColor := clRed;
      YValue := RoundValue(YValue, decPrecision);
      Series2.AddXY(Xvalue, YValue, '', PointColor);
      end
    else
      begin
      Xvalue := Series2.XValue[0];
      Yvalue := Series2.YValue[0];
      XValue1 := Round(Series1.XScreenToValue(x));
      if ssShift in Shift then
        YValue1 := GrabManualValue(X)
      else
        YValue1 := Series1.YScreenToValue(Y);
      Series2.Clear;
      YValue1 := RoundValue(YValue1, decPrecision);
      ValueDiff := YValue1 - YValue;
      SaveArrayHistory;
      if FindNearestX(xValue) <> FindNearestX(Xvalue1) then
        begin
        if FindNearestX(xValue) < FindNearestX(Xvalue1) then
          begin
          for I := FindNearestX(Xvalue) to FindNearestX(Xvalue1) do    // Iterate
            Series1.YValue[I] := RoundValue(YValue + (ValueDiff/(FindNearestX(Xvalue1) - FindNearestX(Xvalue))) * (I - FindNearestX(Xvalue)), Decprecision);
          end
        else
          begin
          for I := FindNearestX(Xvalue) downto FindNearestX(Xvalue1) do    // Iterate
            Series1.YValue[I] := RoundValue(YValue + (ValueDiff/(FindNearestX(Xvalue) - FindNearestX(Xvalue1))) * (FindNearestX(Xvalue) - I), Decprecision);
          end;    // for
        UpdateStart := min(FindNearestX(Xvalue),FindNearestX(Xvalue1));
        UpdateEnd := Max(FindNearestX(Xvalue),FindNearestX(Xvalue1));
        CalcAll;
        end;
      StartPoint.X := 0;
      end;
    end;
  if (Not (ssAlt in Shift)) and (ssCtrl in Shift) then
    begin
    XValue := Round(Series1.XScreenToValue(x));
    if ssShift in Shift then
      YValue := GrabManualValue(X)
    else
      YValue := Series1.YScreenToValue(Y);
    Yvalue1 := Series1.Yvalue[FindNearestX(xValue)];
    PercentChange := 0;
    if YValue1 <> 0 then
      PercentChange := Yvalue / Yvalue1;
    if Percentchange <> 0 then
      begin
      SaveArrayHistory;
      for I := 0 to SeriesSize do    // Iterate
        Series1.YValue[I] := RoundValue(Series1.YValue[I] * PercentChange, Decprecision);
      end;
    UpdateStart := 0;
    UpdateEnd := SeriesSize;
    CalcAll;
    end;

  if (Not (ssAlt in Shift)) and (Not (ssCtrl in Shift)) and (ssShift in Shift) then
    begin
    SaveArrayHistory;
//    i:= FindNearestX(Round(Series1.XScreenToValue(x)));
    Series1.YValues[FindNearestX(Round(Series1.XScreenToValue(x)))] := GrabManualValue(x);
    UpdateStart := FindNearestX(Round(Series1.XScreenToValue(x)));
    UpdateEnd := FindNearestX(Round(Series1.XScreenToValue(x)));
    CalcAll;
    end;
  Chart1.Repaint;
  end;
end;

function TDetailExpensesF.GrabManualValue(currX : Integer): Currency;
begin
  Result := 0;
if AllowChartEdit then
  begin
  Application.CreateForm(TChartManualDEF, ChartManualDEF);
  ChartManualDEF.Label1.Caption := 'Enter the Value for ' + DateTostr(Round(Series1.XScreenToValue(CurrX)));
  ChartManualDef.NewValue.Value := Series1.YValues[FindNearestX(Round(Series1.XScreenToValue(CurrX)))];
  if DecPrecision = 0 then
    ChartManualDEF.NewValue.Properties.DisplayFormat := ',0;-,0'
  else
    ChartManualDEF.NewValue.Properties.DisplayFormat := ',0.00;-,0.00';
  ChartManualDEF.NewValue.Properties.DecimalPlaces := Decprecision;
  CHartManualDEF.ShowModal;
  Result := ChartManualDef.NewValue.Value;
  ChartManualDef.Free;
  end;
end;

procedure TDetailExpensesF.Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
if AllowChartEdit then
  begin
  Chart1.Refresh;
  Chart1.Canvas.Font.Height := -10;
  Chart1.canvas.BackColor := clYellow;
  if (x >= Chart1.ChartRect.Left) and (X <= Chart1.ChartRect.Right) and (Y >= Chart1.ChartRect.Top) and (Y <= Chart1.ChartRect.Bottom) then
    begin
    Chart1.Canvas.TextOut(X + 10, Y - 5, Formatfloat('###,###,###.##', RoundValue(Series1.YScreentoValue(Y), DecPrecision)));
    if (ssLeft in Shift) and (Not (ssShift in Shift)) and (not (ssAlt in Shift)) and (not (ssCtrl in Shift)) then
      begin
      if Not LeftMouseDown then
        SaveArrayHistory;
      Series1.YValues[FindNearestX(Round(Series1.XScreenToValue(x)))] := RoundValue(Series1.YScreenToValue(Y), Decprecision);
      UpdateStart := FindNearestX(Round(Series1.XScreenToValue(x)));
      UpdateEnd := FindNearestX(Round(Series1.XScreenToValue(x)));
      CalcAll;
      LeftMouseDown := True;
      if Startpoint.X = 0 then
        Chart1.Repaint;
      end;
    end;
  end;
end;

procedure TDetailExpensesF.RGIndexClick(Sender: TObject);
var
  j: Integer;
  PlanDataRec: TPlanDataRecPtr;
begin
  UpdateStart := 0;
  UpDateEnd := SeriesSize;
  SeriesSize := trunc(DataModuleClient.DepartmentsCurrentPlanEnd.value) - trunc(DataModuleClient.DepartmentsCurrentPlanStart.value);
  if RGIndex.ItemIndex > 0 then
    SeriesSize :=  createSummaryIndex(RGIndex.ItemIndex, DataModuleClient.DepartmentsCurrentPlanStart.value, DataModuleClient.DepartmentsCurrentPlanEnd.value) - 1;
  for j := 0 to PlanExpDataList.count - 1 do    // Iterate
    begin
    PlanDataRec := PlanExpDataList.items[J];
    BuildSummary(PlanDataRec.Accountno, DataModuleClient.DepartmentsCurrentPlanStart.value, DataModuleClient.DepartmentsCurrentPlanEnd.value, PlanDataRec.PlanDetail, PlanDataRec.PlanSummary);
    end;    // for
  BuildSummary(TotalExpensesrec.Accountno, DataModuleClient.DepartmentsCurrentPlanStart.value, DataModuleClient.DepartmentsCurrentPlanEnd.value, TotalExpensesrec.PlanDetail, TotalExpensesrec.PlanSummary);
  // Record the latest State to ensure it get saved correctly
  PeriodIndex := RGIndex.ItemIndex;
  BuilddateArray;
  UpdateStart := 0;
  UpDateEnd := SeriesSize;
  Chart1.Page := 1;
  BuildSeries;
  Chart1.RePaint;
end;

procedure TDetailExpensesF.BuilddateArray;
var
  j: Integer;
begin
  Fillchar(ChartDates, sizeof(TDateTimeArray), #0);
  for j := 0 to SeriesSize do    // Iterate
    begin
    if RGindex.itemindex = 0 then
      ChartDates[j] := DataModuleClient.DepartmentsCurrentPlanStart.value + j
    else
      ChartDates[j] := DataModuleClient.DepartmentsCurrentPlanStart.value + SummaryPeriodIndexArray[j];
    end;    //
end;

{
procedure TDetailExpensesF.CalculateArray(Accountno: integer);
var
  j: integer;
begin
  Recordptr.PlanTotal := 0;
  TotalExpensesRec.PlanTotal := 0;
  if Periodindex = 0 then
    begin
    for j := UpdateStart to UpdateEnd do
      begin
      RecordPtr.PlanTotal := RecordPtr.PlanTotal + RecordPtr.PlanDetail[j];
      TotalExpensesRec.PlanTotal := TotalExpensesRec.PlanTotal + TotalExpensesRec.PlanDetail[j];
      end;
    end
  else
    begin
    for j := UpdateStart to UpdateEnd do
      begin
      RecordPtr.PlanTotal := RecordPtr.PlanTotal + RecordPtr.PlanSummary[j];
      TotalExpensesRec.PlanTotal := TotalExpensesRec.PlanTotal + TotalExpensesRec.PlanSummary[j];
      end;
    end;
end;
}
procedure TDetailExpensesF.HelpBtnClick(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTEXT, 1031);
end;

procedure TDetailExpensesF.FormClose(Sender: TObject; var Action: TCloseAction);
var
  I: Integer;
  PlanDataRec : TPlanDataRecPtr;
  PlanDataexpRec : TPlanDataRecPtr;
  j : integer;
  TotalExpensestemp : currency;
begin
  screen.Cursor := crHourGlass;
  PlanDataRec := PlanDataList.Items[GetAccountListIndex(TOTALEXPENSES)];
  fillchar(PlanDataRec.PlanDetail, sizeof(TDetailedBalArray), #0);
  TotalExpensestemp := 0;
  for I := 0 to PlanExpDataList.Count - 1 do    // Iterate
    begin
    PlanDataExpRec := PlanExpDataList.items[I];
    for J := 0 to NUM_DAYSINYEAR - 1 do    // Iterate
      begin
      PlanDataExpRec.planDetail[j] := Round(PlanDataExpRec.planDetail[j]);
      PlanDataRec.PlanDetail[j] := PlanDataRec.PlanDetail[j] + PlanDataExpRec.planDetail[j];
      end;    // for
    PlanDataExprec.PlanTotal := Round(PlanDataExprec.PlanTotal);
    TotalExpensestemp := TotalExpensestemp + PlanDataExprec.PlanTotal;
    end;    // for
  DataCollect.psdate := DataModuleClient.DepartmentsCurrentPlanStart.value;
  DataCollect.pedate := DataModuleClient.DepartmentsCurrentPlanEnd.value;
  PlanDataRec.PlanTotal := DataCollect.GetTotalBalance(PlanDataRec^.PlanDetail,
      double(DataCollect.psdate),
      double(DataCollect.psdate),
      double(DataCollect.pedate));

  DataCollect.setPlanningExpData;
  if PlanExpDataList.Count > 0 then
    DataCollect.ClearPlanExpDataList;
end;

procedure TDetailExpensesF.Chart1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  LeftMouseDown := False;
end;

procedure TDetailExpensesF.SaveArrayHistory;
var
  I, J: Integer;
begin
  J := lHistory.GetNextHistArrayNo;
  for I := 0 to SeriesSize do    // Iterate
    lHistory.HistoryArray[J][I] := Series1.YValues[I];
  if LHistory.StoredDepth > 0 then
    begin
    UndoBtn.Enabled := True;
    UndoBtn.Caption := 'Undo (' + inttostr(LHistory.StoredDepth) + ')';
    UndoBtn.Refresh;
    end
  else
    begin
    UndoBtn.Caption := 'Undo';
    UndoBtn.Refresh;
    UndoBtn.Enabled := False;
    end;
end;

procedure TDetailExpensesF.UndoBtnClick(Sender: TObject);
var
  I, J: Integer;
begin
  J := LHistory.GetRestoreHistArrayNo;
  for I := 0 to SeriesSize do    // Iterate
    Series1.YValues[I] := LHistory.HistoryArray[J][I];
  Chart1.Repaint;
  if LHistory.StoredDepth > 0 then
    begin
    UndoBtn.Enabled := True;
    UndoBtn.Caption := 'Undo (' + inttostr(LHistory.StoredDepth) + ')';
    UndoBtn.Refresh;
    end
  else
    begin
    UndoBtn.Caption := 'Undo';
    UndoBtn.Refresh;
    UndoBtn.Enabled := False;
    end;
end;

{
procedure TDetailExpensesF.TotalExpensesLEDClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do    // Iterate
    begin
    if Components[I] is TLEDRadioButton then
      begin
      if Components[I].Name <> TLEDRadioButton(Sender).Name then
        with Components[I] as TLEDRadioButton do
          Checked := False;
      end;
    end;    // for
  if TLEDRadioButton(Sender).Tag = 1 then
    begin
    oldseries := SelectedSeries;
    SelectedSeries := -1;
    end
  else
    begin
    if (Oldseries > -1) and (Oldseries < PlanExpDataList.count - 1)  then
      SelectedSeries := OldSeries
    else
      SelectedSeries := 0;
    end;
  SetCheckedAccount(SelectedSeries);
end;
}

{
function TDetailExpensesF.GetCheckedAccount: integer;
var
  I: Integer;
begin
  result := -1;
  for I := 0 to ComponentCount - 1 do    // Iterate
    begin
    if Components[I] is TLEDRadioButton then
      begin
        with Components[I] as TLEDRadioButton do
          If Checked Then
            begin
            Result := Tag;
            exit;
            end;
      end;
    end;    // for
end;

Procedure TDetailExpensesF.SetCheckedAccount(Idx : integer);
var
  I: Integer;
begin
  SelectedSeries := idx;
  if idx = -1 then
    Idx := 1
  else
    idx := 0;
  for I := 0 to ComponentCount - 1 do    // Iterate
    begin
    if Components[I] is TLEDRadioButton then
      begin
      if TLEDRadioButton(Components[I]).Tag = idx then
        with Components[I] as TLEDRadioButton do
          Checked := True
      else
        with Components[I] as TLEDRadioButton do
          Checked := False;
      end;
    end;    // for
  SeriesSize := trunc(DataModuleClient.DepartmentsCurrentPlanEnd.value) - trunc(DataModuleClient.DepartmentsCurrentPlanStart.value);
  if RGIndex.ItemIndex > 0 then
    SeriesSize :=  createSummaryIndex(RGIndex.ItemIndex, DataModuleClient.DepartmentsCurrentPlanStart.value, DataModuleClient.DepartmentsCurrentPlanEnd.value) - 1;
  BuilddateArray;
  Buildseries;
end;
}

procedure TDetailExpensesF.SetAccount;
begin
  Chart1.LeftAxis.Automatic := False;
  Chart1.LeftAxis.Minimum := 0;
  Chart1.LeftAxis.Maximum := CalcMax(Tag) * 1.10;
  Chart1.LeftAxis.Minimum := CalcMin(Tag) * 0.90;
  if Chart1.LeftAxis.Minimum < 0 then
    Chart1.LeftAxis.Minimum := 0;
  if Chart1.LeftAxis.Maximum = 0 then  // based on 20% of Sales as a starting point
    Chart1.LeftAxis.Maximum := 100;
  DecPrecision := 0;
  if SelectedSeries > -1 then
    AllowChartEdit := True
  else
    AllowChartEdit := False;
end;

procedure TDetailExpensesF.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  if Button = btNext then
    Chart1.NextPage
  else
    Chart1.PreviousPage;
end;

function TDetailExpensesF.RoundValue(Balance: double; Decimalplaces : Integer): Double;
var
  Factor : Double;
begin
  Factor := 10 * decimalPlaces;
  if Factor < 1 then
    result := Round(Balance)
  else
    result := Round(Balance * Factor)/ Factor;
end;

{
Function TDetailExpensesF.GetUnitTitle(AccountNo : Integer): string;
begin
  case AccountNo of    //
    POTENTIAL: Result := 'Potential ' + PluralTitle;
    BILLED: Result := 'Billed ' + PluralTitle;
    SALESUNIT: Result := 'Sales per ' + SingularTitle;
    GPUNIT: Result := 'GP per ' + SingularTitle;
    GPPC: Result := 'Gross Profit %';
    PRODUCTIVITY: Result := 'Productivity %';
  end;
end;
}

procedure TDetailExpensesF.UpdateSeries(ArrayItem, AccountNo: Integer);
var
  PlanDataRec : TPlanDataRecPtr;
  temparray : TDetailedBalArray;
  fromperiod, toperiod : integer;
begin
  if AccountNo <> TOTALEXPENSES then
    PlanDataRec := PlanExpDataList.Items[GetExpaccountListIndex(AccountNo)]
  else
    PlanDataRec := TotalExpensesRec;
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
    DataCollect.psdate := DataModuleClient.DepartmentsCurrentPlanStart.value;
    DataCollect.pedate := DataModuleClient.DepartmentsCurrentPlanEnd.value;
    move(PlanDataRec.Plandetail, temparray, sizeof(TDetailedBalArray));
    DataCollect.updateArray(PlanDataRec.Plandetail,
                  DaysBetween(IncDay(DataCollect.psdate, fromperiod), DataCollect.psdate),
                  DaysBetween(IncDay(DataCollect.psdate, toperiod), DataCollect.psdate),
                  PlanDataRec.PlanSummary[ArrayItem], 0);
end;

procedure TDetailExpensesF.CalcAll;
var
  I : Integer;
  FixedAccounts : array[0..FIXNP] of Integer;
begin
  for I := 0 to FIXNP do    // Iterate - initialise this array, for BILLED, POTENTIAL, SALES, GP, NOP, NP
    FixedAccounts[I] := 0;
  for I := UpdateStart to UpdateEnd do
    begin
    if RGindex.ItemIndex = 0 then
      begin
      RecordPtr.Plantotal := RecordPtr.Plantotal - RecordPtr.PlanDetail[I];
      TotalExpensesRec.PlanTotal := TotalExpensesRec.PlanTotal - RecordPtr.PlanDetail[I];
      RecordPtr.PlanDetail[I] := Series1.Yvalue[I];
      RecordPtr.Plantotal := RecordPtr.Plantotal + RecordPtr.PlanDetail[I];
      TotalExpensesRec.PlanTotal := TotalExpensesRec.PlanTotal + RecordPtr.PlanDetail[I];
      end
    else
      begin
      RecordPtr.Plantotal := RecordPtr.Plantotal - RecordPtr.PlanSummary[I];
      TotalExpensesRec.PlanTotal := TotalExpensesRec.PlanTotal - RecordPtr.PlanSummary[I];
      RecordPtr.PlanSummary[I] := Series1.Yvalue[I];
      RecordPtr.Plantotal := RecordPtr.Plantotal + RecordPtr.PlanSummary[I];
      TotalExpensesRec.PlanTotal := TotalExpensesRec.PlanTotal + RecordPtr.PlanSummary[I];
      UpdateSeries(I, RecordPtr.AccountNo);
      UpdateSeries(I, TOTALEXPENSES);
      end;
    end;               // Iterate
  cxGridExpenseTableView1.DataController.CustomDataSource.DataChanged;
end;

function TDetailExpensesF.FindNearestX(XValue: double): Integer;
var
  I : Integer;
begin
  I := 0;
  while (XValue > Series1.XValue[I]) and (I <= SeriesSize) do
    inc(I);
  if I > SeriesSize then  // return the last one as this could be a valid location of the cursor
    I := SeriesSize;
  if (I > 0) and (I <= SeriesSize) and // If it is nearer to the lower one
    ((Series1.XValue[I] - XValue) > (Xvalue - Series1.XValue[I - 1])) then
    Dec(I);
  result := I;
end;

function TDetailExpensesF.CalcMax(Arrayitem : integer): double;
var
  I: Integer;
  MaxValue : Double;
begin
  MaxValue := 0;
  for I := 0 to SeriesSize do    // Iterate
    begin
    if Periodindex = 0 then
      begin
      if RecordPtr.PlanDetail[I] > MaxValue then
        MaxValue := RecordPtr.PlanDetail[I];
      end
    else
      begin
      if RecordPtr.PlanSummary[I] > MaxValue then
        MaxValue := RecordPtr.PlanSummary[I];
      end;
    end;    // for
  Result := MaxValue;
end;

function TDetailExpensesF.CalcMin(Arrayitem : integer): double;
var
  I: Integer;
  MinValue : Double;
begin
  MinValue := 99999999999;
  for I := 0 to SeriesSize do    // Iterate
    begin
    if Periodindex = 0 then
      begin
      if RecordPtr.PlanDetail[I] < MinValue then
        MinValue := RecordPtr.PlanDetail[I];
      end
    else
      begin
      if RecordPtr.PlanSummary[I] < MinValue then
        MinValue := RecordPtr.PlanSummary[I];
      end;
    end;    // for
  Result := MinValue;
end;

procedure TDetailExpensesF.FormShow(Sender: TObject);
begin
  screen.Cursor := crDefault;
end;

procedure TDetailExpensesF.cxGridExpenseTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
// This is where we change the chart!!
  if SelectedSeries <> AFocusedRecord.index then
    begin
    SelectedSeries := AFocusedRecord.index;
    Buildseries;
    end;
end;

procedure TDetailExpensesF.AccountChanged(AccountNo: Integer; Newvalue : variant);
var
  I, J : Integer;
  temparray : TDetailedBalArray;
  OldRecordTotal : Currency;
begin
// Set a new total for this expenses
// to be really smart we apply the new balance to the Summary or detailed array based on RGIndex
// If it is a summary array (ie RGIndex > 0)
// we apply to the new balance to the summary array and then adjust the detailed array in sections based on the summary.
// In this way, if we have 12 months, the array total is 0 and the new total is 12, then each month is equal.
  move(RecordPtr^.PlanDetail, temparray, sizeof(TDetailedBalArray));
  OldRecordTotal := Recordptr.PlanTotal;
  DataCollect.psdate := DataModuleClient.DepartmentsCurrentPlanStart.value;
  DataCollect.pedate := DataModuleClient.DepartmentsCurrentPlanEnd.value;
  if (OldRecordTotal = 0)  and (RGIndex.ItemIndex <> 0) then
    begin
    // save the old balances for the update
    move(RecordPtr^.PlanDetail, temparray, sizeof(TDetailedBalArray));
    // first apply the new balance to the current summary array
    DataCollect.UpdateArray(RecordPtr^.PlanSummary, 0, SeriesSize, Newvalue, 0);
    for J := 0 to SeriesSize do    // Iterate
      begin
      updateSeries(J, RecordPtr.Accountno);
      end;    // for
    for j := 0 to NUM_DAYSINYEAR do    // Iterate
      begin
      TotalExpensesRec.PlanDetail[j] := TotalExpensesRec.PlanDetail[j] - temparray[j] + RecordPtr.PlanDetail[j];
      end;    // for
    end
  else
    AdjustBalances(RecordPtr^.PlanDetail, TotalExpensesRec^.PlanDetail, Newvalue);
  RecordPtr.PlanTotal := DataCollect.GetTotalBalance(RecordPtr^.PlanDetail,
    double(DataCollect.psdate),
    double(DataCollect.psdate),
    double(DataCollect.pedate));
  BuildSummary(RecordPtr.Accountno, DataCollect.psdate, DataCollect.pedate, RecordPtr.PlanDetail, RecordPtr.PlanSummary);
  for J := 0 to NUM_DAYSINYEAR - 1 do    // Iterate
      TotalExpensesRec.PlanDetail[j] := TotalExpensesRec.PlanDetail[j] - temparray[J] + RecordPtr.planDetail[j];
  TotalExpensesRec.PlanTotal := TotalExpensesRec.PlanTotal - OldRecordTotal + Recordptr.PlanTotal;
  BuildSummary(TotalExpensesRec.Accountno, DataCollect.psdate, DataCollect.pedate, TotalExpensesRec.PlanDetail, TotalExpensesRec.PlanSummary);
  Chart1.Page := 1;
  for I := 0 to SeriesSize do    // Iterate
    begin
    if RGIndex.ItemIndex = 0 then
      Series1.YValue[I] := RoundValue(RecordPtr.PlanDetail[I], Decprecision)
    else
      Series1.YValue[I] := RoundValue(RecordPtr.planSummary[I], Decprecision)
    end;    // for
  Chart1.refresh;
end;

procedure TDetailExpensesF.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TDetailExpensesF.cxButton2Click(Sender: TObject);
begin
  DataCollect.setPlanningExpData;
  DataCollect.clearPlanExpDataList;
  SelectedType := stExpenses;
  Application.CreateForm(TBusinessSetupF, BusinessSetupF);
  BusinessSetupF.showmodal;
  BusinessSetupF.free;
  DataCollect.psdate := DataModuleClient.DepartmentsCurrentPlanStart.value;
  DataCollect.pedate := DataModuleClient.DepartmentsCurrentPlanEnd.value;
  DataCollect.getPlanningExpData(True);
  TExpenseDataSource(cxGridExpenseTableView1.DataController.CustomDataSource).FEXPLIST := PlanExpDataList;
  sortExpenseList(True);
  cxGridExpenseTableView1.DataController.CustomDataSource.DataChanged;
  DATAMODULECLIENT.DateRangers.Locate('D_INDEX', DateIdx, []);
end;

procedure TDetailExpensesF.cxButton3Click(Sender: TObject);
begin
  if DataModuleClient.DateRangers.RecordCount > 1 then
    begin
    Application.CreateForm(TPastPeriodSelectionF, PastPeriodSelectionF);
    PastPeriodSelectionF.ShowModal;
    PastPeriodSelectionF.Free;
    end;
  cxGridExpenseTableView1Amount.Caption := 'Past Period ' + DataModuleClient.DateRangersStartDate.DisplayText + ' to ' +
  DataModuleClient.DateRangersEndDate.DisplayText;
  DateIdx := DATAMODULECLIENT.DateRangersD_INDEX.Value;
  cxGridExpenseTableView1.DataController.CustomDataSource.DataChanged;
end;

procedure TDetailExpensesF.PopupPrintChartClick(Sender: TObject);
begin
  ChartPreviewer1.Execute;
end;

procedure TDetailExpensesF.PopupExportChartClick(Sender: TObject);
begin
  TeePlaceWatermark := True;
  TeeExport(self, Chart1);
end;

procedure TDetailExpensesF.TransferBtnClick(Sender: TObject);
var
  I: Integer;
  PeriodAdjustment : Currency;
  DaysPastPeriod, DaysTargetPeriod : integer;
begin
  if DataModuleClient.DateRangersD_Index.value <= 0 then exit;

  DATAMODULECLIENT.DateRangers.Locate('D_INDEX', DateIdx, []);

  // If the Past period is not with in day in length of the Target period we adjust
  DaysPastPeriod := trunc(DataModuleClient.DateRangersENDDATE.Value - DataModuleClient.DateRangersSTARTDATE.value) + 1;
  DaysTargetPeriod := trunc(DataModuleClient.DepartmentsCURRENTPLANEND.Value - DataModuleClient.DepartmentsCURRENTPLANSTART.value) + 1;
  PeriodAdjustment := 1;
  if ABS(DaysPastPeriod - DaysTargetPeriod) > 1 then
    PeriodAdjustment := DaysTargetPeriod / DaysPastPeriod;

  for I := 0 to PlanExpDataList.Count - 1 do    // Iterate
    begin
    RecordPtr :=  PlanExpDataList.Items[I];
    if (RecordPtr.PastBalances[DataModuleClient.DateRangersD_Index.value - 1] <> 0) and
      (RecordPtr.PlanTotal = 0) then
      AccountChanged(RecordPtr.Accountno, RecordPtr.pastBalances[DataModuleClient.DateRangersD_Index.value - 1] * PeriodAdjustment);
    end;    // for
  cxGridExpenseTableView1.DataController.CustomDataSource.DataChanged;
end;

end.
