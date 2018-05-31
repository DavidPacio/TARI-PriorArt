unit ReportingTracking;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, CustomPDFReport, TrackingPDFReports, Registry, printers,
	ComCtrls, auchtypes,  shellapi, dateUtils, ppCtrls, ppVar,
	ppBands, ppPrnabl, ppClass, ppStrtch,
  ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBJIT, ppModule,
  daDataModule, ppTypes, LGlobals,  {dxNavBarCollns,
  dxNavBarBase, dxNavBar, dxNavBarStyles,} ActnList, cxButtons, cxCheckListBox,
  cxDropDownEdit, cxMaskEdit, cxFontNameComboBox, cxNavigator,
  cxDBNavigator, cxTextEdit, cxDBEdit, cxControls, cxContainer, cxEdit,
  cxLabel, DMrep1U, cxCheckBox, cxCalendar, ExtCtrls, cxLookandFeelPainters,
  cxDBLabel, cxGroupBox, cxRadioGroup, cxGraphics,
  cxLookAndFeels, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinXmas2008Blue, Menus, ppParameter,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, dxCore,
  dxSkinsdxNavBarPainter, dxNavBarCollns, cxClasses, dxNavBarBase, dxNavBar,
  ppDesignLayer, ppPaintBox;

type
  TReportingTrackingF = class(TForm)
    ppJITPipeline1: TppJITPipeline;
    ppJITPipeline1ppField1: TppField;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    BusinessName: TppLabel;
    ReportTitle: TppLabel;
    rbDepartment: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    RbSortType: TppLabel;
    daDataModule1: TdaDataModule;
    cxLabel1: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBNavigator1: TcxDBNavigator;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    FontSelector: TcxFontNameComboBox;
    PreviewZoomCB: TcxComboBox;
    ReportOptionsList: TcxCheckListBox;
    DeptConsolidLabel: TcxLabel;
    cxLabel9: TcxLabel;
    DeptList: TcxCheckListBox;
    CloseBtn: TcxButton;
    ActionList1: TActionList;
    ActKeyIndicatorR: TAction;
    ActKeyIndicatorGR: TAction;
    ActDetailPNLR: TAction;
    ActDetailPNLGR: TAction;
    ActInvoiceGroupingR: TAction;
    ActTrackingPeriod: TAction;
    RBText1: TppLabel;
    RBLine1: TppLine;
    TARIText: TppLabel;
    GraphRepTypeRG: TcxRadioGroup;
    GroupLabel: TppLabel;
    ActKeyIndicTrend: TAction;
    ActCrossDeptR: TAction;
    Panel1: TPanel;
    cxLabel5: TcxLabel;
    PeriodCB: TcxComboBox;
    PEDatesCB: TcxComboBox;
    Panel2: TPanel;
    cxLabel12: TcxLabel;
    cxDBLabel1: TcxDBLabel;
    cxLabel4: TcxLabel;
    cxDBLabel2: TcxDBLabel;
    cxButton2: TcxButton;
    Panel3: TPanel;
    cxLabel6: TcxLabel;
    cxLabel11: TcxLabel;
    QuotesStartDate: TcxDateEdit;
    cxLabel13: TcxLabel;
    QuotesEndDate: TcxDateEdit;
    cxLabel7: TcxLabel;
    QuoteSortCB: TcxComboBox;
    RateCalcCB: TcxCheckBox;
    InvoiceDetailsCHK: TcxCheckBox;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBNavigator2: TcxDBNavigator;
    cxLabel10: TcxLabel;
    cxLabel15: TcxLabel;
    ConsolidationRG: TcxRadioGroup;
    DepartmentsRG: TcxRadioGroup;
    BusinessList: TcxCheckListBox;
    BusConsolidLabel: TcxLabel;
    cxLabel14: TcxLabel;
    AccountFmtCB: TcxCheckBox;
    dxNavBar2: TdxNavBar;
    dxNavBarGroup1: TdxNavBarGroup;
    dxNavBarGroup2: TdxNavBarGroup;
    KeyIndicatorItem: TdxNavBarItem;
    KeyIndicatorGraph: TdxNavBarItem;
    KeyIndicatorTrend: TdxNavBarItem;
    CrosDeptKeyIndicatorR: TdxNavBarItem;
    DetaiedPNLR: TdxNavBarItem;
    DetailedPNLRG: TdxNavBarItem;
    GroupingReport: TdxNavBarItem;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppPaintBox1: TppPaintBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PeriodCBChange(Sender: TObject);
    procedure PEDatesCBChange(Sender: TObject);
    procedure DeptListExit(Sender: TObject);
    procedure ppReport1BeforePrint(Sender: TObject);
    procedure ActKeyIndicatorRExecute(Sender: TObject);
    procedure ActKeyIndicatorGRExecute(Sender: TObject);
    procedure ActDetailPNLRExecute(Sender: TObject);
    procedure ActDetailPNLGRExecute(Sender: TObject);
    procedure ActInvoiceGroupingRExecute(Sender: TObject);
    procedure ActTrackingPeriodExecute(Sender: TObject);
    procedure ActKeyIndicTrendExecute(Sender: TObject);
    procedure ActCrossDeptRExecute(Sender: TObject);
    procedure BusinessListExit(Sender: TObject);
    procedure ConsolidationRGClick(Sender: TObject);
    procedure DepartmentsRGClick(Sender: TObject);
    procedure cxDBTextEdit1PropertiesChange(Sender: TObject);
    procedure AccountFmtCBPropertiesEditValueChanged(Sender: TObject);
    procedure ppPaintBox1Print(Sender: TObject);
  private
    LatestPeriod: Integer;
    NoofPeriods: Integer;
    MarksWerevisible: boolean;
    { Private declarations }
    Annualise : Boolean;
    Consolid : TConsolidateType;
    ReportMTitle : string;
    { Private declarations }
    function getPeriodStartDate(StartDate, EndDate: TDateTime): TDateTime;
    function GetAnnualFactor(startDate, enddate: TDateTime): Extended;
    function getShowAccumulation: Boolean;
    function CheckTrackDates: Boolean;
    procedure SetReportPreview(Rep : TppReport);
//    function ConsolidatedNameList: string;
    procedure SetGroupNames(FormName: TForm);
    procedure SetDeptList;
    procedure SetGroupDepartmentDetails(Sender: TObject);
  public
    { Public declarations }
  end;

var
  ReportingTrackingF: TReportingTrackingF;
  ReportingBaseFolder : string;
  directory, params  : array[0..200] of char;
  CurrentReport : TCustomReport;

implementation

{$R *.DFM}

uses DMClient, DataCollector, TrackGrep, TrackingPeriod;

procedure TReportingTrackingF.FormCreate(Sender: TObject);
var
//  DaysinYear: Integer;
//  I: Integer;
  J: Integer;
//  regfont : string;
//  MonitorDetail: TDetailedBalArray;
begin
//  FontSelector.RecentFonts.Add('Arial');
//  FontSelector.RecentFonts.Add('Times New Roman');
//  Color := GGlobals.FormColour;
//  mxOutlookBarPro1.Background.Color := Color;
  AccountFmtCB.Visible := GGlobals.Config_Accountingfmt;
  AccountFmtCB.Checked := GGlobals.Produce_AccountFmt;
  DMrep1.TariButtonList.GetImage(0, CloseBtn.Glyph);
  FontSelector.FontName := GGlobals.Reporting.ReportFont;
  for J := 0 to ReportOptionsList.Items.Count - 1 do    // Iterate
    begin
    if GGlobals.Reporting.TrackingOptionsList[J] > 0 then
      ReportOptionsList.Items.Items[J].State := cbsChecked
    else
      ReportOptionsList.Items.Items[J].State := cbsUnChecked;
    end;    // for
  ReportOptionsList.Refresh;
  MarksWerevisible := False;
  ReportingBaseFolder := GGlobals.Basedir + 'Reports\';
  strpcopy(directory, Reportingbasefolder);
  strpcopy(params, '');
	Caption := 'Report (Tracking) - '  + DataModuleClient.BusinessDetailsBusiness_Name.AsString;
  DataModuleClient.BusinessesRef.indexName := 'BUSINESS_BRANCH_NAME';
  SetGroupDepartmentDetails(sender);
end;

procedure TReportingTrackingF.SetGroupDepartmentDetails(Sender: TObject);
var
  J: Integer;
