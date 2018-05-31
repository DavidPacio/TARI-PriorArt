unit TargetPLGrep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, TeeProcs, TeEngine, Chart, DBChart, QrTee, QuickRpt, ExtCtrls,
  Series, auchTypes, DMClient, DataCollector;

type

  TGraphColors = array[0..5] of TColor;
  TAccountNos = Array[0..6] of integer;

  TTargetPLGRepF = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRDBChart1: TQRDBChart;
    Chart1: TQRChart;
    CompanyName: TQRLabel;
    Series1: TBarSeries;
    QRLabel1: TQRLabel;
    Departments: TQRLabel;
    QRSysData2: TQRSysData;
    PageDateTime: TQRLabel;
    QRLabel2: TQRLabel;
    QRLegend: TQRShape;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    procedure QuickRep1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PageFooterBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    DetailNo : integer;
//    bmParent : longint;
    ExpenseNo : Integer;
    CogsNonzero : Boolean;
    OtherIncomeNonZero : Boolean;
    ContainsAnnualised : Boolean;
    TotalExpensesPrinted : Boolean;
    LegendTitles : Array[0..5] of TQRLabel;
    DataTitles : Array[0..5] of TQRLabel;
    LegendColors : Array[0..5] of TQRShape;
    procedure LoadChart(AccountRec : TPlanDataRecPtr);
    function NonZeroBalances(AccountRec : TPlanDataRecPtr): boolean;
    procedure CheckColumns;
  public
    { Public declarations }
    UseColor : Boolean;
    Annualise : Boolean;
    ThreeDImage : Boolean;
    ShowMarks : Boolean;
    TitlesList : TStringList;
    DataSource : array[0..5] of integer;
    AnnualiseFactors : array[0..5] of extended;
    PastPeriodIndex : array[0..5] of integer;
    ReportFont : TFontName;
    procedure BuildHeader;
  end;
Const
  GraphColors : TGraphColors = (clRed, clGreen, clYellow, clBlue, clWhite, clGray);
  AccountNos : TAccountNos = (SALES, COGS, GROSSPROFIT, TOTALEXPENSES, NETOPERATINGPROFIT, OTHERINCOME, NETPROFIT);

var
  TargetPLGRepF: TTargetPLGRepF;
  TPLGRConsolidate : Boolean;

implementation

{$R *.DFM}

procedure TTargetPLGRepF.QuickRep1NeedData(Sender: TObject;
  var MoreData: Boolean);
var
  Itemfound : Boolean;
begin
  Itemfound := False;
  MoreData := True;
  while (Not ItemFound) and (DetailNo < 7)do
    begin
    ItemFound := NonzeroBalances(PlanDataList.Items[getaccountlistindex(AccountNos[DetailNo])]);
    if ((AccountNos[DetailNo] = GROSSPROFIT) and (Not NonzeroBalances(PlanDataList.Items[getaccountlistindex(COGS)]))) or
        ((AccountNos[DetailNo] = NETPROFIT) and (Not NonzeroBalances(PlanDataList.Items[getaccountlistindex(OTHERINCOME)])))
        then ItemFound := False;
    if Itemfound then
      LoadChart(PlanDataList.Items[getaccountlistindex(AccountNos[DetailNo])]);
    inc(DetailNo);
  end;
  if ((itemfound) and (DetailNo = 7)
    or ((AccountNos[DetailNo] = NETOPERATINGPROFIT) and (Not NonzeroBalances(PlanDataList.Items[getaccountlistindex(OTHERINCOME)]))))
    then QRShape1.Enabled := True;
  if (DetailNo = 7) and (not ItemFound) then QRShape1.Enabled := False;
  if (not ItemFound) and (Expenseno < PlanExpDataList.count) and (DetailNo = 7) then
    begin
    while (not Itemfound) and (Expenseno < PlanExpDataList.count) do
      begin
      ItemFound := NonZeroBalances(PlanExpDataList.Items[ExpenseNo]);
      if ItemFound then
        LoadChart(PlanExpDataList.Items[ExpenseNo]);
      Inc(ExpenseNo);
    end;    // while
  end;
  if (DetailNo = 7) and (ExpenseNo = PlanExpDataList.count) and (not TotalExpensesPrinted)
    and (not Itemfound) then begin
    ItemFound := NonzeroBalances(PlanDataList.Items[getaccountlistindex(TOTALEXPENSES)]);
    if ItemFound then
      LoadChart(PlanDataList.Items[getaccountlistindex(TOTALEXPENSES)]);
    TotalExpensesPrinted := True;
  end;
  if not Itemfound then MoreData := False;
