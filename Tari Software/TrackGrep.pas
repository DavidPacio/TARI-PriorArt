unit TrackGrep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TeeProcs, TeEngine, Chart, DBChart, ExtCtrls,
  Series, auchTypes, DMClient, DataCollector, printers, ppDB, ppDBJIT,
  ppChrt, ppVar, ppPrnabl, ppClass, ppCtrls, ppBands, ppCache, ppComm,
	ppRelatv, ppProd, ppReport, ppStrtch, ppParameter, ppDesignLayer;

type

  TGraphColors = array[0..5] of TColor;
  TAccountNos = Array[0..6] of integer;

  TTrackGRepF = class(TForm)
    ppReport1: TppReport;
    ppDetailBand1: TppDetailBand;
    ppHeaderBand1: TppHeaderBand;
    ppFooterBand1: TppFooterBand;
    ppJITPipeline1: TppJITPipeline;
    ppJITPipeline1ppField1: TppField;
    RBReportTitle: TppLabel;
    RBCompanyName: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    Chart1: TppTeeChart;
    RBNote: TppLabel;
    RBText1: TppLabel;
    RBLine1: TppLine;
    ppJITPipeline2: TppJITPipeline;
    ppReport2: TppReport;
    ppHeaderBand2: TppHeaderBand;
    RBReportTitle1: TppLabel;
    RBCompanyName1: TppLabel;
    ppDetailBand2: TppDetailBand;
    Chart2: TppTeeChart;
    ppFooterBand2: TppFooterBand;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    RBNote1: TppLabel;
    RBText5: TppLabel;
    RBLine2: TppLine;
    Chart3: TppTeeChart;
    Title2: TppField;
    GroupLabel: TppLabel;
    rbDepartment: TppLabel;
    GroupLabel1: TppLabel;
    rbDepartment1: TppLabel;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
//    procedure QuickRep1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Chart1Print(Sender: TObject);
    procedure ppFooterBand1BeforePrint(Sender: TObject);
    procedure Chart2Print(Sender: TObject);
    procedure Chart3Print(Sender: TObject);
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
    procedure LoadKeyChart(AccountRec : TReportDataRecPtr);
    procedure LoadKeyChart1(AccountRec : TReportDataRecPtr);
    procedure LoadKeyChart2(AccountRec : TReportDataRecPtr; Leftside : Boolean);
    function GetYTDFigure(DataArray : array of Currency; lastPeriod : Integer): currency;
  public
    { Public declarations }
    UseColor : Boolean;
    ThreeDImage : Boolean;
    ShowMarks : Boolean;
    ReportFont : TFontName;
    DefaultOrientation : TPrinterOrientation;
    ReportType : integer;
    AccountstoInclude : array[0..200] of Integer;
    StartPeriod, EndPeriod : Integer;
    PTDTitle, YTDTitle : String;
    Function GetNumberRecords : Integer;
  end;
Const
  GraphColors : TGraphColors = (clRed, clGreen, clYellow, clBlue, clWhite, clGray);
  AccountNos : TAccountNos = (SALES, COGS, GROSSPROFIT, TOTALEXPENSES, NETOPERATINGPROFIT, OTHERINCOME, NETPROFIT);

var
  TrackGRepF: TTrackGRepF;
  Keyindicator : Boolean = False;
  DataConsolidate : TConsolidateType;
  GstartDate, GEndDate, GPeriodStartDate : TDateTime;
  GSummaryType, GLatestPeriod : integer;
  GCumulative : Boolean;


implementation

{$R *.DFM}