begin
  DataModuleClient.BusinessesRef.First;
  J := 0;
  BusinessList.Items.Clear;
  while DataModuleClient.BusinessesRef.eof = False do
    begin
		TcxCheckListBoxItems(BusinessList.Items).Add.Text := DataModuleClient.BusinessesRefBRANCH_NAME.AsString;
    if DataModuleClient.BusinessesRefEXCLUDE_FROM_REPORTING.value = 0 then
      BusinessList.items.Items[J].Checked := True
    else
      BusinessList.items.Items[J].Checked := False;
    DataModuleClient.BusinessesRef.next;
    inc(J);
  end;    // while

  SetDeptList;
  DataModuleClient.LookupSummaryIntervals.First;
  PeriodCB.Clear;
  while DataModuleClient.LookupSummaryIntervals.eof = False do
    begin
		PeriodCB.Properties.Items.Add(DataModuleClient.LookupSummaryIntervalsPeriod_Desc.AsString);
    DataModuleClient.LookupSummaryIntervals.Next;
    end;
  PeriodCB.ItemIndex := GGlobals.Reporting.ReportingPeriod;
  PreviewZoomCB.ItemIndex := GGlobals.Reporting.PreviewZoom;
  latestperiod := GGlobals.Reporting.ReportingDate;
  QuoteSortCB.ItemIndex := GGLobals.Reporting.GroupingSort;
  // Quotes Dates
  QuotesStartDate.Properties.MinDate := DataModuleClient.DepartmentsCURRENTMONITORINGSTART.Value;
  QuotesStartDate.Properties.MaxDate := DataModuleClient.DepartmentsCURRENTMONITORINGEND.Value;
  QuotesStartDate.Date := DataModuleClient.DepartmentsCURRENTMONITORINGSTART.Value;
  QuotesEndDate.Properties.MinDate := DataModuleClient.DepartmentsCURRENTMONITORINGSTART.Value;
  QuotesEndDate.Properties.MaxDate := DataModuleClient.DepartmentsCURRENTMONITORINGEND.Value;
  QuotesEndDate.Date := DataModuleClient.DepartmentsCURRENTMONITORINGEND.Value;
	cxLabel6.Caption := DataModuleClient.DepartmentsInvGroupName.AsString + ' Reporting';
	cxLabel7.caption := 'Sort ' + DataModuleClient.DepartmentsInvGroupName.AsString + ' by:';
	ActInvoiceGroupingR.Caption := 'Produce ' + DataModuleClient.DepartmentsInvGroupName.AsString + ' Report';
  if DataModuleClient.InvQuoteLU.Active = False then
    DataModuleClient.InvQuoteLU.Active := True;
//  DataModuleClient.ClearConsolidatedList;
  PeriodCBChange(Sender);
  ConsolidationRGClick(Sender);
end;

procedure TReportingTrackingF.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  I: Integer;
begin
  for I := 0 to ReportOptionsList.Items.Count - 1 do    // Iterate
    begin
    if ReportOptionsList.Items.Items[I].Checked then
      GGlobals.Reporting.TargetingOptionsList[I] := 1
    else
      GGlobals.Reporting.TargetingOptionsList[I] := 0;
    end;    // for
  GGlobals.Reporting.ReportFont := FontSelector.FontName;
  GGlobals.Reporting.ReportingPeriod := PeriodCB.ItemIndex;
  GGlobals.Reporting.PreviewZoom := PreviewZoomCB.ItemIndex;
  GGlobals.Reporting.GroupingSort := QuoteSortCB.ItemIndex;
  if PeriodCB.itemindex > 0 then
    GGlobals.Reporting.ReportingDate := SummaryPeriodIndexArray[PEDatesCB.ItemIndex]
  else
    GGlobals.Reporting.ReportingDate := PEDatesCB.ItemIndex;
end;

procedure TReportingTrackingF.PeriodCBChange(Sender: TObject);
var
  daysinyear : integer;
  I : integer;
begin
  PEDatesCB.Properties.items.clear;
  daysinyear := trunc(DataModuleClient.DepartmentsCurrentMonitoringEnd.value) - trunc(DataModuleClient.DepartmentsCurrentMonitoringStart.value);
  if PeriodCB.itemindex > 0 then
    begin
    NoofPeriods :=  createSummaryIndex(PeriodCB.itemindex, DataModuleClient.DepartmentsCurrentMonitoringStart.value, DataModuleClient.DepartmentsCurrentMonitoringEnd.value);
    for I := 0 to NoOfPeriods - 1 do    // Iterate
      PEDatesCB.Properties.items.add(formatDateTime(GGlobals.GetDateFENH, DataModuleClient.DepartmentsCurrentMonitoringStart.value + SummaryPeriodIndexArray[I]));
    i := 0;
    while (LatestPeriod > SummaryPeriodIndexArray[I]) and (I < NoofPeriods) do
      inc(I);
    PEDatesCB.itemindex := I;
    LatestPeriod := SummaryPeriodIndexArray[PEDatesCB.itemindex];
    end
  else
    begin
    NoofPeriods := Daysinyear;
    for I := 0 to NoOfPeriods do    // Iterate
      PEDatesCB.Properties.items.append(formatDateTime(GGlobals.GetDateFENH, DataModuleClient.DepartmentsCurrentMonitoringStart.value + I));
    PEDatesCB.ItemIndex := LatestPeriod;
    end;
end;

procedure TReportingTrackingF.PEDatesCBChange(Sender: TObject);
begin
  if PeriodCB.itemindex > 0 then
    LatestPeriod := SummaryPeriodIndexArray[PEDatesCB.itemindex]
  else
    LatestPeriod := PEDatesCB.itemindex;
end;

function TReportingTrackingF.getPeriodStartDate(StartDate, EndDate: TDateTime): TDateTime;
var
  i: Integer;
  NoofPeriods: integer;
begin
  if PeriodCB.itemindex > 0
    then begin
    NoofPeriods :=  createSummaryIndex(PeriodCB.itemindex, DataModuleClient.DepartmentsCurrentMonitoringStart.value, DataModuleClient.DepartmentsCurrentMonitoringEnd.value) + 1;
    i := 0;
    while (EndDate > (StartDate + SummaryPeriodIndexArray[I])) and (I < NoofPeriods) do
      inc(I);
    if I > 0 then
      Result := StartDate + SummaryPeriodIndexArray[I - 1] + 1
    else
      Result := StartDate;
  end
  else
    Result := EndDate;
end;

function TReportingTrackingF.GetAnnualFactor(startDate, enddate: TDateTime): Extended;
var
  NoofDays : integer;
begin
  NoofDays := round(EndDate - Startdate + 1);
  if (NoofDays > 360) and (NoofDays < 370) then
    Result := 1
  else
    Result := Noofdays / 365;
end;

function TReportingTrackingF.getShowAccumulation: Boolean;
var
  I, K: integer;
begin
  result := False;
  K := -99;
  for I := 0 to ReportOptionsList.Items.Count - 1 do    // Iterate
    begin
     if ReportOptionsList.Items.Items[I].DisplayName = 'Show Graphs Cumulatively' then
       K := I;
  end;    // for
  if (K < ReportOptionsList.Items.Count)
   then Result := ReportOptionsList.Items.Items[K].Checked;
end;

procedure TReportingTrackingF.DeptListExit(Sender: TObject);
var
  J : Integer;
begin
  DataModuleClient.DeptRef2.indexName := 'DEPTNAMEIDX';
  DataModuleClient.DeptRef2.First;
  j := 0;
  while DataModuleClient.DeptRef2.eof = False do
    begin
    if (DepartmentsRG.ItemIndex = 0) or ((DepartmentsRG.ItemIndex = 1) and (DataModuleClient.DeptRef2Branch_id.Value = DataModuleClient.BusinessesBranch_id.Value)) then
      begin
      DataModuleClient.DeptRef2.Edit;
      if DeptList.Items.Items[J].Checked = True then
        DataModuleClient.DeptRef2Exclude_from_Reporting.value := 0
      else
        DataModuleClient.DeptRef2Exclude_from_Reporting.value := 1;
      DataModuleClient.DeptRef2.Post;
      end;
    DataModuleClient.DeptRef2.next;
    inc(j);
    end;    // while
  DataModuleClient.departments.Refresh;
end;

function TReportingTrackingF.CheckTrackDates: Boolean;
begin
  result := True; // assume the best result   ;
  if DaysBetween(DataModuleClient.DepartmentsCURRENTMONITORINGEND.Value, DataModuleClient.DepartmentsCURRENTMONITORINGSTART.Value) > 366 then
    begin
    ShowMessage('Tracking Period Dates are greater than 366 days apart. Please correct.');
    Result := False;
    end;
  if DaysBetween(DataModuleClient.DepartmentsCURRENTPLANEND.AsDateTime, DataModuleClient.DepartmentsCURRENTPLANSTART.AsDateTime) > 366 then
    begin
    ShowMessage('Target Period Dates are greater than 366 days apart. Please correct.');
    Result := False;
    end;
end;

procedure TReportingTrackingF.ppPaintBox1Print(Sender: TObject);
begin
  ppPaintBox1.Canvas.StretchDraw(ppPaintBox1.spClipRect, TGraphic(CurrentReport.Metafiles[ppJITPipeline1.RecordIndex + 1]));
end;

procedure TReportingTrackingF.ppReport1BeforePrint(Sender: TObject);
var
  YYY : Single;
