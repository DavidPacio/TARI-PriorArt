unit Quotes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, AuchTypes, db, variants, LGlobals, cxControls, cxContainer,
  cxEdit, cxLabel, DMrep1U,
  cxGridCustomTableView, cxGridCardView, cxGridDBCardView, cxClasses,
  cxGridCustomView, cxGridLevel, cxGrid, cxGridTableView, cxGridDBTableView,
  cxButtons, cxCustomData, cxCurrencyEdit, cxTextEdit, cxDBLabel, ExtCtrls,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxFilter, cxData, cxDataStorage,
  cxDBData, cxCalendar, Menus, cxGridCustomLayoutView, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint;

type

  TQuotesF = class(TForm)
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    QuotesCardView: TcxGridDBCardView;
    QuotesCardViewQUOTE_NUMBER: TcxGridDBCardViewRow;
    QuotesCardViewCUSTOMERNAME: TcxGridDBCardViewRow;
    QuotesCardViewQ_DATE: TcxGridDBCardViewRow;
    QuotesCardViewQ_VALUE: TcxGridDBCardViewRow;
    QuotesCardViewQ_MATERIALS: TcxGridDBCardViewRow;
    QuotesCardViewQ_SUBCONTRACTORS: TcxGridDBCardViewRow;
    QuotesCardViewTARGETUNITS: TcxGridDBCardViewRow;
    QuotesCardViewQ_GP: TcxGridDBCardViewRow;
    QuotesCardViewQ_RATE: TcxGridDBCardViewRow;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1DEPT_ID: TcxGridDBColumn;
    cxGrid2DBTableView1QUOTE_NUMBER: TcxGridDBColumn;
    cxGrid2DBTableView1CUSTOMERNAME: TcxGridDBColumn;
    cxGrid2DBTableView1Q_DATE: TcxGridDBColumn;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    QuoteInsertBtn: TcxButton;
    QuotesDeleteBtn: TcxButton;
    RelatedInvoicesTV: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    RelatedInvoicesTVINVOICE_NUMBER: TcxGridDBColumn;
    RelatedInvoicesTVINV_DATE: TcxGridDBColumn;
    RelatedInvoicesTVNETSALES: TcxGridDBColumn;
    RelatedInvoicesTVMATERIALSATCOST: TcxGridDBColumn;
    RelatedInvoicesTVSUBCONTRACTORS: TcxGridDBColumn;
    RelatedInvoicesTVGrossProfit: TcxGridDBColumn;
    RelatedInvoicesTVRECORDEDUNITS: TcxGridDBColumn;
    RelatedInvoicesTVUNITSREQUIRED: TcxGridDBColumn;
    RelatedInvoicesTVAverageRate: TcxGridDBColumn;
    cxLabel4: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    NetSalesVar: TcxCurrencyEdit;
    MaterialsVar: TcxCurrencyEdit;
    SubContractorsVar: TcxCurrencyEdit;
    GrossProfitVar: TcxCurrencyEdit;
    UnitsVar: TcxCurrencyEdit;
    RateVar: TcxCurrencyEdit;
    TargetRate: TcxCurrencyEdit;
    TrackedRate: TcxCurrencyEdit;
    TargetRateVar: TcxCurrencyEdit;
    TrackedRateVar: TcxCurrencyEdit;
    cxLabel5: TcxLabel;
    CloseBtn: TcxButton;
    cxLabel6: TcxLabel;
    TargetLabel: TcxLabel;
    TrackLabel: TcxLabel;
    RateCalcBtn: TcxButton;
    cxDBLabel4: TcxDBLabel;
    cxLabel14: TcxLabel;
    cxDBLabel3: TcxDBLabel;
    cxLabel15: TcxLabel;
    UnitsTSVar: TcxCurrencyEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure InvGridUpdateFooter(Sender: TObject);
    procedure AverageRateExit(Sender: TObject);
    procedure AverageRateChange(Sender: TObject);
    procedure DBNetSalesExit(Sender: TObject);
    procedure DBNetSalesChange(Sender: TObject);
    procedure RateCalcCBClick(Sender: TObject);
    procedure QuoteInsertBtnClick(Sender: TObject);
    procedure QuotesDeleteBtnClick(Sender: TObject);
    procedure RelatedInvoicesTVDataControllerSummaryAfterSummary(ASender: TcxDataSummary);
    procedure cxGrid2DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure QuotesCardViewQUOTE_NUMBERPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure QuotesCardViewFocusedItemChanged(
      Sender: TcxCustomGridTableView; APrevFocusedItem,
      AFocusedItem: TcxCustomGridTableItem);
