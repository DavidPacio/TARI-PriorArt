unit PrintInvoices;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons,
  AuchTypes, CustomPDFReport, TrackingPDFReports, printers, LGlobals,
	ppModule, daDataModule, ppCtrls, ppVar, ppBands, ppPrnabl,
  ppClass, ppStrtch, ppCache, ppProd, ppReport, ppDB,
  ppComm, ppRelatv, ppDBJIT,  ppTypes, Registry,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxFontNameComboBox, cxLabel, DMrep1U, cxButtons, cxCheckBox, cxCalendar,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
	dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
	dxSkinXmas2008Blue, Menus, ppParameter, ppDesignLayer, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, ComCtrls, dxCore, ppPaintBox, InvoiceClass;

type
  TPrintInvoicesF = class(TForm)
    ppJITPipeline1: TppJITPipeline;
    ppJITPipeline1ppField1: TppField;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    BusinessName: TppLabel;
    ReportTitle: TppLabel;
    DepartmentDetail: TppLabel;
    RbSortType: TppLabel;
		ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    daDataModule1: TdaDataModule;
    FontSelector: TcxFontNameComboBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    QuotesStartDate: TcxDateEdit;
    RateCalcCB: TcxCheckBox;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    CloseBtn: TcxButton;
    QuotesBtn: TcxButton;
    PreviewZoomCB: TcxComboBox;
    QuotesEndDate: TcxDateEdit;
    QuoteSortCB: TcxComboBox;
    RBText1: TppLabel;
    RBLine1: TppLine;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppPaintBox1: TppPaintBox;
    procedure QuotesBtnClick(Sender: TObject);
    procedure ppReport1BeforePrint(Sender: TObject);
