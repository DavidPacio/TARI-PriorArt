unit MYOBReports;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MYOBInterGlobals, cxGroupBox, cxRadioGroup, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxControls, cxContainer, cxEdit,
  ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport, cxLabel,
  DateUtils, MYOBDM, StdCtrls, cxButtons, s, ppCtrls, ppVar,
  ppBands, ppPrnabl, ppStrtch, ppCache, ppParameter, RB_E_PDF, ppDBJIT;

type

  TReportRecPtr = ^TReportRec;TReportRec = record
    Trans_ID : Integer;
    Trans_Date : TDateTime;
    Last_Date : TDateTime;
    First_Name: String[50];
    Last_Name: string[50];
    Full_Name: String[100];
    NetSales: currency;
    materials: currency;
    gross: currency;
    Units: currency;
    Rate: currency;
  end;


  TSCReportsF = class(TForm)
    StaffReport: TppReport;
    StaffReportPipeline: TppDBPipeline;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    BusinessName: TppLabel;
    ReportTitle: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    RBText1: TppLabel;
    RBLine1: TppLine;
    RBDBText1: TppDBText;
    RBDBText2: TppDBText;
    RBDBText3: TppDBText;
    RBDBText4: TppDBText;
    RBDBText5: TppDBText;
    RBDBText6: TppDBText;
    RBDBText7: TppDBText;
    RBLine2: TppLine;
    RBText2: TppLabel;
    RBText3: TppLabel;
    RBText4: TppLabel;
    RBText5: TppLabel;
    RBText6: TppLabel;
    RBText7: TppLabel;
    RBText8: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    RBDBCalc1: TppDBCalc;
    RBTOTALGP: TppDBCalc;
    RBTOTALHOURS: TppDBCalc;
    RBText9: TppLabel;
    TotalProductivity: TppLabel;
    RBText11: TppLabel;
    TOTALPAIDHOURS: TppDBCalc;
    RBText10: TppLabel;
    RBDBText8: TppDBText;
    RBLine3: TppLine;
    RBDBCalc2: TppDBCalc;
    ClientReport: TppReport;
    ppHeaderBand2: TppHeaderBand;
    BusinessNameClient: TppLabel;
    ReportNameClients: TppLabel;
    RBLine4: TppLine;
    RBText14: TppLabel;
    RBText15: TppLabel;
    RBText16: TppLabel;
    RBText17: TppLabel;
    RBText18: TppLabel;
    RBText19: TppLabel;
    RBText21: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    RBText22: TppLabel;
    RBLine5: TppLine;
    ppSummaryBand2: TppSummaryBand;
    CTRATE: TppLabel;
    RBText26: TppLabel;
    RBLine6: TppLine;
    ppParameterList2: TppParameterList;
    JITClientData: TppJITPipeline;
    JITClientDatappField1: TppField;
    JITClientDatappField2: TppField;
    JITClientDatappField3: TppField;
    JITClientDatappField4: TppField;
    JITClientDatappField5: TppField;
    JITClientDatappField6: TppField;
    JITClientDatappField7: TppField;
    RBDBText9: TppDBText;
    RBDBText10: TppDBText;
    RBDBText11: TppDBText;
    RBDBText12: TppDBText;
    RBDBText13: TppDBText;
    RBDBText14: TppDBText;
    RBDBText15: TppDBText;
    CTSALES: TppLabel;
    CTCOGS: TppLabel;
    CTGROSS: TppLabel;
    CTUNITS: TppLabel;
    TransReport: TppReport;
    ppHeaderBand3: TppHeaderBand;
    BusinessNameTrans: TppLabel;
    ReportTitleTrans: TppLabel;
    RBLine7: TppLine;
    RBText20: TppLabel;
    RBText24: TppLabel;
    RBText25: TppLabel;
    RBText27: TppLabel;
    RBText28: TppLabel;
    RBText29: TppLabel;
    RBText30: TppLabel;
    ppDetailBand3: TppDetailBand;
    RBDBText16: TppDBText;
    RBDBText17: TppDBText;
    RBDBText18: TppDBText;
    RBDBText19: TppDBText;
    RBDBText20: TppDBText;
    RBDBText21: TppDBText;
    RBDBText22: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    RBText31: TppLabel;
    RBLine8: TppLine;
    ppSummaryBand3: TppSummaryBand;
    RBText33: TppLabel;
    RBText34: TppLabel;
    RBLine9: TppLine;
    RBText35: TppLabel;
    RBText36: TppLabel;
    RBText37: TppLabel;
    RBText38: TppLabel;
    ppParameterList3: TppParameterList;
    JITTransData: TppJITPipeline;
    ppField1: TppField;
    ppField2: TppField;
    ppField3: TppField;
    ppField4: TppField;
    ppField5: TppField;
    ppField6: TppField;
    SortRG: TcxRadioGroup;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    SCStartdate: TcxDateEdit;
    SCEndDate: TcxDateEdit;
    PeriodRG: TcxRadioGroup;
    cxButton1: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure PeriodRGClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure RBText9GetText(Sender: TObject; var Text: String);
    procedure TotalProductivityGetText(Sender: TObject; var Text: String);
    procedure RBDBCalc2GetValue(Sender: TObject; var theValue: Variant);
    procedure ClientReportBtnClick(Sender: TObject);
    function JITClientDataGetFieldValue(aFieldName: String): Variant;
    procedure JITClientDataGotoFirstRecord(Sender: TObject);
    procedure JITClientDataGotoLastRecord(Sender: TObject);
    function JITClientDataCheckEOF: Boolean;
    function JITClientDataGetActive: Boolean;
    procedure JITClientDataRecordPositionChange(Sender: TObject);
    procedure CTSALESGetText(Sender: TObject; var Text: String);
    procedure CTCOGSGetText(Sender: TObject; var Text: String);
    procedure CTGROSSGetText(Sender: TObject; var Text: String);
    procedure CTUNITSGetText(Sender: TObject; var Text: String);
    procedure CTRATEGetText(Sender: TObject; var Text: String);
    procedure TransreportBtnClick(Sender: TObject);
    function JITTransDataCheckEOF: Boolean;
    function JITTransDataGetFieldValue(aFieldName: String): Variant;
    procedure JITTransDataRecordPositionChange(Sender: TObject);
  private
    { Private declarations }
    ReportData : TList;
    ReportDataTotals : TReportRec;
    RData : TReportRecPtr;
    procedure LoadClientReportData;
    procedure SortReportData;
    procedure ReleaseReportData;
    procedure LoadTransReportData;
  public
    { Public declarations }
    ReportBaseFolder : String;
  end;

