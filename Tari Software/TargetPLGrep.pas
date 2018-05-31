unit TargetPLGrep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TeeProcs, TeEngine, Chart, DBChart, ExtCtrls,
  Series, auchTypes, DMClient, DataCollector, ppVar, ppCtrls, ppPrnabl,
  ppClass, ppStrtch, ppMemo, ppBands, ppCache, ppProd, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, DB, ppChrt, ppDBJIT, s;

type

  TGraphColors = array[0..5] of TColor;
  TAccountNos = Array[0..6] of integer;

  TTargetPLGRepF = class(TForm)
    ppReport1: TppReport;
    ppDetailBand1: TppDetailBand;
    ppHeaderBand1: TppHeaderBand;
    ppFooterBand1: TppFooterBand;
    rbCompanyName: TppLabel;
    rbQRLabel1: TppLabel;
    rbDepartments: TppLabel;
    rbQRSysData2: TppSystemVariable;
    rbQRLabel3: TppLabel;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppColumnFooterBand1: TppColumnFooterBand;
    Chart1: TppTeeChart;
    ppJITPipeline1: TppJITPipeline;
    ppJITPipeline1ppField1: TppField;
    RBShape1: TppShape;
    ppSystemVariable1: TppSystemVariable;
    RBLine1: TppLine;
//    procedure QuickRep1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
//    procedure PageFooterBand1BeforePrint(Sender: TQRCustomBand;
//      var PrintBand: Boolean);
    procedure Chart1Print(Sender: TObject);
    function GetNumberRecords : Integer;
  private
    { Private declarations }
    DetailNo : integer;
//    bmParent : longint;
    ExpenseNo : Integer;
    CogsNonzero : Boolean;
    OtherIncomeNonZero : Boolean;
    ContainsAnnualised : Boolean;
    TotalExpensesPrinted : Boolean;
    LegendTitles : Array[0..5] of TppMemo;
    DataTitles : Array[0..5] of TppLabel;
    LegendColors : Array[0..5] of TppShape;
    procedure LoadPLChart(AccountRec : TPlanDataRecPtr);
    procedure LoadKeyChart(AccountRec : TReportDataRecPtr);
    function NonZeroPLBalances(AccountRec : TPlanDataRecPtr): boolean;
    function NonZeroKeyBalances(AccountRec : TReportDataRecPtr): boolean;
    procedure CheckPLColumns;
    procedure CheckKeyColumns;
  public
    { Public declarations }
    UseColor : Boolean;
    Annualise : Boolean;
    ThreeDImage : Boolean;
    ShowMarks : Boolean;
    TitlesList : TStringList;
    DataColumn : array[0..5] of integer;
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
  DataConsolidate : Boolean;
  KeyIndicator : Boolean = False;
  // Accounts are added to this array during GetnumberRecords. Values are references to either
  // AccounNos array - (Index * -1) + 1         (-1 <= X <= -8) OR
  // ExpenseListItems - Index + 1
  // The negative used to indicate which list
  AccountstoInclude : array[1..200] of integer;
implementation

{$R *.DFM}

procedure TTargetPLGRepF.FormCreate(Sender: TObject);
var
  I : integer;
begin
  DetailNo := 0;
  ExpenseNo := 0;
  CogsNonzero := False;
  OtherIncomeNonZero := False;
  ContainsAnnualised := False;
  TotalExpensesPrinted := False;
  TitlesList := TStringList.create;
  DataCollect.GetConsolidatedList(DataConsolidate);
  if KeyIndicator then
    DataCollect.getReportData
  else
    begin
    if DataCollect.Planloaded = false then
      DataCollect.getPlanningData;
    DataCollect.getPlanningExpData(False);
    end;

end;

procedure TTargetPLGRepF.BuildHeader;
var
  I, K: Integer;
  AnnualisedStr : string[10];
