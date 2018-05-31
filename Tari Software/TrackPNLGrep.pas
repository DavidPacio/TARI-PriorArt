unit TrackPNLGrep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, TeeProcs, TeEngine, Chart, DBChart, QrTee, QuickRpt, ExtCtrls,
  Series, auchTypes, DMClient, DataCollector, printers;

type

  TGraphColors = array[0..5] of TColor;
  TAccountNos = Array[0..6] of integer;

  TTrackPNLGRepF = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRDBChart1: TQRDBChart;
    Chart1: TQRChart;
    CompanyName: TQRLabel;
    QRLabel1: TQRLabel;
    Departments: TQRLabel;
    QRSysData2: TQRSysData;
    PageDateTime: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    Series1: TBarSeries;
    Series2: TBarSeries;
    procedure QuickRep1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PageFooterBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    ItemNo : integer;
    CogsNonzero : Boolean;
    OtherIncomeNonZero : Boolean;
    ContainsAnnualised : Boolean;
    TotalExpensesPrinted : Boolean;
    Narrowrep: boolean;
    ChartDates : TDateTimeArray;
    TotalNoColumns: Integer;
    PageStartColNo : integer;
    GraphColorno : Integer;
    DaysinYear : integer;
    procedure LoadChart(AccountRec : TReportDataRecPtr);
  public
    { Public declarations }
    UseColor : Boolean;
    ThreeDImage : Boolean;
    ShowMarks : Boolean;
    ReportFont : TFontName;
    DefaultOrientation : TPrinterOrientation;
    procedure SetData;
  end;
Const
  GraphColors : TGraphColors = (clRed, clGreen, clYellow, clBlue, clWhite, clGray);
  AccountNos : TAccountNos = (SALES, COGS, GROSSPROFIT, TOTALEXPENSES, NETOPERATINGPROFIT, OTHERINCOME, NETPROFIT);

var
  TrackPNLGRepF: TTrackPNLGRepF;
  PNLGstartDate, PNLGEndDate, PNLGPeriodStartDate : TDateTime;
  PNLGSummaryType, PNLGLatestPeriod : integer;
  PNLGCumulative : Boolean;
  TRPNGRPConsolidate : Boolean;


implementation

{$R *.DFM}

procedure TTrackPNLGRepF.QuickRep1NeedData(Sender: TObject;
  var MoreData: Boolean);
var
  SummaryEnd: Integer;
  DetailEnd: Integer;
  I, K : Integer;
//  Itemfound : Boolean;
  RepData : TReportDataRecPtr;
  ReportOtherInc : TReportDataRecPtr;
  TempBal : Currency;
begin
//  Itemfound := False;
  MoreData := True;
  if ItemNo < ReportDataList.count
    then begin
    RepData := TReportDataRecPtr(ReportDataList.Items[ItemNo]);
    if (RepData.Accountno = NETOPERATINGPROFIT)
      then begin
      ReportOtherInc := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(OTHERINCOME)]);
      DetailEnd := -1;
      SummaryEnd := -1;
      TempBal := 0;
      if PNLGSummaryType = 0 then
        DetailEnd := Trunc(DataModuleClient.DepartmentsCurrentMonitoringEnd.value
                    - DataModuleClient.DepartmentsCurrentMonitoringStart.value) + 1
      else begin
        if PNLGSummaryType < 7 then
          I := 1
        else
          I := 0;
        while (SummaryPeriodIndexArray[I] <> 0) and (I < (NUM_WEEKS - 1)) do inc(I);
        SummaryEnd := I;
      end;
      if DetailEnd > 0
        then begin
        for k := 0 to DetailEnd
          do begin   // Iterate
          if K < Detailend then
            TempBal := Tempbal + ReportOtherInc.monDetail[K];
          TempBal := Tempbal + ReportOtherInc.PlanDetail[K];
        end;
      end
      else begin
        for k := 0 to SummaryEnd
          do begin // Iterate
          if K < SummaryEnd then
            tempbal := tempbal + ReportOtherInc.monSummary[K];
          tempbal := tempbal + ReportOtherInc.PlanSummary[K];
        end;
      end;
      if tempbal = 0
        then begin
        itemNo := GetReportAccountIndex(NETPROFIT)
      end;
      RepData := TReportDataRecPtr(ReportDataList.Items[ItemNo]);
    end;
    LoadChart(RepData);
  end
  else MoreData := False;
    inc(ItemNo);
end;

procedure TTrackPNLGRepF.FormCreate(Sender: TObject);
begin
  ItemNo := 0;
  GraphColorno := 0;
  CogsNonzero := False;
  OtherIncomeNonZero := False;
  ContainsAnnualised := False;
  TotalExpensesPrinted := False;
  DataCollect.GetConsolidatedList(TRPNGRPConsolidate);
  DataCollect.GetMonitoringAccountArray(False);
  DataCollect.getDetailedPLData(PNLGCumulative, PNLGStartDate, PNLGEndDate, PNLGperiodstartDate, PNLGSummaryType);

//  DataModuleClient.getTrackingkeyData(KeyGCumulative, KeyGStartDate, KeyGEndDate, KeyGperiodstartDate, KeyGSummaryType);
//  TitlesList := TStringList.create;
//  DataModuleClient.GetConsolidatedList(Consolidate);
//  if DataModuleClient.Planloaded = false then
//    DataModuleClient.getPlanningData;
end;

procedure TTrackPNLGRepF.SetData;
var
//  I: Integer;
  j: Integer;
//  SummaryPtr : TPlanDataRecPtr;
begin
  // create the correct summary.