//    procedure DeleteBtnClick(Sender: TObject);
  private
    { Private declarations }
    Initialised: boolean;
    RateBalances : array[0..3] of Currency;
    TotalArray : Array[0..6] of Currency;
    procedure UpdateRates(State : TQuoteState; Date : TDateTime);
    procedure UpdateVariance;
  public
    LastQuoteNumber: string;
    { Public declarations }
    procedure setUnitsDesc(singvalue, pluralValue: string);
  end;

var
  QuotesF : TQuotesF;
  LocalStartDate, LocalEndDate : TDateTime;
  QGroupName, PluralName : String;
  ClearFooterB : Boolean;

implementation

{$R *.DFM}
uses DMClient, DataCollector;

procedure TQuotesF.FormCreate(Sender: TObject);
begin
  Color := GGLobals.FormColour;
  DMrep1.TariButtonList.GetImage(0, CloseBtn.Glyph);
	Caption := 'Monitoring ' + DataModuleClient.DepartmentsInvGroupName.AsString + ' - ' + DataModuleClient.BusinessDetailsBusiness_Name.AsString;
	cxLabel2.Caption := 'Select and /or Sort ' + DataModuleClient.DepartmentsInvGroupName.AsString;
	cxLabel3.Caption := 'Add, Edit or Delete ' + DataModuleClient.DepartmentsInvGroupName.AsString;
	cxGrid2DBTableView1QUOTE_NUMBER.Caption := DataModuleClient.DepartmentsInvGroupName.AsString + ' ID';
	QuotesCardViewQUOTE_NUMBER.Caption := DataModuleClient.DepartmentsInvGroupName.AsString + ' ID';
//  DeptLabel.Caption := convertAccelCharToAmpersand(DataModuleClient.DepartmentsRevenue_Group_Name.Value);
	DataCollect.GetConsolidatedList(DataModuleClient.DepartmentsDEPT_ID.Value, ctNormal);
	DataModuleClient.QuotesQ_DATE.DisplayFormat := GGLobals.GetDateFENH;
  DataModuleClient.InvoiceLUINV_DATE.DisplayFormat := GGlobals.GetDateFENH;
  Initialised := False;
  GGlobals.TimeSheetRate := False;
end;

procedure TQuotesF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DataCollect.ClearConsolidatedList;
  Action := caFree;
end;

procedure TQuotesF.CloseBtnClick(Sender: TObject);
begin
	LastQuoteNumber := DataModuleClient.QuotesQuote_Number.AsString;
  if DataModuleClient.DSQuotes.State in [dsinsert, dsedit] then
    DataModuleClient.Quotes.Post;
  ModalResult := mrOK;
end;

{ ---------------------------------------------------------------------------- }
{ -- setUnitDesc - UnitDesc write property procedure, set the heading of the   }
{                  number of units columns using the value passed              }
{ ---------------------------------------------------------------------------- }
procedure TQuotesF.setUnitsDesc(singvalue, pluralValue: string);
begin
  QuotesCardViewTARGETUNITS.Caption := PluralValue + ' Targeted';
  QuotesCardViewQ_RATE.caption := 'Average Contrib. per ' + SingValue;
  RelatedInvoicesTVRECORDEDUNITS.Caption := 'Actual ' + PluralValue;
  RelatedInvoicesTVUNITSREQUIRED.Caption := 'Targeted ' + PluralValue;
  RelatedInvoicesTVAverageRate.Caption := 'Average Contrib. per ' + SingValue;
  PluralName := pluralValue;
end;

procedure TQuotesF.FormActivate(Sender: TObject);
begin
  Initialised := True;
  RateCalcCBClick(Sender);
  DBNetSalesExit(Sender);
  InvGridUpdateFooter(Sender);
end;

procedure TQuotesF.InvGridUpdateFooter(Sender: TObject);
Var
  I: Integer;
  OrderComplete : Boolean;
//  Tempbal : Currency;
begin
  for I := 0 to 6 do    // Iterate
    TotalArray[I] := 0;
  OrderComplete := False;
  with DataModuleClient do
    begin
    InvoiceLU2.First;
    while InvoiceLU2.eof = False do
      begin
      if (InvoiceLU2QUOTE_NUMBER.Value = QuotesQuote_number.value) {and (Not ClearFooterB)} then
        begin
        TotalArray[0] := TotalArray[0] + InvoiceLU2NetSales.value;
        TotalArray[1] := TotalArray[1] + InvoiceLU2MaterialsatCost.value;
        TotalArray[2] := TotalArray[2] + InvoiceLU2SubContractors.value;
        TotalArray[3] := TotalArray[0] - TotalArray[1] - TotalArray[2];
        TotalArray[4] := TotalArray[4] + InvoiceLU2RecordedUnits.value;
        TotalArray[5] := TotalArray[5] + InvoiceLU2UnitsRequired.value;
        if (not GGlobals.TimeSheetRate) and (TotalArray[4] <> 0)then
          TotalArray[6] := TotalArray[3] / TotalArray[4];
        if (GGlobals.TimeSheetRate) and (TotalArray[5] <> 0) then
          TotalArray[6] := TotalArray[3] / TotalArray[5];
        if InvoiceLU2OrderComplete.Value <> 0 then
          OrderComplete := true
        else
          OrderComplete := False;
        end;
      InvoiceLU2.next;
      end;    // while
    end;    // with
  if not OrderComplete then
    cxLabel4.Caption := 'Related Invoices - No Final Invoice'
  else
    CxLabel4.Caption := 'Related Invoices';
  cxLabel4.Refresh;
  AverageRateChange(Self);
