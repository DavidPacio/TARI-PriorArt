unit TargetDetailGrep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TeeProcs, TeEngine, Chart, DBChart, ExtCtrls,
  Series, auchTypes, DMClient, DataCollector, printers, ppChrt, ppDB,
  ppDBJIT, ppVar, ppPrnabl, ppClass, ppCtrls, ppBands, ppCache, ppComm,
	ppRelatv, ppProd, ppReport, ppStrtch, LGlobals, ppParameter, ppDesignLayer;

type

  TGraphColors = array[0..5] of TColor;
  TAccountNos = Array[0..6] of integer;

  TTargetDetailGRepF = class(TForm)
    ppReport1: TppReport;
    ppDetailBand1: TppDetailBand;
    ppHeaderBand1: TppHeaderBand;
    ppFooterBand1: TppFooterBand;
    ppJITPipeline1: TppJITPipeline;
    ppJITPipeline1ppField1: TppField;
    Chart1: TppTeeChart;
    RBCompanyName: TppLabel;
    RBQRLabel1: TppLabel;
    rbQRPeriodinfo: TppLabel;
    rbDepartment: TppLabel;
    rbQRSysData2: TppSystemVariable;
    RBLine1: TppLine;
    ppSystemVariable1: TppSystemVariable;
    RBText1: TppLabel;
    GroupLabel: TppLabel;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
//    procedure QuickRep1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Chart1Print(Sender: TObject);
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
    procedure LoadPLChart(AccountRec : TPlanDataRecPtr);
    procedure LoadKeyChart(AccountRec : TPlanDataRecPtr);
    procedure SetAccount(AccountRec : TPlanDataRecPtr);
  public
    { Public declarations }
    UseColor : Boolean;
    ThreeDImage : Boolean;
    ShowMarks : Boolean;
    ReportFont : TFontName;
    DataConsolidate : TConsolidateType;
    DetailedReportingPeriod : integer;
    DefaultOrientation : TPrinterOrientation;
    AccountstoInclude : array[0..1000] of Integer;
    Function GetNumberRecords : Integer;
  end;
Const
  GraphColors : TGraphColors = (clRed, clGreen, clYellow, clBlue, clWhite, clGray);
  AccountNos : TAccountNos = (SALES, COGS, GROSSPROFIT, TOTALEXPENSES, NETOPERATINGPROFIT, OTHERINCOME, NETPROFIT);

var
  TargetDetailGRepF: TTargetDetailGRepF;
  DKeyIndicator : Boolean = False;


implementation

{$R *.DFM}

{
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
}

procedure TTargetDetailGRepF.FormCreate(Sender: TObject);
begin
  DetailNo := 0;
  ExpenseNo := 0;
  GraphColorno := 0;
  CogsNonzero := False;
  OtherIncomeNonZero := False;
  ContainsAnnualised := False;
  TotalExpensesPrinted := False;
//  TitlesList := TStringList.create;
  DataCollect.GetConsolidatedList(DataModuleClient.DepartmentsDEPT_ID.Value, DataConsolidate);
  DataCollect.psdate := DataModuleClient.DepartmentsCurrentPlanStart.value;
  DataCollect.pedate := DataModuleClient.DepartmentsCurrentPlanEnd.value;
  if DataCollect.Planloaded = false then
    DataCollect.getPlanningData;
  if not DKeyIndicator then
    DataCollect.getPlanningExpData(False);
end;

Function TTargetDetailGRepF.GetNumberRecords : Integer;
var
  I: Integer;
  j: Integer;
  DaysinYear : integer;
  SummaryPtr : TPlanDataRecPtr;
  NoRecords : Integer;
  CurrentWidth : Single;