end;

procedure TTargetPLGRepF.FormCreate(Sender: TObject);
begin
  DetailNo := 0;
  ExpenseNo := 0;
  CogsNonzero := False;
  OtherIncomeNonZero := False;
  ContainsAnnualised := False;
  TotalExpensesPrinted := False;
  TitlesList := TStringList.create;
  DataCollect.GetConsolidatedList(TPLGRConsolidate);
  if DataCollect.Planloaded = false then
    DataCollect.getPlanningData;
  DataCollect.getPlanningExpData(False);
end;

procedure TTargetPLGRepF.BuildHeader;
var
  I, K: Integer;
  AnnualisedStr : string[10];
begin
  CheckColumns;
  K := round(708 / TitlesList.Count);
  for I := 0 to TitlesList.count - 1 do    // Iterate
  begin
    if AnnualiseFactors[I] = 1 then
      AnnualisedStr := ''
    else begin
      AnnualisedStr := '*';
      ContainsAnnualised := True;
    end;

    DataTitles[I] := TQRLabel.Create(self);
    with DataTitles[I] do
    begin
      autosize := False;
      Alignment := taCenter;
      Top := 114;
      Left := 32 + I * K;
      Width := K - 35;
      Height := 20;
      Font.Name := ReportFont;
      Font.Size := 9;
      Font.Style := [fsBold];
      ParentReport := QuickRep1;
      if DataSource[I] = PAST then
        Caption := 'Past' + Annualisedstr
      else
        Caption := 'Target' + AnnualisedStr;
    end;    // with
    PageHeaderBand1.InsertControl(DataTitles[I]);
    LegendTitles[I] := TQRLabel.Create(self);
    with LegendTitles[I] do
    begin
      autosize := False;
      Alignment := taCenter;
      Top := 135;
      Left := 40 + I * K;
      Width := K - 35;
      Height := 35;
      Font.Size := 9;
      Font.Name := ReportFont;
      ParentReport := QuickRep1;
      Caption := TitlesList.Strings[I];
    end;    // with
    PageHeaderBand1.InsertControl(LegendTitles[I]);
    LegendColors[I] := TQRShape.Create(Self);
    with LegendColors[I] do
    begin
      Shape := qrsRectangle;
      Top := 135;
      Left := 10 + I * K;
      Height := 25;
      Width := 25;
      Brush.Style := bsSolid;
      Brush.Color := GraphColors[I];
      if GraphColors[I] <> clWhite then
        Pen.Color := GraphColors[I]
      else
        Pen.Color := clBlack;
      ParentReport := QuickRep1;
    end;    // with
    PageHeaderBand1.InsertControl(LegendColors[I]);
  end;    // for
  with QRLegend do
    begin
    Top := 112;
    Left := 0;
    Width := 719;
    Height := 60;
    Pen.width := 2;
  end;    // with
end;

procedure TTargetPLGRepF.FormDestroy(Sender: TObject);
begin
  TitlesList.Clear;
  TitlesList.Destroy;
  DataCollect.ClearPlanDataList;
  DataCollect.ClearPlanExpDataList;
  DataCollect.ClearConsolidatedList;
end;

function TTargetPLGRepF.NonZeroBalances(AccountRec : TPlanDataRecPtr): boolean;
var
  I : integer;
begin
  Result := false;
  for I := 0 to TitlesList.count - 1 do    // Iterate
    begin
    if ((DataSource[I] = PAST) and (AccountRec.PastBalances[PastPeriodIndex[I]] <> 0)) or
       ((DataSource[I] = TARGET) and (AccountRec.PlanTotal <> 0))
      then Result := True;
  end;