begin
  if not CurrentReport.prepared then
    begin
    BusinessName.Caption := CurrentReport.BusinessName;
    Businessname.Visible := True;
    Businessname.Width := ppReport1.PrinterSetup.PrintableWidth;
    ReportTitle.Caption := CurrentReport.ReportTitle;
    ReportTitle.Visible := true;
    ReportTitle.Width := ppReport1.PrinterSetup.PrintableWidth;
    SetGroupNames(ReportingTrackingF);
{    if CurrentReport.Consolidate in [CtBusiness, ctDepartment] then
      departmentDetail.Caption := 'Consolidated (' + ConsolidatedNameList + ')'
    else
      departmentDetail.Caption := CurrentReport.DepartmentName;
    if Length(departmentDetail.Caption) > 200 then
      departmentDetail.Font.Size := 8
    else
      departmentDetail.Font.Size := 10;
}
    rbDepartment.Width := ppreport1.PrinterSetup.PrintableWidth - GroupLabel.Left - rbDepartment.Left;
    rbDepartment.Visible := True;
    ppreport1.PrinterSetup.DocumentName := CurrentReport.BusinessName + ' - ' + CurrentReport.ReportName + '.pdf';
    ppreport1.PreviewForm.DisplayDocumentName := True;
    YYY := ppreport1.PrinterSetup.PrintableHeight - ppreport1.Header.Height - ppReport1.Footer.Height - 0.5;
    ppJITPipeline1.RecordCount := CurrentReport.Prepare(YYY, ppreport1, ppPaintBox1);
    ppPaintBox1.Height := ppreport1.PrinterSetup.PrintableHeight - ppreport1.Header.Height - ppReport1.Footer.Height - 0.5;
//   ppPaintBox1.Height := YYY;
    CurrentReport.prepared := True;
    end;
end;

procedure TReportingTrackingF.SetReportPreview(Rep : TppReport);
begin
if PreviewZoomCB.ItemIndex < 8 then
  begin
  Rep.PreviewFormSettings.ZoomSetting := zsPercentage;
  Rep.PreviewFormSettings.ZoomPercentage := ZoomValues[PreviewZoomCB.ItemIndex];
  end
else
  if PreviewZoomCB.ItemIndex = 8 then
    Rep.PreviewFormSettings.ZoomSetting := zsPageWidth
  else
    Rep.PreviewFormSettings.ZoomSetting := zsWholePage;
end;

procedure TReportingTrackingF.ActKeyIndicatorRExecute(Sender: TObject);
var
  I: Integer;
  cx : extended;
  colnum: Integer;
  Fname : String;
  Repcol : TRepColPtr;
  UseCol : Boolean;
  Save_Cursor:TCursor;
begin
  if not checktrackdates then exit;
  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crHourglass;    { Show hourglass cursor }

    Annualise := False;
    UseCol := False;
    for I := 0 to ReportOptionsList.Items.Count - 1 do    // Iterate
      begin
      if (ReportOptionsList.Items.Items[I].DisplayName = 'Use Color in Reports') and
        (ReportOptionsList.Items.Items[I].Checked) then UseCol := True;

      if (ReportOptionsList.Items.Items[I].DisplayName = 'Annualise Amounts') and
        (ReportOptionsList.Items.Items[I].Checked) then Annualise := True;

      end;    // for

    ReportMTitle := 'Tracking Key Indicator Report';
    TariText.Visible := True;
    QStartDate := DataModuleClient.DepartmentsCurrentMonitoringStart.value;
    QEndDate := QStartDate + Latestperiod;
    PeriodStartDate := getPeriodStartDate(QStartDate, QEndDate);
    TTrackingKeyReport(CurrentReport) := TTrackingKeyReport.create(Consolid, ReportMTitle, poLandscape);
		CurrentReport.businessName := DataModuleClient.BusinessDetailsBusiness_Name.AsString;
		CurrentReport.DepartmentName := DataModuleClient.DepartmentsRevenue_Group_Name.AsString;
    CurrentReport.ReportTitle := ReportMTitle;
		CurrentReport.Doctitle := DataModuleClient.BusinessDetailsBusiness_Name.AsString + ' - Tracking Key Indicator Report';
    Fname := CurrentReport.Doctitle + '.pdf';//fname;
    CurrentReport.UseColor := UseCol;

    cx := TITLEWIDTH;
    colnum := 1;
    new(RepCol);
    Repcol.Majorcol := colnum;
    repcol.Minorcol := 0;
    Repcol.Start := 0;
    RepCol.Width := cx;
    CurrentReport.Columnadd(Repcol);
    inc(Colnum);
    for I := 0 to 5 do    // Iterate
      begin
      new(RepCol);
      Repcol.Start := cx;
      Repcol.Majorcol := colnum;
      Repcol.Minorcol := 0;
      RepCol.Width := KEYINDICATORWIDTH;
      Repcol.DateIdx := 0;
      if I < 3 then
        RepCol.AnnualFactor := GetAnnualFactor(PeriodStartDate, QEndDate)
      else
        RepCol.AnnualFactor := GetAnnualFactor(QStartDate, QEndDate);
      if (I = 0) or (I = 3) then
        RepCol.Source := TRACK
      else if (I = 1) or (I = 4) then
        RepCol.Source := TARGET
      else
        RepCol.Source := VARIANCE;
      if I < 3 then
        RepCol.FromDate := FormatDateTime(GGlobals.getDateFENH, PeriodStartDate)
      else
        RepCol.FromDate := FormatDateTime(GGlobals.getDateFENH, QStartDate);
      RepCol.ToDate := FormatDateTime(GGlobals.getDateFENH, QEndDate);
      CurrentReport.Columnadd(Repcol);
      cx := cx + KEYINDICATORWIDTH;
      inc(Colnum);
    end;    // for
    CurrentReport.DetailWidth := cx;
    if FontSelector.Text <> '' then
      CurrentReport.CurrentFont := FontSelector.Text
    else
      CurrentReport.CurrentFont := 'Arial';

    ppreport1.Reset;
    ppreport1.PrinterSetup.Orientation := poPortrait;
    setReportPreview(ppReport1);
    if CurrentReport.DetailWidth > ppReport1.PrinterSetup.PrintableWidth then
      ppreport1.PrinterSetup.Orientation := poLandscape;
    rbLine1.Left := 8.0;
    rbline1.Width := ppReport1.PrinterSetup.PrintableWidth - 16.0;
    TariText.Left := (rbLine1.Width / 2) - 28;
    ppPaintBox1.Width := ppReport1.PrinterSetup.PrintableWidth - 16.0;
    ppSystemvariable2.Left := ppReport1.PrinterSetup.PrintableWidth - 8.0 - ppSystemVariable2.Width;
    // Set Default Options
    ppJITPipeline1.Open;
    ppJITPipeline1.First;
    ppreport1.AllowPrintToFile := True;
    ppreport1.ShowPrintDialog := True;
    ppReport1.DeviceType := 'Screen';
    ppReport1.TextFileName := ReportingBaseFolder + Fname;
    ppReport1.Print;
    CurrentReport.free;
  finally
    Screen.Cursor := Save_Cursor;  { Always restore to normal }
  end;
end;

procedure TReportingTrackingF.ActKeyIndicatorGRExecute(Sender: TObject);
var
  I: Integer;
  Fname : String;
  Save_Cursor:TCursor;
  PeriodTitle : String;
