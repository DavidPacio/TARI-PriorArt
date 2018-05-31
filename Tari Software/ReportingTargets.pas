unit ReportingTargets;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, TargetPDFReports, DMrep1U,  printers, ComCtrls, DBCtrls,
  Registry, TargetGrep, auchTypes, Grids, CustomPDFReport,
	shellapi, dateUtils, ppPrnabl, ppClass, ppStrtch,
	ppBands, ppCache, ppDB, ppDBJIT, ppComm, ppRelatv,
	ppProd, ppReport, ppCtrls, ppVar, ppChrt,
  ppTypes, LGlobals, cxControls, cxContainer,
  cxCheckListBox, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxDBEdit,
  cxDBCheckListBox, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxNavigator, cxDBNavigator, cxButtons, cxFontNameComboBox,
  cxCalendar, ActnList, {dxNavBarStyles, dxNavBarCollns, dxNavBarBase,
  dxNavBar, }cxDBLabel, cxLabel, cxListView, ExtCtrls, cxCheckBox,
	cxLookAndFeelPainters,  cxGroupBox, cxRadioGroup,
  ppRichTx, ppParameter, cxGraphics, cxLookAndFeels, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinXmas2008Blue, Menus, ppDesignLayer, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinsdxNavBarPainter, dxNavBarCollns, cxClasses,
  dxNavBarBase, dxNavBar, ppPaintBox, ppDrwCmd;

type
  TReportingTargetsF = class(TForm)
    ppReport1: TppReport;
    ppJITPipeline1: TppJITPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    BusinessName: TppLabel;
    ReportTitle: TppLabel;
    rbDepartment: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppJITPipelineCLIENTNAME: TppField;
    ReportOptionsList: TcxCheckListBox;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBNavigator1: TcxDBNavigator;
    DeptList: TcxCheckListBox;
    CloseBtn: TcxButton;
    PreviewZoomCB: TcxComboBox;
    FontSelector: TcxFontNameComboBox;
    ActionList1: TActionList;
    ActPNLTrendReport: TAction;
    ActPNLTrendGR: TAction;
    ActKeyIndicTrend: TAction;
    ActKeyIndicTrendGR: TAction;
    ActPNLDetailed: TAction;
    ActDetPNLGR: TAction;
    ActDetKeyIndic: TAction;
    ActDetKeyIndicGR: TAction;
    ActCashFlow: TAction;
    ActiDetWorkingCapital: TAction;
    ActProjectedBalanceSheets: TAction;
    ActWorkingCapitalGR: TAction;
    ActChangeTargetPeriod: TAction;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    DeptConsolidLabel: TcxLabel;
    cxLabel9: TcxLabel;
    RBText1: TppLabel;
    RBLine1: TppLine;
    TARIText: TppLabel;
    GroupLabel: TppLabel;
		cxDBTextEdit2: TcxDBTextEdit;
    cxDBNavigator2: TcxDBNavigator;
    Panel1: TPanel;
    ColumnList: TcxListView;
    cxLabel7: TcxLabel;
    Panel2: TPanel;
    PeriodCB: TcxComboBox;
    cxLabel6: TcxLabel;
    cxButton2: TcxButton;
    cxDBLabel1: TcxDBLabel;
    cxLabel5: TcxLabel;
    cxDBLabel2: TcxDBLabel;
    cxLabel10: TcxLabel;
    BusConsolidLabel: TcxLabel;
    BusinessList: TcxCheckListBox;
    ConsolidationRG: TcxRadioGroup;
    DepartmentsRG: TcxRadioGroup;
    cxLabel14: TcxLabel;
    AccountFmtCB: TcxCheckBox;
    DisclaimerCB: TcxCheckBox;
    ppJITPipeline1PERIODEND: TppField;
    ppJITPipelineCURRENTDATE: TppField;
    ppParameterList1: TppParameterList;
    ppRichText1: TppRichText;
    DisclaimerFooter: TppLabel;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    dxNavBar: TdxNavBar;
    dxNavBarGroup1: TdxNavBarGroup;
    dxNavBarGroup2: TdxNavBarGroup;
    ProfitLossTrendItem: TdxNavBarItem;
    ProfitLossTrendGraph: TdxNavBarItem;
    KeyIndicatorTrend: TdxNavBarItem;
    KeyIndicatorTrendGR: TdxNavBarItem;
    DetailedPNLR: TdxNavBarItem;
    DetailedPNLRG: TdxNavBarItem;
    CashFlowReport: TdxNavBarItem;
    dxNavBarGroup3: TdxNavBarGroup;
    DetailedKeyIndic: TdxNavBarItem;
    DetailedKeyGR: TdxNavBarItem;
    WorkingCapitalRep: TdxNavBarItem;
    BSreport: TdxNavBarItem;
    cxLabel1: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel15: TcxLabel;
    ppPaintBox1: TppPaintBox;
    procedure FormCreate(Sender: TObject);
    procedure DeptListExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppReport1BeforePrint(Sender: TObject);
    procedure ActPNLTrendReportExecute(Sender: TObject);
    procedure ActPNLTrendGRExecute(Sender: TObject);
    procedure ActKeyIndicTrendExecute(Sender: TObject);
    procedure ActKeyIndicTrendGRExecute(Sender: TObject);
    procedure ActPNLDetailedExecute(Sender: TObject);
    procedure ActDetPNLGRExecute(Sender: TObject);
    procedure ActDetKeyIndicExecute(Sender: TObject);
    procedure ActDetKeyIndicGRExecute(Sender: TObject);
    procedure ActChangeTargetPeriodExecute(Sender: TObject);
    procedure ActSumCashFlowReportExecute(Sender: TObject);
    procedure ActDetailedWorkingCapitalReportExecute(Sender: TObject);
    procedure PeriodCBPropertiesChange(Sender: TObject);
    procedure cxDBTextEdit1PropertiesChange(Sender: TObject);
    procedure ActProjectedBalanceSheetsExecute(Sender: TObject);
    procedure ConsolidationRGClick(Sender: TObject);
    procedure BusinessListExit(Sender: TObject);
    procedure DepartmentsRGClick(Sender: TObject);
    procedure AccountFmtCBPropertiesEditValueChanged(Sender: TObject);
    function ppJITPipeline1GetFieldValue(aFieldName: String): Variant;
    procedure ppDetailBand1BeforeGenerate(Sender: TObject);
    procedure ppDetailBand1AfterGenerate(Sender: TObject);
    procedure ppPaintBox1Print(Sender: TObject);
    procedure ppReport1PageRequest(Sender, aPageRequest: TObject);
  private
    MarksWerevisible: boolean;
    { Private declarations }
    Annualise : Boolean;
    Consolid : TConsolidateType;
    ReportMTitle : string;
    DetailHeight : single;
    function GetAnnualFactor(Index : integer): Extended;
//    procedure DoConcatentation(FileName : String);
//    procedure SetBookmarks(FileName, Title: string; pages: integer);
    procedure SetColumnList;
    function CheckplanDates(CheckColumnNumbers : Boolean): Boolean;
    procedure SetReportPreview(Rep : TppReport);
//    function ConsolidatedNameList: string;
    Procedure SetGroupNames(FormName: TForm);
    procedure SetDeptList;
  public
    { Public declarations }
  DateIndex : array[0..9] of integer;
  end;

var
  ReportingTargetsF: TReportingTargetsF;
  ReportingBaseFolder : string;
  directory, params  : array[0..200] of char;
  Wclass, Wname : array[0..100] of char;
  Currentreport : TCustomReport;

implementation

{$R *.DFM}

uses DMClient, DataCollector, TargetDetailGrep, {TargetDKeyGrep,}
  BusinessSetup;

procedure TReportingTargetsF.FormCreate(Sender: TObject);
var
  I: Integer;
//  I: Integer;
  J: Integer;
begin
//  color := gglobals.FormColour;
//  mxOutlookBarPro1.Background.Color := color;
  DMrep1.TariButtonList.GetImage(0, CloseBtn.Glyph);
  AccountFmtCB.Visible := GGlobals.Config_Accountingfmt;
  AccountFmtCB.Checked := GGlobals.Produce_AccountFmt;