begin
  if KeyIndicator then
    CheckKeyColumns
  else
    CheckPLColumns;
  ppJITPipeline1.Recordcount := GetNumberRecords;
  DetailNo := 0;
  ExpenseNo := 0;
  ppJITPipeline1.Open;
  ppJITPipeline1.First;
  K := round(708 / TitlesList.Count);
  for I := 0 to TitlesList.count - 1 do    // Iterate
  begin
    if AnnualiseFactors[I] = 1 then
      AnnualisedStr := ''
    else begin
      AnnualisedStr := '*';
      ContainsAnnualised := True;
    end;

    DataTitles[I] := TppLabel.Create(self);

    with DataTitles[I] do
    begin
      autosize := False;
      Alignment := taCenter;
      Band := ppReport1.HeaderBand;
      spTop := 114;
      spLeft := 32 + I * K;
      spWidth := K - 35;
      spHeight := 20;
      Font.Name := ReportFont;
      Font.Size := 9;
      Font.Style := [fsBold];
      if DataColumn[I] = PAST then
        Caption := 'Past' + Annualisedstr
      else
        Caption := 'Target' + AnnualisedStr;
    end;    // with
    LegendTitles[I] := TppMemo.Create(self);
    with LegendTitles[I] do
    begin
      autosize := False;
      Alignment := taCenter;
      Band := ppReport1.HeaderBand;
      spTop := 135;
      spLeft := 35 + I * K;
      spWidth := K - 35;
      spHeight := 35;
      Font.Size := 9;
      Font.Name := ReportFont;
      Lines.Add(TitlesList.Strings[I]);
    end;    // with
    LegendColors[I] := TppShape.Create(Self);
    with LegendColors[I] do
    begin
      Band := ppReport1.HeaderBand;
      Shape := stRectangle;
      spTop := 135;
      spLeft := 10 + I * K;
      spHeight := 25;
      spWidth := 25;
      Brush.Style := bsSolid;
      Brush.Color := GraphColors[I];
      if GraphColors[I] <> clWhite then
        Pen.Color := GraphColors[I]
      else
        Pen.Color := clBlack;
    end;    // with
  end;    // for
  if ContainsAnnualised then
    rbQRLabel3.Visible := True
  else
    rbQRLabel3.Visible := False;
end;

procedure TTargetPLGRepF.FormDestroy(Sender: TObject);
begin
  TitlesList.Clear;
  TitlesList.Destroy;
  if KeyIndicator then
    DataCollect.ClearReportDataList
  else
    begin
    DataCollect.ClearPlanDataList;
    DataCollect.ClearPlanExpDataList;
    end;
  DataCollect.ClearConsolidatedList;
end;

function TTargetPLGRepF.NonZeroPLBalances(AccountRec : TPlanDataRecPtr): boolean;
var
  I : integer;
begin
  Result := false;
  for I := 0 to TitlesList.count - 1 do    // Iterate
    begin
    if ((DataColumn[I] = PAST) and (AccountRec.PastBalances[PastPeriodIndex[I]] <> 0)) or
       ((DataColumn[I] = TARGET) and (AccountRec.PlanTotal <> 0))
      then Result := True;
  end;
end;

function TTargetPLGRepF.NonZeroKeyBalances(AccountRec : TReportDataRecPtr): boolean;
var
  I : integer;
begin
  Result := false;
  for I := 0 to TitlesList.count - 1 do    // Iterate
    begin
    if ((DataColumn[I] = PAST) and (AccountRec.PastBalances[PastPeriodIndex[I]] <> 0)) or
       ((DataColumn[I] = TARGET) and (AccountRec.PlanTotal <> 0))
      then Result := True;
  end;
end;

procedure TTargetPLGRepF.LoadPLChart(AccountRec : TPlanDataRecPtr);
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
    if DataColumn[I] = PAST then
      chart1.Chart.Series[0].AddY(Round(AccountRec.PastBalances[PastPeriodIndex[I] - 1] / AnnualiseFactors[I]), '', GraphColors[I])
    else
      chart1.Chart.Series[0].AddY(Round(AccountRec.PlanTotal / AnnualiseFactors[I]), '', GraphColors[I])
  end;
  Chart1.Chart.Title.text.Clear;
  Chart1.Chart.Title.Text.Add(AccountRec.AccountTitle);
end;

procedure TTargetPLGRepF.LoadKeyChart(AccountRec : TReportDataRecPtr);
var
  I : integer;
  GAmount : Currency;