//  SummaryPeriodIndexArray[j]

  daysinyear := trunc(DataModuleClient.DepartmentsCurrentMonitoringEnd.value) - trunc(DataModuleClient.DepartmentsCurrentMonitoringStart.value);

  if PNLGSummaryType > 0
    then begin
    if PNLGSummaryType < 7 then
      TotalNoColumns := 1
    else
      TotalNoColumns := 0;
    while SummaryPeriodIndexArray[TotalNoColumns] > 0 do inc(TotalNoColumns);
  end
  else begin
    TotalNoColumns := DaysinYear + 1;
  end;
  if DaysInYear < 365 then DaysInyear := 365;
    
  if (PNLGLatestPeriod + 2) < TotalNoColumns then TotalNoColumns := PNLGLatestPeriod + 2;

  PageStartColNo := 0;
  //  BuilddateArray;
  Fillchar(ChartDates, sizeof(TDateTimeArray), #0);
  for j := 0 to TotalNoColumns - 1 do    // Iterate
    begin
    if PNLGSummaryType = 0 then
      ChartDates[j] := DataModuleClient.DepartmentsCurrentMonitoringStart.value + j
    else
      ChartDates[j] := DataModuleClient.DepartmentsCurrentMonitoringStart.value + SummaryPeriodIndexArray[j];
  end;

  if PNLGSummaryType > 4
    then begin
    DefaultOrientation := poPortrait;
    Narrowrep := True;
  end
  else
    DefaultOrientation := poLandscape;
//  SetPage;
end;

procedure TTrackPNLGRepF.FormDestroy(Sender: TObject);
begin
  DataCollect.ClearReportDataList;
  DataCollect.ClearConsolidatedList;
end;

procedure TTrackPNLGRepF.LoadChart(AccountRec : TReportDataRecPtr);
var
  I : integer;
  tempTitle : string;
  AnnualiseFactor : double;
//  DaysInperiod : Integer;
begin
  AnnualiseFactor := 1;
  Chart1.Chart.RemoveAllSeries;
  Chart1.chart.BottomAxis.DateTimeFormat := 'dd MMM';
  if ThreeDImage then
    CHart1.Chart.Chart3DPercent := 15
  else
    CHart1.Chart.Chart3DPercent := 5;
// Add Plan Information
  if TotalNoColumns < 4
    then begin
    Chart1.Chart.AddSeries(TbarSeries.create(self));
    Chart1.chart.Legend.Visible := True;
    Chart1.Chart.AddSeries(TbarSeries.create(self));
  end
  else begin
    Chart1.Chart.AddSeries(TLineSeries.create(self));
    Chart1.Chart.AddSeries(TLineSeries.create(self));
  end;
  Chart1.Chart.Series[0].Title := 'Target';
  Chart1.Chart.Series[0].Xvalues.DateTime := True;
  Chart1.Chart.Series[0].ColorEachPoint := False;
  Chart1.Chart.Series[0].SeriesColor := clRed;
  Chart1.Chart.Series[0].Marks.Style := smsValue;
  Chart1.Chart.Series[0].Marks.Visible := ShowMarks;

  Chart1.Chart.Series[1].Title := 'Actual';
  Chart1.Chart.Series[1].Xvalues.DateTime := True;
  Chart1.Chart.Series[1].ColorEachPoint := False;
  Chart1.Chart.Series[1].SeriesColor := clBlue;
  Chart1.Chart.Series[1].Marks.Style := smsValue;
  Chart1.Chart.Series[1].Marks.Visible := ShowMarks;

  if AccountRec.FormatImage <> 'Mins'
    then begin
    Chart1.Chart.Series[0].ValueFormat := AccountRec.FormatImage;
    Chart1.Chart.Series[1].ValueFormat := AccountRec.FormatImage;
  end
  else begin
    Chart1.Chart.Series[0].ValueFormat := REPORTTENSCURRENCY;
    Chart1.Chart.Series[1].ValueFormat := REPORTTENSCURRENCY;
  end;

  // setting default factor for Daily Listing
  for I := 0 to TotalNoColumns - 1 do    // Iterate
    begin
    if PNLGSummaryType = 0
      then begin
      chart1.Chart.Series[0].AddXY(ChartDates[I], AccountRec.PlanDetail[I] / AnnualiseFactor, '', clTeeColor);
      if I <= PNLGLatestPeriod then
        chart1.Chart.Series[1].AddXY(ChartDates[I], AccountRec.MonDetail[I] / AnnualiseFactor, '', clTeeColor)
    end
    else begin
      chart1.Chart.Series[0].AddXY(ChartDates[I], AccountRec.PlanSummary[I] / AnnualiseFactor, '', clTeeColor);
      if I <= PNLGLatestPeriod then
        chart1.Chart.Series[1].AddXY(ChartDates[I], AccountRec.MonSummary[I] / AnnualiseFactor, '', clTeeColor);
    end;
    Chart1.Chart.Series[0].XLabel[I] := formatDateTime('dd MMM', ChartDates[i]);
    if I <= PNLGLatestPeriod then
      Chart1.Chart.Series[1].XLabel[I] := formatDateTime('dd MMM', ChartDates[i]);
  end;
  Chart1.Chart.Title.text.Clear;
  if AccountRec.Accumulate then
    TempTitle := strPas(AccountRec.AccountTitle) + '*'
  else
    TempTitle := strPas(AccountRec.AccountTitle);
  Chart1.Chart.Title.Text.Add(TempTitle);
end;

procedure TTrackPNLGRepF.PageFooterBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if GCumulative then
    begin
    QRLabel3.Caption := '* Amounts shown are accumulated Year to Date';
    QRLabel3.Enabled := True;
  end;
end;

end.