var
  SCReportsF: TSCReportsF;

implementation

{$R *.dfm}

Uses TariDataModule;

procedure TSCReportsF.FormCreate(Sender: TObject);
begin
  color := GGlobals.FormColour;
  SCStartdate.Properties.DisplayFormat := GGlobals.DateFENH;
  SCEnddate.Properties.DisplayFormat := GGlobals.DateFENH;
  SCStartdate.Date := GGlobals.TARIStartDate;
  SCEnddate.Date := GGlobals.TARIEndDate;
  ReportBaseFolder := GGlobals.BaseDir + 'Reports\';
end;

procedure TSCReportsF.PeriodRGClick(Sender: TObject);
var
  CurrentDayOfWeek : Integer;
  CurrentWeekStartDate, CurrentMonthStartDate : TDateTime;
begin
// Change Period Dates
  CurrentDayOfWeek := DayOfTheWeek(Now);
  if CurrentDayOfWeek = 7 then
    CurrentDayOfWeek := 0;
  if CurrentDayOfWeek > DMMYOBInterface.BusinessEndofWeekDay then
    CurrentWeekStartDate := trunc(now) - (CurrentDayOfWeek - DMMYOBInterface.BusinessEndofWeekDay)
  else
    CurrentWeekStartDate := trunc(now) - (CurrentDayOfWeek + 7 - DMMYOBInterface.BusinessEndofWeekDay);
  CurrentMonthStartDate := StartOfTheMonth(Now);
  if PeriodRg.Properties.Items[PeriodRG.ItemIndex].Tag = 20 then
    begin
    SCStartdate.Date := GGlobals.TARIStartDate;
    SCEnddate.Date := GGlobals.TARIEndDate;
    end
  else if PeriodRg.Properties.Items[PeriodRG.ItemIndex].Tag = 0 then
    begin
    SCStartdate.Date := CurrentWeekStartDate;
    SCEnddate.Date := Trunc(Now);
    end
  else if PeriodRg.Properties.Items[PeriodRG.ItemIndex].Tag = 1 then
    begin
    SCStartdate.Date := CurrentWeekStartDate - 7;
    SCEnddate.Date := CurrentWeekStartDate - 1;
    end
  else if PeriodRg.Properties.Items[PeriodRG.ItemIndex].Tag = 10 then
    begin
    SCStartdate.Date := CurrentMonthStartDate;
    SCEnddate.Date := Trunc(Now);
    end
  else if PeriodRg.Properties.Items[PeriodRG.ItemIndex].Tag = 11 then
    begin
    SCStartdate.Date := StartOfTheMonth(CurrentMonthStartDate - 1);
    SCEnddate.Date := CurrentMonthStartDate - 1;
  end;