begin
  for I := 0 to 200 do    // Iterate
    begin
    AccountsToInclude[I] := 0;
    end;    // for
  // create the correct summary.
  daysinyear := trunc(DataModuleClient.DepartmentsCurrentPlanEnd.value) - trunc(DataModuleClient.DepartmentsCurrentPlanStart.value);
  if DetailedReportingPeriod > 0 then
    TotalNoColumns :=  createSummaryIndex(DetailedReportingPeriod, DataModuleClient.DepartmentsCurrentPlanStart.value, DataModuleClient.DepartmentsCurrentPlanEnd.value)
  else
    TotalNoColumns := DaysinYear + 1;
  PageStartColNo := 0;

  Norecords := 0;
  if DKeyIndicator then
    begin
    for j := 0 to integer(Trunc(sizeof(KeyTargets)/sizeof(integer)) - 1) do
      begin
      SummaryPtr := PlanDataList.Items[GetaccountListIndex(KeyTargets[j])];
      BuildSummary(SummaryPtr.Accountno, DataModuleClient.DepartmentsCURRENTPLANSTART.Value, DataModuleClient.DepartmentsCURRENTPLANEND.Value, SummaryPtr.PlanDetail, SummaryPtr.PlanSummary);
      end;
    // Added one here because is a Graph report, the Total Column is not added
    DataCollect.CalculateKeys(TotalNoColumns + 1, DetailedReportingPeriod);


    // Find any zero accounts
    for J := 0 to integer(Trunc(sizeof(KeyTargets)/sizeof(integer)) - 1) do
      begin
      setAccount(PlanDataList.Items[getaccountlistindex(KeyTargets[J])]);
      if TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(KeyTargets[J])]).nonzero then
        begin
        AccountstoInclude[NoRecords] := -J -1;
        Inc(NoRecords);
        end

      end
    end
  else
    begin
    for j := 0 to 6 do    // Iterate  // Use 6 as this only need
      begin
      SummaryPtr := PlanDataList.Items[GetaccountListIndex(SummaryPlan[j])];
      BuildSummary(SummaryPtr.Accountno, DataModuleClient.DepartmentsCURRENTPLANSTART.Value, DataModuleClient.DepartmentsCURRENTPLANEND.Value, SummaryPtr.PlanDetail, SummaryPtr.PlanSummary);
      end;    // for

    for j := 0 to PlanExpDataList.count - 1 do    // Iterate
      begin
      SummaryPtr := PlanExpDataList.Items[j];
      BuildSummary(SummaryPtr.Accountno, DataModuleClient.DepartmentsCURRENTPLANSTART.Value, DataModuleClient.DepartmentsCURRENTPLANEND.Value, SummaryPtr.PlanDetail, SummaryPtr.PlanSummary);
      end;

  // Find any zero accounts
  // Make up the list of accounts to include
    sortExpenseList(True);
    if GGlobals.Produce_AccountFmt then
      begin
      // include Sales
      setAccount(PlanDataList.Items[0]);
      if TPlanDataRecPtr(PlanDatalist.Items[0]).nonzero then
        begin
        AccountstoInclude[NoRecords] := -1;
        Inc(NoRecords);
        end;
      // include COGS
      setAccount(PlanDataList.Items[1]);
      if TPlanDataRecPtr(PlanDatalist.Items[1]).nonzero then
        begin
        AccountstoInclude[NoRecords] := -2;
        Inc(NoRecords);
        end;
      // now include direct expenses
      for J := 0 to PlanExpDataList.count -1 do    // Iterate
        begin
        setAccount(PlanExpDataList.Items[J]);
        if (TPlanDataRecPtr(PlanExpDatalist.Items[J]).Account_Group = AGDIRECTEXP) and (TPlanDataRecPtr(PlanExpDatalist.Items[J]).nonzero) then
          begin
          AccountstoInclude[NoRecords] := J + 1;
          Inc(NoRecords);
          end;
        End;
      // include GP
      setAccount(PlanDataList.Items[2]);
      if TPlanDataRecPtr(PlanDatalist.Items[2]).nonzero then
        begin
        AccountstoInclude[NoRecords] := -3;
        Inc(NoRecords);
        end;
      // Include General Expenses
      for J := 0 to PlanExpDataList.count -1 do    // Iterate
        begin
        setAccount(PlanExpDataList.Items[J]);
        if (TPlanDataRecPtr(PlanExpDatalist.Items[J]).Account_Group = AGEXPENSES) and (TPlanDataRecPtr(PlanExpDatalist.Items[J]).nonzero) then
          begin
          AccountstoInclude[NoRecords] := J + 1;
          Inc(NoRecords);
          end;
        End;
      // include Total Expenses
      setAccount(PlanDataList.Items[3]);
      if TPlanDataRecPtr(PlanDatalist.Items[3]).nonzero then
        begin
        AccountstoInclude[NoRecords] := -4;
        Inc(NoRecords);
        end;
      // include NOP or EBITA
      setAccount(PlanDataList.Items[4]);
      if TPlanDataRecPtr(PlanDatalist.Items[4]).nonzero then
        begin
        TPlanDataRecPtr(PlanDatalist.Items[4]).AccountTitle := 'Earnings Before Interest, Tax, Depreciation & Amortisation';
        AccountstoInclude[NoRecords] := -5;
        Inc(NoRecords);
        end;
      // include Other Income
      setAccount(PlanDataList.Items[5]);
      if TPlanDataRecPtr(PlanDatalist.Items[5]).nonzero then
        begin
        AccountstoInclude[NoRecords] := -6;
        Inc(NoRecords);
        end;
      // Include Depreciation, etc Expenses
      for J := 0 to PlanExpDataList.count -1 do    // Iterate
        begin
        setAccount(PlanExpDataList.Items[J]);
        if (TPlanDataRecPtr(PlanExpDatalist.Items[J]).Account_Group = AGDEPNINT) and (TPlanDataRecPtr(PlanExpDatalist.Items[J]).nonzero) then
          begin
          AccountstoInclude[NoRecords] := J + 1;
          Inc(NoRecords);
          end;
        End;
      // include Net Profit
      setAccount(PlanDataList.Items[6]);
      if TPlanDataRecPtr(PlanDatalist.Items[6]).nonzero then
        begin
        AccountstoInclude[NoRecords] := -7;
        Inc(NoRecords);
        end;

      end
    else
      begin
      for J := 0 to 6 do    // Iterate
        begin
        setAccount(PlanDataList.Items[J]);
        if TPlanDataRecPtr(PlanDatalist.Items[J]).nonzero then
          begin
          AccountstoInclude[NoRecords] := -J -1;
          Inc(NoRecords);
          end
        end;
      for J := 0 to PlanExpDataList.count -1 do    // Iterate
        begin
        setAccount(PlanExpDataList.Items[J]);
        if TPlanDataRecPtr(PlanExpDatalist.Items[J]).nonzero then
          begin
          AccountstoInclude[NoRecords] := J + 1;
          Inc(NoRecords);
          end;
        End;
      end;
    end;

  //  BuilddateArray;
  Fillchar(ChartDates, sizeof(TDateTimeArray), #0);
  for j := 0 to TotalNoColumns - 1 do    // Iterate
    begin
    if DetailedReportingPeriod = 0 then
      ChartDates[j] := DataModuleClient.DepartmentsCurrentPlanStart.value + j
    else
      ChartDates[j] := DataModuleClient.DepartmentsCurrentPlanStart.value + SummaryPeriodIndexArray[j];
  end;
  CurrentWidth := ppReport1.PrinterSetup.PrintableWidth;
  if (DetailedReportingPeriod > 4) or (TotalNoColumns < 9) then
    begin
    ppReport1.PrinterSetup.Orientation := poPortrait;
    Narrowrep := True;
    end
  else
    begin
    ppReport1.PrinterSetup.Orientation :=  poLandscape;
    rbDepartment.Width := rbDepartment.Width + ppReport1.PrinterSetup.PrintableWidth - CurrentWidth;
    end;
  Chart1.Width := ppReport1.PrinterSetup.PrintableWidth;
  rbQRSysData2.Left := ppReport1.PrinterSetup.PrintableWidth
    - rbQRSysData2.Width;
  ppJITPipeline1.RecordCount := NoRecords;
  ppJITPipeline1.Open;
  ppJITPipeline1.First;
  Result := NoRecords;
//  SetPage;
end;

procedure TTargetDetailGRepF.FormDestroy(Sender: TObject);
begin
  DataCollect.ClearPlanDataList;
  if not DKeyIndicator then
    DataCollect.ClearPlanExpDataList;
  DataCollect.ClearConsolidatedList;
end;

procedure TTargetDetailGRepF.SetAccount(AccountRec : TPlanDataRecPtr);
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

procedure TTargetDetailGRepF.LoadPLChart(AccountRec : TPlanDataRecPtr);
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
		Chart1.Chart.AddSeries(TChartSeries(TbarSeries.create(self)));
    Chart1.Chart.Series[0].ColorEachPoint := True;
    Chart1.chart.Legend.Visible := True;
  end
  else
  begin
		Chart1.Chart.AddSeries(TChartSeries(TLineSeries.create(self)));
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
  Chart1.Chart.Title.Text.Add(AccountRec.AccountTitle);
  inc(Graphcolorno);
  if Graphcolorno > 5 then GraphColorno := 0;
end;

procedure TTargetDetailGRepF.LoadKeyChart(AccountRec : TPlanDataRecPtr);
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
		Chart1.Chart.AddSeries(TChartSeries(TbarSeries.create(self)));
    Chart1.Chart.Series[0].ColorEachPoint := True;
    Chart1.chart.Legend.Visible := True;
  end
  else
  begin
    Chart1.Chart.AddSeries(TChartSeries(TLineSeries.create(self)));
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

procedure TTargetDetailGRepF.Chart1Print(Sender: TObject);
var
  ItemIndex : integer;
begin
  Itemindex := Accountstoinclude[ppJITPipeline1.RecordIndex];
  if ItemIndex < 0 then
    begin
    DetailNo := Itemindex * -1 - 1;
    if DKeyIndicator then
      LoadKeyChart(PlanDataList.Items[getaccountlistindex(KeyTargets[DetailNo])])
    else
      LoadPLChart(PlanDataList.Items[getaccountlistindex(AccountNos[DetailNo])]);
    end
  else
    begin
    ExpenseNo := Itemindex - 1;
    LoadPLChart(PlanExpDataList.Items[ExpenseNo]);
    end;
end;

end.
