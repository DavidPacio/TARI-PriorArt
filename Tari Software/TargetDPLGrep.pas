unit TargetDPLGrep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TeeProcs, TeEngine, Chart, DBChart, ExtCtrls,
  Series, auchTypes, DMClient, DataCollector, printers, ppChrt, ppDB,
  ppDBJIT, ppVar, ppPrnabl, ppClass, ppCtrls, ppBands, ppCache, ppComm,
  ppRelatv, ppProd, ppReport;

type

  TGraphColors = array[0..5] of TColor;
  TAccountNos = Array[0..6] of integer;

  TTargetDPLGRepF = class(TForm)
    ppReport1: TppReport;
    ppDetailBand1: TppDetailBand;
    ppHeaderBand1: TppHeaderBand;
    ppFooterBand1: TppFooterBand;
    rbCompanyName: TppLabel;
    rbQRLabel1: TppLabel;
    rbDepartments: TppLabel;
    rbQRPeriodinfo: TppLabel;
    rbQRSysData2: TppSystemVariable;
    rbPageDateTime: TppLabel;
    rbQRLabel2: TppLabel;
    rbQRLabel3: TppLabel;
    ppJITPipeline1: TppJITPipeline;
    ppJITPipeline1ppField1: TppField;
    Chart1: TppTeeChart;
    procedure QuickRep1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
//    procedure PageFooterBand1BeforePrint(Sender: TQRCustomBand;
//      var PrintBand: Boolean);
  private
    { Private declarations }
    DetailNo : integer;
//    bmParent : longint;
    ExpenseNo : Integer;
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
  TargetDPLGRepF: TTargetDPLGRepF;
  TDGRPConsolidate : Boolean;

implementation

{$R *.DFM}

procedure TTargetDPLGRepF.QuickRep1NeedData(Sender: TObject;
  var MoreData: Boolean);
var
  Itemfound : Boolean;
begin
  Itemfound := False;
  MoreData := True;
  while (Not ItemFound) and (DetailNo < 7)do
    begin
    ItemFound := TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(AccountNos[DetailNo])]).Nonzero;
    if ((AccountNos[DetailNo] = GROSSPROFIT) and (Not TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(COGS)]).Nonzero)) or
        ((AccountNos[DetailNo] = NETPROFIT) and (Not TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(OTHERINCOME)]).Nonzero))
        then ItemFound := False;
    if Itemfound then
      LoadChart(PlanDataList.Items[getaccountlistindex(AccountNos[DetailNo])]);
    inc(DetailNo);
  end;
//  if ((itemfound) and (DetailNo = 7)
//    or ((AccountNos[DetailNo] = NETOPERATINGPROFIT) and (Not TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(OTHERINCOME)]).Nonzero)))
//    then QRShape1.Enabled := True;
//  if (DetailNo = 7) and (not ItemFound) then QRShape1.Enabled := False;
  if (not ItemFound) and (Expenseno < PlanExpDataList.count) and (DetailNo = 7) then
    begin
    while (not Itemfound) and (Expenseno < PlanExpDataList.count) do
      begin
      ItemFound := TPlanDataRecPtr(PlanExpDataList.Items[ExpenseNo]).Nonzero;
      if ItemFound then
        LoadChart(PlanExpDataList.Items[ExpenseNo]);
      Inc(ExpenseNo);
    end;    // while
  end;
  if (DetailNo = 7) and (ExpenseNo = PlanExpDataList.count) and (not TotalExpensesPrinted)
    and (not Itemfound) then begin
    ItemFound := TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(TOTALEXPENSES)]).Nonzero;
    if ItemFound then
      LoadChart(PlanDataList.Items[getaccountlistindex(TOTALEXPENSES)]);
    TotalExpensesPrinted := True;
  end;
  if not Itemfound then MoreData := False;
end;

procedure TTargetDPLGRepF.FormCreate(Sender: TObject);
begin
  DetailNo := 0;
  ExpenseNo := 0;
  GraphColorno := 0;
  CogsNonzero := False;
  OtherIncomeNonZero := False;
  ContainsAnnualised := False;
  TotalExpensesPrinted := False;
//  TitlesList := TStringList.create;
  DataCollect.GetConsolidatedList(TDGRPConsolidate);
  if DataCollect.Planloaded = false then
    DataCollect.getPlanningData;
  DataCollect.getPlanningExpData(False);
end;

procedure TTargetDPLGRepF.SetData;
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

  for j := 0 to 6 do    // Iterate  // Use 6 as this only need
    begin
    SummaryPtr := PlanDataList.Items[GetaccountListIndex(SummaryPlan[j])];
    BuildSummary(SummaryPtr.Accountno, True, SummaryPtr.PlanDetail, SummaryPtr.PlanSummary);
  end;    // for

  for j := 0 to PlanExpDataList.count - 1 do    // Iterate
    begin
    SummaryPtr := PlanExpDataList.Items[j];
    BuildSummary(SummaryPtr.Accountno, True, SummaryPtr.PlanDetail, SummaryPtr.PlanSummary);
  end;

  // Find any zero accounts
  for J := 0 to 6 do    // Iterate
    setAccount(PlanDataList.Items[J]);
  for J := 0 to PlanExpDataList.count -1 do    // Iterate
    setAccount(PlanExpDataList.Items[J]);

  sortExpenseList(True);

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

procedure TTargetDPLGRepF.FormDestroy(Sender: TObject);
begin
  DataCollect.ClearPlanDataList;
  DataCollect.ClearPlanExpDataList;
  DataCollect.ClearConsolidatedList;
end;

procedure TTargetDPLGRepF.SetAccount(AccountRec : TPlanDataRecPtr);
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

procedure TTargetDPLGRepF.LoadChart(AccountRec : TPlanDataRecPtr);
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
  Chart1.Chart.Series[0].ValueFormat := REPORTROUNDCURRENCY;
  Chart1.Chart.Series[0].Marks.Style := smsValue;
  Chart1.Chart.Series[0].Marks.Visible := ShowMarks;
  for I := 0 to TotalNoColumns - 1 do    // Iterate
  begin
    if TotalNoColumns < 5 then
      UseColor := I
    else
      UseColor := GraphColorno;
    if DetailedReportingPeriod = 0 then
      chart1.Chart.Series[0].AddXY(ChartDates[I], Round(AccountRec.PlanDetail[I]), '', Graphcolors[Usecolor] )
    else
      chart1.Chart.Series[0].AddXY(ChartDates[I], Round(AccountRec.PlanSummary[I]), '', Graphcolors[UseColor] );
    Chart1.Chart.Series[0].XLabel[I] := formatDateTime('dd MMM', ChartDates[i])
  end;
  Chart1.Chart.Title.text.Clear;
  Chart1.Chart.Title.Text.Add(strPas(AccountRec.AccountTitle));
  inc(Graphcolorno);
  if Graphcolorno > 5 then GraphColorno := 0;
end;

{
procedure TTargetDPLGRepF.PageFooterBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel3.Enabled := False;
  PageFooterBand1.Height := 24;
  PageDateTime.Top := 0;
  QRLabel2.Top := 0;
  QRSysData2.Top := 0;
  PageDateTime.Caption := formatDateTime('dddddd h:nn:ss am/pm', Now);
end;
}

end.
