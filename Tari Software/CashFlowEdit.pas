unit CashFlowEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  Buttons, auchTypes, LGlobals, ChartHistory,
	ChartmanualDE, Math, CashFlowEngine,
  cxControls, cxContainer, cxEdit, cxRadioGroup, cxButtons, cxGroupBox,
  cxLookAndFeelPainters, Menus, DateUtils,
  cxGraphics, cxLookAndFeels, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinXmas2008Blue,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, TeeEdit,
  TeEngine, TeeTools, TeePageNumTool, Series,
  TeeProcs, Chart;

type
  TCashFlowEditF = class(TForm)
    AccRadioGrp: TcxRadioGroup;
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    PageNumTool1: TPageNumTool;
    BankChart: TChart;
    BankSeries: TLineSeries;
    ChartTool1: TPageNumTool;
    DeptLbl: TLabel;
    UndoBtn: TcxButton;
    HelpBtn: TcxButton;
    CloseBtn: TcxButton;
    ChartPreviewer1: TChartPreviewer;
    PopMenuBank: TPopupMenu;
    PreviewBankChart: TMenuItem;
    ExportBankChart: TMenuItem;
    PopMenuTop: TPopupMenu;
    PreviewTopChart: TMenuItem;
    ExportTopChart: TMenuItem;
    cxResetBtn: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure Chart1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure HelpBtnClick(Sender: TObject);
    procedure Chart1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure UndoBtnClick(Sender: TObject);
    procedure AccRadioGrpClick(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure ExportTopChartClick(Sender: TObject);
    procedure PreviewBankChartClick(Sender: TObject);
    procedure PreviewTopChartClick(Sender: TObject);
    procedure ExportBankChartClick(Sender: TObject);
    procedure cxResetBtnClick(Sender: TObject);
  private
    { Private declarations }
    LeftMouseDown : Boolean;
    UpdateStart, UpdateEnd : Integer;
    DaysTitle : String;
    BankPtr : TCashFlowRecPtr;
    Banksign : Integer;
    function GrabManualValue(currX : Integer): Currency;
    procedure BuildSeries;
    procedure SaveArrayHistory;
    function RoundValue(Balance: double; Decimalplaces : Integer): Double;
    procedure BuilddateArray;
    procedure SetAccount;
    procedure CalcAll;
    function FindNearestX(XValue: double) : integer;
    function CalcMax: double;
    function CalcMin: double;
    procedure UpdateBankChart;
  public
    { Public declarations }
  end;

var
	CashFlowEditF: TCashFlowEditF;
  RecordPtr: array[0..3] of TCashFlowRecPtr;
//  initialized : Boolean;
  cfType : TCashFlowType;
  PeriodIndex : Integer;
  SeriesSize : integer;
  Currentmin : Integer;
  Startpoint : TPoint;
	Lhistory : TCustomHist;
  ChartDates : TDateTimeArray;
  PointersPerPage : Integer;
  DecPrecision : Integer;
  AllowChartEdit : Boolean;
  ApplyZero : Boolean;

implementation

uses DataCollector, DMClient, DMrep1U;

{$R *.dfm}

procedure TCashFlowEditF.FormCreate(Sender: TObject);
Var
  I : integer;
begin
//  Color := GGlobals.FormColour;
  DMrep1.TariButtonList.GetImage(0, CloseBtn.Glyph);
  Width := 1020;
  Height := 760;
//  Initialized := False;
	Caption := 'Cash Flow Editing - '  + DataModuleClient.BusinessDetailsBusiness_Name.AsString;
  DeptLbl.Caption := 'Business Centre / Branch: ' + DataModuleClient.BusinessesBRANCH_NAME.AsString;
  Chart1.BottomAxis.DateTimeFormat := 'dd' + #13 + 'MMM';
  BankChart.BottomAxis.DateTimeFormat := 'dd' + #13 + 'MMM';
  Chart1.LeftAxis.AxisValuesFormat := '###,##0';
  SeriesSize := cashfe.PeriodCount - 1;
  Series1.Clear;
  Series2.Clear;
  BankSeries.Clear;
  AllowChartEdit := True;
  LeftMouseDown := False;
  ApplyZero := False;
  AccRadioGrp.Properties.Items.BeginUpdate;
  case CFType of    //
    cfReceivables:
      begin
      RecordPtr[0] := CashFe.ARDataRec;
      RecordPtr[1] := CashFe.AR_DaysRec;
      RecordPtr[2] := CashFe.ARCashReceiptsRec;
      RecordPtr[3] := CashFe.ARAdjustmentsRec;
      DaysTitle := 'Accounts Receivable - Days Outstanding';
      TcxRadioGroupItem(AccRadioGrp.Properties.Items[1]).Caption := 'Days Outstanding';
      TcxRadioGroupItem(AccRadioGrp.Properties.Items[2]).Caption := 'Cash Receipts';
      end;
    cfStock:
      begin
      RecordPtr[0] := CashFe.StockDataRec;
      RecordPtr[1] := CashFe.Stock_DaysRec;
      RecordPtr[2] := CashFe.StockDeliveriesRec;
      RecordPtr[3] := CashFe.STAdjustmentsRec;
      if DataCollect.GetUserOption(OUSESTOCKDAYS, UOInteger) <> 0 then
        DaysTitle := 'Stock Days on Hand'
      else
        DaysTitle := 'Stockturns per annum';
      TcxRadioGroupItem(AccRadioGrp.Properties.Items[1]).Caption := DaysTitle;
      TcxRadioGroupItem(AccRadioGrp.Properties.Items[2]).Caption := 'Stock Deliveries';
      end;
    cfPayables:
      begin
      RecordPtr[0] := CashFe.APDataRec;
      RecordPtr[1] := CashFe.AP_DaysRec;
      RecordPtr[2] := CashFe.CashPaymentsAPRec;
      RecordPtr[3] := CashFe.APAdjustmentsRec;
      DaysTitle := 'Accounts Payable - Days Outstanding';
      TcxRadioGroupItem(AccRadioGrp.Properties.Items[1]).Caption := 'Days Outstanding';
      TcxRadioGroupItem(AccRadioGrp.Properties.Items[2]).Caption := 'Cash Payments';
      end;
    cfAccruedExpenses:
      begin
      RecordPtr[0] := CashFe.AEDataRec;
      RecordPtr[1] := CashFe.AE_DaysRec;
      RecordPtr[2] := CashFe.CashPaymentsAERec;
      RecordPtr[3] := CashFe.AEAdjustmentsRec;
      DaysTitle := 'Accrued Expenses - Days Outstanding';
      TcxRadioGroupItem(AccRadioGrp.Properties.Items[1]).Caption := 'Days Outstanding';
      TcxRadioGroupItem(AccRadioGrp.Properties.Items[2]).Caption := 'Cash Payments';
      end;
  end;    // case
  AccRadioGrp.Properties.Items.EndUpdate;
  BuilddateArray;
  if Cashfe.BankisOD then
    begin
    BankPtr := Cashfe.BankODDataRec;
    BankSign := -1;
    end
  else
    begin
    BankPtr := Cashfe.BankDataRec;
    BankSign := 1;
    end;
  for I := 0 to SeriesSize do    // Iterate
    BankSeries.AddXY(ChartDates[I], RoundValue(BankPtr.PlanSummary[I], 0) * Banksign, FormatDateTime('dd' + #13 + 'MMM', ChartDates[I]), clTeeColor);
  Lhistory := TCustomHist.Create;
  Lhistory.UnDoButton := UndoBtn;
  UndoBtn.Caption := 'Undo (' + inttostr(LHistory.StoredDepth) + ')';
  BuildSeries;
end;

procedure TCashFlowEditF.BuildSeries;
var
  I: Integer;
begin
  Series1.Clear;
  Chart1.Title.Text.Clear;
  if AccRadioGrp.ItemIndex = 1 then
    Chart1.Title.Text.add(DaysTitle)
  else
    Chart1.Title.Text.add(Recordptr[AccRadioGrp.itemIndex].AccountTitle);

  LHistory.InitializeHistory(HISTORYSIZE, SeriesSize + 1);
  if AccRadioGrp.ItemIndex < 2 then
    Cashfe.BuildBSSummary(RecordPtr[AccRadioGrp.itemIndex])
  else
    BuildSummary(Recordptr[AccRadioGrp.itemIndex].accountNo, DataModuleClient.DepartmentsCURRENTPLANSTART.Value, DataModuleClient.DepartmentsCURRENTPLANEND.Value, Recordptr[AccRadioGrp.itemIndex].PlanDetail, Recordptr[AccRadioGrp.itemIndex]^.planSummary);
  for I := 0 to SeriesSize do    // Iterate
    Series1.AddXY(ChartDates[I], RoundValue(RecordPtr[AccRadioGrp.itemIndex].planSummary[I], Decprecision), FormatDateTime('dd' + #13 + 'MMM', ChartDates[I]), clTeeColor);
  SetAccount;
end;

procedure TCashFlowEditF.Chart1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
Var
  I: Integer;
  XValue, XValue1 : Double;
  YValue, YValue1, ValueDiff : Double;
  PointColor : TColor;
  PercentChange : Double;
begin
  ApplyZero := False;
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
        begin
        YValue := GrabManualValue(X);
        if YValue = 0 then
          ApplyZero := True
        else
          ApplyZero := False;
        end
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
        begin
        YValue1 := GrabManualValue(X);
        if YValue1 = 0 then
          ApplyZero := True
        else
          ApplyZero := False;
        end
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
      begin
      YValue := GrabManualValue(X);
      if YValue = 0 then
        ApplyZero := True
      else
        ApplyZero := False;
      end
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
    if Series1.YValues[FindNearestX(Round(Series1.XScreenToValue(x)))] = 0 then
      ApplyZero := True
    else
      ApplyZero := False;
    UpdateStart := FindNearestX(Round(Series1.XScreenToValue(x)));
    UpdateEnd := FindNearestX(Round(Series1.XScreenToValue(x)));
    CalcAll;
    end;
  Chart1.Repaint;
  end;
end;

function TCashFlowEditF.GrabManualValue(currX : Integer): Currency;
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
  ChartManualDEF.ShowModal;
  Result := ChartManualDef.NewValue.Value;
  ChartManualDef.Free;
  end;
end;

procedure TCashFlowEditF.Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
if AllowChartEdit then
  begin
	Chart1.refresh;
	Chart1.Canvas.Font.Size := 10;
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

procedure TCashFlowEditF.BuilddateArray;
var
  j: Integer;
begin
  Fillchar(ChartDates, sizeof(TDateTimeArray), #0);
  for j := 0 to SeriesSize do    // Iterate
    begin
      ChartDates[j] := DataModuleClient.DepartmentsCurrentPlanStart.value + SummaryPeriodIndexArray[j];
    end;    //
end;

procedure TCashFlowEditF.HelpBtnClick(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTEXT, 1031);
end;

procedure TCashFlowEditF.Chart1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  LeftMouseDown := False;
end;

procedure TCashFlowEditF.SaveArrayHistory;
var
  I, J: Integer;
begin
  J := lHistory.GetNextHistArrayNo;
  for I := 0 to SeriesSize do    // Iterate
    lHistory.HistoryArray[J][I] := Series1.YValues[I];
  UndoBtn.Caption := 'Undo (' + inttostr(LHistory.StoredDepth) + ')';
  UndoBtn.Refresh;
end;

procedure TCashFlowEditF.UndoBtnClick(Sender: TObject);
var
  I, J: Integer;
begin
  if LHistory.StoredDepth > 0 then
    begin
    J := LHistory.GetRestoreHistArrayNo;
    for I := 0 to SeriesSize do    // Iterate
      Series1.YValues[I] := LHistory.HistoryArray[J][I];
    CalcAll;
    Chart1.Repaint;
    end;
  UndoBtn.Caption := 'Undo (' + inttostr(LHistory.StoredDepth) + ')';
  UndoBtn.Refresh;
end;

procedure TCashFlowEditF.SetAccount;
var
  lmax, lmin : double;
begin
  Lmax := CalcMax;
  lmin := CalcMin;
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
  if (AccRadioGrp.ItemIndex = 0) or (AccRadioGrp.ItemIndex = 2) then
    DecPrecision := 0
  else
    DecPrecision := 2;
  AllowChartEdit := True;
end;

function TCashFlowEditF.RoundValue(Balance: double; Decimalplaces : Integer): Double;
var
  Factor : Double;
begin
  Factor := 10 * decimalPlaces;
  if Factor < 1 then
    result := Round(Balance)
  else
    result := Round(Balance * Factor)/ Factor;
end;

procedure TCashFlowEditF.UpdateBankChart;
var
  I : integer;
begin
	BankSeries.BeginUpdate;
  if AccRadioGrp.ItemIndex = 0 then
    Cashfe.BuildBSSummary(RecordPtr[AccRadioGrp.itemIndex]);
  if AccradioGrp.ItemIndex = 2 then
    BuildSummary(Recordptr[AccRadioGrp.itemIndex].accountNo, DataModuleClient.DepartmentsCURRENTPLANSTART.Value, DataModuleClient.DepartmentsCURRENTPLANEND.Value, Recordptr[AccRadioGrp.itemIndex].PlanDetail, Recordptr[AccRadioGrp.itemIndex]^.planSummary);
  Series1.Clear;
  for I := 0 to SeriesSize do    // Iterate
    Series1.AddXY(ChartDates[I], RoundValue(RecordPtr[AccRadioGrp.itemIndex].planSummary[I], Decprecision), FormatDateTime('dd' + #13 + 'MMM', ChartDates[I]), clTeeColor);
  SetAccount;

  BankSeries.Clear;
  if Cashfe.BankisOD then
    begin
    BankPtr := Cashfe.BankODDataRec;
    BankSign := -1;
    end
  else
    begin
    BankPtr := Cashfe.BankDataRec;
    BankSign := 1;
    end;
  for I := 0 to SeriesSize do    // Iterate
    BankSeries.AddXY(ChartDates[I], RoundValue(BankPtr.PlanSummary[I], 0) * Banksign, FormatDateTime('dd' + #13 + 'MMM', ChartDates[I]), clTeeColor);
	BankSeries.endUpdate;
  BankChart.Repaint;
end;

procedure TCashFlowEditF.CalcAll;
var
  I : Integer;
  Openingbal : Currency;
  perstart, perend : TDate;
begin
  for I := UpdateStart to UpdateEnd do
    begin
    RecordPtr[AccRadioGrp.itemindex].PlanSummary[I] := Series1.Yvalue[I];
    if ApplyZero and (AccRadioGrp.itemindex < 2) then
      begin
      RecordPtr[0].PlanSummary[I] := 0;
      RecordPtr[1].PlanSummary[I] := 0;
      end;
    end;
    // Balances - we adjust receipting, stockdeliveries, payments
  if AccRadioGrp.itemindex = 0 then
    begin
      case Cftype of    //
      cfReceivables:
        begin
        for I := 0 to seriesSize do    // Iterate
          begin
          if I = 0 then
            OpeningBal := CashFe.ARDataRec.OpeningBalance
          else
            OpeningBal := CashFe.ARDataRec.PlanSummary[I - 1];
//          if (ApplyZero) then
//            CashFe.ARDataRec.PlanSummary[I] := 0;
          Cashfe.ARCashReceiptsRec.PlanSummary[I] := OpeningBal
                                                     + Cashfe.GrossSalesRec.PlanSummary[I]
                                                     - CashFe.ARDataRec.PlanSummary[I]
                                                     - Cashfe.AR_WriteOffRec.PlanSummary[I]
                                                     - RecordPtr[3].PlanSummary[I];
          if Cashfe.ARCashReceiptsRec.PlanSummary[I] > (OpeningBal + Cashfe.GrossSalesRec.PlanSummary[I] - RecordPtr[3].PlanSummary[I]) then
            begin
            Cashfe.ARDataRec.PlanSummary[I] := 0;
            Cashfe.ARCashReceiptsRec.PlanSummary[I] := OpeningBal + Cashfe.GrossSalesRec.PlanSummary[I] - RecordPtr[3].PlanSummary[I];
            end;

          end;    // for
        cashfe.calculateBSDays(0, seriesSize, cftype);
        Cashfe.BuildBSDetail(Cashfe.AR_DaysRec);
        Cashfe.ProcessAccountsReceivable;
        end;
      cfStock:
        begin
        for I := 0 to seriesSize do    // Iterate
          begin
          if I = 0 then
            OpeningBal := CashFe.StockDataRec.OpeningBalance
          else
            OpeningBal := CashFe.StockDataRec.PlanSummary[I - 1];
//          if ApplyZero) then
//            Cashfe.StockSoldRec.PlanSummary[I] := 0;
          Cashfe.StockDeliveriesRec.PlanSummary[I] := CashFe.StockDataRec.PlanSummary[I]
                                                      - OpeningBal
                                                      + Cashfe.StockSoldRec.PlanSummary[I]
                                                      - Cashfe.ST_WriteOffRec.PlanSummary[I]
                                                      - RecordPtr[3].PlanSummary[I];
          end;    // for
        CashFe.calculateStockturn(0, SeriesSize);
        Cashfe.BuildBSDetail(Cashfe.Stock_DaysRec);
        Cashfe.ProcessStock;
        cashfe.ProcessAccountsPayable;
        end;
      cfPayables:
        begin
        for I := 0 to seriesSize do    // Iterate
          begin
          if I = 0 then
            OpeningBal := CashFe.APDataRec.OpeningBalance
          else
            OpeningBal := CashFe.APDataRec.PlanSummary[I - 1];
//          if ApplyZero then
//            CashFe.APDataRec.PlanSummary[I] := 0;
          Cashfe.CashPaymentsAPRec.PlanSummary[I] := OpeningBal
                                                     + Cashfe.TotalInvoicesAPRec.PlanSummary[I]
                                                     - CashFe.APDataRec.PlanSummary[I]
                                                     - RecordPtr[3].PlanSummary[I];
          end;    // for
        cashfe.calculateBSDays(0, seriesSize, cftype);
        Cashfe.BuildBSDetail(Cashfe.AP_DaysRec);
        Cashfe.ProcessAccountsPayable;
        end;
      cfAccruedExpenses:
        begin
        for I := 0 to seriesSize do    // Iterate
          begin
          if I = 0 then
            OpeningBal := CashFe.AEDataRec.OpeningBalance
          else
            OpeningBal := CashFe.AEDataRec.PlanSummary[I - 1];
//          if ApplyZero then
//            CashFe.AeDataRec.PlanSummary[I] := 0;
          Cashfe.CashPaymentsAERec.PlanSummary[I] := OpeningBal
                                                     + Cashfe.GrossExpensesAccruedRec.PlanSummary[I]
                                                     - CashFe.AeDataRec.PlanSummary[I]
                                                     - RecordPtr[3].PlanSummary[I];
          end;    // for
        cashfe.calculateBSDays(0, seriesSize, cftype);
        Cashfe.BuildBSDetail(Cashfe.AE_DaysRec);
        Cashfe.ProcessAccruedExpenses;
        end;
      end;    // case
    end;
    // Days / stock turns - we adjust Closing balances
  if AccRadioGrp.itemindex = 1 then
    begin
      case cfType of    //
      cfReceivables:
        begin
        CashFe.BuildBSDetail(cashfe.AR_DaysRec);
        Cashfe.ProcessAccountsReceivable;
        end;
      cfStock:
        begin
        Cashfe.BuildBSDetail(Cashfe.Stock_DaysRec);
        Cashfe.ProcessStock;
        cashfe.ProcessAccountsPayable;
        end;
      cfPayables:
        begin
        CashFe.BuildBSDetail(cashfe.AP_DaysRec);
        cashfe.ProcessAccountsPayable;
        end;
      cfAccruedExpenses:
        begin
        CashFe.BuildBSDetail(cashfe.AE_DaysRec);
        cashfe.ProcessAccruedExpenses;
        end;
      end;    // case
    end;
  if AccRadioGrp.itemindex = 2 then
    begin
      case Cftype of    //
      cfReceivables:
        begin
        for I := 0 to seriesSize do    // Iterate
          begin
          if I = 0 then
            OpeningBal := CashFe.ARDataRec.OpeningBalance
          else
            OpeningBal := CashFe.ARDataRec.PlanSummary[I - 1];
          if Cashfe.ARCashReceiptsRec.PlanSummary[I] > (OpeningBal + CashFe.ARDataRec.PlanSummary[I] - RecordPtr[3].PlanSummary[I]) then
             Cashfe.ARCashReceiptsRec.PlanSummary[I] := OpeningBal + CashFe.ARDataRec.PlanSummary[I] - RecordPtr[3].PlanSummary[I];
          CashFe.ARDataRec.PlanSummary[I] := OpeningBal
                                             + Cashfe.GrossSalesRec.PlanSummary[I]
                                             - Cashfe.ARCashReceiptsRec.PlanSummary[I]
                                             - Cashfe.AR_WriteOffRec.PlanSummary[I]
                                             - RecordPtr[3].PlanSummary[I];
          if I = 0 then
            Perstart := Cashfe.Psdate
          else
            Perstart := CashFe.psdate + SummaryPeriodIndexArray[I - 1] + 1;
          PerEnd := CashFe.psdate + SummaryPeriodIndexArray[I];
          DataCollect.updateArray(Cashfe.ARCashReceiptsRec.PlanDetail,
                  DaysBetween(Perstart, Cashfe.psdate),
                  DaysBetween(PerEnd, Cashfe.psdate),
                  Cashfe.ARCashReceiptsRec.PlanSummary[I],
                  2);
          end;    // for
        cashfe.calculateBSDays(0, seriesSize, cftype);
        Cashfe.ProcessAccountsReceivable;
        end;
      cfStock:
        begin
        for I := 0 to seriesSize do    // Iterate
          begin
          if I = 0 then
            OpeningBal := CashFe.StockDataRec.OpeningBalance
          else
            OpeningBal := CashFe.StockDataRec.PlanSummary[I - 1];
          if Cashfe.StockSoldRec.PlanSummary[I] > (Openingbal + Cashfe.StockDeliveriesRec.PlanSummary[I]) then
            Cashfe.StockSoldRec.PlanSummary[I] := Openingbal + Cashfe.StockDeliveriesRec.PlanSummary[I];
          CashFe.StockDataRec.PlanSummary[I] := OpeningBal
                                                - Cashfe.StockSoldRec.PlanSummary[I]
                                                + Cashfe.StockDeliveriesRec.PlanSummary[I]
                                                - Cashfe.ST_WriteOffRec.PlanSummary[I]
                                                - RecordPtr[3].PlanSummary[I];
          if I = 0 then
            Perstart := CashFe.psdate
          else
            Perstart := CashFe.psdate + SummaryPeriodIndexArray[I - 1] + 1;
          PerEnd := CashFe.psdate + SummaryPeriodIndexArray[I];
          DataCollect.updateArray(Cashfe.StockDeliveriesRec.PlanDetail,
                  DaysBetween(Perstart, Cashfe.psdate),
                  DaysBetween(PerEnd, Cashfe.psdate),
                  Cashfe.StockDeliveriesRec.PlanSummary[I],
                  2);
          end;    // for
        CashFe.calculateStockturn(0, SeriesSize);
        Cashfe.BuildBSDetail(Cashfe.Stock_DaysRec);
        Cashfe.ProcessStock;
        cashfe.ProcessAccountsPayable;
        end;
      cfPayables:
        begin
        for I := 0 to seriesSize do    // Iterate
          begin
          if I = 0 then
            OpeningBal := CashFe.APDataRec.OpeningBalance
          else
            OpeningBal := CashFe.APDataRec.PlanSummary[I - 1];
          if Cashfe.CashPaymentsAPRec.PlanSummary[I] > (OpeningBal + Cashfe.TotalInvoicesAPRec.PlanSummary[I]) then
            Cashfe.CashPaymentsAPRec.PlanSummary[I] := OpeningBal + Cashfe.TotalInvoicesAPRec.PlanSummary[I];
          CashFe.APDataRec.PlanSummary[I] := OpeningBal
                                             + Cashfe.TotalInvoicesAPRec.PlanSummary[I]
                                             - Cashfe.CashPaymentsAPRec.PlanSummary[I]
                                             - RecordPtr[3].PlanSummary[I];
          if I = 0 then
            Perstart := Cashfe.psdate
          else
            Perstart := Cashfe.psdate + SummaryPeriodIndexArray[I - 1] + 1;
          PerEnd := Cashfe.psdate + SummaryPeriodIndexArray[I];
          DataCollect.updateArray(cashfe.CashPaymentsAPRec.PlanDetail,
                  DaysBetween(Perstart, Cashfe.psdate),
                  DaysBetween(PerEnd, Cashfe.psdate),
                  Cashfe.CashPaymentsAPRec.PlanSummary[I],
                  2);
          end;    // for
        cashfe.calculateBSDays(0, seriesSize, cftype);
        Cashfe.ProcessAccountsPayable;
        end;
      cfAccruedExpenses:
        begin
        for I := 0 to seriesSize do    // Iterate
          begin
          if I = 0 then
            OpeningBal := CashFe.AEDataRec.OpeningBalance
          else
            OpeningBal := CashFe.AEDataRec.PlanSummary[I - 1];
          if Cashfe.CashPaymentsAERec.PlanSummary[I] > (OpeningBal + Cashfe.GrossExpensesAccruedRec.PlanSummary[I]) then
            Cashfe.CashPaymentsAERec.PlanSummary[I] := OpeningBal + Cashfe.GrossExpensesAccruedRec.PlanSummary[I];
          CashFe.AeDataRec.PlanSummary[I] := OpeningBal
                                             + Cashfe.GrossExpensesAccruedRec.PlanSummary[I]
                                             - Cashfe.CashPaymentsAERec.PlanSummary[I]
                                             - RecordPtr[3].PlanSummary[I];
          if I = 0 then
            Perstart := cashfe.psdate
          else
            Perstart := Cashfe.psdate + SummaryPeriodIndexArray[I - 1] + 1;
          PerEnd := Cashfe.psdate + SummaryPeriodIndexArray[I];
          DataCollect.updateArray(Cashfe.CashPaymentsAERec.PlanDetail,
                  DaysBetween(Perstart, Cashfe.psdate),
                  DaysBetween(PerEnd, Cashfe.psdate),
                  Cashfe.CashPaymentsAERec.PlanSummary[I],
                  2);

          end;    // for
        cashfe.calculateBSDays(0, seriesSize, cftype);
        Cashfe.ProcessAccruedExpenses;
        end;
      end;    // case
    end;
  cashFe.ProcessTax;
  cashFe.ProcessCash;
  UpdateBankChart;
  Chart1.Repaint;
  ApplyZero := False;
end;

function TCashFlowEditF.FindNearestX(XValue: double): Integer;
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

function TCashFlowEditF.CalcMax: double;
var
  I: Integer;
  MaxValue : Double;
begin
  MaxValue := -99999999;
  for I := 0 to SeriesSize do    // Iterate
    begin
    if RecordPtr[AccRadioGrp.itemindex].PlanSummary[I] > MaxValue then
      MaxValue := RecordPtr[AccRadioGrp.itemindex].PlanSummary[I];
    end;    // for
  Result := MaxValue;
end;

function TCashFlowEditF.CalcMin: double;
var
  I: Integer;
  MinValue : Double;
begin
  MinValue := 99999999999;
  for I := 0 to SeriesSize do    // Iterate
    begin
    if RecordPtr[AccRadioGrp.itemindex].PlanSummary[I] < MinValue then
      MinValue := RecordPtr[AccRadioGrp.itemindex].PlanSummary[I];
    end;    // for
  Result := MinValue;
end;

procedure TCashFlowEditF.AccRadioGrpClick(Sender: TObject);
begin
  if (AccRadioGrp.ItemIndex = 0) or (AccRadioGrp.ItemIndex = 2) then
    begin
    DecPrecision := 0;
    chart1.LeftAxis.AxisValuesFormat := '###,##0';
    end
  else
    begin
    DecPrecision := 2;
    chart1.LeftAxis.AxisValuesFormat := '###,##0.00';
    end;
  BuildSeries;
end;

procedure TCashFlowEditF.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TCashFlowEditF.ExportTopChartClick(Sender: TObject);
begin
//  TeePlaceWatermark := True;
//	TeeExport(self, Chart1);
end;

procedure TCashFlowEditF.PreviewBankChartClick(Sender: TObject);
begin
//  ChartPreviewer1.BankChart;
//  ChartPreviewer1.Execute;
end;

procedure TCashFlowEditF.PreviewTopChartClick(Sender: TObject);
begin
//  ChartPreviewer1.Chart := Chart1;
//  ChartPreviewer1.Execute;
end;

procedure TCashFlowEditF.ExportBankChartClick(Sender: TObject);
begin
//	TeePlaceWatermark := True;
//  TeeExport(self, BankChart);
end;

procedure TCashFlowEditF.cxResetBtnClick(Sender: TObject);
var
  I : Integer;
  Openingbal : Currency;
begin
// take the selected mode and make all outputs - inputs and all balances equal to opening balance and reset days
  AccRadioGrp.itemindex := 0;
    // Balances - we adjust receipting, stockdeliveries, payments
  case Cftype of    //
    cfReceivables:
    begin
			for I := 0 to seriesSize do    // Iterate
      begin
        if I = 0 then
          OpeningBal := CashFe.ARDataRec.OpeningBalance
        else
          OpeningBal := CashFe.ARDataRec.PlanSummary[I - 1];
        CashFe.ARCashReceiptsRec.PlanSummary[I] := Cashfe.GrossSalesRec.PlanSummary[I] - Cashfe.AR_WriteOffRec.PlanSummary[I] - RecordPtr[3].PlanSummary[I];
        Cashfe.ARDataRec.PlanSummary[I] := OpeningBal
                                                   + Cashfe.GrossSalesRec.PlanSummary[I]
                                                   - CashFe.ARCashReceiptsRec.PlanSummary[I]
                                                   - Cashfe.AR_WriteOffRec.PlanSummary[I]
                                                   - RecordPtr[3].PlanSummary[I];
      end;    // for
      cashfe.calculateBSDays(0, seriesSize, cftype);
      Cashfe.BuildBSDetail(Cashfe.AR_DaysRec);
      Cashfe.ProcessAccountsReceivable;
    end;
    cfStock:
      begin
      for I := 0 to seriesSize do    // Iterate
        begin
        if I = 0 then
          OpeningBal := CashFe.StockDataRec.OpeningBalance
        else
          OpeningBal := CashFe.StockDataRec.PlanSummary[I - 1];
        Cashfe.StockDeliveriesRec.PlanSummary[I] := Cashfe.StockSoldRec.PlanSummary[I] - Cashfe.ST_WriteOffRec.PlanSummary[I]
                                                    - RecordPtr[3].PlanSummary[I];
        Cashfe.StockDataRec.PlanSummary[I] := OpeningBal + Cashfe.StockDeliveriesRec.PlanSummary[I] - Cashfe.StockSoldRec.PlanSummary[I]
                                                    - Cashfe.ST_WriteOffRec.PlanSummary[I]
                                                    - RecordPtr[3].PlanSummary[I];
        end;    // for
      CashFe.calculateStockturn(0, SeriesSize);
      Cashfe.BuildBSDetail(Cashfe.Stock_DaysRec);
      Cashfe.ProcessStock;
      cashfe.ProcessAccountsPayable;
    end;
    cfPayables:
      begin
      for I := 0 to seriesSize do    // Iterate
        begin
        if I = 0 then
          OpeningBal := CashFe.APDataRec.OpeningBalance
        else
          OpeningBal := CashFe.APDataRec.PlanSummary[I - 1];
        Cashfe.CashPaymentsAPRec.PlanSummary[I] := Cashfe.TotalInvoicesAPRec.PlanSummary[I]
                                                   - RecordPtr[3].PlanSummary[I];
        Cashfe.APDataRec.PlanSummary[I] := OpeningBal + Cashfe.TotalInvoicesAPRec.PlanSummary[I]
                                                   - CashFe.CashPaymentsAPRec.PlanSummary[I]
                                                   - RecordPtr[3].PlanSummary[I];
        end;    // for
      cashfe.calculateBSDays(0, seriesSize, cftype);
      Cashfe.BuildBSDetail(Cashfe.AP_DaysRec);
      Cashfe.ProcessAccountsPayable;
      end;
    cfAccruedExpenses:
      begin
      for I := 0 to seriesSize do    // Iterate
        begin
        if I = 0 then
          OpeningBal := CashFe.AEDataRec.OpeningBalance
        else
          OpeningBal := CashFe.AEDataRec.PlanSummary[I - 1];
        Cashfe.CashPaymentsAERec.PlanSummary[I] := Cashfe.GrossExpensesAccruedRec.PlanSummary[I]
                                                   - RecordPtr[3].PlanSummary[I];
        Cashfe.AeDataRec.PlanSummary[I] := OpeningBal + Cashfe.GrossExpensesAccruedRec.PlanSummary[I]
                                                   - CashFe.CashPaymentsAERec.PlanSummary[I]
                                                   - RecordPtr[3].PlanSummary[I];
        end;    // for
      cashfe.calculateBSDays(0, seriesSize, cftype);
      Cashfe.BuildBSDetail(Cashfe.AE_DaysRec);
      Cashfe.ProcessAccruedExpenses;
      end;
    end;    // case
  UpdateStart := 0;
  UpdateEnd := SeriesSize;
  CalcAll;
end;

end.