begin
  if not checktrackdates then exit;
  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crHourglass;    { Show hourglass cursor }
    KeyIndicator := True;
    GSummaryType := PeriodCB.ItemIndex;
    GStartDate := DataModuleClient.DepartmentsCurrentMonitoringStart.value;
    GEndDate := GStartDate + Latestperiod;
    GPeriodStartDate := getPeriodStartDate(GStartDate, GEndDate);
    GLatestPeriod := PEDatesCB.itemindex;
    GCumulative := getShowAccumulation;
    DataConsolidate := Consolid;
    for I := 0 to ReportOptionsList.Items.Count - 1 do    // Iterate
      begin
      if (ReportOptionsList.Items.Items[I].DisplayName = 'Annualise Amounts') and
        (ReportOptionsList.Items.Items[I].Checked) then
        Annualise := True;
      end;    // for
    Application.CreateForm(TTrackGRepF, TrackGRepF);

    if FontSelector.Text <> '' then
      TrackGRepF.ReportFont := FontSelector.Text
    else
      TrackGRepF.ReportFont := 'Arial';
    with TrackGRepF do
      begin
      Font.Name := ReportFont;
      Chart1.Chart.Title.Font.Name := ReportFont;
      Chart2.Chart.Title.Font.Name := ReportFont;
      Chart3.Chart.Title.Font.Name := ReportFont;
      RbCompanyName.Font.Name := ReportFont;
      RbDepartment.Font.Name := ReportFont;
      RbCompanyName1.Font.Name := ReportFont;
      RbDepartment1.Font.Name := ReportFont;
      ppSystemVariable1.Font.Name := ReportFont;
      ppSystemVariable2.Font.Name := ReportFont;
      ppSystemVariable3.Font.Name := ReportFont;
      ppSystemVariable4.Font.Name := ReportFont;
      end;    // with

    ReportMTitle := 'Detailed Tracking Key Indicator Graph Report';
    TrackGRepF.PTDTitle := formatDateTime('dd MMM', GperiodStartDate) + ' to ' + PEDatesCB.Text;
    TrackGRepF.YTDTitle := FormatDateTime('dd MMM',  DataModuleClient.DepartmentsCURRENTMONITORINGSTART.Value) + ' to ' + PEDatesCB.Text;
		Fname := DataModuleClient.BusinessDetailsBusiness_Name.AsString + ' - ' + ReportMTitle + '.pdf';//fname;
    Annualise := False;

		TrackGRepF.rbCompanyName.Caption := DataModuleClient.BusinessDetailsBusiness_Name.AsString;
		TrackGRepF.rbCompanyName1.Caption := DataModuleClient.BusinessDetailsBusiness_Name.AsString;
    TrackGRepF.UseColor := False;
    TrackGrepF.ThreeDImage := False;
    TrackGrepF.ShowMarks := False;
    for I := 0 to ReportOptionsList.Items.Count - 1 do    // Iterate
      begin
      if (ReportOptionsList.Items.Items[I].DisplayName = 'Use Color in Reports') and
        (ReportOptionsList.Items.Items[I].Checked) then TrackGRepF.UseColor := True;
      if (ReportOptionsList.Items.Items[I].DisplayName = '3D Graphs') and
        (ReportOptionsList.Items.Items[I].Checked) then
        TrackGrepF.ThreeDImage := True;
      if (ReportOptionsList.Items.Items[I].DisplayName = 'Values Visible') Then
        if (ReportOptionsList.Items.Items[I].Checked) and
        ((GraphRepTypeRG.ItemIndex > 0) or (PeriodCB.ItemIndex > 1)) then
        TrackGrepF.ShowMarks := True;
      end;    // for
    TrackGrepF.ReportType := GraphRepTypeRG.ItemIndex;
    SetGroupNames(TrackGrepF);
{    if DataConsolidate in [ctBusiness, ctDepartment]then
      begin
      TrackGRepF.rbDepartments.Caption := 'Consolidated (' + ConsolidatedNameList + ')';
      TrackGRepF.rbDepartments1.Caption := 'Consoldiated (' + ConsolidatedNameList + ')';
      end
    else
      begin
      TrackGRepF.rbDepartments.Caption := DataModuleClient.BusinessesBRANCH_NAME.Value + '/' + DataModuleClient.DepartmentsRevenue_Group_Name.Value;
      TrackGRepF.rbDepartments1.Caption := DataModuleClient.BusinessesBRANCH_NAME.Value + '/' + DataModuleClient.DepartmentsRevenue_Group_Name.Value;
//      TrackGRepF.rbDepartments.Caption := convertAccelCharToAmpersand(DataModuleClient.DepartmentsRevenue_Group_Name.Value);
//      TrackGRepF.rbDepartments1.Caption := convertAccelCharToAmpersand(DataModuleClient.DepartmentsRevenue_Group_Name.Value);
      end;
}
    if PeriodCB.ItemIndex < (PeriodCB.Properties.Items.Count - 1) then
      PeriodTitle := PeriodCB.text + ' '
    else
      PeriodTitle := '';
{    if length(TrackGRepF.rbDepartments.Caption) > 200 then
      begin
      TrackGRepF.rbDepartments.Font.Size := 8;
      TrackGRepF.rbDepartments1.Font.Size := 8;
      end
    else
      begin
      TrackGRepF.rbDepartments.Font.Size := 10;
      TrackGRepF.rbDepartments1.Font.Size := 10;
      end;
}
    TrackGrepF.RbReportTitle.Caption := 'Detailed ' + PeriodTitle + 'Tracking Key Indicator Graph Report'
      + #13#10 + 'From ' + formatdateTime(GGlobals.DateFENH, DataModuleClient.DepartmentsCURRENTMONITORINGSTART.value)
      + ' to ' + FormatDateTime(GGlobals.DateFENH, DataModuleClient.DepartmentsCURRENTMONITORINGEND.value);
    TrackGrepF.RbReportTitle1.Caption := TrackGrepF.RbReportTitle.Caption;
    TrackGRepF.GetNumberRecords;

//    if PeriodCB.ItemIndex < (PeriodCB.items.Count - 1) then
//      PeriodTitle := PeriodCB.text + ' '
//    else
//      PeriodTitle := '';
//    TrackGRepF.DetailedReportingPeriod := PeriodCB.ItemIndex;
    if TrackGrepF.ReportType < 2 then
      begin
      TrackGRepF.rbDepartment.Width := TrackGRepF.ppreport1.PrinterSetup.PrintableWidth - TrackGRepF.GroupLabel.Left - TrackGRepF.rbDepartment.Left;
      TrackGRepF.ppreport1.AllowPrintToFile := True;
      TrackGRepF.ppreport1.ShowPrintDialog := True;
      setReportPreview(TrackGRepF.ppReport1);
      TrackGRepF.ppReport1.TextFileName := ReportingBaseFolder + fname;
      TrackGRepF.ppReport1.DeviceType := 'Screen';
      TrackGRepF.ppreport1.print;
      end
    else
      begin
      TrackGRepF.rbDepartment1.Width := TrackGRepF.ppreport2.PrinterSetup.PrintableWidth - TrackGRepF.GroupLabel1.Left - TrackGRepF.rbDepartment1.Left;
      TrackGRepF.ppreport2.AllowPrintToFile := True;
      TrackGRepF.ppreport2.ShowPrintDialog := True;
      setReportPreview(TrackGRepF.ppReport2);
      TrackGRepF.ppReport2.TextFileName := ReportingBaseFolder + fname;
      TrackGRepF.ppReport2.DeviceType := 'Screen';
      TrackGRepF.ppreport2.print;
      end;
    TrackGRepF.Free;
  finally
    Screen.Cursor := Save_Cursor;  { Always restore to normal }
  end;
end;

procedure TReportingTrackingF.ActDetailPNLRExecute(Sender: TObject);
var
  I: Integer;
  cx : extended;
  colnum: Integer;
  Fname : String;
  Repcol : TRepColPtr;
  UseCol : Boolean;
  Save_Cursor:TCursor;
begin
  if not checktrackdates then exit;
  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crHourglass;    { Show hourglass cursor }
    Annualise := False;
    UseCol := False;
    for I := 0 to ReportOptionsList.Items.Count - 1 do    // Iterate
    begin
      if (ReportOptionsList.Items.Items[I].DisplayName = 'Use Color in Reports') and
        (ReportOptionsList.Items.Items[I].Checked) then UseCol := True;

      if (ReportOptionsList.Items.Items[I].DisplayName = 'Annualise Amounts') and
        (ReportOptionsList.Items.Items[I].Checked) then Annualise := True;
    end;    // for

    ReportMTitle := 'Tracking Profit and Loss Report';
    TARIText.Visible := False;
    QStartDate := DataModuleClient.DepartmentsCurrentMonitoringStart.value;
    QEndDate := QStartDate + Latestperiod;
    PeriodStartDate := getPeriodStartDate(QStartDate, QEndDate);
    TTrackingDPLReport(CurrentReport) := TTrackingDPLReport.create(Consolid, ReportMTitle, poLandscape);
    Currentreport.AccountingFmt := GGlobals.Produce_AccountFmt;
		CurrentReport.businessName := DataModuleClient.BusinessDetailsBusiness_Name.AsString;
		CurrentReport.DepartmentName := DataModuleClient.DepartmentsRevenue_Group_Name.AsString;
    CurrentReport.ReportTitle := ReportMTitle;
		CurrentReport.Doctitle := DataModuleClient.BusinessDetailsBusiness_Name.AsString + ' - Tracking Profit and Loss Report';
    Fname := CurrentReport.Doctitle + '.pdf';//fname;
    CurrentReport.UseColor := UseCol;

    cx := TITLEWIDTH;
    colnum := 1;
    new(RepCol);
    Repcol.Majorcol := colnum;
    repcol.Minorcol := 0;
    Repcol.Start := 0;
    RepCol.Width := cx;
    CurrentReport.Columnadd(Repcol);
    inc(Colnum);
    for I := 0 to 5 do    // Iterate
      begin
      new(RepCol);
      Repcol.Start := cx;
      Repcol.Majorcol := colnum;
      Repcol.Minorcol := 0;
      RepCol.Width := DOLLARWIDTH;
      Repcol.DateIdx := 0;
      if I < 3 then
        RepCol.AnnualFactor := GetAnnualFactor(PeriodStartDate, QEndDate)
      else
        RepCol.AnnualFactor := GetAnnualFactor(QStartDate, QEndDate);
      if (I = 0) or (I = 3) then
        RepCol.Source := TRACK
      else if (I = 1) or (I = 4) then
        RepCol.Source := TARGET
      else
        RepCol.Source := VARIANCE;
      if I < 3 then
        RepCol.FromDate := FormatDateTime(GGlobals.GetDateFENH, PeriodStartDate)
      else
        RepCol.FromDate := FormatDateTime(GGlobals.GetDateFENH, QStartDate);
      RepCol.ToDate := FormatDateTime(GGlobals.GetDateFENH, QEndDate);
      CurrentReport.Columnadd(Repcol);
      cx := cx + DOLLARWIDTH;
      inc(Colnum);
    end;    // for
    CurrentReport.DetailWidth := cx;
    if FontSelector.Text <> '' then
      CurrentReport.CurrentFont := FontSelector.Text
    else
      CurrentReport.CurrentFont := 'Arial';

    ppreport1.Reset;
    ppreport1.PrinterSetup.Orientation := poPortrait;
    setReportPreview(ppReport1);
    if CurrentReport.DetailWidth > ppReport1.PrinterSetup.PrintableWidth then
      ppreport1.PrinterSetup.Orientation := poLandscape;
    rbLine1.Left := 8.0;
    rbline1.Width := ppReport1.PrinterSetup.PrintableWidth - 16.0;
    ppPaintBox1.Width := ppReport1.PrinterSetup.PrintableWidth - 16.0;
    ppSystemvariable2.Left := ppReport1.PrinterSetup.PrintableWidth - 8.0 - ppSystemVariable2.Width;
    // Set Default Options
    ppJITPipeline1.Open;
    ppJITPipeline1.First;
    ppreport1.AllowPrintToFile := True;
    ppreport1.ShowPrintDialog := True;
    ppReport1.DeviceType := 'Screen';
    ppReport1.TextFileName := ReportingBaseFolder + Fname;
    ppReport1.Print;
    CurrentReport.free;
  finally
    Screen.Cursor := Save_Cursor;  { Always restore to normal }
  end;
