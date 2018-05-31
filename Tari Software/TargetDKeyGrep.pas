unit TargetDKeyGrep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, TeeProcs, TeEngine, Chart, DBChart, QrTee, QuickRpt, ExtCtrls,
  Series, auchTypes, DMClient, DataCollector, printers;

type

  TGraphColors = array[0..5] of TColor;
  TAccountNos = Array[0..6] of integer;

  TTargetDKeyGRepF = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRDBChart1: TQRDBChart;
    Chart1: TQRChart;
    QRShape1: TQRShape;
    Series1: TLineSeries;
    procedure QuickRep1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PageFooterBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    DetailNo : integer;
    CogsNonzero : Boolean;
    OtherIncomeNonZero : Boolean;
    ContainsAnnualised : Boolean;
    TotalExpensesPrinted : Boolean;
    Narrowrep: boolean;
    ChartDates : TDateTimeArray;
    TotalNoColumns: Integer;
    PageStartColNo : integer;
    GraphColorno : Integer;
    procedure LoadChart(AccountRec : TPlanDataRecPtr);
    procedure SetAccount(AccountRec : TPlanDataRecPtr);
  public
    { Public declarations }
    UseColor : Boolean;
    ThreeDImage : Boolean;
    ShowMarks : Boolean;
    ReportFont : TFontName;
    DetailedReportingPeriod : integer;
    DefaultOrientation : TPrinterOrientation;
    procedure SetData;
  end;
Const
  GraphColors : TGraphColors = (clRed, clGreen, clYellow, clBlue, clWhite, clGray);
  AccountNos : TAccountNos = (SALES, COGS, GROSSPROFIT, TOTALEXPENSES, NETOPERATINGPROFIT, OTHERINCOME, NETPROFIT);

var
  TargetDKeyGRepF: TTargetDKeyGRepF;
  TDKGRPConsolidate : Boolean;

implementation

{$R *.DFM}

procedure TTargetDKeyGRepF.QuickRep1NeedData(Sender: TObject;
  var MoreData: Boolean);
var
  Itemfound : Boolean;
begin
  Itemfound := False;
  MoreData := True;
  while (Not ItemFound) and (DetailNo < DETAILEDTARGETLIST)do
    begin
    ItemFound := TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(KeyTargets[DetailNo])]).Nonzero;
//    if ((AccountNos[DetailNo] = GROSSPROFIT) and (Not TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(COGS)]).Nonzero)) or
//        ((AccountNos[DetailNo] = NETPROFIT) and (Not TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(OTHERINCOME)]).Nonzero))
//        then ItemFound := False;
    if Itemfound then
      LoadChart(PlanDataList.Items[getaccountlistindex(KeyTargets[DetailNo])]);
    inc(DetailNo);
  end;
  if not Itemfound then MoreData := False;
end;

procedure TTargetDKeyGRepF.FormCreate(Sender: TObject);
begin
  DetailNo := 0;
  GraphColorno := 0;
  CogsNonzero := False;
  OtherIncomeNonZero := False;
  ContainsAnnualised := False;
  TotalExpensesPrinted := False;
//  TitlesList := TStringList.create;
  DataCollect.GetConsolidatedList(TDKGRPConsolidate);
  if DataCollect.Planloaded = false then
    DataCollect.getPlanningData;
end;

procedure TTargetDKeyGRepF.SetData;
var
  j: Integer;
  DaysinYear : integer;
  SummaryPtr : TPlanDataRecPtr;