begin
  Chart1.Chart.RemoveAllSeries;
  CHart1.Chart.View3D := ThreeDImage;
  Chart1.Chart.AddSeries(TbarSeries.create(self));    // with
  Chart1.Chart.Series[0].ColorEachPoint := True;
  Chart1.Chart.Series[0].Marks.Style := smsValue;
  Chart1.Chart.Series[0].Marks.Visible := ShowMarks;
  Chart1.Chart.Series[0].ValueFormat := AccountRec.FormatImage;
  for I := 0 to TitlesList.count - 1 do    // Iterate
    begin
    if DataColumn[I] = PAST
      then begin
      GAmount := AccountRec.PastBalances[PastPeriodIndex[I] - 1];
      if AccountRec.Annualise then
        GAmount := GAmount / AnnualiseFactors[I];
    end
    else begin
      GAmount := AccountRec.PlanTotal;
      if AccountRec.Annualise then
        GAmount := GAmount / AnnualiseFactors[I];
    end;
//    GAmount := RoundtoFormat(AccountRec.FormatImage, GAmount);
    chart1.Chart.Series[0].AddY(GAmount, '', GraphColors[I]);
  end;
  Chart1.Chart.Title.text.Clear;
  Chart1.Chart.Title.Text.Add(AccountRec.AccountTitle);
end;

procedure TTargetPLGRepF.CheckPLColumns;
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
    if ((DataColumn[I] = PAST) and (AccountRec.PastBalances[PastPeriodIndex[I] - 1] <> 0)) or
       ((DataColumn[I] = TARGET) and (AccountRec.PlanTotal <> 0))
      then ItemsToDelete[I] := False;
    AccountRec := PlanDataList.Items[getaccountlistindex(GROSSPROFIT)];
    if ((DataColumn[I] = PAST) and (AccountRec.PastBalances[PastPeriodIndex[I] - 1] <> 0)) or
       ((DataColumn[I] = TARGET) and (AccountRec.PlanTotal <> 0))
      then ItemsToDelete[I] := False;
    AccountRec := PlanDataList.Items[getaccountlistindex(TOTALEXPENSES)];
    if ((DataColumn[I] = PAST) and (AccountRec.PastBalances[PastPeriodIndex[I] - 1] <> 0)) or
       ((DataColumn[I] = TARGET) and (AccountRec.PlanTotal <> 0))
      then ItemsToDelete[I] := False;
    AccountRec := PlanDataList.Items[getaccountlistindex(NETPROFIT)];
    if ((DataColumn[I] = PAST) and (AccountRec.PastBalances[PastPeriodIndex[I] - 1] <> 0)) or
       ((DataColumn[I] = TARGET) and (AccountRec.PlanTotal <> 0))
      then ItemsToDelete[I] := False;
  end;
  for I := TitlesList.count - 1 downto 0 do    // Iterate
    begin
    if ItemsToDelete[I] and (I <= TitlesList.count - 1)
      then begin
      for K := I to TitlesList.count - 1 do    // Iterate
        begin
        DataColumn[K] := DataColumn[K + 1];
        AnnualiseFactors[K] := AnnualiseFactors[K + 1];
        PastPeriodIndex[K] := PastPeriodIndex[K + 1];
      end;    // for
      TitlesList.Delete(I);
    end;
  end;    // for
end;

procedure TTargetPLGRepF.CheckKeyColumns;
var
  K: Integer;
  I: Integer;
  AccountRec : TReportDataRecPtr;
  ItemsToDelete : array[0..18] of Boolean;