end;

procedure TQuotesF.UpdateVariance;
Var
  I: Integer;
  Tempbal : Currency;
begin
  Tempbal := 0;
  for I := 0 to 5 do    // Iterate
    begin
    Tempbal := Tempbal + TotalArray[I];
    end;    // for
  if (Tempbal <> 0){ and (Not ClearFooterB)} then
    begin
    NetSalesVar.Value := TotalArray[0] - DataModuleClient.QuotesQ_VALUE.Value;
    MaterialsVar.Value := DataModuleClient.QuotesQ_MATERIALS.Value - TotalArray[1];
    SubcontractorsVar.Value := DataModuleClient.QuotesQ_SUBCONTRACTORS.Value - TotalArray[2];
    GrossProfitVar.Value := TotalArray[3] - DataModuleClient.QuotesQ_GP.Value;
    UnitsTSVar.Value := DataModuleClient.QuotesTARGETUNITS.Value - TotalArray[4];
    UnitsVar.Value := DataModuleClient.QuotesTARGETUNITS.Value - TotalArray[5];
    RateVar.value := TotalArray[6] - DataModuleClient.QuotesQ_RATE.Value;
    end
  else
    begin
    NetSalesVar.Value := 0;
    MaterialsVar.Value := 0;
    SubcontractorsVar.Value := 0;
    GrossProfitVar.Value := 0;
    UnitsTsVar.Value := 0;
    UnitsVar.Value := 0;
    RateVar.Value := 0;
    end;

  if NetSalesVar.Value >= 0 then
    NetSalesVar.Style.Font.Color := clBlack
  else
    NetSalesVar.Style.Font.Color := clRed;
  if MaterialsVar.Value >= 0 then
    MaterialsVar.Style.Font.Color := clBlack
  else
    MaterialsVar.Style.Font.Color := clRed;
  if SubcontractorsVar.Value >= 0 then
    SubcontractorsVar.Style.Font.Color := clBlack
  else
    SubcontractorsVar.Style.Font.Color := clRed;
  if GrossProfitVar.Value >= 0 then
    GrossProfitVar.Style.Font.Color := clBlack
  else
    GrossProfitVar.Style.Font.Color := clRed;
  if UnitsTSVar.Value >= 0 then
    UnitsTSVar.Style.Font.Color := clBlack
  else
    UnitsTSVar.Style.Font.Color := clRed;
  if UnitsVar.Value >= 0 then
    UnitsVar.Style.Font.Color := clBlack
  else
    UnitsVar.Style.Font.Color := clRed;
  if RateVar.Value >= 0 then
    RateVar.Style.Font.Color := clBlack
  else
    RateVar.Style.Font.Color := clRed;
end;

procedure TQuotesF.AverageRateExit(Sender: TObject);
begin
  if Initialised then
    UpdateVariance;
end;

procedure TQuotesF.UpdateRates(State : TQuoteState; Date : TDateTime);
var
  Lmonth : string;