end;

procedure TSCReportsF.cxButton1Click(Sender: TObject);
begin
  DMMYOBInterface.FBStaffReport.Params.ParamByName('STARTDATE').Value := SCStartdate.Date;
  DMMYOBInterface.FBStaffReport.Params.ParamByName('ENDDATE').Value := SCEnddate.Date;
  DMMYOBInterface.FBStaffPaidHours.Params.ParamByName('STARTDATE').Value := SCStartdate.Date;
  DMMYOBInterface.FBStaffPaidHours.Params.ParamByName('ENDDATE').Value := SCEnddate.Date;
  DMMYOBInterface.FBStaffPaidHours.Active := True;
  DMMYOBInterface.FBStaffReport.Active := True;
  BusinessName.Caption := TARIDM.Business_DetailsBUSINESS_NAME.Value;
  ReportTitle.Caption := 'TARI Staff Report - ' + formatDateTime(SCStartdate.Properties.DisplayFormat, SCStartdate.Date) + ' to ' + formatDateTime(SCEnddate.Properties.DisplayFormat, SCEnddate.Date);
  StaffReport.TextFileName := ReportBaseFolder + BusinessName.Caption + ' - TARI Staff Report' + '.pdf';
  StaffReport.Print;
  DMMYOBInterface.FBStaffReport.Active := False;
  DMMYOBInterface.FBStaffPaidHours.Active := False;
end;

procedure TSCReportsF.RBText9GetText(Sender: TObject; var Text: String);
var
  TheValue : Currency;
begin
  if (RBTOTALHOURS.Value <> VarNull) and (RBTOTALHOURS.Value <> 0)then
    TheValue := RBTOTALGP.Value / RBTOTALHOURS.Value
  else
    theValue := 0;
  Text := formatFloat('$,0.00;$(,0.00)', theValue);
end;

procedure TSCReportsF.TotalProductivityGetText(Sender: TObject; var Text: String);
var
  TheValue : Currency;
begin
  if (TOTALPAIDHOURS.Value <> null) and (TOTALPAIDHOURS.Value <> 0)then
    TheValue := RBTOTALHOURS.Value * 100 / TOTALPAIDHOURS.Value
  else
    theValue := 0;
  Text := formatFloat('0.0 %;(,0.0) %', theValue);
end;

procedure TSCReportsF.RBDBCalc2GetValue(Sender: TObject;
  var theValue: Variant);
begin
  // this is s fudge to ensure that the "Sum" of a sum in the report works OK. Variants with null don't
  // accumulate properly
  if theValue = null then
    thevalue := 0;
end;

procedure TSCReportsF.LoadClientReportData;
var
  RepData : TReportRecPtr;
