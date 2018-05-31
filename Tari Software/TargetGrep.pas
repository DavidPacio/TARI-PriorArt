unit TargetGrep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TeeProcs, TeEngine, Chart, DBChart, ExtCtrls,
  Series, auchTypes, DMClient, DataCollector, ppVar, ppCtrls, ppPrnabl,
  ppClass, ppStrtch, ppMemo, ppBands, ppCache, ppProd, ppReport, ppComm,
	ppRelatv, ppDB, ppDBPipe, ppDBBDE, DB, ppChrt, ppDBJIT, LGlobals, ppParameter,
  ppDesignLayer;

type

  TGraphColors = array[0..5] of TColor;
  TAccountNos = Array[0..6] of integer;

  TTargetGRepF = class(TForm)
    ppReport1: TppReport;
    ppDetailBand1: TppDetailBand;
    ppHeaderBand1: TppHeaderBand;
    ppFooterBand1: TppFooterBand;
    rbCompanyName: TppLabel;
    rbQRLabel1: TppLabel;
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
    RBText1: TppLabel;
    GroupLabel: TppLabel;
    rbDepartment: TppLabel;
		ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
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
    DataConsolidate : TConsolidateType;
    TitlesList : TStringList;
    DataColumn : array[0..5] of integer;
    AnnualiseFactors : array[0..5] of extended;
    PastPeriodIndex : array[0..5] of integer;
    AccountstoInclude : array[1..200] of integer;
		ReportFont : TFontName;
    procedure BuildHeader;
  end;
Const
  GraphColors : TGraphColors = (clRed, clGreen, clYellow, clBlue, clWhite, clGray);
  AccountNos : TAccountNos = (SALES, COGS, GROSSPROFIT, TOTALEXPENSES, NETOPERATINGPROFIT, OTHERINCOME, NETPROFIT);

var
  TargetGRepF: TTargetGRepF;
  KeyIndicator : Boolean = False;


implementation

{$R *.DFM}

procedure TTargetGRepF.FormCreate(Sender: TObject);
begin
  DetailNo := 0;
  ExpenseNo := 0;
  CogsNonzero := False;
  OtherIncomeNonZero := False;
  ContainsAnnualised := False;
  TotalExpensesPrinted := False;
  TitlesList := TStringList.create;
  DataCollect.GetConsolidatedList(DataModuleClient.DepartmentsDEPT_ID.Value, DataConsolidate);
  DataCollect.psdate := DataModuleClient.DepartmentsCurrentPlanStart.value;
  DataCollect.pedate := DataModuleClient.DepartmentsCurrentPlanEnd.value;
  if KeyIndicator then
    DataCollect.getReportData
  else
    begin
    if DataCollect.Planloaded = false then
      DataCollect.getPlanningData;
    DataCollect.getPlanningExpData(False);
    end;
end;

procedure TTargetGRepF.BuildHeader;
var
  I, K, T: Integer;
  AnnualisedStr : string;
  localFont : Tfont;
begin
  if KeyIndicator then
    CheckKeyColumns
  else
    CheckPLColumns;
  ppJITPipeline1.Recordcount := GetNumberRecords;
  DetailNo := 0;
  ExpenseNo := 0;
  localFont := Tfont.Create;
  localFont.Name := reportFont;
  LocalFont.Size := 9;
  ppJITPipeline1.Open;
  ppJITPipeline1.First;
  rbDepartment.Height := rbDepartment.Height + 2;
  rbShape1.Top := rbDepartment.Top + rbDepartment.Height + 10;
  K := 0;
  if Titleslist.Count > 0 then
    K := round(708 / TitlesList.Count);
  for I := 0 to TitlesList.count - 1 do    // Iterate
  begin
  // Store the current value for end of loop
    T := 3;
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
      spTop := rbshape1.spTop + T;
      spLeft := 32 + I * K;
      spWidth := K - 35;
      spHeight := 18;
      Transparent := true;
      Font.Name := ReportFont;
      Font.Size := 9;
      Font.Style := [fsBold];
      if DataColumn[I] = PAST then
        Caption := 'Past' + Annualisedstr
      else
        Caption := 'Target' + AnnualisedStr;
    end;    // with
    LegendTitles[I] := TppMemo.Create(self);
    T := DataTitles[0].spTOP + DataTitles[0].spHeight + 2;
    with LegendTitles[I] do
    begin
      autosize := False;
      Alignment := taCenter;
      Band := ppReport1.HeaderBand;
      spTop := T;
      spLeft := 35 + I * K;
      spWidth := K - 35;
      spHeight := 28;
      Transparent := true;
      AutoSize := true;
      Font.Size := 8;
      Font.Name := ReportFont;
      Lines.Add(TitlesList.Strings[I]);
    end;    // with
    T := LegendTitles[0].sptop - 2;
    LegendColors[I] := TppShape.Create(Self);
    with LegendColors[I] do
    begin
      Band := ppReport1.HeaderBand;
      Shape := stRectangle;
      spTop := T;
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
  rbShape1.spHeight := LegendTitles[0].spTop - rbShape1.sptop + LegendTitles[0].spHeight + 5;
  ppReport1.HeaderBand.spHeight := rbShape1.spTop + rbShape1.spheight + 10;
  if ContainsAnnualised then
    rbQRLabel3.Visible := True
  else
    rbQRLabel3.Visible := False;
end;

procedure TTargetGRepF.FormDestroy(Sender: TObject);
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

function TTargetGRepF.NonZeroPLBalances(AccountRec : TPlanDataRecPtr): boolean;
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

function TTargetGRepF.NonZeroKeyBalances(AccountRec : TReportDataRecPtr): boolean;
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

procedure TTargetGRepF.LoadPLChart(AccountRec : TPlanDataRecPtr);
var
	I : integer;
