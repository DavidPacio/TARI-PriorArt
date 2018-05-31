unit TrackKeyGrep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TeeProcs, TeEngine, Chart, DBChart, ExtCtrls,
  Series, auchTypes, DMClient, DataCollector, printers, ppDB, ppDBJIT,
  ppChrt, ppVar, ppPrnabl, ppClass, ppCtrls, ppBands, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, ppStrtch, s;

type

  TGraphColors = array[0..5] of TColor;
  TAccountNos = Array[0..6] of integer;

  TTrackKeyGRepF = class(TForm)
    ppReport1: TppReport;
    ppDetailBand1: TppDetailBand;
    ppHeaderBand1: TppHeaderBand;
    ppFooterBand1: TppFooterBand;
    rbCompanyName: TppLabel;
    rbDepartments: TppLabel;
    rbQRSysData2: TppSystemVariable;
    rbPageDateTime: TppLabel;
    rbQRLabel2: TppLabel;
    rbQRLabel3: TppLabel;
    Chart1: TppTeeChart;
    ppJITPipeline1: TppJITPipeline;
    ppJITPipeline1ppField1: TppField;
    RBReportTitle: TppLabel;
    procedure QuickRep1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
//    procedure PageFooterBand1BeforePrint(Sender: TQRCustomBand;
//      var PrintBand: Boolean);
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
  TrackKeyGRepF: TTrackKeyGRepF;
  KeyGstartDate, KeyGEndDate, KeyGPeriodStartDate : TDateTime;
  KeyGSummaryType, KeyGLatestPeriod : integer;
  KeyGCumulative : Boolean;
  TRKGRPConsolidate : Boolean;


implementation

{$R *.DFM}

procedure TTrackKeyGRepF.QuickRep1NeedData(Sender: TObject;
  var MoreData: Boolean);
//var
//  Itemfound : Boolean;
begin
//  Itemfound := False;
  MoreData := True;
  if ItemNo < ReportDataList.count then
    LoadChart(TReportDataRecPtr(ReportDataList.Items[ItemNo]))
  else MoreData := False;
  inc(ItemNo);
end;

procedure TTrackKeyGRepF.FormCreate(Sender: TObject);
begin
  ItemNo := 0;
  GraphColorno := 0;
  CogsNonzero := False;
  OtherIncomeNonZero := False;
  ContainsAnnualised := False;
  TotalExpensesPrinted := False;
  DataCollect.GetConsolidatedList(TRKGRPConsolidate);
  DataCollect.getTrackingkeyData(KeyGCumulative, KeyGStartDate, KeyGEndDate, KeyGperiodstartDate, KeyGSummaryType);
//  TitlesList := TStringList.create;
//  DataModuleClient.GetConsolidatedList(Consolidate);
//  if DataModuleClient.Planloaded = false then
//    DataModuleClient.getPlanningData;
end;

procedure TTrackKeyGRepF.SetData;
var
//  I: Integer;
  j: Integer;
//  SummaryPtr : TPlanDataRecPtr;
begin
  // create the correct summary.
//  SummaryPeriodIndexArray[j]

  daysinyear := trunc(DataModuleClient.DepartmentsCurrentMonitoringEnd.value) - trunc(DataModuleClient.DepartmentsCurrentMonitoringStart.value);

  if KeyGSummaryType > 0
    then begin
    if KeyGSummaryType < 7 then
      TotalNoColumns := 1
    else
      TotalNoColumns := 0;
    while SummaryPeriodIndexArray[TotalNoColumns] > 0 do inc(TotalNoColumns);
  end
  else begin
    TotalNoColumns := DaysinYear + 1;
  end;
  if DaysInYear < 365 then DaysInyear := 365;
    
  if (KeyGLatestPeriod + 2) < TotalNoColumns then TotalNoColumns := KeyGLatestPeriod + 2;

  PageStartColNo := 0;
  //  BuilddateArray;
  Fillchar(ChartDates, sizeof(TDateTimeArray), #0);
  for j := 0 to TotalNoColumns - 1 do    // Iterate
    begin
    if KeyGSummaryType = 0 then
      ChartDates[j] := DataModuleClient.DepartmentsCurrentMonitoringStart.value + j
    else
      ChartDates[j] := DataModuleClient.DepartmentsCurrentMonitoringStart.value + SummaryPeriodIndexArray[j];
  end;

  if KeyGSummaryType > 4
    then begin
    DefaultOrientation := poPortrait;
    Narrowrep := True;
  end
  else
    DefaultOrientation := poLandscape;
//  SetPage;
end;

procedure TTrackKeyGRepF.FormDestroy(Sender: TObject);
begin
  DataCollect.ClearReportDataList;
  DataCollect.ClearConsolidatedList;
end;

procedure TTrackKeyGRepF.LoadChart(AccountRec : TReportDataRecPtr);
var
  I : integer;
  tempTitle : string;
  AnnualiseFactor : double;
  DaysInperiod : Integer;
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
  if KeyGCumulative and ((AccountRec.Accountno = SALESFTE) or (AccountRec.AccountNo = GPFTE) or (AccountRec.AccountNo = NPFTE)) then
    AnnualiseFactor := 1 / DaysInYear;
  for I := 0 to TotalNoColumns - 1 do    // Iterate
    begin
    if KeyGSummaryType = 0
      then begin
      chart1.Chart.Series[0].AddXY(ChartDates[I], AccountRec.PlanDetail[I] / AnnualiseFactor, '', clTeeColor);
      if I <= KeyGLatestPeriod then
        chart1.Chart.Series[1].AddXY(ChartDates[I], AccountRec.MonDetail[I] / AnnualiseFactor, '', clTeeColor)
    end
    else begin
      if (AccountRec.Accountno = SALESFTE) or (AccountRec.AccountNo = GPFTE) or (AccountRec.AccountNo = NPFTE)
        then begin
        DaysinPeriod := SummaryPeriodIndexArray[I] + 1;
        if (Not KeyGCumulative) and (I > 0) then
          DaysinPeriod := DaysinPeriod - SummaryPeriodIndexArray[I - 1];
        AnnualiseFactor := Daysinperiod / DaysInYear;
      end;
      chart1.Chart.Series[0].AddXY(ChartDates[I], AccountRec.PlanSummary[I] / AnnualiseFactor, '', clTeeColor);
      if I <= KeyGLatestPeriod then
        chart1.Chart.Series[1].AddXY(ChartDates[I], AccountRec.MonSummary[I] / AnnualiseFactor, '', clTeeColor);
    end;
    Chart1.Chart.Series[0].XLabel[I] := formatDateTime('dd MMM', ChartDates[i]);
    if I <= KeyGLatestPeriod then
      Chart1.Chart.Series[1].XLabel[I] := formatDateTime('dd MMM', ChartDates[i]);
  end;
  Chart1.Chart.Title.text.Clear;
  if AccountRec.Accumulate then
    TempTitle := strPas(AccountRec.AccountTitle) + '*'
  else
    TempTitle := strPas(AccountRec.AccountTitle);

  Chart1.Chart.Title.Text.Add(TempTitle);
end;

{
procedure TTrackKeyGRepF.PageFooterBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if KeyGCumulative
    then begin
    QRLabel3.Caption := '* Amounts shown are accumulated Year to Date';
    QRLabel3.Enabled := True;
  end
  else begin
    QRLabel3.Enabled := False;
    PageFooterBand1.Height := 24;
    PageDateTime.Top := 0;
    QRLabel2.Top := 0;
    QRSysData2.Top := 0;
  end;
  PageDateTime.Caption := formatDateTime('dddddd h:nn:ss am/pm', Now);
end;
}

end.