begin
  if not assigned(ReportData) then
    ReportData := TList.create;
  ReportData.Clear;
  DMMYOBInterface.FBClientReport.Params.ParamByName('STARTDATE').Value := SCStartdate.Date;
  DMMYOBInterface.FBClientReport.Params.ParamByName('ENDDATE').Value := SCEnddate.Date;
  ReportDataTotals.NetSales := 0;
  ReportDataTotals.materials := 0;
  ReportDataTotals.Units := 0;

  DMMYOBInterface.FBClientReport.Active := True;
  DMMYOBInterface.FBClientReport.First;
  while DMMYOBInterface.FBClientReport.Eof = false do
    begin
    New(RepData);
    RepData.First_Name := DMMYOBInterface.FBClientReportFIRSTNAME.Value;
    RepData.Last_Name := DMMYOBInterface.FBClientReportLASTNAME.Value;
    RepData.Full_Name := RepData.First_Name + ' ' + RepData.Last_Name;
    RepData.Last_Date := DMMYOBInterface.FBClientReportLAST_DATE.Value;
    if DMMYOBInterface.FBClientReportSALES.Value <> null then
      RepData.NetSales := DMMYOBInterface.FBClientReportSALES.Value
    else
      RepData.NetSales := 0;
    if DMMYOBInterface.FBClientReportCOGS.Value <> null then
      RepData.materials := DMMYOBInterface.FBClientReportCOGS.Value
    else
      RepData.materials := 0;
    RepData.gross := RepData.NetSales - RepData.materials;
    if DMMYOBInterface.FBClientReportTOTAL_MINS.Value <> null then
      RepData.Units := DMMYOBInterface.FBClientReportTOTAL_MINS.Value / 60
    else
      RepData.Units := 0;
    if RepData.Units <> 0 then
      RepData.Rate := Trunc(RepData.gross * 100 / RepData.Units) / 100
    else
      RepData.Rate := 0;
    ReportDataTotals.NetSales := ReportDataTotals.NetSales + RepData.NetSales;
    ReportDataTotals.materials := ReportDataTotals.materials + RepData.materials;
    ReportDataTotals.Units := ReportDataTotals.Units + RepData.Units;
    ReportData.Add(RepData);
    DMMYOBInterface.FBClientReport.Next;
    end;    // while
  DMMYOBInterface.FBClientReport.Active := False;
  ReportDataTotals.gross := ReportDataTotals.NetSales - ReportDataTotals.materials;
  if ReportDataTotals.Units <> 0 then
    ReportDataTotals.Rate := Trunc(ReportDataTotals.gross * 100 / ReportDataTotals.Units) / 100
  else
    ReportDataTotals.Rate := 0;
  SortReportData;
  JITClientData.RecordCount := ReportData.Count;
end;

procedure TSCReportsF.SortReportData;

  function SortOnContribution(item1, Item2: pointer): integer;
  begin  // Highest contribution to the lowest
    if TReportRecPtr(item1).Rate > TReportRecPtr(item2).Rate
      then Result := -1
    else if TReportRecPtr(item1).Rate < TReportRecPtr(item2).Rate
      then Result := 1
    else begin
      result := 0;
    end;
  end;
  function SortOnGrossProfit(item1, Item2: pointer): integer;
  begin  // Greatest Revenue to the lowest
    if TReportRecPtr(item1).gross > TReportRecPtr(item2).gross
      then Result := -1
    else if TReportRecPtr(item1).Gross < TReportRecPtr(item2).Gross
      then Result := 1
    else begin
      result := 0;
    end;
  end;
begin
   case SortRG.ItemIndex of
   0: ReportData.Sort(@SortOnGrossProfit);
   1: ReportData.Sort(@SortOnContribution);
   end;
end;

procedure TSCReportsF.ReleaseReportData;
var
  I: Integer;
  LData : TReportRecPtr;
begin
  for I := 0 to ReportData.Count - 1 do    // Iterate
    begin
    LData := TReportRecPtr(ReportData.items[I]);
    dispose(LData);
    end;    // for
  ReportData.Destroy;
  ReportData := nil;
end;

procedure TSCReportsF.ClientReportBtnClick(Sender: TObject);
begin
  LoadClientReportData;
  BusinessNameClient.Caption := TARIDM.Business_DetailsBUSINESS_NAME.Value;
  ReportNameClients.Caption := 'Top Ranking Client Report - ' + formatDateTime(SCStartdate.Properties.DisplayFormat, SCStartdate.Date) + ' to ' + formatDateTime(SCEnddate.Properties.DisplayFormat, SCEnddate.Date);
  ClientReport.TextFileName := ReportBaseFolder + BusinessNameClient.Caption + ' - Top Ranking Client Report' + '.pdf';
  ClientReport.Print;
  ReleaseReportData;