{procedure TTrackKeyGRepF.QuickRep1NeedData(Sender: TObject;
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
}
procedure TTrackGRepF.FormCreate(Sender: TObject);
begin
  ItemNo := 0;
  GraphColorno := 0;
  CogsNonzero := False;
  OtherIncomeNonZero := False;
  ContainsAnnualised := False;
  TotalExpensesPrinted := False;
  DataCollect.GetConsolidatedList(DataModuleClient.DepartmentsDEPT_ID.Value, DataConsolidate);
  if KeyIndicator then
    DataCollect.getTrackingkeyData(GCumulative, GStartDate, GEndDate, GperiodstartDate, GSummaryType)
  else
    begin
    DataCollect.GetMonitoringAccountArray(False);
    DataCollect.getDetailedPLData(GCumulative, GStartDate, GEndDate, GperiodstartDate, GSummaryType);
    end;
end;

Function TTrackGRepF.GetNumberRecords : Integer;
var
  I: Integer;
  j, norecords: Integer;
//  SummaryPtr : TPlanDataRecPtr;
begin
   for I := 0 to 200 do    // Iterate
    begin
    AccountsToInclude[I] := 0;
    end;    // for

  daysinyear := trunc(DataModuleClient.DepartmentsCurrentMonitoringEnd.value) - trunc(DataModuleClient.DepartmentsCurrentMonitoringStart.value);

  if GSummaryType > 0 then
    begin
    if GSummaryType < 7 then
      TotalNoColumns := 1
    else
      TotalNoColumns := 0;
    while SummaryPeriodIndexArray[TotalNoColumns] > 0 do inc(TotalNoColumns);
    end
  else
    begin
    TotalNoColumns := DaysinYear + 1;
    end;
  if DaysInYear < 365 then DaysInyear := 365;

  if ((GLatestPeriod + 2) < TotalNoColumns) and (ReportType = 0) then
    TotalNoColumns := GLatestPeriod + 2;
  if (ReportType > 0) then
    TotalNoColumns := GLatestPeriod + 1;
  StartPeriod := 0;
  EndPeriod := TotalNoColumns;
  if (ReportType = 1)  and (TotalNoColumns > 8) then
    begin
    StartPeriod := TotalNoColumns - 8;
    EndPeriod := StartPeriod + 8;
    TotalNoColumns := 8;
    end;

  // Find any zero accounts
  Norecords := 0;
  for J := 0 to ReportDataList.count - 1 do
    begin
//    setAccount(PlanDataList.Items[getaccountlistindex(KeyTargets[J])]);
    TPlanDataRecPtr(ReportDataList.Items[J]).nonzero := True;
    AccountstoInclude[NoRecords] := -J -1;
    Inc(NoRecords);
    end;

  PageStartColNo := 0;
  Fillchar(ChartDates, sizeof(TDateTimeArray), #0);
  for j := StartPeriod to EndPeriod do    // Iterate
    begin
    if GSummaryType = 0 then
      ChartDates[j] := DataModuleClient.DepartmentsCurrentMonitoringStart.value + j
    else
      ChartDates[j] := DataModuleClient.DepartmentsCurrentMonitoringStart.value + SummaryPeriodIndexArray[j];
    end;

  if (GSummaryType > 4) or (TotalNoColumns < 9) or (ReportType > 0) then
    begin
    ppReport1.PrinterSetup.Orientation := poPortrait;
    ppReport2.PrinterSetup.Orientation := poPortrait;
    Narrowrep := True;
    end
  else
    ppReport1.PrinterSetup.Orientation :=  poLandscape;
  if ReportType < 2 then
    begin
    Chart1.Width := ppReport1.PrinterSetup.PrintableWidth;
    ppSystemVariable2.Left := ppReport1.PrinterSetup.PrintableWidth
      - ppSystemVariable2.Width;
    ppJITPipeline1.RecordCount := NoRecords;
    ppJITPipeline1.Open;
    ppJITPipeline1.First;
    end
  else
    begin
    Chart2.Width := ppReport2.PrinterSetup.PrintableWidth / 2;
    Chart2.Left := 0;
    Chart3.Width := ppReport2.PrinterSetup.PrintableWidth / 2;
    Chart3.Left :=  ppReport2.PrinterSetup.PrintableWidth / 2;
    ppSystemVariable4.Left := ppReport2.PrinterSetup.PrintableWidth
      - ppSystemVariable4.Width;
    ppJITPipeline2.RecordCount := NoRecords;
    ppJITPipeline2.Open;
    ppJITPipeline2.First;
    end;
  Result := NoRecords;
end;

procedure TTrackGRepF.FormDestroy(Sender: TObject);
begin
  DataCollect.ClearReportDataList;
  DataCollect.ClearConsolidatedList;
end;

procedure TTrackGRepF.LoadKeyChart(AccountRec : TReportDataRecPtr);
var
  I : integer;
  AnnualiseFactor : double;
  DaysInperiod : Integer;
  Strdate : String;
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
		Chart1.Chart.AddSeries(TChartSeries(TbarSeries.create(self)));
    Chart1.chart.Legend.Visible := True;
		Chart1.Chart.AddSeries(TChartSeries(TbarSeries.create(self)));
  end
  else begin
		Chart1.Chart.AddSeries(TChartSeries(TLineSeries.create(self)));
		Chart1.Chart.AddSeries(TChartSeries(TLineSeries.create(self)));
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
  if GCumulative and ((AccountRec.Accountno = SALESFTE) or (AccountRec.AccountNo = GPFTE) or (AccountRec.AccountNo = NPFTE)) then
    AnnualiseFactor := 1 / DaysInYear;
  for I := 0 to TotalNoColumns - 1 do    // Iterate
    begin
    Strdate := formatDateTime('dd MMM', ChartDates[i]);
    if GSummaryType = 0 then
      begin
      chart1.Chart.Series[0].AddXY(Chartdates[I], AccountRec.PlanDetail[I] / AnnualiseFactor, Strdate, clTeeColor);
      if I <= GLatestPeriod then
        chart1.Chart.Series[1].AddXY(ChartDates[I], AccountRec.MonDetail[I] / AnnualiseFactor, Strdate, clTeeColor)
      end
    else
      begin
      if (AccountRec.Accountno = SALESFTE) or (AccountRec.AccountNo = GPFTE) or (AccountRec.AccountNo = NPFTE) then
        begin
        DaysinPeriod := SummaryPeriodIndexArray[I] + 1;
        if (Not GCumulative) and (I > 0) then
          DaysinPeriod := DaysinPeriod - SummaryPeriodIndexArray[I - 1];
        AnnualiseFactor := Daysinperiod / DaysInYear;
        end;
      chart1.Chart.Series[0].AddXY(ChartDates[I], AccountRec.PlanSummary[I] / AnnualiseFactor, Strdate, clTeeColor);
      if I <= GLatestPeriod then
        chart1.Chart.Series[1].AddXY(ChartDates[I], AccountRec.MonSummary[I] / AnnualiseFactor, Strdate, clTeeColor);
      end;
//    Chart1.Chart.Series[0].XLabel[I] := formatDateTime('dd MMM', ChartDates[i]);
//    if I <= GLatestPeriod then
//      Chart1.Chart.Series[1].XLabel[I] := formatDateTime('dd MMM', ChartDates[i]);
    end;
  Chart1.Chart.Title.text.Clear;
  if AccountRec.Accumulate then
    AccountRec.AccountTitle := AccountRec.AccountTitle + '*';
  Chart1.Chart.Title.Text.Add(AccountRec.AccountTitle);
end;

procedure TTrackGRepF.LoadKeyChart1(AccountRec : TReportDataRecPtr);
var
  I : integer;
  AnnualiseFactor : double;
  DaysInperiod : Integer;
  Strdate : String;
begin
  AnnualiseFactor := 1;
  Chart1.Chart.RemoveAllSeries;
  Chart1.chart.BottomAxis.DateTimeFormat := 'dd MMM';
  if ThreeDImage then
    CHart1.Chart.Chart3DPercent := 15
  else
    CHart1.Chart.Chart3DPercent := 5;
// Add Plan Information
	Chart1.Chart.AddSeries(TChartSeries(TbarSeries.create(self)));
  Chart1.chart.Legend.Visible := True;
	Chart1.Chart.AddSeries(TChartSeries(TbarSeries.create(self)));
  Chart1.Chart.Series[0].Title := 'Target';
  Chart1.Chart.Series[0].Xvalues.DateTime := False;
  Chart1.Chart.Series[0].ColorEachPoint := False;
  Chart1.Chart.Series[0].SeriesColor := clRed;
  Chart1.Chart.Series[0].Marks.Style := smsValue;
  Chart1.Chart.Series[0].Marks.Visible := ShowMarks;

  Chart1.Chart.Series[1].Title := 'Actual';
  Chart1.Chart.Series[1].Xvalues.DateTime := False;
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
  if GCumulative and ((AccountRec.Accountno = SALESFTE) or (AccountRec.AccountNo = GPFTE) or (AccountRec.AccountNo = NPFTE)) then
    AnnualiseFactor := 1 / DaysInYear;
  for I := Startperiod to Endperiod - 1 do    // Iterate
    begin
    strdate := formatDateTime('dd MMM', ChartDates[i]);
    if GSummaryType = 0 then
      begin
      chart1.Chart.Series[0].AddY(AccountRec.PlanDetail[I] / AnnualiseFactor, strdate, clTeeColor);
      if I <= GLatestPeriod then
        chart1.Chart.Series[1].AddY(AccountRec.MonDetail[I] / AnnualiseFactor, Strdate, clTeeColor)
      end
    else
      begin
      if (AccountRec.Accountno = SALESFTE) or (AccountRec.AccountNo = GPFTE) or (AccountRec.AccountNo = NPFTE) then
        begin
        DaysinPeriod := SummaryPeriodIndexArray[I] + 1;
        if (Not GCumulative) and (I > 0) then
          DaysinPeriod := DaysinPeriod - SummaryPeriodIndexArray[I - 1];
        AnnualiseFactor := Daysinperiod / DaysInYear;
        end;
      chart1.Chart.Series[0].AddY(AccountRec.PlanSummary[I] / AnnualiseFactor, strdate, clTeeColor);
      chart1.Chart.Series[1].AddY(AccountRec.MonSummary[I] / AnnualiseFactor, strdate, clTeeColor);
      end;
    end;
  Chart1.Chart.Title.text.Clear;
  if AccountRec.Accumulate then
    AccountRec.AccountTitle := AccountRec.AccountTitle + '*';
  Chart1.Chart.Title.Text.Add(AccountRec.AccountTitle);
end;

function TTrackGRepF.GetYTDFigure(DataArray : array of Currency; lastPeriod : Integer): currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to Lastperiod do    // Iterate
    Result := Result + DataArray[I];
end;

procedure TTrackGRepF.LoadKeyChart2(AccountRec : TReportDataRecPtr; Leftside : Boolean);
//var
//  I : integer;
//  AnnualiseFactor : double;
//  DaysInperiod : Integer;
begin
//  AnnualiseFactor := 1;
  if Leftside then
    begin
    Chart2.Chart.RemoveAllSeries;
    Chart3.Chart.RemoveAllSeries;
    end;
  if ThreeDImage then
    begin
    CHart2.Chart.Chart3DPercent := 15;
    CHart3.Chart.Chart3DPercent := 15;
    End
  else
    begin
    CHart2.Chart.Chart3DPercent := 5;
    CHart3.Chart.Chart3DPercent := 5;
    end;
// Add Plan Information
  if Leftside then
    begin
		Chart2.Chart.AddSeries(TChartSeries(TbarSeries.create(self)));
		Chart2.Chart.AddSeries(TChartSeries(TbarSeries.create(self)));
    Chart2.chart.Legend.Visible := true;
//    Chart2.Chart.LeftAxis.Title.Caption := AccountRec.AccountTitle;
//    Chart2.Chart.LeftAxis.Title.Angle := 90;
//    Chart2.Chart.LeftAxis.Title.Visible := True;
    Chart2.Chart.Series[0].Title := 'Target';
    Chart2.Chart.Series[0].Color := Graphcolors[0];
    Chart2.Chart.Series[0].Xvalues.DateTime := False;
    Chart2.Chart.Series[0].ColorEachPoint := False;
    Chart2.Chart.Series[0].Marks.Style := smsValue;
    Chart2.Chart.Series[0].Marks.Visible := ShowMarks;
    Chart2.Chart.Series[1].Title := 'Actual';
    Chart2.Chart.Series[1].Color := Graphcolors[1];
    Chart2.Chart.Series[1].Xvalues.DateTime := False;
    Chart2.Chart.Series[1].ColorEachPoint := False;
    Chart2.Chart.Series[1].Marks.Style := smsValue;
    Chart2.Chart.Series[1].Marks.Visible := ShowMarks;
    End
  else
    begin
		Chart3.Chart.AddSeries(TChartSeries(TbarSeries.create(self)));
    Chart3.Chart.AddSeries(TChartSeries(TbarSeries.create(self)));
    Chart3.chart.Legend.Visible := true;
//    Chart3.Chart.LeftAxis.Title.Caption := AccountRec.AccountTitle;
//    Chart3.Chart.LeftAxis.Title.Angle := 90;
//    Chart3.Chart.LeftAxis.Title.Visible := True;
    Chart3.Chart.Series[0].Title := 'Target';
    Chart3.Chart.Series[0].Color := Graphcolors[0];
    Chart3.Chart.Series[0].Xvalues.DateTime := False;
    Chart3.Chart.Series[0].ColorEachPoint := False;
    Chart3.Chart.Series[0].Marks.Style := smsValue;
    Chart3.Chart.Series[0].Marks.Visible := ShowMarks;
    Chart3.Chart.Series[1].Title := 'Actual';
    Chart3.Chart.Series[1].Color := Graphcolors[1];
    Chart3.Chart.Series[1].Xvalues.DateTime := False;
    Chart3.Chart.Series[1].ColorEachPoint := False;
    Chart3.Chart.Series[1].Marks.Style := smsValue;
    Chart3.Chart.Series[1].Marks.Visible := ShowMarks;
    End;
  if AccountRec.FormatImage <> 'Mins' then
    begin
    if Leftside then
      begin
      Chart2.Chart.Series[0].ValueFormat := AccountRec.FormatImage;
      Chart2.Chart.Series[1].ValueFormat := AccountRec.FormatImage;
      End
    else
      begin
      Chart3.Chart.Series[0].ValueFormat := AccountRec.FormatImage;
      Chart3.Chart.Series[1].ValueFormat := AccountRec.FormatImage;
      end;
    end
  else
    begin
    if Leftside then
      begin
      Chart2.Chart.Series[0].ValueFormat := REPORTTENSCURRENCY;
      Chart2.Chart.Series[1].ValueFormat := REPORTTENSCURRENCY;
      End
    else
      begin
      Chart3.Chart.Series[0].ValueFormat := REPORTTENSCURRENCY;
      Chart3.Chart.Series[1].ValueFormat := REPORTTENSCURRENCY;
      end;
    end;

  // setting default factor for Daily Listing
//  if GCumulative and ((AccountRec.Accountno = SALESFTE) or (AccountRec.AccountNo = GPFTE) or (AccountRec.AccountNo = NPFTE)) then
//    AnnualiseFactor := 1 / DaysInYear;
  if Leftside then
    begin
    if GSummaryType = 0 then
      begin
      chart2.Chart.Series[0].AddY(AccountRec.PlanDetail[GLatestPeriod], 'Target', clTeeColor);
      chart2.Chart.Series[1].AddY(AccountRec.MonDetail[GLatestPeriod], 'Actual', clTeeColor);
      end
    else
      begin
      chart2.Chart.Series[0].AddY(AccountRec.PlanSummary[GLatestPeriod], 'Target', clTeeColor);
      chart2.Chart.Series[1].AddY(AccountRec.MonSummary[GLatestPeriod], 'Actual', clTeeColor);
      end;
    end
  else
    begin
    if GSummaryType = 0 then
      begin
      chart3.Chart.Series[0].AddY(GetYTDFigure(AccountRec.PlanDetail, GLatestPeriod), 'Target', clTeeColor);
      chart3.Chart.Series[1].AddY(GetYTDFigure(AccountRec.MonDetail, GLatestPeriod), 'Actual', clTeeColor);
      end
    else
      begin
      chart3.Chart.Series[0].AddY(GetYTDFigure(AccountRec.PlanSummary, GLatestPeriod), 'Target', clTeeColor);
      chart3.Chart.Series[1].AddY(GetYTDFigure(AccountRec.MonSummary, GLatestPeriod), 'Actual', clTeeColor);
      end;
    end;
  if Leftside then
    begin
    Chart2.Chart.Title.text.Clear;
    Chart2.Chart.Title.Text.Add(AccountRec.AccountTitle + ' ' + PTDTitle);
    end
  else
    begin
    Chart3.Chart.Title.text.Clear;
    Chart3.Chart.Title.Text.Add(AccountRec.AccountTitle + ' ' + YTDTitle);
    end;
end;

procedure TTrackGRepF.Chart1Print(Sender: TObject);
var
  ItemIndex, DetailNo : integer;
begin
  Itemindex := Accountstoinclude[ppJITPipeline1.RecordIndex];
  if ItemIndex < 0 then
    begin
    DetailNo := Itemindex * -1 - 1;
    if ReportType = 0 then
      LoadKeyChart(ReportDataList.Items[DetailNo]);
    if ReportType = 1 then
      LoadKeyChart1(ReportDataList.Items[DetailNo]);
    end;
end;

procedure TTrackGRepF.ppFooterBand1BeforePrint(Sender: TObject);
begin
  if GCumulative
    then begin
    RBNote.Caption := '* Amounts shown are accumulated Year to Date';
    RbNote.Visible := True;
  end;
end;

procedure TTrackGRepF.Chart2Print(Sender: TObject);
var
  ItemIndex, DetailNo : integer;
begin
  Itemindex := Accountstoinclude[ppJITPipeline2.RecordIndex];
  if ItemIndex < 0 then
    begin
    DetailNo := Itemindex * -1 - 1;
    LoadKeyChart2(ReportDataList.Items[DetailNo], True);
    end;
end;

procedure TTrackGRepF.Chart3Print(Sender: TObject);
var
  ItemIndex, DetailNo : integer;
begin
  Itemindex := Accountstoinclude[ppJITPipeline2.RecordIndex];
  if ItemIndex < 0 then
    begin
    DetailNo := Itemindex * -1 - 1;
    LoadKeyChart2(ReportDataList.Items[DetailNo], False);
    end;
end;

end.