end;

procedure TTargetPLGRepF.LoadChart(AccountRec : TPlanDataRecPtr);
var
  I : integer;
begin
  Chart1.Chart.RemoveAllSeries;
  CHart1.Chart.View3D := ThreeDImage;
  Chart1.Chart.AddSeries(TbarSeries.create(self));    // with
  Chart1.Chart.Series[0].ColorEachPoint := True;
  Chart1.Chart.Series[0].Marks.Style := smsValue;
  Chart1.Chart.Series[0].Marks.Visible := ShowMarks;

  Chart1.Chart.Series[0].ValueFormat := REPORTROUNDCURRENCY;

  for I := 0 to TitlesList.count - 1 do    // Iterate
    begin
    if DataSource[I] = PAST then
      chart1.Chart.Series[0].AddY(Round(AccountRec.PastBalances[PastPeriodIndex[I] - 1] / AnnualiseFactors[I]), '', GraphColors[I])
    else
      chart1.Chart.Series[0].AddY(Round(AccountRec.PlanTotal / AnnualiseFactors[I]), '', GraphColors[I])
  end;
  Chart1.Chart.Title.text.Clear;
  Chart1.Chart.Title.Text.Add(AccountRec.AccountTitle);
end;

procedure TTargetPLGRepF.CheckColumns;
var
  K: Integer;
  I: Integer;
  AccountRec : TPlanDataRecPtr;
  ItemsToDelete : array[0..18] of Boolean;
begin
  // initialise
  for I := 0 to TitlesList.count - 1 do
   ItemsToDelete[I] := true;

  for I := 0 to TitlesList.count - 1 do    // Iterate
    begin
    AccountRec := PlanDataList.Items[getaccountlistindex(SALES)];
    if ((DataSource[I] = PAST) and (AccountRec.PastBalances[PastPeriodIndex[I] - 1] <> 0)) or
       ((DataSource[I] = TARGET) and (AccountRec.PlanTotal <> 0))
      then ItemsToDelete[I] := False;
    AccountRec := PlanDataList.Items[getaccountlistindex(GROSSPROFIT)];
    if ((DataSource[I] = PAST) and (AccountRec.PastBalances[PastPeriodIndex[I] - 1] <> 0)) or
       ((DataSource[I] = TARGET) and (AccountRec.PlanTotal <> 0))
      then ItemsToDelete[I] := False;
    AccountRec := PlanDataList.Items[getaccountlistindex(TOTALEXPENSES)];
    if ((DataSource[I] = PAST) and (AccountRec.PastBalances[PastPeriodIndex[I] - 1] <> 0)) or
       ((DataSource[I] = TARGET) and (AccountRec.PlanTotal <> 0))
      then ItemsToDelete[I] := False;
    AccountRec := PlanDataList.Items[getaccountlistindex(NETPROFIT)];
    if ((DataSource[I] = PAST) and (AccountRec.PastBalances[PastPeriodIndex[I] - 1] <> 0)) or
       ((DataSource[I] = TARGET) and (AccountRec.PlanTotal <> 0))
      then ItemsToDelete[I] := False;
  end;
  for I := TitlesList.count - 1 downto 0 do    // Iterate
    begin
    if ItemsToDelete[I] and (I <= TitlesList.count - 1)
      then begin
      for K := I to TitlesList.count - 1 do    // Iterate
        begin
        DataSource[K] := DataSource[K + 1];
        AnnualiseFactors[K] := AnnualiseFactors[K + 1];
        PastPeriodIndex[K] := PastPeriodIndex[K + 1];
      end;    // for
      TitlesList.Delete(I);
    end;
  end;    // for
end;

procedure TTargetPLGRepF.PageFooterBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if ContainsAnnualised
    then begin
    QRLabel3.Enabled := True;
    PageFooterBand1.Height := 35;
    PageDateTime.Top := 16;
    QRLabel2.Top := 16;
    QRSysData2.Top := 16;
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

end.