end;

procedure TReportingTrackingF.ActDetailPNLGRExecute(Sender: TObject);
var
  I: Integer;
//  cx : extended;
  Fname : String;
  Save_Cursor:TCursor;
  PeriodTitle : String;
begin
  if not checktrackdates then exit;
  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crHourglass;    { Show hourglass cursor }
    KeyIndicator := False;
    GSummaryType := PeriodCB.ItemIndex;
    GStartDate := DataModuleClient.DepartmentsCurrentMonitoringStart.value;
    GEndDate := GStartDate + Latestperiod;
    GPeriodStartDate := getPeriodStartDate(GStartDate, GEndDate);
    GLatestPeriod := PEDatesCB.itemindex;
    GCumulative := getShowAccumulation;
    DataConsolidate := Consolid;
    for I := 0 to ReportOptionsList.Items.Count - 1 do    // Iterate
      begin
      if (ReportOptionsList.Items.Items[I].DisplayName = 'Annualise Amounts') and
        (ReportOptionsList.Items.Items[I].Checked) then
        Annualise := True;
      end;    // for

    Application.CreateForm(TTrackGRepF, TrackGRepF);

    if FontSelector.Text <> '' then
      TrackGRepF.ReportFont := FontSelector.Text
    else
      TrackGRepF.ReportFont := 'Arial';
    with TrackGRepF do
      begin
      Font.Name := ReportFont;
      Chart1.Chart.Title.Font.Name := ReportFont;
      Chart2.Chart.Title.Font.Name := ReportFont;
      Chart3.Chart.Title.Font.Name := ReportFont;
      RbCompanyName.Font.Name := ReportFont;
      RbDepartment.Font.Name := ReportFont;
      RbCompanyName1.Font.Name := ReportFont;
      RbDepartment1.Font.Name := ReportFont;
//      RbQRLabel2.Font.Name := ReportFont;
      ppSystemVariable1.Font.Name := ReportFont;
      ppSystemVariable2.Font.Name := ReportFont;
//      rbPageDateTime.Font.Name := ReportFont;
      end;    // with
    ReportMTitle := 'Detailed Tracking Profit and Loss Graph Report';
    TrackGRepF.PTDTitle := formatDateTime('dd MMM', GperiodStartDate) + ' to ' + PEDatesCB.Text;
    TrackGRepF.YTDTitle := FormatDateTime('dd MMM',  DataModuleClient.DepartmentsCURRENTMONITORINGSTART.Value) + ' to ' + PEDatesCB.Text;
		Fname := DataModuleClient.BusinessDetailsBusiness_Name.AsString + ' - ' + ReportMTitle + '.pdf';//fname;
    Annualise := False;
		TrackGRepF.rbCompanyName.Caption := DataModuleClient.BusinessDetailsBusiness_Name.AsString;
		TrackGRepF.rbCompanyName1.Caption := DataModuleClient.BusinessDetailsBusiness_Name.AsString;
    TrackGRepF.UseColor := False;
    TrackGrepF.ThreeDImage := False;
    TrackGrepF.ShowMarks := False;
    for I := 0 to ReportOptionsList.Items.Count - 1 do    // Iterate
      begin
      if (ReportOptionsList.Items.Items[I].DisplayName = 'Use Color in Reports') and
        (ReportOptionsList.Items.Items[I].Checked) then TrackGRepF.UseColor := True;
      if (ReportOptionsList.Items.Items[I].DisplayName = '3D Graphs') and
        (ReportOptionsList.Items.Items[I].Checked) then
        TrackGrepF.ThreeDImage := True;
      if (ReportOptionsList.Items.Items[I].DisplayName = 'Values Visible') Then
        if (ReportOptionsList.Items.Items[I].Checked) and
        ((GraphRepTypeRG.ItemIndex > 0) or (PeriodCB.ItemIndex > 1)) then
        TrackGrepF.ShowMarks := True;
      end;    // for

    SetGroupNames(TrackGrepF);
{    if DataConsolidate in [ctBusiness, ctDepartment]then
      begin
      TrackGRepF.rbDepartments.Caption := 'Consolidated (' + ConsolidatedNameList + ')';
      TrackGRepF.rbDepartments1.Caption := 'Consolidated (' + ConsolidatedNameList + ')';
      end
    else
      begin
      TrackGRepF.rbDepartments.Caption := DataModuleClient.BusinessesBRANCH_NAME.Value + '/' + DataModuleClient.DepartmentsRevenue_Group_Name.Value;
      TrackGRepF.rbDepartments1.Caption := DataModuleClient.BusinessesBRANCH_NAME.Value + '/' + DataModuleClient.DepartmentsRevenue_Group_Name.Value;
//      TrackGRepF.rbDepartments.Caption := convertAccelCharToAmpersand(DataModuleClient.DepartmentsRevenue_Group_Name.Value);
//      TrackGRepF.rbDepartments1.Caption := convertAccelCharToAmpersand(DataModuleClient.DepartmentsRevenue_Group_Name.Value);
      end;

    if length(TrackGRepF.rbDepartments.Caption) > 200 then
      begin
      TrackGRepF.rbDepartments.Font.Size := 8;
      TrackGRepF.rbDepartments1.Font.Size := 8;
      end
    else
      begin
      TrackGRepF.rbDepartments.Font.Size := 10;
      TrackGRepF.rbDepartments1.Font.Size := 10;
      end;
}
    if PeriodCB.ItemIndex < (PeriodCB.Properties.items.Count - 1) then
      PeriodTitle := PeriodCB.text + ' '
    else
      PeriodTitle := '';
    TrackGrepF.RbReportTitle.Caption := 'Detailed ' + PeriodTitle + 'Tracking Profit and Loss Graph Report'
      + #13#10 + 'From ' + formatdateTime(GGlobals.DateFENH, DataModuleClient.DepartmentsCURRENTMONITORINGSTART.value)
      + ' to ' + FormatDateTime(GGlobals.DateFENH, DataModuleClient.DepartmentsCURRENTMONITORINGEND.value);
    TrackGrepF.RbReportTitle1.Caption := TrackGrepF.RbReportTitle.Caption;
    TrackGrepF.ReportType := GraphRepTypeRG.ItemIndex;
    TrackGRepF.GetNumberRecords;
    if TrackGrepF.ReportType < 2 then
      begin
      TrackGRepF.rbDepartment.Width := TrackGRepF.ppreport1.PrinterSetup.PrintableWidth - TrackGRepF.GroupLabel.Left - TrackGRepF.rbDepartment.Left;
      TrackGRepF.ppreport1.AllowPrintToFile := True;
      TrackGRepF.ppreport1.ShowPrintDialog := True;
      setReportPreview(TrackGRepF.ppReport1);
      TrackGRepF.ppReport1.TextFileName := ReportingBaseFolder + fname;
      TrackGRepF.ppReport1.DeviceType := 'Screen';
      TrackGRepF.ppreport1.print;
      end
    else
      begin
      TrackGRepF.rbDepartment1.Width := TrackGRepF.ppreport2.PrinterSetup.PrintableWidth - TrackGRepF.GroupLabel1.Left - TrackGRepF.rbDepartment1.Left;
      TrackGRepF.ppreport2.AllowPrintToFile := True;
      TrackGRepF.ppreport2.ShowPrintDialog := True;
      setReportPreview(TrackGRepF.ppReport2);
      TrackGRepF.ppReport2.TextFileName := ReportingBaseFolder + fname;
      TrackGRepF.ppReport2.DeviceType := 'Screen';
      TrackGRepF.ppreport2.print;
      end;
    TrackGRepF.Free;
  finally
    Screen.Cursor := Save_Cursor;  { Always restore to normal }
  end;