begin
  // initialise
  for I := 0 to TitlesList.count - 1 do
   ItemsToDelete[I] := true;

  for I := 0 to TitlesList.count - 1 do    // Iterate
    begin
    AccountRec := ReportDataList.Items[getreportaccountindex(SALES)];
    if ((DataColumn[I] = PAST) and (AccountRec.PastBalances[PastPeriodIndex[I] - 1] <> 0)) or
       ((DataColumn[I] = TARGET) and (AccountRec.PlanTotal <> 0))
      then ItemsToDelete[I] := False;
    AccountRec := ReportDataList.Items[getreportaccountindex(GROSSPROFIT)];
    if ((Datacolumn[I] = PAST) and (AccountRec.PastBalances[PastPeriodIndex[I] - 1] <> 0)) or
       ((Datacolumn[I] = TARGET) and (AccountRec.PlanTotal <> 0))
      then ItemsToDelete[I] := False;
    AccountRec := ReportDataList.Items[getreportaccountindex(TOTALEXPENSES)];
    if ((DataColumn[I] = PAST) and (AccountRec.PastBalances[PastPeriodIndex[I] - 1] <> 0)) or
       ((DataColumn[I] = TARGET) and (AccountRec.PlanTotal <> 0))
      then ItemsToDelete[I] := False;
    AccountRec := ReportDataList.Items[getreportaccountindex(NETPROFIT)];
    if ((DataColumn[I] = PAST) and (AccountRec.PastBalances[PastPeriodIndex[I] - 1] <> 0)) or
       ((DataColumn[I] = TARGET) and (AccountRec.PlanTotal <> 0))
      then ItemsToDelete[I] := False;
  end;
  for I := TitlesList.count - 1 downto 0 do    // Iterate
    begin
    if ItemsToDelete[I] and (I <= TitlesList.count - 1)
      then begin
      for K := I to TitlesList.count - 1 do    // Iterate
        begin
        DataColumn[K] := DataColumn[K + 1];
        AnnualiseFactors[K] := AnnualiseFactors[K + 1];
        PastPeriodIndex[K] := PastPeriodIndex[K + 1];
      end;    // for
      TitlesList.Delete(I);
    end;
  end;    // for
end;

{
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
}
function TTargetPLGRepF.GetNumberRecords : Integer;
var
  I: Integer;
  Itemfound, OneExpense : Boolean;
  RecordCnt : integer;
begin
  for I := 1 to 200 do    // Iterate
    AccountstoInclude[I] := 0;
  DetailNo := 0;
  ExpenseNo := 0;
  RecordCnt := 1;
  OneExpense := False;
  while ((DetailNo < 7) and (Not KeyIndicator)) or ((KeyIndicator) and (DetailNo < ReportDataList.Count)) do
    begin
//    Itemfound := False;
    if KeyIndicator then
      ItemFound := NonzeroKeyBalances(ReportDataList.Items[DetailNo])
    else
      begin
      ItemFound := NonzeroPLBalances(PlanDataList.Items[getaccountlistindex(AccountNos[DetailNo])]);
      if ((AccountNos[DetailNo] = GROSSPROFIT) and (Not NonzeroPLBalances(PlanDataList.Items[getaccountlistindex(COGS)]))) or
          ((AccountNos[DetailNo] = NETPROFIT) and (Not NonzeroPLBalances(PlanDataList.Items[getaccountlistindex(OTHERINCOME)])))
        then ItemFound := False;
      end;
    if Itemfound then
      Begin
      AccountstoInclude[RecordCnt] := -DetailNo - 1;
      Inc(RecordCnt);
      end;
    inc(DetailNo);
    end;
  if not KeyIndicator then
    begin
    while (Expenseno < PlanExpDataList.count) do
      begin
  //    Itemfound := False;
      ItemFound := NonZeroPLBalances(PlanExpDataList.Items[ExpenseNo]);
      if ItemFound then
        Begin
        AccountstoInclude[RecordCnt] := ExpenseNo + 1;
        Inc(RecordCnt);
        OneExpense := True;
        end;
      Inc(ExpenseNo);
      end;
    if (OneExpense) then
      begin
//      Itemfound := False;
      ItemFound := NonzeroPLBalances(PlanDataList.Items[getaccountlistindex(TOTALEXPENSES)]);
      if ItemFound then
        Begin
        AccountstoInclude[RecordCnt] := -4;
        Inc(RecordCnt);
        end;
      end;
    end;
  Result := Recordcnt - 1;
end;

procedure TTargetPLGRepF.Chart1Print(Sender: TObject);
var
  ItemIndex : integer;
begin
  Itemindex := Accountstoinclude[ppJITPipeline1.RecordIndex + 1];
  if ItemIndex < 0 then
    begin
    DetailNo := Itemindex * -1 - 1;
    if KeyIndicator then
      LoadKeyChart(ReportDataList.Items[DetailNo])
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