//  RegIni := TReginiFile.create;
//  RegIni.RootKey := HKey_Local_Machine;
//  if (not Regini.OpenKey('SOFTWARE\Focus Based Management\' + PRODUCT_NAME + '\Users\' + GetcurrentUser + '\Report Options', True)) then
//    Regini.OpenKey('SOFTWARE\Focus Based Management\' + PRODUCT_NAME + '\Report Options', True);
  FontSelector.FontName := GGlobals.Reporting.ReportFont;
  for I := 0 to ReportOptionsList.Items.Count - 1 do    // Iterate
    begin
    if GGlobals.Reporting.TargetingOptionsList[I] > 0 then
      ReportOptionsList.Items.Items[I].State := cbsChecked
    else
      ReportOptionsList.Items.Items[I].State := cbsUnChecked;
    end;    // for
  ReportOptionsList.Refresh;
  DataModuleClient.DepartmentsCURRENTPLANSTART.DisplayFormat := GGlobals.GetDateFENH;
  DataModuleClient.DepartmentsCURRENTPLANEND.DisplayFormat := GGlobals.GetDateFENH;
  MarksWerevisible := False;
  ReportingBaseFolder := GGlobals.Basedir + 'Reports\';
  strpcopy(directory, Reportingbasefolder);
  strpcopy(params, '');
  GGlobals.DebugOut('Basedir = ' + GGlobals.Basedir);
  GGlobals.DebugOut('ReportingBase Folder = ' + ReportingBaseFolder);
	Caption := 'Report (Targets) - '  + DataModuleClient.BusinessDetailsBusiness_Name.AsString;

  DataModuleClient.BusinessesRef.indexName := 'BUSINESS_BRANCH_NAME';
  DataModuleClient.BusinessesRef.First;
  BusinessList.Items.Clear;
  J := 0;
  while DataModuleClient.BusinessesRef.eof = False do
    begin
		TcxCheckListBoxItems(BusinessList.Items).Add.Text := DataModuleClient.BusinessesRefBRANCH_NAME.AsString;
    if DataModuleClient.BusinessesRefExclude_from_Reporting.value = 0 then
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
  PeriodCB.ItemIndex := GGLobals.Reporting.ReportingPeriod;
  PreviewZoomCB.ItemIndex := GGlobals.Reporting.PreviewZoom;

  //  RegIni.CloseKey;
  // Load up ColumnList
  SetColumnList;
  if GGlobals.DemoFileLicenced then
    begin
    ActPNLDetailed.Enabled := False;
    ActDetPNLGR.Enabled := False;
    ActDetKeyIndic.Enabled := False;
    ActDetKeyIndicGR.Enabled := False;
    ActCashFlow.Enabled := False;
    ActiDetWorkingCapital.Enabled := False;
    ActProjectedBalanceSheets.Enabled := False;
    ActWorkingCapitalGR.Enabled := False;
    ActChangeTargetPeriod.Enabled := False;
    end;
  ConsolidationRGClick(Sender);
  if fileexists('Disclaimer.rtf') then
    disclaimercb.Visible := true
  else
    disclaimercb.Visible := False;    
end;

procedure TReportingTargetsF.SetColumnList;
var
  J: Integer;
  ColumnItem : TListItem;
  LastDate : TDateTime;
begin
  ColumnList.Items.Clear;
  DataModuleClient.DateRef.Active := False;
  DataModuleClient.Dateref.Filtered := False;
  DataModuleClient.DateRef.indexName := 'ENDDATEIDX';
  DataModuleClient.DateRef.Active := True;
  // this needs to be smarter - Include all dates on non excluded departments
  // up to and including 5 dates
  DataModuleClient.DateRef.First;
  Lastdate := 0;
  J := 0;
  while DataModuleClient.DateRef.eof = False do
    begin
    if (LastDate <> DataModuleClient.DateRefEndDate.value) then
      inc(j);
    LastDate := DataModuleClient.DateRefEndDate.value;
    DataModuleClient.DateRef.edit;
    DataModuleClient.DateRefD_Index.value := j;
    DataModuleClient.DateRef.post;
    DataModuleClient.DateRef.Next;
    end;    // while
  DataModuleClient.DateRef.First;
  for J := 0 to 9 do DateIndex[J] := 0;
  J := 0;
  while DataModuleClient.DateRef.eof = False do
    begin
    if DataModuleClient.DateRefDept_ID.value = DataModuleClient.DepartmentsDept_ID.value then
      begin
      ColumnItem := ColumnList.Items.add;
      ColumnItem.Checked := True;
      ColumnItem.Caption := 'Past';
      ColumnItem.subitems.Add(FormatDateTime(GGlobals.GetDateFENH, DataModuleClient.DateRefStartDate.value));
      ColumnItem.subitems.Add(FormatDateTime(GGlobals.GetDateFENH, DataModuleClient.DateRefEndDate.value));
      DateIndex[J] := DataModuleClient.DateRefD_Index.Value;
      Inc(J);
      end;
    DataModuleClient.DateRef.next;
    end;    // while
  // Add the current Targeting period
  ColumnItem := ColumnList.Items.add;
  ColumnItem.Checked := True;
  ColumnItem.Caption := 'Target';
  ColumnItem.subitems.Add(DataModuleClient.DepartmentsCURRENTPLANSTART.DisplayText);
  ColumnItem.subitems.Add(DataModuleClient.DepartmentsCURRENTPLANEND.DisplayText);
end;

procedure TReportingTargetsF.DeptListExit(Sender: TObject);
var
  J: Integer;
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