begin
	Chart1.Chart.RemoveAllSeries;
	CHart1.Chart.View3D := ThreeDImage;
	Chart1.Chart.AddSeries(TChartSeries(TBarSeries.Create(self)));    // with
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

procedure TTargetGRepF.LoadKeyChart(AccountRec : TReportDataRecPtr);
var
  I : integer;
  GAmount : Currency;
begin
  Chart1.Chart.RemoveAllSeries;
  CHart1.Chart.View3D := ThreeDImage;
  Chart1.Chart.AddSeries(TChartSeries(TbarSeries.create(self)));    // with
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

procedure TTargetGRepF.CheckPLColumns;
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

procedure TTargetGRepF.CheckKeyColumns;
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


function TTargetGRepF.GetNumberRecords : Integer;
var
  I, J: Integer;
  Itemfound, OneExpense : Boolean;
  RecordCnt : integer;
begin
  for I := 1 to 200 do    // Iterate
    AccountstoInclude[I] := 0;
  DetailNo := 0;
  RecordCnt := 1;
  OneExpense := False;
  if KeyIndicator then
    begin
    while (DetailNo < ReportDataList.Count) do
      begin
      if NonzeroKeyBalances(ReportDataList.Items[DetailNo]) then
        Begin
        AccountstoInclude[RecordCnt] := -DetailNo - 1;
        Inc(RecordCnt);
        end;
      inc(DetailNo);
      end;
    end
  else
    begin
    ExpenseNo := 0;
    // SortExpenses
    sortExpenseList(True);
    if GGlobals.Produce_AccountFmt then
      begin
      // include Sales
      if NonZeroPLBalances(PlanDatalist.Items[0]) then
        begin
        AccountstoInclude[RecordCnt] := -1;
        Inc(RecordCnt);
        end;
      // include COGS
      if NonZeroPLBalances(PlanDatalist.Items[1]) then
        begin
        AccountstoInclude[RecordCnt] := -2;
        Inc(RecordCnt);
        end;
      // now include direct expenses
      for J := 0 to PlanExpDataList.count -1 do    // Iterate
        begin
        if (TPlanDataRecPtr(PlanExpDatalist.Items[J]).Account_Group = AGDIRECTEXP) and NonZeroPLBalances(PlanExpDataList.Items[J]) then
          begin
          AccountstoInclude[RecordCnt] := J + 1;
          Inc(RecordCnt);
          end;
        End;
      // include GP
      if NonZeroPLBalances(PlanDatalist.Items[2]) then
        begin
        AccountstoInclude[RecordCnt] := -3;
        Inc(RecordCnt);
        end;
      // Include General Expenses
      for J := 0 to PlanExpDataList.count -1 do    // Iterate
        begin
        if (TPlanDataRecPtr(PlanExpDatalist.Items[J]).Account_Group = AGEXPENSES) and NonZeroPLBalances(PlanExpDataList.Items[J]) then
          begin
          AccountstoInclude[RecordCnt] := J + 1;
          Inc(RecordCnt);
          end;
        End;
      // include Total Expenses
      if NonZeroPLBalances(PlanDatalist.Items[3]) then
        begin
        AccountstoInclude[RecordCnt] := -4;
        Inc(RecordCnt);
        end;
      // include NOP or EBITA
      if NonZeroPLBalances(PlanDatalist.Items[4]) then
        begin
        TPlanDataRecPtr(PlanDatalist.Items[4]).AccountTitle := 'Earnings Before Int. Tax, Depn & Amort.';
        AccountstoInclude[RecordCnt] := -5;
        Inc(RecordCnt);
        end;
      // include Other Income
      if NonZeroPLBalances(PlanDatalist.Items[5]) then
        begin
        AccountstoInclude[RecordCnt] := -6;
        Inc(RecordCnt);
        end;
      // Include Depreciation, etc Expenses
      for J := 0 to PlanExpDataList.count -1 do    // Iterate
        begin
        if (TPlanDataRecPtr(PlanExpDatalist.Items[J]).Account_Group = AGDEPNINT) and NonZeroPLBalances(PlanExpDataList.Items[J]) then
          begin
          AccountstoInclude[RecordCnt] := J + 1;
          Inc(RecordCnt);
          end;
        End;
      // include Net Profit
      if NonZeroPLBalances(PlanDatalist.Items[6]) then
        begin
        AccountstoInclude[RecordCnt] := -7;
        Inc(RecordCnt);
        end;

      end
    else
      begin
      while (DetailNo < 7) do
        begin
        ItemFound := NonzeroPLBalances(PlanDataList.Items[getaccountlistindex(AccountNos[DetailNo])]);
        if ((AccountNos[DetailNo] = GROSSPROFIT) and (Not NonzeroPLBalances(PlanDataList.Items[getaccountlistindex(COGS)]))) or
            ((AccountNos[DetailNo] = NETPROFIT) and (Not NonzeroPLBalances(PlanDataList.Items[getaccountlistindex(OTHERINCOME)]))) then
          ItemFound := False;
        if Itemfound then
          Begin
          AccountstoInclude[RecordCnt] := -DetailNo - 1;
          Inc(RecordCnt);
          end;
        inc(DetailNo);
        end;
      while (Expenseno < PlanExpDataList.count) do
        begin
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
        ItemFound := NonzeroPLBalances(PlanDataList.Items[getaccountlistindex(TOTALEXPENSES)]);
        if ItemFound then
          Begin
          AccountstoInclude[RecordCnt] := -4;
          Inc(RecordCnt);
          end;
        end;
      end;
    end;
  Result := Recordcnt - 1;
end;

procedure TTargetGRepF.Chart1Print(Sender: TObject);
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