end;

procedure TReportingTrackingF.ActInvoiceGroupingRExecute(Sender: TObject);
var
  I: Integer;
  cx : extended;
  Fname : String;
  Repcol : TRepColPtr;
//  QuoteRep : TQuotesReport;
  UseCol : Boolean;
  Save_Cursor:TCursor;
begin
  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crHourglass; { Show hourglass cursor }
    GGlobals.TimeSheetRate := RateCalcCB.Checked;
    Annualise := False;
    UseCol := False;
    for I := 0 to ReportOptionsList.Items.Count - 1 do    // Iterate
      begin
      if (ReportOptionsList.Items.Items[I].DisplayName = 'Use Color in Reports') and
        (ReportOptionsList.Items.Items[I].Checked) then UseCol := True;

      end;    // for
		ReportMTitle := 'Listing of ' + DataModuleClient.DepartmentsInvGroupName.AsString + ' Report';
    QStartDate := QuotesStartDate.Date;
    QEndDate := QuotesEndDate.Date;
    TQuotesReport(CurrentReport) := TQuotesReport.create(Consolid, ReportMTitle, poLandscape);
		CurrentReport.businessName := DataModuleClient.BusinessDetailsBusiness_Name.AsString;
		CurrentReport.DepartmentName := DataModuleClient.DepartmentsRevenue_Group_Name.AsString;
    DataCollect.SortQuotes(TQuoteSortType(QuoteSortCB.ItemIndex));
    QuoteSortType := TQuoteSortType(QuoteSortCB.ItemIndex);
    CurrentReport.ReportTitle := ReportMTitle + #13#10
      +  'For the period ' + FormatDateTime(GGlobals.DateFENH, QStartDate) + ' to ' + FormatDateTime(GGlobals.DateFENH, QEndDate);
    rbSortType.Visible := True;
    case QuoteSortType of    //
      qstQuoteNumber: RbSortType.Caption := '(Sorted by Group ID)';
      qstCustomerName: RbSortType.Caption := '(Sorted by ' + 'Customer / Name / Product';
      qstDate: RbSortType.Caption := '(Sorted by Group Date)';
      qstSales: RbSortType.Caption := '(Sorted by Group Sales Target)';
      qstGPPC: RbSortType.Caption := '(Sorted by Group Gross Profit %)';
      qstAverageRate: RbSortType.Caption := '(Sorted by Group GP Rate)';
			qstHours: RbSortType.Caption := '(Sorted by Group '+ DataModuleClient.DepartmentsPlural_UnitDesc.AsString + ')';
    end;    // case

		CurrentReport.Doctitle := DataModuleClient.BusinessDetailsBusiness_Name.AsString + ' - Tracking ' + DataModuleClient.DepartmentsInvGroupName.AsString;
    Fname := CurrentReport.Doctitle + '.pdf';//fname;
    CurrentReport.UseColor := UseCol;

    ShowDetail := InvoiceDetailsChk.checked;

    cx := 0;
    for I := 1 to 9 do    // Iterate
      begin
      new(RepCol);
      Repcol.Majorcol := I;
      repcol.Minorcol := 0;
      Repcol.Start := cx;
      if I = 1  then
        RepCol.Width := QUOTESREPCOL1
      else
        RepCol.Width := QUOTESREPCOLS;
      cx := cx + RepCol.Width;
      CurrentReport.Columnadd(Repcol);
    end;    // for
    CurrentReport.DetailWidth := cx;
    if FontSelector.Text <> '' then
      CurrentReport.CurrentFont := FontSelector.Text
    else
      CurrentReport.CurrentFont := 'Arial';

    ppreport1.Reset;
    ppreport1.PrinterSetup.Orientation := poPortrait;
    setReportPreview(ppReport1);
    if CurrentReport.DetailWidth > ppReport1.PrinterSetup.PrintableWidth then
      ppreport1.PrinterSetup.Orientation := poLandscape;
    rbLine1.Left := 8.0;
    ppSystemVariable1.Left := 8.0;
//    DepartmentDetail.Left := 8.0;
    rbline1.Width := ppReport1.PrinterSetup.PrintableWidth - 16.0;
    ppPaintBox1.Width := ppReport1.PrinterSetup.PrintableWidth - 16.0;
    rbSortType.Left := ppReport1.PrinterSetup.PrintableWidth - rbSortType.Width - 8.0;
    ppSystemvariable2.Left := ppReport1.PrinterSetup.PrintableWidth - ppSystemVariable2.Width - 8.0;
    // Set Default Options
    ppJITPipeline1.Open;
    ppJITPipeline1.First;
    ppreport1.AllowPrintToFile := True;
    ppreport1.ShowPrintDialog := True;
    ppReport1.DeviceType := 'Screen';
    ppReport1.TextFileName := ReportingBaseFolder + Fname;
    ppReport1.Print;
    CurrentReport.free;
  finally
    Screen.Cursor := Save_Cursor;  { Always restore to normal }
  end;
end;

procedure TReportingTrackingF.ActTrackingPeriodExecute(Sender: TObject);
begin
  Application.CreateForm(TTrackingPeriodF, TrackingPeriodF);
  TrackingPeriodF.showmodal;
  TrackingPeriodF.free;
end;

{
function TReportingTrackingF.ConsolidatedNameList: string;
var
  J: Integer;
begin
  result := '';
  DataModuleClient.DeptRef2.indexName := 'DEPTNAMEIDX';
  DataModuleClient.DeptRef2.First;
  j := 0;
  while DataModuleClient.DeptRef2.eof = False do
    begin
    if DataModuleClient.DeptRef2Exclude_from_Reporting.value = 0 then
      begin
      if J > 0 then
        Result := Result + ', ';
      Result := Result + DataModuleClient.DeptRef2REVENUE_GROUP_NAME.Value;
//      Result := Result + convertAccelCharToAmpersand(DataModuleClient.DeptRef2REVENUE_GROUP_NAME.Value);
      inc(j);
      end;
    DataModuleClient.DeptRef2.next;
    end;    // while
end;
}
{
procedure TReportingTargetsF.ActDetKeyIndicExecute(Sender: TObject);
var
  I: Integer;
  Fname : String;
  useCol : Boolean;
  Save_Cursor:TCursor;
  PeriodTitle : String;
  WrapChars : string;
begin
  if not CheckPlandates(False) then exit;
  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crHourglass;   //  Show hourglass cursor

//    PdfPtr.FileNameOptions := NoPrompt + UseFileName;
    Annualise := False;
    UseCol := False;
    for I := 0 to ReportOptionsList.Items.Count - 1 do    // Iterate
      begin
      if (ReportOptionsList.Items.Items[I].DisplayName = 'Use Color in Reports') and
        (ReportOptionsList.items.Items[I].Checked) then UseCol := True;

      if (ReportOptionsList.Items.Items[I].DisplayName = 'Annualise Amounts') and
        (ReportOptionsList.items.Items[I].Checked) then Annualise := True;

      end;    // for

    if PeriodCB.ItemIndex < (PeriodCB.Properties.items.Count - 1) then
      PeriodTitle := PeriodCB.text + ' '
    else
      PeriodTitle := '';
    ReportMTitle := 'Detailed ' + PeriodTitle + 'Target Key Targets Report';
    TARIText.Visible := True;
    TKeyTargetReport(CurrentReport) := TKeyTargetReport.create(Consolid, ReportMTitle, poLandscape);
    CurrentReport.businessName := DataModuleClient.BusinessDetailsBusiness_Name.value;
    CurrentReport.DepartmentName := DataModuleClient.DepartmentsRevenue_Group_Name.Value;
    CurrentReport.Doctitle := DataModuleClient.BusinessDetailsBusiness_Name.value + ' - Detailed Target Key Targets Report';
    Fname := CurrentReport.Doctitle + '.pdf';//fname;
    CurrentReport.UseColor := UseCol;
    TKeyTargetReport(Currentreport).DetailedReportingPeriod := PeriodCB.ItemIndex;

    if FontSelector.Text <> '' then
      Currentreport.CurrentFont := FontSelector.Text
    else
      CurrentReport.CurrentFont := 'Arial';

    TKeyTargetReport(CurrentReport).CheckColumns;
    ppreport1.Reset;
    setReportPreview(ppReport1);
    ppreport1.PrinterSetup.Orientation := poPortrait;
    WrapChars := #13#10;
    if CurrentReport.DetailWidth > ppReport1.PrinterSetup.PrintableWidth then
      begin
      ppreport1.PrinterSetup.Orientation := poLandscape;
      WrapChars := '';
      end;
    CurrentReport.ReportTitle := ReportMTitle + Wrapchars + ' for the period ending '
   + FormatDateTime('dd MMM yyy', DataModuleClient.DepartmentsCurrentPlanEnd.value);
    rbLine1.Left := 8;
    rbLine1.Width := ppReport1.PrinterSetup.PrintableWidth - 16.0;
    TARIText.Left := (rbLine1.Width / 2) - 28;
    ppTWPaintbox1.Width := ppReport1.PrinterSetup.PrintableWidth - 16.0;
    ppSystemvariable2.Left := ppReport1.PrinterSetup.PrintableWidth - 8.0 - ppSystemVariable2.Width;
    // Set Default Options
    ppJITPipeline1.Open;
    ppJITPipeline1.First;
    ppreport1.AllowPrintToFile := True;
    ppreport1.ShowPrintDialog := True;
    ppReport1.DeviceType := 'Screen';
    ppReport1.TextFileName := ReportingBaseFolder + Fname;
    ppReport1.Print;
    CurrentReport.free;
  finally
    Screen.Cursor := Save_Cursor;  // Always restore to normal
  end;
end;
}