end;

function TSCReportsF.JITClientDataGetFieldValue(
  aFieldName: String): Variant;
begin
  if Not Assigned(Rdata) then
    Rdata := TReportRecPtr(ReportData.items[JITClientData.RecordIndex]);
  If AFieldName = 'FULLNAME' then
    Result := RData.Full_Name;
  If AFieldName = 'SALES' then
    Result := FormatCurr( '$,0.00;$(,0.00)', RData.NetSales);
  IF AFieldName = 'COGS' then
    Result := Formatcurr( '$,0.00;$(,0.00)',RData.materials);
  IF AFieldName = 'GROSS' then
    Result := Formatcurr( '$,0.00;$(,0.00)',RData.gross);
  IF AFieldName = 'UNITS' then
    Result := Formatcurr( ',0.00;(,0.00)',RData.Units);
  IF AFieldName = 'RATE' then
    Result := Formatcurr( '$,0.00;$(,0.00)',RData.Rate);
  IF AFieldName = 'LAST_DATE' then
    Result := RData.Last_Date;
end;

procedure TSCReportsF.JITClientDataGotoFirstRecord(Sender: TObject);
begin
  Rdata := TReportRecPtr(ReportData.items[0]);
end;

procedure TSCReportsF.JITClientDataGotoLastRecord(Sender: TObject);
begin
  Rdata := TReportRecPtr(ReportData.items[ReportData.Count - 1]);
end;

function TSCReportsF.JITClientDataCheckEOF: Boolean;
begin
  if JITClientData.RecordIndex >= (ReportData.Count - 1) then
    Result := True
  else
    Result := False;
end;

function TSCReportsF.JITClientDataGetActive: Boolean;
begin
  Result := True;
end;

procedure TSCReportsF.JITClientDataRecordPositionChange(Sender: TObject);
begin
    Rdata := TReportRecPtr(ReportData.items[JITClientData.RecordIndex]);
end;

procedure TSCReportsF.CTSALESGetText(Sender: TObject; var Text: String);
begin
  Text := FormatCurr( '$,0.00;$(,0.00)', ReportDataTotals.NetSales);
end;

procedure TSCReportsF.CTCOGSGetText(Sender: TObject; var Text: String);
begin
  Text := Formatcurr( '$,0.00;$(,0.00)',ReportDataTotals.materials);
end;

procedure TSCReportsF.CTGROSSGetText(Sender: TObject; var Text: String);
begin
  Text := Formatcurr( '$,0.00;$(,0.00)',ReportDataTotals.gross);
end;

procedure TSCReportsF.CTUNITSGetText(Sender: TObject; var Text: String);
begin
  Text := Formatcurr( ',0.00;(,0.00)',ReportDataTotals.Units);
end;

procedure TSCReportsF.CTRATEGetText(Sender: TObject; var Text: String);
begin
  Text := Formatcurr( '$,0.00;$(,0.00)',ReportDataTotals.Rate);
end;

procedure TSCReportsF.TransreportBtnClick(Sender: TObject);
begin
  LoadTransReportData;
  BusinessNameTrans.Caption := TARIDM.Business_DetailsBUSINESS_NAME.Value;
  ReportTitleTrans.Caption := 'Top Ranking Transaction Report - ' + formatDateTime(SCStartdate.Properties.DisplayFormat, SCStartdate.Date) + ' to ' + formatDateTime(SCEnddate.Properties.DisplayFormat, SCEnddate.Date);
  TransReport.TextFileName := ReportBaseFolder + BusinessNameClient.Caption + ' - Top Ranking Transaction Report' + '.pdf';
  TransReport.Print;
  ReleaseReportData;
end;

procedure TSCReportsF.LoadTransReportData;
var
  RepData : TReportRecPtr;