begin
  // create the correct summary.
  daysinyear := trunc(DataModuleClient.DepartmentsCurrentPlanEnd.value) - trunc(DataModuleClient.DepartmentsCurrentPlanStart.value);
  if DetailedReportingPeriod > 0 then
      TotalNoColumns :=  createSummaryIndex(DetailedReportingPeriod, DataModuleClient.DepartmentsCurrentPlanStart.value, DataModuleClient.DepartmentsCurrentPlanEnd.value)
    else TotalNoColumns := DaysinYear + 1;
  PageStartColNo := 0;

  for j := 0 to integer(Trunc(sizeof(KeyTargets)/sizeof(integer)) - 1)
    do begin
    SummaryPtr := PlanDataList.Items[GetaccountListIndex(KeyTargets[j])];
    BuildSummary(SummaryPtr.Accountno, True, SummaryPtr.PlanDetail, SummaryPtr.PlanSummary);
  end;
  // Added one here because is a Graph report, the Total Column is not added
  DataCollect.CalculateKeys(TotalNoColumns + 1, DetailedReportingPeriod);


  // Find any zero accounts
  for J := 0 to integer(Trunc(sizeof(KeyTargets)/sizeof(integer)) - 1)
    do setAccount(PlanDataList.Items[getaccountlistindex(KeyTargets[J])]);

  //  BuilddateArray;
  Fillchar(ChartDates, sizeof(TDateTimeArray), #0);
  for j := 0 to TotalNoColumns - 1 do    // Iterate
    begin
    if DetailedReportingPeriod = 0 then
      ChartDates[j] := DataModuleClient.DepartmentsCurrentPlanStart.value + j
    else
      ChartDates[j] := DataModuleClient.DepartmentsCurrentPlanStart.value + SummaryPeriodIndexArray[j];
  end;

  if DetailedReportingPeriod > 4
    then begin
    DefaultOrientation := poPortrait;
    Narrowrep := True;
  end
  else
    DefaultOrientation := poLandscape;
//  SetPage;
end;

procedure TTargetDKeyGRepF.FormDestroy(Sender: TObject);
begin
  DataCollect.ClearPlanDataList;
  DataCollect.ClearConsolidatedList;
end;

procedure TTargetDKeyGRepF.SetAccount(AccountRec : TPlanDataRecPtr);
var
  daysinyear: Integer;
  I: Integer;
begin
  AccountRec.Nonzero := False;
  daysinyear := trunc(DataModuleClient.DepartmentsCurrentPlanEnd.value) - trunc(DataModuleClient.DepartmentsCurrentPlanStart.value);
  I := 0;
  while (I < DaysinYear) and (not AccountRec.NonZero) do    // Iterate
    begin
    if ((I = 0) and (Round(AccountRec.PlanTotal) <> 0)) or (Round(AccountRec.PlanDetail[I]) <> 0) then
      AccountRec.Nonzero := True;
    inc(I);
  end;
end;

procedure TTargetDKeyGRepF.LoadChart(AccountRec : TPlanDataRecPtr);
var
  I : integer;
  Usecolor : Integer;
begin
  Chart1.Chart.RemoveAllSeries;
  Chart1.chart.BottomAxis.DateTimeFormat := 'dd MMM';
  if ThreeDImage then
    CHart1.Chart.Chart3DPercent := 15
  else
    CHart1.Chart.Chart3DPercent := 5;
  if TotalNoColumns < 5 then
  begin
    Chart1.Chart.AddSeries(TbarSeries.create(self));
    Chart1.Chart.Series[0].ColorEachPoint := True;
    Chart1.chart.Legend.Visible := True;
  end
  else
  begin
    Chart1.Chart.AddSeries(TLineSeries.create(self));
  end;
  Chart1.Chart.Series[0].Xvalues.DateTime := True;
  Chart1.Chart.Series[0].ColorEachPoint := True;
  if AccountRec.FormatImage <> 'Mins' then
    Chart1.Chart.Series[0].ValueFormat := AccountRec.FormatImage
  else
    Chart1.Chart.Series[0].ValueFormat := REPORTTENSCURRENCY;
  Chart1.Chart.Series[0].Marks.Style := smsValue;
  Chart1.Chart.Series[0].Marks.Visible := ShowMarks;
  for I := 0 to TotalNoColumns - 1 do    // Iterate
    begin
    if TotalNoColumns < 5 then
      UseColor := I
    else
      UseColor := GraphColorno;
    if DetailedReportingPeriod = 0 then
      chart1.Chart.Series[0].AddXY(ChartDates[I], AccountRec.PlanDetail[I], '', Graphcolors[UseColor] )
    else
      chart1.Chart.Series[0].AddXY(ChartDates[I], AccountRec.PlanSummary[I], '', Graphcolors[UseColor] );
    Chart1.Chart.Series[0].XLabel[I] := formatDateTime('dd MMM', ChartDates[i])
  end;
  Chart1.Chart.Title.text.Clear;
  Chart1.Chart.Title.Text.Add(AccountRec.AccountTitle);
  inc(Graphcolorno);
  if Graphcolorno > 5 then GraphColorno := 0;
end;

procedure TTargetDKeyGRepF.PageFooterBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//  QRLabel3.Enabled := False;
  PageFooterBand1.Height := 24;
//  PageDateTime.Top := 0;
//  QRLabel2.Top := 0;
//  QRSysData2.Top := 0;
//  PageDateTime.Caption := formatDateTime('dddddd h:nn:ss am/pm', Now);
end;

end.
