unit detailTargets;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls,
  Buttons, auchTypes, ChartmanualDE, ChartHistory, Math, DMrep1U,
  LGlobals, cxButtons, cxGroupBox, cxRadioGroup, cxControls, cxContainer,
	cxEdit, cxLabel, cxTextEdit, cxCurrencyEdit, ExtCtrls,
	Menus, DateUtils, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinXmas2008Blue, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, cxMaskEdit, cxSpinEdit, cxSpinButton, dxBevel,
  VCLTee.TeeEdit, VCLTee.TeEngine, VCLTee.TeeTools, VCLTee.TeePageNumTool,
  VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, dxGDIPlusClasses, cxImage;

Const
  MAXSALESUNIT = 50000;
  FIXBILLED = 0;
  FIXPOTENTIAL = 1;
  FIXSALES = 2;
  FIXGP = 3;
  FIXNOP = 4;
  FIXNP = 5;

type
	TDetailTargetsF = class(TForm)
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    ChartTool1: TPageNumTool;
    cxLabel1: TcxLabel;
    RGIndex: TcxRadioGroup;
    cxGroupBox1: TcxGroupBox;
    cxLabel2: TcxLabel;
    UndoBtn: TcxButton;
    HelpBtn: TcxButton;
    CloseBtn: TcxButton;
    PotentialBtn: TcxRadioButton;
    ProductivityBtn: TcxRadioButton;
    BilledBtn: TcxRadioButton;
    SalePerUnitBtn: TcxRadioButton;
    GPperUnitBtn: TcxRadioButton;
    GPPCBtn: TcxRadioButton;
    OtherIncomeBtn: TcxRadioButton;
    DownArrow: TImage;
    UpArrow: TImage;
    NPBtn: TcxRadioButton;
    NOPBtn: TcxRadioButton;
    ExpensesBtn: TcxRadioButton;
    GPBtn: TcxRadioButton;
    SalesBtn: TcxRadioButton;
    SalesCurrLbl: TcxCurrencyEdit;
    GPCurrLbl: TcxCurrencyEdit;
    ExpensesCurrLbl: TcxCurrencyEdit;
    NOPCurrLbl: TcxCurrencyEdit;
    OtherCurrLbl: TcxCurrencyEdit;
    NPCurrLbl: TcxCurrencyEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    PopupMenu1: TPopupMenu;
    PopupPrintChart: TMenuItem;
    PopupExportChart: TMenuItem;
    ChartPreviewer1: TChartPreviewer;
    EditRawBtn: TcxButton;
    TotalFTEBtn: TcxRadioButton;
    ProdFTEBtn: TcxRadioButton;
    dxBevel1: TdxBevel;
    cxLabel8: TcxLabel;
    dxBevel2: TdxBevel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxSpinButton1: TcxSpinButton;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    DeptLbl: TcxLabel;
    GPArrow: TcxImage;
    SalesArrow: TcxImage;
    procedure FormCreate(Sender: TObject);
    procedure Chart1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure RGIndexClick(Sender: TObject);
    procedure Chart1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure UndoBtnClick(Sender: TObject);
    procedure BilledBtnClick(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure HelpBtnClick(Sender: TObject);
    procedure PopupPrintChartClick(Sender: TObject);
    procedure PopupExportChartClick(Sender: TObject);
    procedure EditRawBtnClick(Sender: TObject);
    procedure cxSpinButton1PropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
    LeftMouseDown : Boolean;
    SelectedSeries : Integer;
    UpdateStart, UpdateEnd : Integer;
    CalcSalesGPUP : Boolean;  // If set GP is calculated Units * GPUnit & uses GPPC to calc sales
                              // else Sales is calculated Units * SalesUnits and uses GPPC to calc GP
    function GrabManualValue(currX : Integer): Currency;
    procedure BuildSeries;
    procedure SaveArrayHistory;
    function RoundValue(Balance: double; Decimalplaces : Integer): Double;
    procedure CalculateArray(Accountno: integer);
    procedure BuilddateArray;
    procedure SetAccount(tag : Integer);
    Function GetUnitTitle(AccountNo : Integer): string;
    procedure SetTotals;
    procedure UpdateSeries(ArrayItem, AccountNo: Integer);
    procedure CalcAll;
    function FindNearestX(XValue: double) : integer;
    function CalcMax(Arrayitem : integer): double;
    function CalcMin(Arrayitem : integer): double;
  public
    { Public declarations }
    SingularTitle, PluralTitle : string;
    DefPeriod, DefAccount : Integer;
    function GetCheckedAccount: integer;
    Procedure SetCheckedAccount(Idx : integer);
    Function GetCalcMode : Boolean;
    procedure SetCalcMode(CalcUp : Boolean);
  end;

var
  DetailTargetsF: TDetailTargetsF;
  RecordPtr: array[1..14] of TPlanDataRecPtr;
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
  TmpCurrency : Currency;

implementation

uses DataCollector, DMClient, DetailRawTargets;

{$R *.dfm}

procedure TDetailTargetsF.FormCreate(Sender: TObject);
begin
  Width := 1020;
  Height := 760;
//  Color := GGlobals.FormColour;
  DMrep1.TariButtonList.GetImage(0, CloseBtn.Glyph);
//  Initialized := False;
	Caption := 'Target Details - '  + DataModuleClient.BusinessesBRANCH_NAME.AsString;
  DeptLbl.Caption := 'Department: ' + DataModuleClient.DepartmentsREVENUE_GROUP_NAME.AsString;
  BilledBtn.Checked := True;
  Chart1.BottomAxis.DateTimeFormat := 'dd' + #13 + 'MMM';
  Series1.Clear;
  Series2.Clear;
  LeftMouseDown := False;
  Lhistory := TCustomHist.Create;
  Lhistory.UnDoButton := UndoBtn;
  UndoBtn.Caption := 'Undo (' + inttostr(LHistory.StoredDepth) + ')';
  RecordPtr[1] := PlanDataList.Items[getAccountListIndex(BILLED)];
  RecordPtr[2] := PlanDataList.Items[getAccountListIndex(POTENTIAL)];
  RecordPtr[3] := PlanDataList.Items[getAccountListIndex(PRODUCTIVITY)];
  RecordPtr[4] := PlanDataList.Items[getAccountListIndex(SALESUNIT)];
  RecordPtr[5] := PlanDataList.Items[getAccountListIndex(GPUNIT)];
  RecordPtr[6] := PlanDataList.Items[getAccountListIndex(GPPC)];
  RecordPtr[7] := PlanDataList.Items[getAccountListIndex(OTHERINCOME)];
  RecordPtr[8] := PlanDataList.Items[getAccountListIndex(SALES)];
  RecordPtr[9] := PlanDataList.Items[getAccountListIndex(GROSSPROFIT)];
  RecordPtr[10] := PlanDataList.Items[getAccountListIndex(TOTALEXPENSES)];
  RecordPtr[11] := PlanDataList.Items[getAccountListIndex(NETOPERATINGPROFIT)];
  RecordPtr[12] := PlanDataList.Items[getAccountListIndex(NETPROFIT)];
  RecordPtr[13] := PlanDataList.Items[getAccountListIndex(FTEOTHER)];
  RecordPtr[14] := PlanDataList.Items[getAccountListIndex(FTEPROD)];
  SetCalcMode(False);
end;

procedure TDetailTargetsF.BuildSeries;
var
  I: Integer;
begin
  Series1.Clear;
  Chart1.Title.Text.Clear;
  if (Recordptr[SelectedSeries].Accountno = POTENTIAL) or (Recordptr[SelectedSeries].Accountno = BILLED)
      or (Recordptr[SelectedSeries].Accountno >= 10000) then
    Chart1.Title.Text.add(GetUnitTitle(Recordptr[SelectedSeries].AccountNo))
  else
    Chart1.Title.Text.add(Recordptr[SelectedSeries].AccountTitle);
  //  set the Chart axis format depending on the account
  chart1.LeftAxis.AxisValuesFormat := '###,##0';
  if (Recordptr[SelectedSeries].Accountno = PRODUCTIVITY)
    or (Recordptr[SelectedSeries].Accountno = SALESUNIT)
    or (Recordptr[SelectedSeries].Accountno = GPUNIT)
    or (Recordptr[SelectedSeries].Accountno = GPPC) then
    chart1.LeftAxis.AxisValuesFormat := '###,##0.00';

  LHistory.InitializeHistory(HISTORYSIZE, SeriesSize + 1);
  if SeriesSize > 16 then
    begin
//    UpDown1.Enabled := True;
    Chart1.MaxPointsPerPage := 16;
    end
  else
    begin
//    UpDown1.Enabled := False;
    Chart1.MaxPointsPerPage := 0;
    end;
  for I := 0 to SeriesSize do    // Iterate
    begin
//    Tempstr := FormatDateTime('dd' + #13 + 'MMM', ChartDates[I]);
    if RGIndex.ItemIndex = 0 then
      Series1.AddXY(ChartDates[I], RoundValue(RecordPtr[SelectedSeries].PlanDetail[I], Decprecision), FormatDateTime('dd' + #13 + 'MMM', ChartDates[I]), clTeeColor)
    else
      Series1.AddXY(ChartDates[I], RoundValue(RecordPtr[SelectedSeries].planSummary[I], Decprecision), FormatDateTime('dd' + #13 + 'MMM', ChartDates[I]), clTeeColor);
    end;    // for
  SetAccount(SelectedSeries);
  cxSpinButton1.Properties.MinValue := 1;
  cxSpinButton1.Properties.MaxValue := chart1.NumPages;
  chart1.Page := 1;
  cxSpinButton1.Value := chart1.Page
end;

procedure TDetailTargetsF.Chart1MouseDown(Sender: TObject; Button: TMouseButton;
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
    SetAccount(SelectedSeries);
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

function TDetailTargetsF.GrabManualValue(currX : Integer): Currency;
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

procedure TDetailTargetsF.Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
if AllowChartEdit then
  begin
  Chart1.Refresh;
	Chart1.Canvas.Font.size := 10;
  Chart1.canvas.BackColor := clYellow;
  // Set timer to update and calculate. separate function.
  if (x >= Chart1.ChartRect.Left) and (X <= Chart1.ChartRect.Right) and (Y >= Chart1.ChartRect.Top) and (Y <= Chart1.ChartRect.Bottom) then
    begin
// ini file 'tariconf' controls the refresh rate. IF 0, normal operations
// else, timer is set to ini file value and series is updated in X ms. x must be less than 1000.
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
				Chart1.repaint;
      end;
    end;
  end;
end;

procedure TDetailTargetsF.RGIndexClick(Sender: TObject);
var
  j: Integer;
  PlanDataRec: TPlanDataRecPtr;
begin
  UpdateStart := 0;
  UpDateEnd := SeriesSize;
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
  BuilddateArray;
  UpdateStart := 0;
  UpDateEnd := SeriesSize;
  CalculateArray(SALESUNIT);
  CalculateArray(GPUNIT);
  CalculateArray(GPPC);
  CalculateArray(PRODUCTIVITY);
  SetTotals;
  Chart1.Page := 1;
  BuildSeries;
  Chart1.RePaint;
end;

procedure TDetailTargetsF.BuilddateArray;
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

procedure TDetailTargetsF.SetTotals;
var
  Temp : Currency;
begin
  SalesCurrLbl.Value := Round(RecordPtr[8].PlanTotal);
  GPCurrLbl.Value := Round(RecordPtr[9].PlanTotal);
  ExpensesCurrLbl.Value := Round(RecordPtr[10].PlanTotal);
  NOPCurrLbl.Value := Round(RecordPtr[11].PlanTotal);
  OtherCurrLbl.Value := Round(RecordPtr[7].PlanTotal);
  NPCurrLbl.Value := Round(RecordPtr[12].PlanTotal);
  BilledBtn.Caption := GetUnitTitle(Recordptr[1].AccountNo) + ' (' + CurrToStrF(RecordPtr[1].Plantotal,ffNumber, 1) + ')';
  PotentialBtn.Caption := GetUnitTitle(Recordptr[2].AccountNo) + ' (' + CurrToStrF(RecordPtr[2].Plantotal,ffNumber, 1) + ')';
  if RecordPtr[2].Plantotal > 0 then
    temp := RecordPtr[1].Plantotal*100 / RecordPtr[2].Plantotal
  else
    temp := 0;
  ProductivityBtn.Caption := GetUnitTitle(Recordptr[3].AccountNo) + ' (' + CurrToStrF(temp,ffNumber, 1) + '%)';
  if RecordPtr[1].Plantotal > 0 then
    temp := RecordPtr[8].Plantotal / RecordPtr[1].Plantotal
  else
    temp := 0;
  SalePerUnitBtn.Caption := GetUnitTitle(Recordptr[4].AccountNo) + ' (' + CurrToStrF(temp,ffCurrency, 2) + ')';
  if RecordPtr[1].Plantotal > 0 then
    temp := RecordPtr[9].Plantotal / RecordPtr[1].Plantotal
  else
    temp := 0;
  GPperUnitBtn.Caption := GetUnitTitle(Recordptr[5].AccountNo) + ' (' + CurrToStrF(temp,ffCurrency, 2) + ')';
  if RecordPtr[8].Plantotal > 0 then
    temp := RecordPtr[9].Plantotal*100 / RecordPtr[8].Plantotal
  else
    temp := 0;
  GPPCBtn.Caption := GetUnitTitle(Recordptr[6].AccountNo) + ' (' + CurrToStrF(temp,ffNumber, 2) + '%)';
end;


procedure TDetailTargetsF.CalculateArray(Accountno: integer);
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
    if (Accountno = SALES) and (CalcSalesGPUP) then
      for j := UpdateStart to UpdateEnd do
        begin
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanDetail[j];
        if PlanGPPCRec.PlanDetail[j] <> 0 then
          PlanDataRec.PlanDetail[j] := PlanGPRec.Plandetail[j] * 100 / PlanGPPCRec.Plandetail[j]
        else
          PlanDataRec.PlanDetail[j] := 0;
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanDetail[j];
        end;
    if (Accountno = SALES) and (not CalcSalesGPUP) then
      for j := UpdateStart to UpdateEnd do
        begin
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanDetail[j];
        if PlanBilledRec.PlanDetail[j] <> 0 then
          PlanDataRec.PlanDetail[j] := PlanBilledRec.Plandetail[j] * PlanSalesunitRec.Plandetail[j]
        else
          PlanDataRec.PlanDetail[j] := 0;
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanDetail[j];
        end;
    if (Accountno = GROSSPROFIT) and (Not CalcSalesGPUP) then
      for j := UpdateStart to UpdateEnd do
        begin
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanDetail[j];
        if PlanGPPCRec.PlanDetail[j] <> 0 then
          PlanDataRec.PlanDetail[j] := PlanSalesRec.Plandetail[j] * PlanGPPCRec.Plandetail[j] / 100
        else
          PlanDataRec.PlanDetail[j] := 0;
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanDetail[j];
        end;
    if (Accountno = GROSSPROFIT) and (CalcSalesGPUP) then
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
    if (Accountno = SALES) and (CalcSalesGPUP) then
      for j := UpdateStart to UpdateEnd do
        begin
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanSummary[j];
        if PlanGPPCRec.PlanSummary[j] <> 0 then
          PlanDataRec.PlanSummary[j] := PlanGPRec.PlanSummary[j] * 100 / PlanGPPCRec.PlanSummary[j]
        else
          PlanDataRec.PlanSummary[j] := 0;
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanSummary[j];
        end;
    if (Accountno = SALES) and (not CalcSalesGPUP) then
      for j := UpdateStart to UpdateEnd do
        begin
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanSummary[j];
        if PlanBilledRec.PlanSummary[j] <> 0 then
          PlanDataRec.PlanSummary[j] := PlanBilledRec.PlanSummary[j] * PlanSalesunitRec.PlanSummary[j]
        else
          PlanDataRec.PlanSummary[j] := 0;
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanSummary[j];
        end;
    if (Accountno = GROSSPROFIT) and (Not CalcSalesGPUP) then
      for j := UpdateStart to UpdateEnd do
        begin
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal - PlanDataRec.PlanSummary[j];
        if PlanGPPCRec.PlanSummary[j] <> 0 then
          PlanDataRec.PlanSummary[j] := PlanSalesRec.PlanSummary[j] * PlanGPPCRec.PlanSummary[j] / 100
        else
          PlanDataRec.PlanSummary[j] := 0;
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanSummary[j];
        end;
    if (Accountno = GROSSPROFIT) and (CalcSalesGPUP) then
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


procedure TDetailTargetsF.Chart1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  LeftMouseDown := False;
end;

procedure TDetailTargetsF.cxSpinButton1PropertiesEditValueChanged(
  Sender: TObject);
begin
 Chart1.Page := cxSpinButton1.Value;
end;

procedure TDetailTargetsF.SaveArrayHistory;
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
    end
  else
    begin
    UndoBtn.Caption := 'Undo';
    UndoBtn.Enabled := False;
    end;
end;

procedure TDetailTargetsF.UndoBtnClick(Sender: TObject);
var
  I, J: Integer;
begin
  if LHistory.StoredDepth > 0 then
    begin
    J := LHistory.GetRestoreHistArrayNo;
    for I := 0 to SeriesSize do    // Iterate
      Series1.YValues[I] := LHistory.HistoryArray[J][I];
    Chart1.Repaint;
    CalcAll;
    end;
  UndoBtn.Caption := 'Undo (' + inttostr(LHistory.StoredDepth) + ')';
end;

procedure TDetailTargetsF.BilledBtnClick(Sender: TObject);
var
  I: Integer;
begin

  for I := 0 to ComponentCount - 1 do    // Iterate
    begin
    if Components[I] is TcxRadioButton then
      begin
      Color := GGlobals.FormColour;
      if Components[I].Name <> TcxRadioButton(Sender).Name then
        with Components[I] as TcxRadioButton do
          Checked := False;
      end;
    end;    // for
  SetCheckedAccount(TcxRadioButton(Sender).Tag);    //
end;

function TDetailTargetsF.GetCheckedAccount: integer;
var
  I: Integer;
begin
  result := -1;
  for I := 0 to ComponentCount - 1 do    // Iterate
    begin
    if Components[I] is TcxRadioButton then
      begin
        with Components[I] as TcxRadioButton do
          If Checked Then
            begin
            Result := Tag;
            exit;
            end;
      end;
    end;    // for
end;

Procedure TDetailTargetsF.SetCheckedAccount(Idx : integer);
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do    // Iterate
    begin
    if Components[I] is TcxRadioButton then
      begin
      if TcxRadioButton(Components[I]).Tag = idx then
        with Components[I] as TcxRadioButton do
          Checked := True
      else
        with Components[I] as TcxRadioButton do
          Checked := False;
      end;
    end;    // for
  SelectedSeries := idx;
  Buildseries;
end;

procedure TDetailTargetsF.SetAccount(tag : Integer);
var
  lmax, lmin : double;
begin
  if tag = 4 then // force calc mode
    SetCalcMode(False);
  if tag = 5 then // force calc mode
    SetCalcMode(True);
  case Tag of    //
    1, 2:  {'BilledBtn'} {'PotentialBtn'}
        begin
        Chart1.LeftAxis.Automatic := False;
        Chart1.LeftAxis.Minimum := 0;
        Chart1.LeftAxis.Maximum := CalcMax(Tag) * 1.20;
        Chart1.LeftAxis.Minimum := CalcMin(Tag) * 0.80;
        if Chart1.LeftAxis.Maximum = 0 then  // based on 40% of Total Expenses as a starting point
          begin
          if SeriesSize <> 0 then
            Chart1.LeftAxis.Maximum := RecordPtr[10].Plantotal * (0.40 / SeriesSize)
          else
            Chart1.LeftAxis.Maximum := RecordPtr[10].Plantotal * 0.10;
          end;
//        This can't be true ever
//        if ((Chart1.LeftAxis.Maximum - Chart1.LeftAxis.Minimum) < (Chart1.LeftAxis.Minimum * 0.50)) and
//           ()then
//          Chart1.LeftAxis.Maximum := Chart1.LeftAxis.Maximum * 0.50;
        if Chart1.LeftAxis.Minimum < (Chart1.LeftAxis.Maximum * 0.2) then
          Chart1.LeftAxis.Minimum := 0;
        Decprecision := 1;
        AllowChartEdit := True;
        end;
    3:  {'ProductivityBtn'}
        begin
        Chart1.LeftAxis.Automatic := False;
        lmax := CalcMax(tag);
        lmin := CalcMin(tag);
        Chart1.LeftAxis.Minimum := 0;
        Chart1.LeftAxis.Maximum := lmax;
        if (100 > Chart1.LeftAxis.Maximum) and (Lmax > 0) then
          Chart1.LeftAxis.Maximum := lMax * 1.1;
        if (lmin > 30) and (Chart1.LeftAxis.Maximum > lMin) then
          Chart1.LeftAxis.Minimum := 25;
        Decprecision := 1;
        AllowChartEdit := True;
        end;
    4, 5: {'SalePerUnitBtn'} {'GPperUnitBtn'}
        begin
        Chart1.LeftAxis.Automatic := False;
        Chart1.LeftAxis.Minimum := 0;
        Chart1.LeftAxis.Maximum := CalcMax(Tag) * 1.20;
        Chart1.LeftAxis.Minimum := CalcMin(Tag) * 0.80;
        if ((round(Chart1.LeftAxis.Maximum) mod Integer(MAXSALESUNIT)) = 0) and (Chart1.LeftAxis.Maximum > 0) then
          Chart1.LeftAxis.Maximum := MAXSALESUNIT * ((Chart1.LeftAxis.Maximum / MAXSALESUNIT) + 1);
        if Chart1.LeftAxis.Maximum = 0 then
          Chart1.LeftAxis.Maximum := MAXSALESUNIT;
        if (Chart1.LeftAxis.Maximum - Chart1.LeftAxis.Minimum) < (Chart1.LeftAxis.Minimum * 0.50) then
          begin
          if Chart1.leftAxis.minimum > Chart1.LeftAxis.Maximum * 0.50 then
            Chart1.LeftAxis.Minimum := 0;
          Chart1.LeftAxis.Maximum := Chart1.LeftAxis.Maximum * 0.50;
          end;
        if Chart1.LeftAxis.Minimum < (Chart1.LeftAxis.Maximum * 0.2) then
          Chart1.LeftAxis.Minimum := 0;
        DecPrecision := 2;
        AllowChartEdit := True;
        end;
    6: {'GPPCBtn'}
        begin
        Chart1.LeftAxis.Automatic := False;
        Chart1.LeftAxis.Minimum := 0;
        Chart1.LeftAxis.Maximum := 100;
        lmax := CalcMax(tag);
        Chart1.LeftAxis.Minimum := CalcMin(tag);
        if lMax > Chart1.LeftAxis.Maximum then
          Chart1.LeftAxis.Maximum := lMax * 1.1;
        if Chart1.LeftAxis.Minimum > 20 then
          Chart1.LeftAxis.Minimum := 15;
        DecPrecision := 2;
        AllowChartEdit := True;
        end;
    7:  begin {'OtherIncomeBtn'}
        Chart1.LeftAxis.Automatic := False;
        Lmax := CalcMax(Tag);
        lmin := CalcMin(Tag);
        if Lmax > Chart1.LeftAxis.Minimum then
          begin
          Chart1.LeftAxis.Maximum := Lmax * 1.20;
          Chart1.LeftAxis.Minimum := lmin * 0.80;
          end
        else
          begin
          Chart1.LeftAxis.Minimum := lmin * 0.80;
          Chart1.LeftAxis.Maximum := Lmax * 1.20;
          end;
        Chart1.LeftAxis.Minimum := lmin * 0.80;
        if Chart1.LeftAxis.Maximum = 0 then
          Chart1.LeftAxis.Maximum := 1000;
        if Chart1.LeftAxis.Minimum > Chart1.LeftAxis.Maximum then
          Chart1.LeftAxis.Minimum := Chart1.LeftAxis.Maximum - 1000;
        DecPrecision := 0;
        AllowChartEdit := True;
        end;
    8, 9, 10, 11, 12: {'SalesBtn'} {'GPBtn'} {'ExpensesBtn'} {'NOPBtn'} {'NPBtn'}
        begin
        Lmax := CalcMax(Tag);
        lmin := CalcMin(Tag);
        Chart1.LeftAxis.Automatic := False;
        Chart1.LeftAxis.Minimum := 0;
        if Lmax > 0 then
          Chart1.LeftAxis.Maximum := lmax * 1.10
        else
          Chart1.LeftAxis.Maximum := lmax * 0.90;
        if lmin > 0 then
          Chart1.LeftAxis.Minimum := lmin * 0.90
        else
          Chart1.LeftAxis.Minimum := lmin * 1.10;
        if Chart1.LeftAxis.Maximum = 0 then  // based on 20% of Sales as a starting point
          Chart1.LeftAxis.Maximum := 100;
        DecPrecision := 0;
        AllowChartEdit := False;
        end;
    13, 14:  begin {'Total FTE' }
        Chart1.LeftAxis.Automatic := False;
        Lmax := CalcMax(Tag);
        lmin := CalcMin(Tag);
        if Lmax > Chart1.LeftAxis.Minimum then
          begin
          Chart1.LeftAxis.Maximum := lmax * 1.20;
          Chart1.LeftAxis.Minimum := lmin * 0.80;
          end
        else
          begin
          Chart1.LeftAxis.Minimum := lmin * 0.80;
          Chart1.LeftAxis.Maximum := lmax * 1.20;
          end;
        if Chart1.LeftAxis.Maximum = 0 then
          Chart1.LeftAxis.Maximum := 1000;
        if Chart1.LeftAxis.Minimum > Chart1.LeftAxis.Maximum then
          Chart1.LeftAxis.Minimum := Chart1.LeftAxis.Maximum - 1000;
        DecPrecision := 0;
        AllowChartEdit := True;
        end;
  end;    // case
end;

procedure TDetailTargetsF.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
//  if Button = btNext then
//    Chart1.NextPage
//  else
//    Chart1.PreviousPage;
end;

function TDetailTargetsF.RoundValue(Balance: double; Decimalplaces : Integer): Double;
var
  Factor : Double;
begin
  Factor := 10 * decimalPlaces;
  if Factor < 1 then
    result := Round(Balance)
  else
    result := Round(Balance * Factor)/ Factor;
end;

Function TDetailTargetsF.GetUnitTitle(AccountNo : Integer): string;
begin
  case AccountNo of    //
    POTENTIAL: Result := 'Potential ' + PluralTitle;
    BILLED: Result := 'Billed ' + PluralTitle;
    SALESUNIT: Result := 'Sales per ' + SingularTitle;
    GPUNIT: Result := '*GP per ' + SingularTitle;
    GPPC: Result := 'Gross Profit %';
    PRODUCTIVITY: Result := 'Productivity %';
  end;
end;

procedure TDetailTargetsF.UpdateSeries(ArrayItem, AccountNo: Integer);
var
  PlanDataRec : TPlanDataRecPtr;
  temparray : TDetailedBalArray;
  fromperiod, toperiod : integer;
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
  // FTE and FTE Prod require special treatment

  // Force Update of PlanDetail for this account
  if PlanDataRec.accountNo < SALESUNIT then
    begin
    DataCollect.psdate := DataModuleClient.DepartmentsCurrentPlanStart.value;
    DataCollect.pedate := DataModuleClient.DepartmentsCurrentPlanEnd.value;
    move(PlanDataRec.Plandetail, temparray, sizeof(TDetailedBalArray));
    if (PlanDataRec.accountNo = FTEOTHER) or (PlanDataRec.accountNo = FTEPROD) then
      begin
      DataCollect.updateArray(PlanDataRec.Plandetail,
                  DaysBetween(IncDay(DataCollect.psdate, fromperiod), DataCollect.psdate),
                  DaysBetween(IncDay(DataCollect.psdate, toperiod), DataCollect.psdate),
                   0, 1);
      DataCollect.updateArray(PlanDataRec.Plandetail,
                  DaysBetween(IncDay(DataCollect.psdate, fromperiod), DataCollect.psdate),
                  DaysBetween(IncDay(DataCollect.psdate, toperiod), DataCollect.psdate),
                  PlanDataRec.PlanSummary[ArrayItem]* (toperiod - fromperiod + 1), 1);
      PlanDataRec.PlanTotal := DataCollect.GetTotalBalance(
          PlanDataRec^.PlanDetail,
          double(DataCollect.psdate),
          double(DataCollect.psdate),
          double(DataCollect.pedate));
      PlanDataRec.PlanTotal := PlanDataRec.PlanTotal / (Trunc(DataCollect.pedate - DataCollect.psdate) + 1);
      end
    else
      DataCollect.updateArray(PlanDataRec.Plandetail,
                  DaysBetween(IncDay(DataCollect.psdate, fromperiod), DataCollect.psdate),
                  DaysBetween(IncDay(DataCollect.psdate, toperiod), DataCollect.psdate),
                   PlanDataRec.PlanSummary[ArrayItem], 1);
    end;
end;

procedure TDetailTargetsF.CalcAll;
var
  I, J : Integer;
  FixedAccounts : array[0..FIXNP] of Integer;
  AccNo : integer;
begin
  for I := 0 to FIXNP do    // Iterate - initialise this array, for BILLED, POTENTIAL, SALES, GP, NOP, NP
    FixedAccounts[I] := 0;
  for I := UpdateStart to UpdateEnd do
    begin
    if RGindex.ItemIndex = 0 then
      begin
      RecordPtr[SelectedSeries].Plantotal := RecordPtr[SelectedSeries].Plantotal - RecordPtr[SelectedSeries].PlanDetail[I];
      RecordPtr[SelectedSeries].PlanDetail[I] := Series1.Yvalue[I];
      RecordPtr[SelectedSeries].Plantotal := RecordPtr[SelectedSeries].Plantotal + RecordPtr[SelectedSeries].PlanDetail[I];
      end
    else
      begin
      RecordPtr[SelectedSeries].Plantotal := RecordPtr[SelectedSeries].Plantotal - RecordPtr[SelectedSeries].PlanSummary[I];
      RecordPtr[SelectedSeries].PlanSummary[I] := Series1.Yvalue[I];
      RecordPtr[SelectedSeries].Plantotal := RecordPtr[SelectedSeries].Plantotal + RecordPtr[SelectedSeries].PlanSummary[I];
      UpdateSeries(I, RecordPtr[SelectedSeries].AccountNo);
      end;
    end;               // Iterate
  if SelectedSeries = 1 then // Billed
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
  if (SelectedSeries = 2) or (SelectedSeries = 3) then // Potential or Productivity
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
  if SelectedSeries = 4 then // Sales per Unit
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
  if SelectedSeries = 5 then // GP per Unit
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
  if SelectedSeries = 6 then // GPPC
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
  if SelectedSeries = 7 then // GPPC
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
  SetTotals;
end;

Function TDetailTargetsF.GetCalcMode : Boolean;
begin
  Result := CalcSalesGPUP;
end;

function TDetailTargetsF.FindNearestX(XValue: double): Integer;
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

function TDetailTargetsF.CalcMax(Arrayitem : integer): double;
var
  I: Integer;
  MaxValue : Double;
begin
  MaxValue := -99999999;
  for I := 0 to SeriesSize do    // Iterate
    begin
    if Periodindex = 0 then
      begin
      if RecordPtr[ArrayItem].PlanDetail[I] > MaxValue then
        MaxValue := RecordPtr[ArrayItem].PlanDetail[I];
      end
    else
      begin
      if RecordPtr[ArrayItem].PlanSummary[I] > MaxValue then
        MaxValue := RecordPtr[ArrayItem].PlanSummary[I];
      end;
    end;    // for
  Result := MaxValue;
end;

function TDetailTargetsF.CalcMin(Arrayitem : integer): double;
var
  I: Integer;
  MinValue : Double;
begin
  MinValue := 99999999999;
  for I := 0 to SeriesSize do    // Iterate
    begin
    if Periodindex = 0 then
      begin
      if RecordPtr[ArrayItem].PlanDetail[I] < MinValue then
        MinValue := RecordPtr[ArrayItem].PlanDetail[I];
      end
    else
      begin
      if RecordPtr[ArrayItem].PlanSummary[I] < MinValue then
        MinValue := RecordPtr[ArrayItem].PlanSummary[I];
      end;
    end;    // for
  Result := MinValue;
end;

procedure TDetailTargetsF.HelpBtnClick(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTEXT, 1031);
end;

procedure TDetailTargetsF.SetCalcMode(CalcUp: Boolean);
begin
  if CalcUp then
    begin
    SalesArrow.Visible := false;
    GPArrow.Visible := True;
    Uparrow.visible := True;
    DownArrow.visible := False;
    CalcSalesGPUP := True;
    end
  else
    begin
    SalesArrow.Visible := True;
    GPArrow.Visible := false;
    Uparrow.visible := False;
    DownArrow.visible := True;
    CalcSalesGPUP := False;
    end;
//  dxfLabel1.Repaint;
//  dxfLabel2.Repaint;
end;

procedure TDetailTargetsF.PopupPrintChartClick(Sender: TObject);
begin
  ChartPreviewer1.Execute;
end;

procedure TDetailTargetsF.PopupExportChartClick(Sender: TObject);
begin
//  TeePlaceWatermark := True;
//  TeeExport(self, Chart1);
end;


procedure TDetailTargetsF.EditRawBtnClick(Sender: TObject);
begin
  Application.CreateForm(TDetailRawTargetsF, DetailRawTargetsF);
  // set Period Settings before we edit
  DetailRawTargetsF.RGIndex.ItemIndex := RGIndex.ItemIndex;
  DetailRawTargetsF.BandGVBilledCol.Caption := GetUnitTitle(BILLED);
  DetailRawTargetsF.BandGVPotentialCol.Caption := GetUnitTitle(POTENTIAL);
  DetailRawTargetsF.BandGVSaleUnitCol.Caption := GetUnitTitle(SALESUNIT);
  DetailRawTargetsF.BandGVGPUnitCol.Caption := GetUnitTitle(GPUNIT);
  DetailRawTargetsF.CalcSalesGPUP.Checked := CalcSalesGPUP;
  DetailRawTargetsF.RGIndexClick(Self);
  DetailRawTargetsF.ShowModal;
  // Set a couple of things before we close up shop
  SetCalcMode(DetailRawTargetsF.CalcSalesGPUP.Checked);
  // Update Current Series.
  RGIndex.ItemIndex := DetailRawTargetsF.RGIndex.ItemIndex;
  RGIndexClick(Self);
  DetailRawTargetsF.Free;
end;

end.