begin
  Lmonth := formatDateTime('mmmm', Date);
  TargetLabel.caption := Lmonth + '''s Monthly Target';
  TargetRate.Value := RateBalances[MMONTHLYTARGET];
  TargetRateVar.Value := DataModuleClient.QuotesQ_RATE.Value - TargetRate.value;
  if State in [NewQuote, NoInvQuote] then
    begin // no variances
    TrackLabel.visible := False;
    TrackedRate.Visible := False;
    TrackedRateVar.Visible := False;
    end
  else
    begin
    TrackLabel.visible := True;
    TrackLabel.caption := 'Last Month''s Billed Rate';
    TrackedRate.Visible := True;
    TrackedRateVar.Visible := True;
    TrackedRate.Value := RateBalances[MLASTMONTHMONITORED];
    TrackedRateVar.Value := DataModuleClient.QuotesQ_RATE.Value - TrackedRate.Value;
    end;
  TargetLabel.Refresh;
  TrackLabel.Refresh;
  if TargetRateVar.Value >= 0 then
    TargetRateVar.Style.Font.Color := clBlack
  else
    TargetRateVar.Style.Font.Color := clRed;
  if TrackedRateVar.Value >= 0 then
    TrackedRateVar.Style.Font.Color := clBlack
  else
    TrackedRateVar.Style.Font.Color := clRed;
end;

procedure TQuotesF.AverageRateChange(Sender: TObject);
begin
  if initialised then
    begin
    with DataModuleClient do
      begin
      InvoiceLU2.Last;
      if InvoiceLU2Inv_Date.value > 0 then
        begin
        DataCollect.GetRateBalances(RateBalances, InvoiceLU2Inv_Date.value);
        UpdateRates(InvQuote, InvoiceLU2Inv_Date.value);
        end
      else
        begin
        DataCollect.GetRateBalances(RateBalances, QuotesQ_Date.value);
        UpdateRates(NoInvQuote, QuotesQ_Date.value);
        end;
      end;    // with
    UpdateVariance;
    end;
end;

procedure TQuotesF.DBNetSalesExit(Sender: TObject);
begin
  if Initialised then
    UpdateVariance;
end;

procedure TQuotesF.DBNetSalesChange(Sender: TObject);
begin
  InvGridUpdateFooter(Sender);
end;

procedure TQuotesF.RateCalcCBClick(Sender: TObject);
begin
  if GGlobals.TimeSheetRate then
    begin
    RateCalcBtn.Caption := 'Show Average Contrib. using Targeted ' + Pluralname;
    GGlobals.TimeSheetRate := False;
    UnitsTSVar.Visible := True;
    UnitsVar.Visible := False;
    RelatedInvoicesTVRECORDEDUNITS.Visible := True;
    RelatedInvoicesTVUNITSREQUIRED.Visible := False;
    end
  else
    begin
    RateCalcBtn.Caption := 'Show Average Contrib. using Actual ' + Pluralname;
    UnitsTSVar.Visible := False;
    UnitsVar.Visible := True;
    GGlobals.TimeSheetRate := True;
    RelatedInvoicesTVRECORDEDUNITS.Visible := False;
    RelatedInvoicesTVUNITSREQUIRED.Visible := True;
    end;
  DataModuleClient.InvoiceLU.refresh;
  InvGridUpdateFooter(Sender);
end;

procedure TQuotesF.QuoteInsertBtnClick(Sender: TObject);
begin
  DataModuleClient.Quotes.Insert;
  CxGrid1.SetFocus;
end;

procedure TQuotesF.QuotesDeleteBtnClick(Sender: TObject);
begin
  if Messagedlg('Delete the current ' + DataModuleClient.DepartmentsInvGroupName.AsString, mtWarning, [mbok, mbCancel], 0) = mrOK then
    DataModuleClient.Quotes.Delete;
end;

procedure TQuotesF.RelatedInvoicesTVDataControllerSummaryAfterSummary(
  ASender: TcxDataSummary);
begin
// Calculate Unit Rate
  Asender.FooterSummaryValues[5] := 0;
  if (GGlobals.TimeSheetRate) and (Asender.FooterSummaryValues[4] <> 0) then
    Asender.FooterSummaryValues[5] := Asender.FooterSummaryValues[3] / Asender.FooterSummaryValues[6];
  if (Not GGlobals.TimeSheetRate) and (Asender.FooterSummaryValues[6] <> 0) then
    Asender.FooterSummaryValues[5] := Asender.FooterSummaryValues[3] / Asender.FooterSummaryValues[4];
//  if not VarIsNull(Asender.FooterSummaryValues[5]) then
//    InvoiceRate := Asender.FooterSummaryValues[5];
end;

procedure TQuotesF.cxGrid2DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  InvGridUpdateFooter(Self);
end;

procedure TQuotesF.QuotesCardViewQUOTE_NUMBERPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if VarIsNull(DisplayValue) or (length(DisplayValue) < 1) then
    begin
    Error := True;
    ErrorText := 'The Group ID field can not be blank. Please enter a value.';
    end
  else
    Error := False;
end;

procedure TQuotesF.QuotesCardViewFocusedItemChanged(
  Sender: TcxCustomGridTableView; APrevFocusedItem,
  AFocusedItem: TcxCustomGridTableItem);
begin
  if APrevFocusedItem.Name = 'QuotesCardViewQUOTE_NUMBER' then
    begin
    if VarIsNull(TcxGridDBCardViewRow(APrevFocusedItem).EditValue)
      or (length(TcxGridDBCardViewRow(APrevFocusedItem).EditValue) < 1) then
      begin
      Messagedlg('The Group ID field can not be blank. Please enter a value.', mtWarning, [mbOK], 0);
      CxGrid1.SetFocus;
      end;
    end;
end;

end.
