unit TargetKeyGrep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TeeProcs, TeEngine, Chart, ExtCtrls,
  Series, auchTypes, DMClient, DataCollector, ppChrt, ppStrtch,
  s, ppBands, ppDB, ppDBJIT, ppVar, ppCtrls, ppPrnabl,
  ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport;

type

  TGraphColors = array[0..5] of TColor;

  TTargetKeyGRepF = class(TForm)
    ppReport1: TppReport;
    ppDetailBand1: TppDetailBand;
    ppHeaderBand1: TppHeaderBand;
    ppFooterBand1: TppFooterBand;
    rbQRShape1: TppLine;
    rbCompanyName: TppLabel;
    rbQRLabel1: TppLabel;
    rbDepartments: TppLabel;
    rbQRSysData2: TppSystemVariable;
    rbPageDateTime: TppLabel;
    rbQRLabel2: TppLabel;
    rbQRLabel3: TppLabel;
    ppJITPipeline1: TppJITPipeline;
    ppJITPipeline1ppField1: TppField;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppColumnFooterBand1: TppColumnFooterBand;
    RBShape1: TppShape;
    Chart1: TppTeeChart;
    procedure QuickRep1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PageFooterBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    DetailNo : integer;
//    bmParent : longint;
    OtherIncomeNonZero : Boolean;
    ContainsAnnualised : Boolean;
    TotalExpensesPrinted : Boolean;
    LegendTitles : Array[0..5] of TQRLabel;
    DataTitles : Array[0..5] of TQRLabel;
    LegendColors : Array[0..5] of TQRShape;
    procedure LoadChart(AccountRec : TReportDataRecPtr);
    function NonZeroBalances(AccountRec : TReportDataRecPtr): boolean;
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

var
  TargetKeyGRepF: TTargetKeyGRepF;
  TKGRPConsolidate : Boolean;

implementation

{$R *.DFM}

procedure TTargetKeyGRepF.QuickRep1NeedData(Sender: TObject;
  var MoreData: Boolean);
var
  Itemfound : Boolean;
begin
  Itemfound := False;
  MoreData := True;
  while (Not ItemFound) and (DetailNo <= ReportDataList.count -1)do
    begin
    ItemFound := NonzeroBalances(ReportDataList.Items[DetailNo]);
    if Itemfound then
      LoadChart(ReportDataList.Items[DetailNo]);
    inc(DetailNo);
  end;
  if (DetailNo <= ReportDataList.count -1) and (itemfound) and (DetailNo = 7)
//    or (Not NonzeroBalances(ReportDataList.Items[DetailNo]))
    then QRShape1.Enabled := True;
  if (DetailNo = 7) and (not ItemFound) then QRShape1.Enabled := False;
  if not Itemfound and (DetailNo > ReportDataList.count -1) then MoreData := False;
end;

procedure TTargetKeyGRepF.FormCreate(Sender: TObject);
begin
  DetailNo := 0;
  OtherIncomeNonZero := False;
  ContainsAnnualised := False;
  TotalExpensesPrinted := False;
  TitlesList := TStringList.create;
  DataCollect.GetConsolidatedList(TKGRPConsolidate);
  DataCollect.getReportData;
end;

procedure TTargetKeyGRepF.BuildHeader;
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
      Font.Size := 9;
      Font.Style := [fsBold];
      Font.Name := ReportFont;
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

procedure TTargetKeyGRepF.FormDestroy(Sender: TObject);
begin
  TitlesList.Clear;
  TitlesList.Destroy;
  DataCollect.ClearReportDataList;
  DataCollect.ClearConsolidatedList;
end;

function TTargetKeyGRepF.NonZeroKeyBalances(AccountRec : TReportDataRecPtr): boolean;
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

procedure TTargetKeyGRepF.LoadChart(AccountRec : TReportDataRecPtr);
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
    if DataSource[I] = PAST
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

procedure TTargetKeyGRepF.CheckKeyColumns;
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
    if ((DataSource[I] = PAST) and (AccountRec.PastBalances[PastPeriodIndex[I] - 1] <> 0)) or
       ((DataSource[I] = TARGET) and (AccountRec.PlanTotal <> 0))
      then ItemsToDelete[I] := False;
    AccountRec := ReportDataList.Items[getreportaccountindex(GROSSPROFIT)];
    if ((DataSource[I] = PAST) and (AccountRec.PastBalances[PastPeriodIndex[I] - 1] <> 0)) or
       ((DataSource[I] = TARGET) and (AccountRec.PlanTotal <> 0))
      then ItemsToDelete[I] := False;
    AccountRec := ReportDataList.Items[getreportaccountindex(TOTALEXPENSES)];
    if ((DataSource[I] = PAST) and (AccountRec.PastBalances[PastPeriodIndex[I] - 1] <> 0)) or
       ((DataSource[I] = TARGET) and (AccountRec.PlanTotal <> 0))
      then ItemsToDelete[I] := False;
    AccountRec := ReportDataList.Items[getreportaccountindex(NETPROFIT)];
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

procedure TTargetKeyGRepF.PageFooterBand1BeforePrint(Sender: TQRCustomBand;
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