procedure TReportingTrackingF.ActKeyIndicTrendExecute(Sender: TObject);
var
  I: Integer;
  Fname : String;
  useCol : Boolean;
  Save_Cursor:TCursor;
  PeriodTitle : String;
  WrapChars : string;
begin
  if not CheckTrackDates then exit;
  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crHourglass;   //  Show hourglass cursor

//    PdfPtr.FileNameOptions := NoPrompt + UseFileName;
    Annualise := False;
    UseCol := False;
    for I := 0 to ReportOptionsList.Items.Count - 1 do    // Iterate
      begin
      if (ReportOptionsList.Items.Items[I].DisplayName = 'Use Color in Reports') and
        (ReportOptionsList.items.Items[I].Checked) then UseCol := True;

      if (ReportOptionsList.Items.Items[I].DisplayName = 'Annualise Amounts') and
        (ReportOptionsList.items.Items[I].Checked) then Annualise := True;

      end;    // for

    if PeriodCB.ItemIndex < (PeriodCB.Properties.items.Count - 1) then
      PeriodTitle := PeriodCB.text + ' '
    else
      PeriodTitle := '';
    ReportMTitle := 'Detailed ' + PeriodTitle + ' Key Indicator Trend Report';
    TariText.Visible := True;
    SummaryType := PeriodCB.ItemIndex;
    QStartDate := DataModuleClient.DepartmentsCurrentMonitoringStart.value;
    QEndDate := QStartDate + Latestperiod;
    PeriodStartDate := getPeriodStartDate(QStartDate, QEndDate);
    TKeyTrendReport(CurrentReport) := TKeyTrendReport.create(Consolid, ReportMTitle, poLandscape);
		CurrentReport.businessName := DataModuleClient.BusinessDetailsBusiness_Name.AsString;
		CurrentReport.DepartmentName := DataModuleClient.DepartmentsRevenue_Group_Name.AsString;
    CurrentReport.Doctitle := DataModuleClient.BusinessDetailsBusiness_Name.AsString + ' - Key Indicator Trend Report';
    Fname := CurrentReport.Doctitle + '.pdf';//fname;
    CurrentReport.UseColor := UseCol;
    TKeyTrendReport(Currentreport).DetailedReportingPeriod := PeriodCB.ItemIndex;

    if FontSelector.Text <> '' then
      Currentreport.CurrentFont := FontSelector.Text
    else
      CurrentReport.CurrentFont := 'Arial';

    TKeyTrendReport(CurrentReport).CheckColumns;

    ppreport1.Reset;
    setReportPreview(ppReport1);
    ppreport1.PrinterSetup.Orientation := poPortrait;
    WrapChars := #13#10;
    if CurrentReport.DetailWidth > ppReport1.PrinterSetup.PrintableWidth then
      begin
      ppreport1.PrinterSetup.Orientation := poLandscape;
      WrapChars := '';
      end;
    CurrentReport.ReportTitle := ReportMTitle + Wrapchars + ' for the period ending '
   + FormatDateTime('dd MMM yyy', DataModuleClient.DepartmentsCURRENTMONITORINGEND.value);
    rbLine1.Left := 8;
    rbLine1.Width := ppReport1.PrinterSetup.PrintableWidth - 16.0;
    TARIText.Left := (rbLine1.Width / 2) - 28;
    ppPaintBox1.Width := ppReport1.PrinterSetup.PrintableWidth - 16.0;
    ppSystemvariable2.Left := ppReport1.PrinterSetup.PrintableWidth - 8.0 - ppSystemVariable2.Width;
    // Set Default Options
    ppJITPipeline1.Open;
    ppJITPipeline1.First;
    ppreport1.AllowPrintToFile := True;
    ppreport1.ShowPrintDialog := True;
    ppReport1.DeviceType := 'Screen';
    ppReport1.TextFileName := ReportingBaseFolder + Fname;
    ppReport1.Print;
    CurrentReport.free;
  finally
    Screen.Cursor := Save_Cursor;  // Always restore to normal
  end;
end;

procedure TReportingTrackingF.ActCrossDeptRExecute(Sender: TObject);
var
  I: Integer;
  cx : extended;
  colnum: Integer;
  Fname : String;
  Repcol : TRepColPtr;
  UseCol : Boolean;
  Save_Cursor:TCursor;
begin
  if not checktrackdates then exit;
  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crHourglass;    { Show hourglass cursor }

    Annualise := False;
    UseCol := False;
    Consolid := ctDepartment; // Must be true to get all deptments
    for I := 0 to ReportOptionsList.Items.Count - 1 do    // Iterate
      begin
      if (ReportOptionsList.Items.Items[I].DisplayName = 'Use Color in Reports') and
        (ReportOptionsList.Items.Items[I].Checked) then UseCol := True;

      if (ReportOptionsList.Items.Items[I].DisplayName = 'Annualise Amounts') and
        (ReportOptionsList.Items.Items[I].Checked) then Annualise := True;

      end;    // for

    ReportMTitle := 'Cross Departmental Tracking Key Indicator Report';
    TariText.Visible := True;
    QStartDate := DataModuleClient.DepartmentsCurrentMonitoringStart.value;
    QEndDate := QStartDate + Latestperiod;
    PeriodStartDate := getPeriodStartDate(QStartDate, QEndDate);
    TDeptTrackingKeyReport(CurrentReport) := TDeptTrackingKeyReport.create(Consolid, ReportMTitle, poLandscape);
		CurrentReport.businessName := DataModuleClient.BusinessDetailsBusiness_Name.AsString;
		CurrentReport.DepartmentName := DataModuleClient.DepartmentsRevenue_Group_Name.AsString;
    CurrentReport.ReportTitle := ReportMTitle;
		CurrentReport.Doctitle := DataModuleClient.BusinessDetailsBusiness_Name.AsString + ' - Cross Departmental Tracking Key Indicator Report';
    Fname := CurrentReport.Doctitle + '.pdf';//fname;
    CurrentReport.UseColor := UseCol;

    cx := TITLEWIDTH * 0.7;
    colnum := 1;
    new(RepCol);
    Repcol.Majorcol := colnum;
    repcol.Minorcol := 0;
    Repcol.Start := 0;
    RepCol.Width := cx;
    CurrentReport.Columnadd(Repcol);
    inc(Colnum);
    for I := 0 to 5 do    // Iterate
      begin
      new(RepCol);
      Repcol.Start := cx;
      Repcol.Majorcol := colnum;
      Repcol.Minorcol := 0;
      RepCol.Width := KEYINDICATORWIDTH * 0.7;
      Repcol.DateIdx := 0;
      if I < 3 then
        RepCol.AnnualFactor := GetAnnualFactor(PeriodStartDate, QEndDate)
      else
        RepCol.AnnualFactor := GetAnnualFactor(QStartDate, QEndDate);
      if (I = 0) or (I = 3) then
        RepCol.Source := TRACK
      else if (I = 1) or (I = 4) then
        RepCol.Source := TARGET
      else
        RepCol.Source := VARIANCE;
      if I < 3 then
        RepCol.FromDate := FormatDateTime(GGlobals.getDateFENH, PeriodStartDate)
      else
        RepCol.FromDate := FormatDateTime(GGlobals.getDateFENH, QStartDate);
      RepCol.ToDate := FormatDateTime(GGlobals.getDateFENH, QEndDate);
      cx := cx + RepCol.width; //KEYINDICATORWIDTH;
      CurrentReport.Columnadd(Repcol);
      inc(Colnum);
      end;    // for
    CurrentReport.DetailWidth := cx;
    if FontSelector.Text <> '' then
      CurrentReport.CurrentFont := FontSelector.Text
    else
      CurrentReport.CurrentFont := 'Arial';

    ppreport1.Reset;
    ppreport1.PrinterSetup.Orientation := poPortrait;
    setReportPreview(ppReport1);
    if CurrentReport.DetailWidth > ppReport1.PrinterSetup.PrintableWidth then
      ppreport1.PrinterSetup.Orientation := poLandscape;
    rbLine1.Left := 8.0;
    rbline1.Width := ppReport1.PrinterSetup.PrintableWidth - 16.0;
    TariText.Left := (rbLine1.Width / 2) - 28;
    ppPaintBox1.Width := ppReport1.PrinterSetup.PrintableWidth - 16.0;
    ppSystemvariable2.Left := ppReport1.PrinterSetup.PrintableWidth - 8.0 - ppSystemVariable2.Width;
    // Set Default Options
    ppJITPipeline1.Open;
    ppJITPipeline1.First;
    ppreport1.AllowPrintToFile := True;
    ppreport1.ShowPrintDialog := True;
    ppReport1.DeviceType := 'Screen';
    ppReport1.TextFileName := ReportingBaseFolder + Fname;
    ppReport1.Print;
    CurrentReport.free;
  finally
    ConsolidationRGClick(Sender);
    Screen.Cursor := Save_Cursor;  { Always restore to normal }
  end;