procedure TReportingTargetsF.FormClose(Sender: TObject;
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
end;

function TReportingTargetsF.GetAnnualFactor(Index : integer): Extended;
var
  I: Integer;
  SDate, Edate : TDateTime;
  NoofDays : integer;
  d, m, y : word;
	Months : array[1..12] of string;
  subdate : string;

  function FindSubstring(const src : string; substring : integer) : string;
  var
    dest : array[0 .. 30] of char;
    i, j, k : integer;
    c : char;
  begin
    j := 1;
    k := 0;
    for i := 1 to Length(src) do
      begin
      c := src[i];
      if c = '-' then
        inc(J)
      else if (J = substring)
        then begin
        dest[K] := c;
        inc(K);
      end;
    end;
    dest[k] := #0;
    result := dest;
  end;

begin
  result := 1;
  if Annualise
    then begin
    Months[1] := 'Jan';
    Months[2] := 'Feb';
    Months[3] := 'Mar';
    Months[4] := 'Apr';
    Months[5] := 'May';
    Months[6] := 'Jun';
    Months[7] := 'Jul';
    Months[8] := 'Aug';
    Months[9] := 'Sep';
    Months[10] := 'Oct';
    Months[11] := 'Nov';
    Months[12] := 'Dec';

    d := Strtoint(FindsubString(ColumnList.Items[Index].SubItems[0], 1));
		subdate := FindsubString(ColumnList.Items[Index].SubItems[0], 2);
    M := 1;
    for I := 1 to 12 do    // Iterate
      begin
      if subdate = Months[i] then
        M := I;
    end;    // for
    Y := Strtoint(FindsubString(ColumnList.Items[Index].SubItems[0], 3));
    sDate := encodeDate(y, m, d);

    d := Strtoint(FindsubString(ColumnList.Items[Index].SubItems[1], 1));
    subdate := FindsubString(ColumnList.Items[Index].SubItems[1], 2);
    for I := 1 to 12 do    // Iterate
      begin
      if subdate = Months[i] then
        M := I;
    end;    // for
    Y := Strtoint(FindsubString(ColumnList.Items[Index].SubItems[1], 3));
    EDate := encodeDate(y, m, d);

    NoofDays := round(Edate - Sdate + 1);
    if (NoofDays > 360) and (NoofDays < 370) then
      Result := 1
    else
      Result := Noofdays / 365;
  end;
end;

function TReportingTargetsF.CheckplanDates(CheckColumnNumbers : Boolean): Boolean;
var
  I, J: Integer;
begin
  result := True; // assume the best result
  if DaysBetween(DataModuleClient.DepartmentsCURRENTPLANEND.AsDateTime, DataModuleClient.DepartmentsCURRENTPLANSTART.AsDateTime) > 366 then
    begin
    ShowMessage('Target Period Dates are greater than 366 days apart. Please correct.');
    Result := False;
    end;
  if DaysBetween(DataModuleClient.DepartmentsCURRENTPLANEND.AsDateTime, DataModuleClient.DepartmentsCURRENTPLANSTART.AsDateTime) < 31 then
    begin
    Showmessage('Please set Target Dates that are at least 31 days apart' + #13#10 + 'and ensure Sales and Expense targets have been established.');
    Result := False;
    end;
  // If more than 5 past dates - STOP
  if CheckColumnNumbers then
    begin
    J := 0;
    for I := 0 to ColumnList.Items.Count - 1 do    // Iterate
      if (ColumnList.Items[I].caption = 'Past') and (ColumnList.Items[I].Checked) then
        Inc(J);
    if J > 5 then
      begin
      Showmessage('There are more than 5 ''Past'' periods in the Column List.' + #13#10 + 'Please uncheck one or more ''Past'' columns to comply.');
      Result := False;
      end;
    end;
end;

procedure TReportingTargetsF.ppReport1BeforePrint(Sender: TObject);
begin
  if Not CurrentReport.prepared then
    begin
    if DisclaimerCB.Checked then
      begin
      DisclaimerFooter.Visible := True;
      CurrentReport.PlaceDisclaimer := True;
      if (ppreport1.PrinterSetup.Orientation = poPortrait) then
        begin
        ppRichText1.Width := ppReport1.PrinterSetup.PrintableWidth - 16;
        ppRichText1.Top := 5.0;
        ppRichText1.Height := ppReport1.PrinterSetup.PrintableHeight - 45;
        end
      else
        begin
        ppRichText1.Width := ppReport1.PrinterSetup.PrintableWidth - 16;
        ppRichText1.Top := 5.0;
        ppRichText1.Height := ppReport1.PrinterSetup.PrintableHeight - 45;
        end;
      ppRichText1.DataPipeline := ppJITPipeline1;
      ppRichText1.BringToFront;
      ppRichText1.Visible := true;
      ppRichText1.MailMerge := True;
      ppRichText1.LoadFromFile('Disclaimer.rtf');
      end
    else
      DisclaimerFooter.Visible := False;
    BusinessName.Caption := CurrentReport.BusinessName;
    Businessname.Visible := True;
    Businessname.Width := ppReport1.PrinterSetup.PrintableWidth;
    ReportTitle.Caption := CurrentReport.ReportTitle;
    ReportTitle.Visible := true;
    ReportTitle.Width := ppReport1.PrinterSetup.PrintableWidth;
    rbDepartment.Width := ppReport1.PrinterSetup.PrintableWidth - rbDepartment.Left - GroupLabel.Left;
    SetGroupNames(ReportingTargetsF);
{    if (CurrentReport.Consolidate = ctBusiness) then
      departmentDetail.Caption := 'Businesses Consolidated (' + ConsolidatedNameList + ')'
    else if (CurrentReport.Consolidate = ctDepartment) then
      departmentDetail.Caption := 'Departments Consolidated (' + ConsolidatedNameList + ')'
    else
      departmentDetail.Caption := DataModuleClient.BusinessesBRANCH_NAME.Value + '/' + CurrentReport.DepartmentName;

    if Length(rbdepartments.Caption) > 200 then
      rbdepartments.Font.Size := 8
    else
      rbdepartmentDetail.Font.Size := 10;
}
    rbDepartment.Visible := True;
    ppreport1.PrinterSetup.DocumentName := CurrentReport.BusinessName + ' - ' + CurrentReport.ReportName + '.pdf';
    ppreport1.PreviewForm.DisplayDocumentName := True;
    DetailHeight := ppreport1.PrinterSetup.PrintableHeight - ppreport1.Header.Height - ppReport1.Footer.Height - 0.5;
    ppJITPipeline1.RecordCount := CurrentReport.Prepare(DetailHeight, ppreport1, ppPaintBox1);
    ppPaintBox1.Height := ppreport1.PrinterSetup.PrintableHeight - ppreport1.Header.Height - ppReport1.Footer.Height - 0.5;
    CurrentReport.prepared := True;
    end;
end;

procedure TReportingTargetsF.ppReport1PageRequest(Sender,
  aPageRequest: TObject);
begin

end;

{var
  lDC             : HDC;
  lMetafile       : TMetafile;
  lMetaFileCanvas : TMetaFileCanvas;
  lDrawCommand    : TppDrawImage;
  lRect           : TRect;
begin

    inherited PropertiesToDrawCommand(aDrawCommand);
    if (aDrawCommand is TppDrawImage) then
    begin
        // Copy the component properties to the draw command
        lDrawCommand            := TppDrawImage(aDrawCommand);
        lDrawCommand.Left       := PrintPosRect.Left;
        lDrawCommand.Top        := PrintPosRect.Top;
        lDrawCommand.Width      := PrintPosRect.Right  - PrintPosRect.Left;
        lDrawCommand.Height     := PrintPosRect.Bottom - PrintPosRect.Top;
        lDrawCommand.DirectDraw := True;

        lRect.Left   := 0;
        lRect.Top    := 0;
        lRect.Right  := spWidth;
        lRect.Bottom := spHeight;

        // Create the metafile for the output
        lMetafile        := TMetafile.Create();
        lMetaFile.Width  := spWidth;
        lMetaFile.Height := spHeight;

        // Get the device context of the printing device
        if (ppPrinter <> nil) and (ppPrinter.DC <> 0) then
          begin
          lDC := ppPrinter.DC;
          end
        else
          begin
          lDC := GetDC(0);
          end;
//        lMetafile.Inch := 96;
        lMetafile.Inch := GetDeviceCaps(ldc, LOGPIXELSX);

        // Create the canvas to draw on
        lMetaFileCanvas := TMetaFileCanvas.Create(lMetaFile, ldc);
        if not Transparent then
        begin
            lMetaFileCanvas.Brush.Color := Color;
            lMetaFileCanvas.Fillrect(lRect);
        end;

        // call the on paint event
        CallOnDrawPaintbox(lMetaFileCanvas, lRect);

        lMetaFileCanvas.Free;

        // Assign the metafile to the picture property
        lDrawCommand.Picture.Graphic := lMetafile;
        lMetaFile.Free;

        // Release the device context
        if (ppPrinter = nil) or (ppPrinter.DC = 0) then
            ReleaseDC(0,lDC);
    end;

procedure TReportingTargetsF.ppTWPaintbox1DrawPaintbox(Sender: TObject;
  Canvas: TCanvas; ClipRect: TRect);
var
  X,Y, useRight, UseBottom : integer;
  Lrect : TRECT;
  Factor : extended;
begin
  // required to adjust to 96 dpi for screen since it seems incapable of doing the right thing!
  Factor := 1.0;
  X := GetdeviceCaps(Canvas.Handle, LOGPIXELSX);
  Y := GetdeviceCaps(Canvas.Handle, LOGPIXELSY);
  if ppReport1.DeviceType = 'Screen' then
    Factor := screen.PixelsPerInch / X;

  if (ppReport1.Printersetup.Orientation = poLandscape) and
    (GGlobals.IsWIN95) and (Canvas.ClipRect.Bottom > Canvas.ClipRect.Right) then
    begin
    UseRight := Round(Canvas.ClipRect.Bottom * Factor);
    UseBottom := Round(Canvas.ClipRect.Right * Factor);
    end
  else
    begin
    UseRight := Round(Canvas.ClipRect.Right * Factor);
    UseBottom := Round(Canvas.ClipRect.Bottom * Factor);
    end;
  LRect.Left := Round(Canvas.ClipRect.Left * Factor) + Round((X * 10.0 * Factor) / 25.4);
  LRect.Top := Round(Canvas.ClipRect.Top * Factor) + Round((Y * 10.0 * Factor) / 25.4);
  LRect.Right := Round(UseRight) - Round((X * 20.0 * Factor) / 25.4);
  LRect.Bottom := Round(UseBottom) - Round((Y * 20.0 * Factor) / 25.4);
  Canvas.StretchDraw( LRect, TGraphic(CurrentReport.Metafiles[ppJITPipeline1.RecordIndex + 1]));
end;
}
procedure TReportingTargetsF.ppPaintBox1Print(Sender: TObject);
begin
  ppPaintBox1.Canvas.StretchDraw(ppPaintBox1.spClipRect, TGraphic(CurrentReport.Metafiles[ppJITPipeline1.RecordIndex + 1]));
end;

procedure TReportingTargetsF.SetReportPreview(Rep : TppReport);
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

procedure TReportingTargetsF.ActPNLTrendReportExecute(Sender: TObject);
var
  I: Integer;
  cx : extended;
  colnum: Integer;
  Fname : String;
  Repcol : TRepColPtr;
  useCol : Boolean;
  Save_Cursor:TCursor;
begin
  if not CheckPlandates(True) then exit;
  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crHourglass;    { Show hourglass cursor }
    for I := 0 to ReportOptionsList.Items.Count - 1 do    // Iterate
    begin
      if (ReportOptionsList.Items.Items[I].DisplayName = 'Annualise Amounts') and
        (ReportOptionsList.items.Items[I].Checked) then Annualise := True;
    end;
    ReportMTitle := 'Profit and Loss Trend Report';
    TARIText.Visible := False;
    TPLTrendReport(CurrentReport) := TPLTrendReport.create(Consolid, ReportMTitle, poLandscape);
    Currentreport.AccountingFmt := GGlobals.Produce_AccountFmt;
		CurrentReport.businessName := DataModuleClient.BusinessDetailsBusiness_Name.AsString;
		CurrentReport.DepartmentName := DataModuleClient.DepartmentsRevenue_Group_Name.AsString;
    CurrentReport.ReportTitle := ReportMTitle;
		CurrentReport.Doctitle := DataModuleClient.BusinessDetailsBusiness_Name.AsString + ' - Target Profit and Loss Trends';
    fName := Currentreport.DocTitle + '.pdf';//fname;

    cx := TITLEWIDTH;
    colnum := 1;
    new(RepCol);
    Repcol.Majorcol := colnum;
    repcol.Minorcol := 0;
    Repcol.Start := 0;
    RepCol.Width := cx;
    CurrentReport.Columnadd(Repcol);
    inc(Colnum);
    for I := 0 to ColumnList.Items.Count - 1 do    // Iterate
    begin
      if (ColumnList.Items[I].Checked = True) and (TPLTrendReport(CurrentReport).hasdata(DateIndex[I], ColumnList.Items[I].caption = 'Past')) then
        begin
        new(RepCol);
        Repcol.Start := cx;
        Repcol.Majorcol := colnum;
        Repcol.Minorcol := 0;
        RepCol.Width := DOLLARWIDTH + PERCENTWIDTH;
        RepCol.AnnualFactor := GetAnnualFactor(I);
        if ColumnList.Items[I].caption = 'Past' then
          RepCol.Source := PAST
        else if ColumnList.Items[I].caption = 'Target' then
          RepCol.Source := TARGET
        else RepCol.Source := TRACK;
        RepCol.FromDate := ColumnList.Items[I].SubItems.strings[0];
        RepCol.ToDate := ColumnList.Items[I].SubItems.strings[1];
        CurrentReport.Columnadd(Repcol);
        New(repCol);
        Repcol.Start := cx;
        Repcol.Majorcol := colnum;
        Repcol.Minorcol := 1;
        Repcol.Width := DOLLARWIDTH;
        Repcol.DateIdx := DateIndex[I];
        cx := cx + DOLLARWIDTH;
        Repcol.Top := 225;
        Repcol.Totaling := True;
        RepCol.AnnualFactor := GetAnnualFactor(I);
        if ColumnList.items[I].caption = 'Past' then
          RepCol.Source := PAST
        else if ColumnList.Items[I].caption = 'Target' then
          RepCol.Source := TARGET
        else RepCol.Source := TRACK;
        CurrentReport.Columnadd(Repcol);
        New(repCol);
        Repcol.Start := cx;
        Repcol.DateIdx := DateIndex[I];
        Repcol.Majorcol := colnum;
        Repcol.Minorcol := 2;
        Repcol.width := PERCENTWIDTH;
        cx := cx + PERCENTWIDTH;
        Repcol.Top := 225;
        Repcol.Totaling := True;
        RepCol.AnnualFactor := GetAnnualFactor(I);
        if ColumnList.Items[I].caption = 'Past' then
          RepCol.Source := PAST
        else if ColumnList.Items[I].caption = 'Target' then
          RepCol.Source := TARGET
        else RepCol.Source := TRACK;
        CurrentReport.Columnadd(Repcol);
        inc(Colnum);
        end;
    end;    // for
    CurrentReport.DetailWidth := cx;
    if FontSelector.Text <> '' then
      CurrentReport.CurrentFont := FontSelector.Text
    else
      CurrentReport.CurrentFont := 'Arial';

    Annualise := False;
    UseCol := False;
    for I := 0 to ReportOptionsList.Items.Count - 1 do    // Iterate
    begin
      if (ReportOptionsList.Items.Items[I].DisplayName = 'Use Color in Reports') and
        (ReportOptionsList.items.Items[I].Checked) then UseCol := True;
    end;    // for
    CurrentReport.UseColor := UseCol;
    TPLTrendReport(CurrentReport).CheckColumns;
    ppreport1.Reset;
    setReportPreview(ppReport1);
    ppreport1.PrinterSetup.Orientation := poPortrait;
    if CurrentReport.DetailWidth > ppReport1.PrinterSetup.PrintableWidth then
      ppreport1.PrinterSetup.Orientation := poLandscape;
    rbline1.Left := 8.0;
    rbLine1.Width := ppReport1.PrinterSetup.PrintableWidth - 16.0;
    ppPaintBox1.Width := ppReport1.PrinterSetup.PrintableWidth;// - 16.0;
    ppSystemvariable2.Left := ppReport1.PrinterSetup.PrintableWidth - 8.0 - ppSystemVariable2.Width;
    // Set Default Options
    ppJITPipeline1.Open;
    ppJITPipeline1.First;
    ppreport1.AllowPrintToFile := True;
    ppreport1.ShowPrintDialog := True;
    ppReport1.TextFileName := ReportingBaseFolder + Fname;
    ppReport1.DeviceType := 'Screen';
    ppReport1.Print;
    CurrentReport.free;
  finally
    Screen.Cursor := Save_Cursor;  { Always restore to normal }
  end;
end;

procedure TReportingTargetsF.ActPNLTrendGRExecute(Sender: TObject);
var
  I: Integer;
//  cx : extended;
  colnum: Integer;
  Fname : String;
//  Shown : Boolean;
  Save_Cursor:TCursor;
begin
  if not CheckPlandates(True) then exit;
  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crHourglass;    { Show hourglass cursor }
    KeyIndicator := False;
    Application.CreateForm(TTargetGRepF, TargetGRepF);

    TargetGRepF.DataConsolidate := Consolid;
    for I := 0 to ReportOptionsList.Items.Count - 1 do    // Iterate
      begin
      if (ReportOptionsList.Items.Items[I].DisplayName = 'Annualise Amounts') and
        (ReportOptionsList.items.Items[I].Checked) then
        Annualise := True;
      end;    // for


    if FontSelector.Text <> '' then
      TargetGRepF.ReportFont := FontSelector.Text
    else
      TargetGRepF.ReportFont := 'Arial';
    with TargetGRepF do
    begin
      Font.Name := ReportFont;
      Chart1.Chart.Title.Font.Name := ReportFont;
      rbCompanyName.Font.Name := ReportFont;
      rbDepartment.Font.Name := ReportFont;
      rbQRLabel1.Font.Name := ReportFont;
      rbQRLabel3.Font.Name := ReportFont;
    end;    // with

		Fname := DataModuleClient.BusinessDetailsBusiness_Name.AsString + ' - Target Profit and Loss Graph Trends.pdf';//fname;
    TargetGRepF.UseColor := False;
    TargetGRepF.Annualise := False;
    TargetGrepF.ThreeDImage := False;
    TargetGrepF.ShowMarks := False;
    for I := 0 to ReportOptionsList.Items.Count - 1 do    // Iterate
      begin
      if (ReportOptionsList.Items.Items[I].DisplayName = 'Use Color in Reports') and
        (ReportOptionsList.items.Items[I].Checked) then TargetGRepF.UseColor := True;

      if (ReportOptionsList.Items.Items[I].DisplayName = '3D Graphs') and
        (ReportOptionsList.items.Items[I].Checked) then
        TargetGrepF.ThreeDImage := True;
      if (ReportOptionsList.Items.Items[I].DisplayName = 'Values Visible') and
        (ReportOptionsList.items.Items[I].Checked) then
        TargetGrepF.ShowMarks := True;
      end;    // for
    Colnum := 0;

    for I := 0 to ColumnList.Items.Count - 1 do    // Iterate
    begin
      if ColumnList.Items[I].Checked = True then
      begin
        TargetGrepF.TitlesList.add(ColumnList.Items[I].SubItems.strings[0] + #13#10 + ColumnList.Items[I].SubItems.strings[1]);
        TargetGrepF.PastPeriodIndex[Colnum] := DateIndex[I];
        if ColumnList.Items[I].caption = 'Past' then
          TargetGrepF.DataColumn[Colnum] := PAST
        else
        if ColumnList.Items[I].caption = 'Target' then
          TargetGrepF.DataColumn[Colnum] := TARGET
        else
          TargetGrepF.DataColumn[I] := TRACK;
        TargetGRepF.AnnualiseFactors[Colnum] := GetAnnualFactor(I);
        inc(Colnum);
      end;
    end;    // for
    ReportMTitle := 'Profit and Loss Trend Graph Report';
    TARIText.Visible := False;
    if TargetGRepF.TitlesList.count > 1 then
    begin
			TargetGRepF.rbCompanyName.Caption := DataModuleClient.BusinessDetailsBusiness_Name.AsString;
      SetGroupNames(TargetGRepF);
      TargetGRepF.BuildHeader; // must be after setgroupNames
{      if TargetGRepF.DataConsolidate = ctBusiness then
        TargetGRepF.rbDepartments.Caption := 'Businesses Consolidated (' + ConsolidatedNameList + ')'
      else if TargetGRepF.DataConsolidate = ctDepartment then
        TargetGRepF.rbDepartments.Caption := 'Departments Consolidated (' + ConsolidatedNameList + ')'
      else
        TargetGRepF.rbDepartments.Caption := DataModuleClient.BusinessesBRANCH_NAME.Value + '/' + DataModuleClient.DepartmentsRevenue_Group_Name.Value;
}
//        TargetGRepF.rbDepartments.Caption := convertAccelCharToAmpersand(DataModuleClient.DepartmentsRevenue_Group_Name.Value);
      TargetGRepF.ppreport1.AllowPrintToFile := True;
      TargetGRepF.ppreport1.ShowPrintDialog := True;
      setReportPreview(TargetGRepF.ppReport1);
      TargetGRepF.ppReport1.TextFileName := ReportingBaseFolder + fname;
      TargetGRepF.ppReport1.DeviceType := 'Screen';

      TargetGRepF.ppreport1.print;
    end;
    TargetGRepF.Free;
  finally
    Screen.Cursor := Save_Cursor;  { Always restore to normal }
  end;
end;

procedure TReportingTargetsF.ActKeyIndicTrendExecute(Sender: TObject);
var
  I : Integer;
  cx : extended;
  colnum: Integer;
  Fname : String;
  Repcol : TRepColPtr;
  UseCol : Boolean;
  Save_Cursor:TCursor;
begin
  if not CheckPlandates(True) then exit;
  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crHourglass;    { Show hourglass cursor }

    Annualise := False;
    UseCol := False;
    for I := 0 to ReportOptionsList.Items.Count - 1 do    // Iterate
      begin
      if (ReportOptionsList.Items.Items[I].DisplayName = 'Use Color in Reports') and
        (ReportOptionsList.items.Items[I].Checked) then UseCol := True;

      if (ReportOptionsList.Items.Items[I].DisplayName = 'Annualise Amounts') and
        (ReportOptionsList.items.Items[I].Checked) then Annualise := True;

      end;    // for
    ReportMTitle := 'Key Indicator Trend Report';
    TARIText.Visible := False;
    TKeytrendReport(CurrentReport) := TKeyTrendReport.create(Consolid, ReportMTitle, poLandscape);
		CurrentReport.businessName := DataModuleClient.BusinessDetailsBusiness_Name.AsString;
		CurrentReport.DepartmentName := DataModuleClient.DepartmentsRevenue_Group_Name.AsString;
    CurrentReport.ReportTitle := ReportMTitle;
		CurrentReport.Doctitle := DataModuleClient.BusinessDetailsBusiness_Name.AsString + ' - Target Key Indicator Trend';
    Fname := CurrentReport.Doctitle + '.pdf';//fname;
    CurrentReport.UseColor := UseCol;

    cx := TITLEWIDTH;
    colnum := 1;
    new(RepCol);
    Repcol.Majorcol := colnum;
    repcol.Minorcol := 0;
    Repcol.Start := 0;
    RepCol.Width := cx;
    CurrentReport.ColumnAdd(Repcol);
    inc(Colnum);
    for I := 0 to ColumnList.Items.Count - 1 do    // Iterate
      begin
      if (ColumnList.Items[I].Checked = True) and
       (TKeyTrendReport(CurrentReport).hasdata(DateIndex[I], ColumnList.Items[I].caption = 'Past')) then
        begin
        new(RepCol);
        Repcol.Start := cx;
        Repcol.Majorcol := colnum;
        Repcol.Minorcol := 0;
        RepCol.Width := KEYINDICATORWIDTH;
        Repcol.DateIdx := DateIndex[I];
        RepCol.AnnualFactor := GetAnnualFactor(I);
        if ColumnList.Items[I].caption = 'Past' then
          RepCol.Source := PAST
        else if ColumnList.Items[I].caption = 'Target' then
          RepCol.Source := TARGET
        else RepCol.Source := TRACK;
        RepCol.FromDate := ColumnList.Items[I].SubItems.strings[0];
        RepCol.ToDate := ColumnList.Items[I].SubItems.strings[1];
        Currentreport.Columnadd(Repcol);
        cx := cx + KEYINDICATORWIDTH;
        inc(Colnum);
        end;
    end;    // for
    CurrentReport.DetailWidth := cx;
    if FontSelector.Text <> '' then
      CurrentReport.CurrentFont := FontSelector.Text
    else
      CurrentReport.CurrentFont := 'Arial';
    TKeyTrendReport(CurrentReport).CheckColumns;
    ppreport1.Reset;
    setReportPreview(ppReport1);
    ppreport1.PrinterSetup.Orientation := poPortrait;
    if CurrentReport.DetailWidth > ppReport1.PrinterSetup.PrintableWidth then
      ppreport1.PrinterSetup.Orientation := poLandscape;
    rbLine1.Left := 8;
    rbLine1.Width := ppReport1.PrinterSetup.PrintableWidth - 16.0;
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

procedure TReportingTargetsF.ActKeyIndicTrendGRExecute(Sender: TObject);
var
  I: Integer;
//  cx : extended;
  colnum: Integer;
  Fname : String;
  Save_Cursor:TCursor;
begin
  if not CheckPlandates(True) then exit;
  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crHourglass;    { Show hourglass cursor }

    KeyIndicator := True; // Must be set before Create
    Application.CreateForm(TTargetGRepF, TargetGRepF);
    TargetGRepF.DataConsolidate := consolid;
    for I := 0 to ReportOptionsList.Items.Count - 1 do    // Iterate
      begin
      if (ReportOptionsList.Items.Items[I].DisplayName = 'Annualise Amounts') and
        (ReportOptionsList.items.Items[I].Checked) then
        Annualise := True;
      end;    // for
    if FontSelector.Text <> '' then
      TargetGRepF.ReportFont := FontSelector.Text
    else
      TargetGRepF.ReportFont := 'Arial';
    with TargetGRepF do
    begin
      Font.Name := ReportFont;
      Chart1.Chart.Title.Font.Name := ReportFont;
      rbCompanyName.Font.Name := ReportFont;
      rbDepartment.Font.Name := ReportFont;
      rbQRLabel1.Font.Name := ReportFont;
      rbQRLabel3.Font.Name := ReportFont;
    end;    // with

		Fname := DataModuleClient.BusinessDetailsBusiness_Name.AsString + ' - Target Key Indicator Graph.pdf';//fname;
    TargetGRepF.UseColor := False;
    TargetGRepF.Annualise := False;
    TargetGrepF.ThreeDImage := False;
    TargetGrepF.ShowMarks := False;
    for I := 0 to ReportOptionsList.Items.Count - 1 do    // Iterate
      begin
      if (ReportOptionsList.Items.Items[I].DisplayName = 'Use Color in Reports') and
        (ReportOptionsList.items.Items[I].Checked) then TargetGRepF.UseColor := True;

      if (ReportOptionsList.Items.Items[I].DisplayName = '3D Graphs') and
        (ReportOptionsList.items.Items[I].Checked) then
        TargetGrepF.ThreeDImage := True;
      if (ReportOptionsList.Items.Items[I].DisplayName = 'Values Visible') and
        (ReportOptionsList.items.Items[I].Checked) then
        TargetGrepF.ShowMarks := True;
      end;    // for
    Colnum := 0;

    for I := 0 to ColumnList.Items.Count - 1 do    // Iterate
    begin
      if ColumnList.Items[I].Checked = True then
      begin
        TargetGrepF.TitlesList.add(ColumnList.Items[I].SubItems.strings[0] + #13#10 + ColumnList.Items[I].SubItems.strings[1]);
        TargetGrepF.PastPeriodIndex[Colnum] := DateIndex[I];
        if ColumnList.Items[I].caption = 'Past' then
          TargetGrepF.DataColumn[Colnum] := PAST
        else
        if ColumnList.Items[I].caption = 'Target' then
          TargetGrepF.DataColumn[Colnum] := TARGET
        else
          TargetGrepF.DataColumn[I] := TRACK;
        TargetGRepF.AnnualiseFactors[Colnum] := GetAnnualFactor(I);
        inc(Colnum);
      end;
    end;    // for
    ReportMTitle := 'Key Indicator Graph Report';
    if TargetGRepF.TitlesList.count > 1 then
    begin
			TargetGRepF.rbCompanyName.Caption := DataModuleClient.BusinessDetailsBusiness_Name.AsString;
      SetGroupNames(TargetGRepF);
      TargetGRepF.BuildHeader;
{      if TargetGRepF.DataConsolidate = ctBusiness then
        TargetGRepF.rbDepartments.Caption := 'Businesses Consolidated (' + ConsolidatedNameList + ')'
      else if TargetGRepF.DataConsolidate = ctDepartment then
        TargetGRepF.rbDepartments.Caption := 'Departments Consolidated (' + ConsolidatedNameList + ')'
      else
        TargetGRepF.rbDepartments.Caption := DataModuleClient.BusinessesBRANCH_NAME.Value + '/' + DataModuleClient.DepartmentsRevenue_Group_Name.Value;
}
//        TargetGRepF.rbDepartments.Caption := convertAccelCharToAmpersand(DataModuleClient.DepartmentsRevenue_Group_Name.Value);
      TargetGRepF.ppreport1.AllowPrintToFile := True;
      TargetGRepF.ppreport1.ShowPrintDialog := True;
      setReportPreview(TargetGRepF.ppReport1);
      TargetGRepF.ppReport1.TextFileName := ReportingBaseFolder + fname;
      TargetGRepF.ppReport1.DeviceType := 'Screen';

      TargetGRepF.ppreport1.print;
    end;
    TargetGRepF.Free;
  finally
    Screen.Cursor := Save_Cursor;  { Always restore to normal }
  end;
end;

procedure TReportingTargetsF.ActPNLDetailedExecute(Sender: TObject);
var
  I : Integer;
  Fname : String;
  useCol : Boolean;
  Save_Cursor:TCursor;
  PeriodTitle : string;
  WrapChars : string;
begin
  if not CheckPlandates(False) then exit;
  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crHourglass;    { Show hourglass cursor }

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
    ReportMTitle := 'Detailed ' + PeriodTitle + 'Target Profit and Loss Report';
    TARIText.Visible := False;
    TDPLTrendReport(CurrentReport) := TDPLTrendReport.create(Consolid, ReportMTitle, poLandscape);
    Currentreport.AccountingFmt := GGlobals.Produce_AccountFmt;
		CurrentReport.businessName := DataModuleClient.BusinessDetailsBusiness_Name.AsString;
		CurrentReport.DepartmentName := DataModuleClient.DepartmentsRevenue_Group_Name.AsString;
		CurrentReport.Doctitle := DataModuleClient.BusinessDetailsBusiness_Name.AsString + ' - Detailed Target Profit and Loss Trends';
    Fname := CurrentReport.Doctitle + '.pdf';//fname;
    CurrentReport.UseColor := UseCol;
    TDPLTrendReport(Currentreport).DetailedReportingPeriod := PeriodCB.ItemIndex;


    if FontSelector.Text <> '' then
      Currentreport.CurrentFont := FontSelector.Text
    else
      CurrentReport.CurrentFont := 'Arial';

    TDPLTrendReport(CurrentReport).CheckColumns;
    ppreport1.Reset;
    setReportPreview(ppReport1);
    ppreport1.PrinterSetup.Orientation := poPortrait;
    WrapChars := #13#10;
    if CurrentReport.DetailWidth > ppReport1.PrinterSetup.PrintableWidth then
      begin
      ppreport1.PrinterSetup.Orientation := poLandscape;
      WrapChars := '';
      end;
    CurrentReport.ReportTitle := ReportMTitle + WrapChars + ' for the period ending '
   + FormatDateTime('dd MMM yyy', DataModuleClient.DepartmentsCurrentPlanEnd.value);
    rbLine1.Left := 8;
    rbLine1.Width := ppReport1.PrinterSetup.PrintableWidth - 16.0;
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

procedure TReportingTargetsF.ActDetPNLGRExecute(Sender: TObject);
var
  I: Integer;
//  cx : extended;
  Fname : String;
  Save_Cursor:TCursor;
  PeriodTitle : String;
begin
  if not CheckPlandates(False) then exit;
  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crHourglass;    { Show hourglass cursor }

    DKeyIndicator := False;

    Application.CreateForm(TTargetDetailGRepF, TargetDetailGRepF);
    TargetDetailGRepF.DataConsolidate := Consolid;
    for I := 0 to ReportOptionsList.Items.Count - 1 do    // Iterate
      begin
      if (ReportOptionsList.Items.Items[I].DisplayName = 'Annualise Amounts') and
        (ReportOptionsList.items.Items[I].Checked) then
        Annualise := True;
      end;    // for


    if FontSelector.Text <> '' then
      TargetDetailGRepF.ReportFont := FontSelector.Text
    else
      TargetDetailGRepF.ReportFont := 'Arial';
    with TargetDetailGRepF do
    begin
      Font.Name := ReportFont;
      Chart1.Chart.Title.Font.Name := ReportFont;
      rbCompanyName.Font.Name := ReportFont;
      rbDepartment.Font.Name := ReportFont;
      rbQRLabel1.Font.Name := ReportFont;
//      rbQRLabel3.Font.Name := ReportFont;
    end;    // with

    Fname := DataModuleClient.BusinessDetailsBusiness_Name.AsString + ' - Detailed Target Profit and Loss Graph.pdf';//fname;
    TargetDetailGRepF.UseColor := False;
    Annualise := False;
    TargetDetailGRepF.ThreeDImage := False;
    TargetDetailGRepF.ShowMarks := False;
    for I := 0 to ReportOptionsList.Items.Count - 1 do    // Iterate
      begin
      if (ReportOptionsList.Items.Items[I].DisplayName = 'Use Color in Reports') and
        (ReportOptionsList.items.Items[I].Checked) then TargetDetailGRepF.UseColor := True;

      if (ReportOptionsList.Items.Items[I].DisplayName = '3D Graphs') and
        (ReportOptionsList.items.Items[I].Checked) then
        TargetDetailGRepF.ThreeDImage := True;
      if (ReportOptionsList.Items.Items[I].DisplayName = 'Values Visible') and
        (ReportOptionsList.items.Items[I].Checked) then
        TargetDetailGRepF.ShowMarks := True;
      end;    // for

    ReportMTitle := 'Detailed Profit and Loss Trend Graph Report';
    if PeriodCB.ItemIndex < (PeriodCB.Properties.items.Count - 1) then
      PeriodTitle := PeriodCB.text + ' '
    else
      PeriodTitle := '';
    TargetDetailGRepF.rbQRLabel1.Caption := 'Detailed ' + PeriodTitle + 'Target Profit and Loss Graph Report';
    TargetDetailGRepF.rbQRPeriodInFo.caption := 'From ' + formatdateTime(GGlobals.DateFENH, DataModuleClient.DepartmentsCurrentPlanStart.value)
      + ' to ' + FormatDateTime(GGlobals.DateFENH, DataModuleClient.DepartmentsCurrentPlanEnd.value);
    TargetDetailGRepF.DetailedReportingPeriod := PeriodCB.ItemIndex;
    TargetDetailGRepF.GetNumberRecords;
		TargetDetailGRepF.rbCompanyName.Caption := DataModuleClient.BusinessDetailsBusiness_Name.AsString;
    SetGroupNames(TargetDetailGRepF);
{    if TargetDetailGRepF.DataConsolidate = ctBusiness then
      TargetDetailGRepF.rbDepartments.Caption := 'Businesses Consolidated (' + ConsolidatedNameList + ')'
    else if TargetDetailGRepF.DataConsolidate = ctDepartment then
      TargetDetailGRepF.rbDepartments.Caption := 'Departments Consolidated (' + ConsolidatedNameList + ')'
    else
      TargetDetailGRepF.rbDepartments.Caption := DataModuleClient.BusinessesBRANCH_NAME.Value + '/' + DataModuleClient.DepartmentsRevenue_Group_Name.Value;
}
//      TargetDetailGRepF.rbDepartments.Caption := convertAccelCharToAmpersand(DataModuleClient.DepartmentsRevenue_Group_Name.Value);
//    if length(TargetDetailGRepF.rbDepartments.Caption) > 200 then
//      TargetDetailGRepF.rbDepartments.Font.Size := 8
//    else
//      TargetDetailGRepF.rbDepartments.Font.Size := 10;
    TargetDetailGRepF.ppreport1.AllowPrintToFile := True;
    TargetDetailGRepF.ppreport1.ShowPrintDialog := True;
    setReportPreview(TargetDetailGRepF.ppReport1);

    TargetDetailGRepF.ppReport1.TextFileName := ReportingBaseFolder + fname;
    TargetDetailGRepF.ppReport1.DeviceType := 'Screen';
    TargetDetailGRepF.ppreport1.print;

    TargetDetailGRepF.Free;
  finally
    Screen.Cursor := Save_Cursor;  { Always restore to normal }
  end;
end;

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
    Screen.Cursor := crHourglass;    { Show hourglass cursor }

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
		CurrentReport.businessName := DataModuleClient.BusinessDetailsBusiness_Name.AsString;
		CurrentReport.DepartmentName := DataModuleClient.DepartmentsRevenue_Group_Name.AsString;
		CurrentReport.Doctitle := DataModuleClient.BusinessDetailsBusiness_Name.AsString + ' - Detailed Target Key Targets Report';
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

procedure TReportingTargetsF.ActDetKeyIndicGRExecute(Sender: TObject);
var
  I: Integer;
//  cx : extended;
  Fname : String;
  Save_Cursor:TCursor;
  PeriodTitle : String;
begin
  if not CheckPlandates(False) then exit;
  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crHourglass;    { Show hourglass cursor }
    DKeyIndicator := True;
    Application.CreateForm(TTargetDetailGRepF, TargetDetailGRepF);
    TargetDetailGRepF.DataConsolidate := consolid;
    for I := 0 to ReportOptionsList.Items.Count - 1 do    // Iterate
      begin
      if (ReportOptionsList.Items.Items[I].DisplayName = 'Annualise Amounts') and
        (ReportOptionsList.items.Items[I].Checked) then
        Annualise := True;
      end;    // for
   if FontSelector.Text <> '' then
      TargetDetailGRepF.ReportFont := FontSelector.Text
    else
      TargetDetailGRepF.ReportFont := 'Arial';
    with TargetDetailGRepF do
    begin
      Font.Name := ReportFont;
      Chart1.Chart.Title.Font.Name := ReportFont;
      rbCompanyName.Font.Name := ReportFont;
      rbDepartment.Font.Name := ReportFont;
      rbQRLabel1.Font.Name := ReportFont;
//      rbQRLabel3.Font.Name := ReportFont;
    end;    // with

		Fname := DataModuleClient.BusinessDetailsBusiness_Name.AsString + ' - Detailed Key Indicator Graph Report.pdf';//fname;
    TargetDetailGRepF.UseColor := False;
    Annualise := False;
    TargetDetailGRepF.ThreeDImage := False;
    TargetDetailGRepF.ShowMarks := False;
    for I := 0 to ReportOptionsList.Items.Count - 1 do    // Iterate
      begin
      if (ReportOptionsList.Items.Items[I].DisplayName = 'Use Color in Reports') and
        (ReportOptionsList.items.Items[I].Checked) then TargetDetailGRepF.UseColor := True;

      if (ReportOptionsList.Items.Items[I].DisplayName = '3D Graphs') and
        (ReportOptionsList.items.Items[I].Checked) then
        TargetDetailGRepF.ThreeDImage := True;
      if (ReportOptionsList.Items.Items[I].DisplayName = 'Values Visible') and
        (ReportOptionsList.items.Items[I].Checked) then
        TargetDetailGRepF.ShowMarks := True;
      end;    // for

    ReportMTitle := 'Detailed Profit and Loss Trend Graph Report';
    if PeriodCB.ItemIndex < (PeriodCB.Properties.items.Count - 1) then
      PeriodTitle := PeriodCB.text + ' '
    else
      PeriodTitle := '';
    TargetDetailGrepF.rbQRLabel1.Caption := 'Detailed ' + PeriodTitle + 'Target Key Indicator Graph Report';
    TargetDetailGRepF.rbQRPeriodInFo.caption := 'From ' + formatdateTime(GGlobals.DateFENH, DataModuleClient.DepartmentsCurrentPlanStart.value)
      + ' to ' + FormatDateTime(GGlobals.DateFENH, DataModuleClient.DepartmentsCurrentPlanEnd.value);
    TargetDetailGRepF.DetailedReportingPeriod := PeriodCB.ItemIndex;
    TargetDetailGRepF.GetNumberRecords;
		TargetDetailGRepF.rbCompanyName.Caption := DataModuleClient.BusinessDetailsBusiness_Name.AsString;
    SetGroupNames(TargetDetailGRepF);
{    if TargetDetailGRepF.DataConsolidate = ctBusiness then
      TargetDetailGRepF.rbDepartments.Caption := 'Businesses Consolidated (' + ConsolidatedNameList + ')'
    else if TargetDetailGRepF.DataConsolidate = ctDepartment then
      TargetDetailGRepF.rbDepartments.Caption := 'Departments Consolidated (' + ConsolidatedNameList + ')'
    else
      TargetDetailGRepF.rbDepartments.Caption := DataModuleClient.BusinessesBRANCH_NAME.Value + '/' + DataModuleClient.DepartmentsRevenue_Group_Name.Value;
}
//      TargetDetailGRepF.rbDepartments.Caption := convertAccelCharToAmpersand(DataModuleClient.DepartmentsRevenue_Group_Name.Value);
{
    if length(TargetDetailGRepF.rbDepartments.Caption) > 200 then
      TargetDetailGRepF.rbDepartments.Font.Size := 8
    else
      TargetDetailGRepF.rbDepartments.Font.Size := 10;
}
    TargetDetailGRepF.ppreport1.AllowPrintToFile := True;
    TargetDetailGRepF.ppreport1.ShowPrintDialog := True;
    setReportPreview(TargetDetailGRepF.ppReport1);
    TargetDetailGRepF.ppReport1.TextFileName := ReportingBaseFolder + fname;
    TargetDetailGRepF.ppReport1.DeviceType := 'Screen';
    TargetDetailGRepF.ppreport1.print;

    TargetDetailGRepF.Free;
  finally
    Screen.Cursor := Save_Cursor;  { Always restore to normal }
  end;
end;

procedure TReportingTargetsF.ActSumCashFlowReportExecute(Sender: TObject);
var
  I : Integer;
  Fname : String;
  useCol : Boolean;
  Save_Cursor:TCursor;
//  PeriodTitle : string;
  WrapChars : string;
begin
  if not CheckPlandates(False) then exit;
  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crHourglass;    { Show hourglass cursor }
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

{    if PeriodCB.ItemIndex < (PeriodCB.Properties.items.Count - 1) then
      PeriodTitle := PeriodCB.text + ' '
    else
      PeriodTitle := '';
}
    ReportMTitle := 'Summary Cash Flow Report';
    TCashFlowReport(CurrentReport) := TCashFlowReport.create(Consolid, ReportMTitle, poLandscape);
		CurrentReport.businessName := DataModuleClient.BusinessDetailsBusiness_Name.AsString;
		CurrentReport.DepartmentName := DataModuleClient.DepartmentsRevenue_Group_Name.AsString;
		CurrentReport.Doctitle := DataModuleClient.BusinessDetailsBusiness_Name.AsString + ' - Summary Cash Flow';
    Fname := CurrentReport.Doctitle + '.pdf';//fname;
    CurrentReport.UseColor := UseCol;
    TCashFlowReport(Currentreport).DetailedReportingPeriod := 4; // Monthly Only  PeriodCB.ItemIndex;


    if FontSelector.Text <> '' then
      Currentreport.CurrentFont := FontSelector.Text
    else
      CurrentReport.CurrentFont := 'Arial';

    TCashFlowReport(CurrentReport).CheckColumns;
    ppreport1.Reset;
    setReportPreview(ppReport1);
    ppreport1.PrinterSetup.Orientation := poPortrait;
    WrapChars := #13#10;
    if CurrentReport.DetailWidth > ppReport1.PrinterSetup.PrintableWidth then
      begin
      ppreport1.PrinterSetup.Orientation := poLandscape;
      WrapChars := '';
      end;
    CurrentReport.ReportTitle := ReportMTitle + WrapChars + ' for the period ending '
   + FormatDateTime('dd MMM yyy', DataModuleClient.DepartmentsCurrentPlanEnd.value);
    rbLine1.Left := 8;
    rbLine1.Width := ppReport1.PrinterSetup.PrintableWidth - 16.0;
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

procedure TReportingTargetsF.ActDetailedWorkingCapitalReportExecute(Sender: TObject);
var
  I : Integer;
  Fname : String;
  useCol : Boolean;
  Save_Cursor:TCursor;
//  PeriodTitle : string;
  WrapChars : string;
begin
  if not CheckPlandates(False) then exit;
  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crHourglass;    { Show hourglass cursor }

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

{    if PeriodCB.ItemIndex < (PeriodCB.Properties.items.Count - 1) then
      PeriodTitle := PeriodCB.text + ' '
    else
      PeriodTitle := '';
}
    ReportMTitle := 'Detailed Working Capital Report';
    TDetailedWorkingCapitalReport(CurrentReport) := TDetailedWorkingCapitalReport.create(Consolid, ReportMTitle, poLandscape);
		CurrentReport.businessName := DataModuleClient.BusinessDetailsBusiness_Name.AsString;
		CurrentReport.DepartmentName := DataModuleClient.DepartmentsRevenue_Group_Name.AsString;
		CurrentReport.Doctitle := DataModuleClient.BusinessDetailsBusiness_Name.AsString + ' - Detailed Working Capital';
    Fname := CurrentReport.Doctitle + '.pdf';//fname;
    CurrentReport.UseColor := UseCol;
    TDetailedWorkingCapitalReport(Currentreport).DetailedReportingPeriod := 4; // Monthly Only  PeriodCB.ItemIndex;


    if FontSelector.Text <> '' then
      Currentreport.CurrentFont := FontSelector.Text
    else
      CurrentReport.CurrentFont := 'Arial';

    TDetailedWorkingCapitalReport(CurrentReport).CheckColumns;
    ppreport1.Reset;
    setReportPreview(ppReport1);
    ppreport1.PrinterSetup.Orientation := poPortrait;
    WrapChars := #13#10;
    if CurrentReport.DetailWidth > ppReport1.PrinterSetup.PrintableWidth then
      begin
      ppreport1.PrinterSetup.Orientation := poLandscape;
      WrapChars := '';
      end;
    CurrentReport.ReportTitle := ReportMTitle + WrapChars + ' for the period ending '
   + FormatDateTime('dd MMM yyy', DataModuleClient.DepartmentsCurrentPlanEnd.value);
    rbLine1.Left := 8;
    rbLine1.Width := ppReport1.PrinterSetup.PrintableWidth - 16.0;
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

procedure TReportingTargetsF.ActChangeTargetPeriodExecute(Sender: TObject);
var
  I: Integer;
begin
  DataModuleClient.DepartmentsCurrentPlanStart.DisplayFormat := '';
  DataModuleClient.DepartmentsCurrentPlanEnd.DisplayFormat := '';

  SelectedType := stTarget;
  Application.CreateForm(TBusinessSetupF, BusinessSetupF);
  BusinessSetupF.showmodal;
  BusinessSetupF.free;
  DataModuleClient.DepartmentsCURRENTPLANSTART.DisplayFormat := GGlobals.GetDateFENH;
  DataModuleClient.DepartmentsCURRENTPLANEND.DisplayFormat := GGlobals.GetDateFENH;

  for I := 0 to ColumnList.Items.Count - 1 do    // Iterate
    begin
    if ColumnList.items[I].Caption = 'Target' then
      begin
      ColumnList.Items[I].SubItems.strings[0] := DataModuleClient.DepartmentsCURRENTPLANSTART.DisplayText;
      ColumnList.Items[I].SubItems.strings[1] := DataModuleClient.DepartmentsCURRENTPLANEND.DisplayText;
      end;
    end;    // for
end;

procedure TReportingTargetsF.PeriodCBPropertiesChange(Sender: TObject);
var
  I, J: Integer;
begin
  J := -1;
  for I := 0 to ReportOptionsList.Items.Count - 1 do    // Iterate
    begin
    if (ReportOptionsList.Items.Items[I].DisplayName = 'Values Visible') then
      J := I;
    end;    // for
  if PeriodCB.ItemIndex < 2 then
    begin
    if ReportOptionsList.items.Items[J].Checked then
      begin
      ReportOptionsList.items.Items[J].Checked := False;
      MarksWerevisible := True;
      end;
    if ReportOptionsList.Items.Items[J].Enabled then
      ReportOptionsList.Items.Items[J].Enabled := False;
    end
  else
    begin
    if not ReportOptionsList.Items.Items[J].Enabled then
      ReportOptionsList.Items.Items[J].Enabled := True;
    if MarksWerevisible then // Used to restore previous state if applicable
      begin
      MarksWerevisible := False;
      ReportOptionsList.items.Items[J].Checked := True;
      end;
    end;
end;

procedure TReportingTargetsF.cxDBTextEdit1PropertiesChange(
  Sender: TObject);
begin
  SetcolumnList;
  SetDeptList;
end;

procedure TReportingTargetsF.ActProjectedBalanceSheetsExecute(
  Sender: TObject);
var
  I : Integer;
  Fname : String;
  useCol : Boolean;
  Save_Cursor:TCursor;
//  PeriodTitle : string;
  WrapChars : string;
begin
  if not CheckPlandates(False) then exit;
  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crHourglass;    { Show hourglass cursor }

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

{    if PeriodCB.ItemIndex < (PeriodCB.Properties.items.Count - 1) then
      PeriodTitle := PeriodCB.text + ' '
    else
      PeriodTitle := '';
}
    ReportMTitle := 'Projected Balance Sheet Report';
    TBalanceSheetReport(CurrentReport) := TBalanceSheetReport.create(Consolid, ReportMTitle, poLandscape);
		CurrentReport.businessName := DataModuleClient.BusinessDetailsBusiness_Name.AsString;
		CurrentReport.DepartmentName := DataModuleClient.DepartmentsRevenue_Group_Name.AsString;
//    CurrentReport.DepartmentName := convertAccelCharToAmpersand(DataModuleClient.DepartmentsRevenue_Group_Name.Value);
		CurrentReport.Doctitle := DataModuleClient.BusinessDetailsBusiness_Name.AsString + ' - Projected Balance Sheet';
    Fname := CurrentReport.Doctitle + '.pdf';//fname;
    CurrentReport.UseColor := UseCol;
    TBalanceSheetReport(Currentreport).DetailedReportingPeriod := 4; // Monthly Only  PeriodCB.ItemIndex;


    if FontSelector.Text <> '' then
      Currentreport.CurrentFont := FontSelector.Text
    else
      CurrentReport.CurrentFont := 'Arial';

    TBalanceSheetReport(CurrentReport).CheckColumns;
    ppreport1.Reset;
    setReportPreview(ppReport1);
    ppreport1.PrinterSetup.Orientation := poPortrait;
    WrapChars := #13#10;
    if CurrentReport.DetailWidth > ppReport1.PrinterSetup.PrintableWidth then
      begin
      ppreport1.PrinterSetup.Orientation := poLandscape;
      WrapChars := '';
      end;
    CurrentReport.ReportTitle := ReportMTitle + WrapChars + ' for periods ending '
   + FormatDateTime('dd MMM yyy', DataModuleClient.DepartmentsCurrentPlanEnd.value);
    rbLine1.Left := 8;
    rbLine1.Width := ppReport1.PrinterSetup.PrintableWidth - 16.0;
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

Procedure TReportingTargetsF.SetGroupNames(FormName: TForm);
var
  I, J: Integer;
  GTitle, DTitle : TppLabel;
  cfConsolid : Boolean;
  SelectedBranchID : integer;
begin
  DTitle := nil;
  GTitle := nil;
  cfConsolid := False;
  for I := 0 to Formname.ComponentCount - 1 do    // Iterate
    begin
    if Formname.Components[I].name = 'GroupLabel' then
      GTitle := TppLabel(Formname.Components[I]);
    if Formname.Components[I].name = 'rbDepartment' then
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

procedure TReportingTargetsF.ConsolidationRGClick(Sender: TObject);
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

procedure TReportingTargetsF.BusinessListExit(Sender: TObject);
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

procedure TReportingTargetsF.SetDeptList;
Var
  J : integer;
begin
  DataModuleClient.DeptRef2.indexName := 'DEPTNAMEIDX';
  DataModuleClient.DeptRef2.First;
  DeptList.items.Clear;
  J := 0;
  while DataModuleClient.DeptRef2.eof = False do
    begin 
    if ((DepartmentsRG.ItemIndex = 0)
        or ((DepartmentsRG.ItemIndex = 1) and (DataModuleClient.DeptRef2Branch_Id.Value = DataModuleClient.BusinessesBranch_id.Value))) then
      begin
      TcxCheckListBoxItems(DeptList.Items).Add.Text := DataModuleClient.DeptRef2Revenue_Group_Name.AsString;
      if (DataModuleClient.DeptRef2Exclude_from_Reporting.value = 0) then
        DeptList.items.Items[J].Checked := True
      else
        DeptList.items.Items[J].Checked := False;
      inc(J);
    end;
    DataModuleClient.DeptRef2.next;
    end;    // while
end;

procedure TReportingTargetsF.DepartmentsRGClick(Sender: TObject);
begin
  SetDeptList;
end;

procedure TReportingTargetsF.AccountFmtCBPropertiesEditValueChanged(
  Sender: TObject);
begin
  GGlobals.Produce_AccountFmt := AccountFmtCB.Checked;
end;

function TReportingTargetsF.ppJITPipeline1GetFieldValue(
  aFieldName: String): Variant;
begin
  if aFieldName = 'CLIENT NAME' then
    Result := CurrentReport.BusinessName;
  if aFieldName = 'PERIOD END' then
    Result := formatdatetime('d mmmm, yyyy', DatamoduleClient.DepartmentsCURRENTPLANEND.Value);
  if aFieldName = 'CURRENT DATE' then
    begin
    Result := formatdatetime('d mmmm, yyyy', now());
    end;
end;

procedure TReportingTargetsF.ppDetailBand1BeforeGenerate(Sender: TObject);
begin
    ppRichText1.Visible := True;
    ppPaintBox1.Visible := True;
    DisclaimerFooter.Visible := True;
end;

procedure TReportingTargetsF.ppDetailBand1AfterGenerate(Sender: TObject);
begin
  if DisclaimerCB.Checked and (ppreport1.PageNo = CurrentReport.DisclaimPageNo) then
    begin
    DisclaimerFooter.Visible := False;
    ppPaintBox1.Visible := false;
    ppRichText1.BringToFront;
    end
  else
    begin
    if Not DisclaimerCB.Checked then
      DisclaimerFooter.Visible := False;
    ppRichText1.SendToBack;
    ppPaintBox1.Visible := True;
    ppRichText1.Visible := False;
    end;
end;

end.