begin
  if not assigned(ReportData) then
    ReportData := TList.create;
  ReportData.Clear;
  DMMYOBInterface.FBTransactionsReport.Params.ParamByName('STARTDATE').Value := SCStartdate.Date;
  DMMYOBInterface.FBTransactionsReport.Params.ParamByName('ENDDATE').Value := SCEnddate.Date;
  ReportDataTotals.NetSales := 0;
  ReportDataTotals.materials := 0;
  ReportDataTotals.Units := 0;

  DMMYOBInterface.FBTransactionsReport.Active := True;
  DMMYOBInterface.FBTransactionsReport.First;
  while DMMYOBInterface.FBTransactionsReport.Eof = false do
    begin
    New(RepData);
    RepData.First_Name := DMMYOBInterface.FBTransactionsReportFIRSTNAME.Value;
    RepData.Last_Name := DMMYOBInterface.FBTransactionsReportLASTNAME.Value;
    RepData.Full_Name := RepData.First_Name + ' ' + RepData.Last_Name;
    RepData.Trans_Date := DMMYOBInterface.FBTransactionsReportTRANS_DATE.Value;
    if DMMYOBInterface.FBTransactionsReportSALES.Value <> null then
      RepData.NetSales := DMMYOBInterface.FBTransactionsReportSALES.Value
    else
      RepData.NetSales := 0;
    if DMMYOBInterface.FBTransactionsReportCOGS.Value <> null then
      RepData.materials := DMMYOBInterface.FBTransactionsReportCOGS.Value
    else
      RepData.materials := 0;
    RepData.gross := RepData.NetSales - RepData.materials;
    if DMMYOBInterface.FBTransactionsReportTOTAL_MINS.Value <> null then
      RepData.Units := DMMYOBInterface.FBTransactionsReportTOTAL_MINS.Value / 60
    else
      RepData.Units := 0;
    if RepData.Units <> 0 then
      RepData.Rate := Trunc(RepData.gross * 100 / RepData.Units) / 100
    else
      RepData.Rate := 0;
    ReportDataTotals.NetSales := ReportDataTotals.NetSales + RepData.NetSales;
    ReportDataTotals.materials := ReportDataTotals.materials + RepData.materials;
    ReportDataTotals.Units := ReportDataTotals.Units + RepData.Units;
    ReportData.Add(RepData);
    DMMYOBInterface.FBTransactionsReport.Next;
    end;    // while
  DMMYOBInterface.FBTransactionsReport.Active := False;
  ReportDataTotals.gross := ReportDataTotals.NetSales - ReportDataTotals.materials;
  if ReportDataTotals.Units <> 0 then
    ReportDataTotals.Rate := Trunc(ReportDataTotals.gross * 100 / ReportDataTotals.Units) / 100
  else
    ReportDataTotals.Rate := 0;
  SortReportData;
  JITTransData.RecordCount := ReportData.Count;
end;


function TSCReportsF.JITTransDataCheckEOF: Boolean;
begin
  if JITTransData.RecordIndex >= (ReportData.Count - 1) then
    Result := True
  else
    Result := False;
end;

function TSCReportsF.JITTransDataGetFieldValue(
  aFieldName: String): Variant;
begin
  if Not Assigned(Rdata) then
    Rdata := TReportRecPtr(ReportData.items[JITClientData.RecordIndex]);
  If AFieldName = 'FULLNAME' then
    Result := RData.Full_Name;
  If AFieldName = 'SALES' then
    Result := FormatCurr( '$,0.00;$(,0.00)', RData.NetSales);
  IF AFieldName = 'COGS' then
    Result := Formatcurr( '$,0.00;$(,0.00)',RData.materials);
  IF AFieldName = 'GROSS' then
    Result := Formatcurr( '$,0.00;$(,0.00)',RData.gross);
  IF AFieldName = 'UNITS' then
    Result := Formatcurr( ',0.00;(,0.00)',RData.Units);
  IF AFieldName = 'RATE' then
    Result := Formatcurr( '$,0.00;$(,0.00)',RData.Rate);
  IF AFieldName = 'TRANS_DATE' then
    Result := RData.Trans_Date;

end;

procedure TSCReportsF.JITTransDataRecordPositionChange(Sender: TObject);
begin
    Rdata := TReportRecPtr(ReportData.items[JITTransData.RecordIndex]);
end;

end.