end;

procedure TReportingTrackingF.SetDeptList;
Var
  J : integer;
begin
  DataModuleClient.DeptRef2.indexName := 'DEPTNAMEIDX';
  DataModuleClient.DeptRef2.First;
  DeptList.items.Clear;
  J := 0;
  while DataModuleClient.DeptRef2.eof = False do
    begin
		TcxCheckListBoxItems(DeptList.Items).Add.Text := DataModuleClient.DeptRef2Revenue_Group_Name.AsString;

    if ((DepartmentsRG.ItemIndex = 0)
        or ((DepartmentsRG.ItemIndex = 1) and (DataModuleClient.DeptRef2Branch_Id.Value = DataModuleClient.BusinessesBranch_id.Value)))
      and (DataModuleClient.DeptRef2Exclude_from_Reporting.value = 0) then
      DeptList.items.Items[J].Checked := True
    else
      DeptList.items.Items[J].Checked := False;
    DataModuleClient.DeptRef2.next;
    inc(J);
    end;    // while
end;


procedure TReportingTrackingF.BusinessListExit(Sender: TObject);
var
  J: Integer;
begin
  DataModuleClient.BusinessesRef.indexName := 'BUSINESS_BRANCH_NAME';
  DataModuleClient.BusinessesRef.First;
  j := 0;
  while DataModuleClient.BusinessesRef.eof = False do
    begin
    DataModuleClient.BusinessesRef.Edit;
    if BusinessList.Items.Items[J].Checked = True then
      DataModuleClient.BusinessesRefExclude_from_Reporting.value := 0
    else
      DataModuleClient.BusinessesRefExclude_from_Reporting.value := 1;
    DataModuleClient.BusinessesRef.Post;
    DataModuleClient.BusinessesRef.next;
    inc(j);
    end;    // while
  DataModuleClient.Businesses.Refresh;
end;

procedure TReportingTrackingF.ConsolidationRGClick(Sender: TObject);
begin
  case ConsolidationRG.ItemIndex of    //
    0:  begin
        Consolid := ctNormal;
        BusConsolidLabel.Visible := False;
        BusinessList.Enabled := False;
        BusinessList.Visible := False;
        DepartmentsRG.Enabled := False;
        DepartmentsRG.Visible := False;
        DeptConsolidLabel.Visible := False;
        DeptList.Enabled := False;
        DeptList.Visible := False;
        end;
    1:  Begin
        Consolid := ctBusiness;
        BusConsolidLabel.Visible := True;
        BusinessList.Enabled := True;
        BusinessList.Visible := True;
        end;
    2:  Begin
        Consolid := ctDepartment;
        BusConsolidLabel.Visible := True;
        BusinessList.Enabled := True;
        BusinessList.Visible := True;
        DepartmentsRG.Enabled := True;
        DepartmentsRG.Visible := True;
        DeptConsolidLabel.Visible := True;
        DeptList.Enabled := True;
        DeptList.Visible := True;
        end;
  end;    // case
end;

procedure TReportingTrackingF.DepartmentsRGClick(Sender: TObject);
begin
  SetDeptList;
end;

procedure TReportingTrackingF.SetGroupNames(FormName: TForm);
var
  I, J: Integer;
  GTitle, DTitle : TppLabel;
  cfConsolid : Boolean;
  SelectedBranchID : integer;
  GCompName, DCompName : String;
begin
  DTitle := nil;
  GTitle := nil;
  cfConsolid := False;
  if GraphRepTypeRG.ItemIndex < 2 then
    begin
    GCompname := 'GroupLabel';
    DCompname := 'rbDepartment';
    end
  else
    begin
    GCompname := 'GroupLabel1';
    DCompname := 'rbDepartment1';
    end;
  for I := 0 to Formname.ComponentCount - 1 do    // Iterate
    begin
    if Formname.Components[I].name = GCompname then
      GTitle := TppLabel(Formname.Components[I]);
    if Formname.Components[I].name = DCompName then
      DTitle := TppLabel(Formname.Components[I]);
    end;    // for
  if (Gtitle = nil) or (DTitle = nil) then exit;    
  if Consolid = ctNormal then
    begin
    GTitle.Caption := 'Business / Department:';
		DTitle.Caption := DataModuleClient.businessesBranch_name.AsString + ' / ' + DataModuleClient.DepartmentsREVENUE_GROUP_NAME.AsString;
    end;
  if IsCashFlowReport then
    begin
    GTitle.Caption := 'Business/Branch:';
    if Consolid = ctNormal then
			DTitle.Caption := DataModuleClient.BusinessesBRANCH_NAME.AsString
    else
      begin
      DataModuleClient.BusinessesRef.Active := False;
      DataModuleClient.BusinessesRef.Filter := 'Exclude_from_Reporting = 0';
      DataModuleClient.BusinessesRef.Filtered := True;
      DataModuleClient.BusinessesRef.Active := True;
      cfConsolid := False;
      if DataModuleClient.BusinessesRef.RecordCount = 1 then
        begin
        DTitle.Caption := DataModuleClient.BusinessesRefBRANCH_NAME.AsString;
        cfConsolid := True;
        end;
      DataModuleClient.BusinessesRef.Active := False;
      DataModuleClient.BusinessesRef.Filter := '';
      DataModuleClient.BusinessesRef.Filtered := False;
      DataModuleClient.BusinessesRef.Active := True;
      end;
    end;
  if (Consolid = ctBusiness) or ((IsCashFlowReport) and (cfConsolid = True)) then
    begin
    DTitle.Caption := '';
    DataModuleClient.BusinessesRef.indexName := 'BUSINESS_BRANCH_NAME';
    DataModuleClient.BusinessesRef.First;
    j := 0;
    while DataModuleClient.BusinessesRef.eof = False do
      begin
      if DataModuleClient.BusinessesRefExclude_from_Reporting.value = 0 then
        begin
        if J > 0 then
          DTitle.Caption := DTitle.Caption + ', ';
				DTitle.Caption := DTitle.Caption + DataModuleClient.BusinessesRefBRANCH_NAME.AsString;
        inc(j);
        end;
      DataModuleClient.BusinessesRef.next;
      end;    // while
    if J > 1 then
      GTitle.Caption := 'Consolidated Businesses/Branches:'
    else
      GTitle.Caption := 'Business/Branch (All Departments):';
    end
  else
    if Consolid = ctDepartment then
    begin
    DTitle.Caption := '';
    DataModuleClient.DeptRef2.indexName := 'DEPTNAMEIDX';
    DataModuleClient.DeptRef2.First;
    j := 0;
    SelectedBranchID := 0;
    while DataModuleClient.DeptRef2.eof = False do
      begin
      if DataModuleClient.DeptRef2Exclude_from_Reporting.value = 0 then
        begin
        SelectedBranchID := DataModuleClient.DeptRef2BRANCH_ID.Value;
        if J > 0 then
          DTitle.Caption := DTitle.Caption + ', ';
				DTitle.Caption := DTitle.Caption + DataModuleClient.DeptRef2REVENUE_GROUP_NAME.AsString;
        inc(j);
        end;
      DataModuleClient.DeptRef2.next;
      end;    // while
    if J > 1 then
      GTitle.Caption := 'Consolidated Departments:'
    else
      begin
      GTitle.Caption := 'Business / Department:';
      // the problem here is that the selected department may not be the selected business
      if SelectedBranchID <> 0 then
        begin
        if DataModuleClient.BusinessesRef.Locate('BRANCH_ID', Variant(SelectedBranchID), []) then
          DTitle.Caption := DataModuleClient.BusinessesRefBRANCH_NAME.AsString + ' / ' + DTitle.Caption;
        end;
      end;
    end;
  Dtitle.Left := GTitle.Left + GTitle.Width + 3.5;
  if Length(DTitle.Caption) > 200 then
    DTitle.Font.Size := 8
  else
    DTitle.Font.Size := 10;
end;

procedure TReportingTrackingF.cxDBTextEdit1PropertiesChange(
  Sender: TObject);
begin
//
// Department has changed. We must reset the reporting period and dates as if we have entered
// through the front door.
  SetGroupDepartmentDetails(Sender);
end;

procedure TReportingTrackingF.AccountFmtCBPropertiesEditValueChanged(
  Sender: TObject);
begin
  GGlobals.Produce_AccountFmt := AccountFmtCB.Checked;
end;

end.