//    procedure ppTWPaintBox1DrawPaintbox(Sender: TObject; Canvas: TCanvas;
//      ClipRect: TRect);
    procedure FormCreate(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure ppPaintBox1Print(Sender: TObject);
  private
    { Private declarations }
    procedure SetReportPreview(Rep : TppReport);
  public
    { Public declarations }
    InvoiceO : TInvoiceDetail;
    InvType : TInvType;
  end;

var
  PrintInvoicesF: TPrintInvoicesF;
  directory, params  : array[0..200] of char;
  Currentreport : TCustomReport;

implementation

uses DMClient;

{$R *.dfm}

procedure TPrintInvoicesF.QuotesBtnClick(Sender: TObject);
var
  I: Integer;
  cx : extended;
  Fname, reportMTitle : String;
  Repcol : TRepColPtr;
  Save_Cursor:TCursor;
begin
  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crHourglass; { Show hourglass cursor }
    GGlobals.TimeSheetRate := RateCalcCB.Checked;
    ReportMTitle := 'Listing of Invoices';
    QStartDate := QuotesStartDate.Date;
    QEndDate := QuotesEndDate.Date;
    PDFInvType := InvType;
    TInvoicesReport(CurrentReport) := TInvoicesReport.create(ctNormal, ReportMTitle, poLandscape);
    TInvoicesReport(CurrentReport).InvoiceO := InvoiceO;
		CurrentReport.businessName := DataModuleClient.BusinessDetailsBusiness_Name.AsString;
		CurrentReport.DepartmentName := DataModuleClient.DepartmentsRevenue_Group_Name.AsString;
    TInvoicesReport(CurrentReport).SortInvoices(TInvoiceSortType(QuoteSortCB.ItemIndex));
    TInvoicesReport(CurrentReport).LocalInvType := InvType;
    CurrentReport.ReportTitle := ReportMTitle + #13#10
      +  'For the period ' + FormatDateTime(GGlobals.DateFENH, QStartDate) + ' to ' + FormatDateTime(GGlobals.DateFENH, QEndDate);
    rbSortType.Visible := True;
    case TInvoiceSortType(QuoteSortCB.ItemIndex) of
      stAsEntered: RbSortType.Caption := '(Sorted as Entered)';
      stAverageRate: RbSortType.Caption := '(Sorted by ' + 'Average Rate)';
      stSales: RbSortType.Caption := '(Sorted by Sales Value)';
      stGPPC: RbSortType.Caption := '(Sorted by Gross Profit %)';
      stInvoiceNumber: RbSortType.Caption := '(Sorted by Invoice Number)';
      stdate: RbSortType.Caption := '(Sorted by Invoice Date)';
    end;    // case

    CurrentReport.Doctitle := DataModuleClient.BusinessDetailsBusiness_Name.AsString + ' - Invoice Listing';
    Fname := CurrentReport.Doctitle + '.pdf';//fname;
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
    BusinessName.Left := 0.0;
    BusinessName.Width := ppReport1.PrinterSetup.PrintableWidth;
    ReportTitle.Left := 0.0;
    ReportTitle.Width := ppReport1.PrinterSetup.PrintableWidth;
    rbLine1.Left := 8.0;
    ppSystemVariable1.Left := 8.0;
    DepartmentDetail.Left := 8.0;
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
    ppReport1.TextFileName := GGlobals.Basedir + 'Reports\' + Fname;
    ppReport1.Print;
    CurrentReport.free;
  finally
    Screen.Cursor := Save_Cursor;  { Always restore to normal }
  end;
end;

procedure TPrintInvoicesF.ppPaintBox1Print(Sender: TObject);
begin
  ppPaintBox1.Canvas.StretchDraw(ppPaintBox1.spClipRect, TGraphic(CurrentReport.Metafiles[ppJITPipeline1.RecordIndex + 1]));
end;

procedure TPrintInvoicesF.ppReport1BeforePrint(Sender: TObject);
var
  YYY : Single;
begin
  if not CurrentReport.prepared then
    begin
    BusinessName.Caption := CurrentReport.BusinessName;
    Businessname.Visible := True;
    ReportTitle.Caption := CurrentReport.ReportTitle;
    ReportTitle.Visible := true;
    if CurrentReport.Consolidate in [ctBusiness, ctDepartment]then
      departmentDetail.Caption := 'Department/Revenue Group: Consolidated'
    else
      departmentDetail.Caption := 'Department/Revenue Group: ' + CurrentReport.DepartmentName;
    DepartmentDetail.Visible := True;
    ppreport1.PrinterSetup.DocumentName := CurrentReport.BusinessName + ' - ' + CurrentReport.ReportName + '.pdf';
    ppreport1.PreviewForm.DisplayDocumentName := True;
    YYY := ppreport1.PrinterSetup.PrintableHeight - ppreport1.Header.Height - ppReport1.Footer.Height - 0.5;
    ppJITPipeline1.RecordCount := CurrentReport.Prepare(YYY, ppreport1, ppPaintBox1);
    ppPaintBox1.Height := ppreport1.PrinterSetup.PrintableHeight - ppreport1.Header.Height - ppReport1.Footer.Height - 0.5;
    CurrentReport.prepared := True;
    end;
end;

{
procedure TPrintInvoicesF.ppTWPaintBox1DrawPaintbox(Sender: TObject;
  Canvas: TCanvas; ClipRect: TRect);
var
  X,Y, useRight, UseBottom : integer;
  Lrect : TRECT;
begin
  X := GetdeviceCaps(Canvas.Handle, LOGPIXELSX);
  Y := GetdeviceCaps(Canvas.Handle, LOGPIXELSY);

  if (ppReport1.Printersetup.Orientation = poLandscape) and
    (GGlobals.IsWIN95) and (Canvas.ClipRect.Bottom > Canvas.ClipRect.Right) then
    begin
    UseRight := Canvas.ClipRect.Bottom;
    UseBottom := Canvas.ClipRect.Right;
    end
  else
    begin
    UseRight := Canvas.ClipRect.Right;
    UseBottom := Canvas.ClipRect.Bottom;
    end;

  LRect.Left := Canvas.ClipRect.Left + Round((X * 1.0) / 25.4);
  LRect.Top := Canvas.ClipRect.Top + Round((Y * 1.0) / 25.4);
  LRect.Right := UseRight - Round((X * 2.0) / 25.4);
  LRect.Bottom := UseBottom - Round((Y * 2.0) / 25.4);
//  LRect.Right := Canvas.ClipRect.Right - Round((X * 2.0) / 25.4);
//  LRect.Bottom := Canvas.ClipRect.Bottom - Round((Y * 2.0) / 25.4);
  Canvas.StretchDraw( LRect, TGraphic(CurrentReport.Metafiles[ppJITPipeline1.RecordIndex + 1]));
end;
}

procedure TPrintInvoicesF.SetReportPreview(Rep : TppReport);
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

procedure TPrintInvoicesF.FormCreate(Sender: TObject);
begin
//  Color := GGlobals.FormColour;
  DMrep1.TariButtonList.GetImage(0, CloseBtn.Glyph);
  Caption := 'Print Invoices - ' + DataModuleClient.BusinessDetailsBusiness_Name.AsString;
  FontSelector.FontName := GGlobals.Reporting.ReportFont;
  PreviewZoomCB.ItemIndex := 9;
  QuoteSortCB.ItemIndex := 1;
end;

procedure TPrintInvoicesF.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

end.
