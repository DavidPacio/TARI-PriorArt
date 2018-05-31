unit MonitoringInvoices;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, AuchTypes, InvoiceClass, Buttons, LGlobals, PrintInvoices,
  DMrep1U, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxCalendar,
  cxDropDownEdit, cxCustomData, cxDataStorage, cxCurrencyEdit, cxTextEdit, cxDBEdit,
  cxContainer, cxEdit, cxLabel, cxButtons, IB_Components, Variants, cxDBLabel, ExtCtrls,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxFilter, cxData, DB, cxDBData,
  cxDBLookupComboBox, cxCheckBox, Menus, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint;

const
  // Grid column constants
  INV_DATE = 1;
  QUOTEID = 2;
  INV_CODE = 3;
  GROSSREVENUE = 4;
  MAT_COST = 5;
  SUB_COST = 6;
  GP = 7;
  GPPERCENT = 8;
  NUMTSUNITS = 9;
  NUMUNITS = 10;
  AVGRATE = 11;
  LAST_INV = 12;
  TOCOMPLETE = 13;

type
  TColTotals = array[GROSSREVENUE..AVGRATE] of currency;

  TMonitoringInvoicesF = class(TForm)
    DBTVInvoices: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    DBTVInvoicesINV_DATE: TcxGridDBColumn;
    DBTVInvoicesQUOTE_NUMBER: TcxGridDBColumn;
    DBTVInvoicesINVOICE_NUMBER: TcxGridDBColumn;
    DBTVInvoicesNETSALES: TcxGridDBColumn;
    DBTVInvoicesMATERIALSATCOST: TcxGridDBColumn;
    DBTVInvoicesSUBCONTRACTORS: TcxGridDBColumn;
    DBTVInvoicesUNITSREQUIRED: TcxGridDBColumn;
    DBTVInvoicesORDERCOMPLETE: TcxGridDBColumn;
    DBTVInvoicesUNITSTORUN: TcxGridDBColumn;
    DBTVInvoicesRECORDEDUNITS: TcxGridDBColumn;
    DBTVInvoicesGROSSPROFIT: TcxGridDBColumn;
    DBTVInvoicesAVERAGERATE: TcxGridDBColumn;
    DBTVInvoicesGPPC: TcxGridDBColumn;
    cxLabel2: TcxLabel;
    InvPeriod: TcxLabel;
    CloseBtn: TcxButton;
    PrintBtn: TcxButton;
    DeleteBtn: TcxButton;
    QuoteBtn: TcxButton;
    cxLabel3: TcxLabel;
    TariAmount: TcxLabel;
    cxLabel4: TcxLabel;
    UnitsTarget: TcxLabel;
    TargetUnitsLbl: TcxLabel;
    TargetGPLbl: TcxLabel;
    cxLabel5: TcxLabel;
    cxDBLabel4: TcxDBLabel;
    cxLabel14: TcxLabel;
    cxDBLabel3: TcxDBLabel;
    cxLabel15: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
    procedure DBTVInvoicesDataControllerSummaryAfterSummary(
      ASender: TcxDataSummary);
    procedure QuoteBtnClick(Sender: TObject);
  private
    { Private declarations }
    InvoiceO : TInvoiceDetail;
    procedure GetTariValue;
  public
    procedure setUnitsDesc(singvalue, pluralValue: string);
    { Public declarations }
  end;

var
  MonitoringInvoicesF : TMonitoringInvoicesF;
  LocalInvType : TInvType;
  LocalStartDate, LocalEndDate : TDateTime;
  MonitorValues : array[0..MSEND - 1] of currency;
  IGroupName : String;
  NoDateEntry : Boolean;


implementation

{$R *.DFM}
uses DMClient, DataCollector, quotes;

procedure TMonitoringInvoicesF.FormCreate(Sender: TObject);
begin
//  color := GGlobals.FormColour;
  DMrep1.TariButtonList.GetImage(0, CloseBtn.Glyph);
  DMrep1.TariButtonList.GetImage(3, DeleteBtn.Glyph);
  if Screen.width > 1024 then
    begin
    MonitoringInvoicesF.width := 1064;
    cxGrid1.Width := 1052;
    CloseBtn.Left := 944;
    end
  else
    begin
    MonitoringInvoicesF.width := 1020;
    cxGrid1.Width := 1006;
    CloseBtn.Left := 900;
    end;
	Caption := 'Tracking Invoices - ' + DataModuleClient.BusinessesBranch_Name.AsString;
  // get TARI Value from Planning Data
  GetTariValue;
  InvPeriod.Caption := FormatDateTime(GGlobals.GetDateFENH, LocalStartDate) +  ' to ' +
  FormatDateTime(GGlobals.GetDateFENH, LocalEndDate);
  TcxDateEditProperties(DBTVInvoicesINV_DATE.Properties).MinDate := LocalStartDate;
  TcxDateEditProperties(DBTVInvoicesINV_DATE.Properties).MaxDate := LocalEndDate;

//  if GGlobals.UnitRounding = 0 then
//    begin
//    TcxCurrencyEditProperties(DBTVInvoicesRECORDEDUNITS.Properties).DecimalPlaces := 0;
//    TcxCurrencyEditProperties(DBTVInvoicesUNITSREQUIRED.Properties).DecimalPlaces := 0;
//    TcxCurrencyEditProperties(DBTVInvoicesRECORDEDUNITS.Properties).DisplayFormat := ',0;-,0';
//    TcxCurrencyEditProperties(DBTVInvoicesUNITSREQUIRED.Properties).DisplayFormat := ',0;-,0';
//    DBTVInvoices.DataController.Summary.FooterSummaryItems.Items[6].Format := ',0;-,0';
//    DBTVInvoices.DataController.Summary.FooterSummaryItems.Items[7].Format := ',0;-,0';
//    end
//  else
//    begin
    TcxCurrencyEditProperties(DBTVInvoicesRECORDEDUNITS.Properties).DecimalPlaces := 1;
    TcxCurrencyEditProperties(DBTVInvoicesUNITSREQUIRED.Properties).DecimalPlaces := 1;
    TcxCurrencyEditProperties(DBTVInvoicesRECORDEDUNITS.Properties).DisplayFormat := ',0.0;-,0.0';
    TcxCurrencyEditProperties(DBTVInvoicesUNITSREQUIRED.Properties).DisplayFormat := ',0.0;-,0.0';
    DBTVInvoices.DataController.Summary.FooterSummaryItems.Items[6].Format := ',0.0;-,0.0';
    DBTVInvoices.DataController.Summary.FooterSummaryItems.Items[7].Format := ',0.0;-,0.0';
//    end;
  if DataModuleClient.ActualInvoiceDetails.RecordCount = 0 then
    DataModuleClient.ActualInvoiceDetails.Insert;
end;

procedure TMonitoringInvoicesF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  screen.Cursor := crHourGlass;
end;

procedure TMonitoringInvoicesF.CloseBtnClick(Sender: TObject);
var
  I: Integer;
  index: integer;
  LastDate : TdateTime;
  MonSales : TPlanDataRecPtr;
  MonCOGS : TPlanDataRecPtr;
  MonGP : TPlanDataRecPtr;
  MonBilled : TPlanDataRecPtr;
  ltemp : array[0..3] of Currency;

begin

  MonSales := MonitoringDataList.Items[GetMonitoringSalesListIndex(SALES)];
  MonCogs := MonitoringDataList.Items[GetMonitoringSalesListIndex(COGS)];
  MonGP := MonitoringDataList.Items[GetMonitoringSalesListIndex(GROSSPROFIT)];
  MonBilled := MonitoringDataList.Items[GetMonitoringSalesListIndex(BILLED)];
  Ltemp[0] := 0;
  Ltemp[1] := 0;
  Ltemp[2] := 0;
  Ltemp[3] := 0;
  if not VarIsNull(DBTVInvoices.DataController.Summary.FooterSummaryValues[1]) then
    Ltemp[0] := DBTVInvoices.DataController.Summary.FooterSummaryValues[1];
  if not VarIsNull((DBTVInvoices.DataController.Summary.FooterSummaryValues[2] + DBTVInvoices.DataController.Summary.FooterSummaryValues[3])) then
    Ltemp[1] := (DBTVInvoices.DataController.Summary.FooterSummaryValues[2] + DBTVInvoices.DataController.Summary.FooterSummaryValues[3]);
  if not VarIsNull(DBTVInvoices.DataController.Summary.FooterSummaryValues[4]) then
    Ltemp[2] := DBTVInvoices.DataController.Summary.FooterSummaryValues[4];
  if not VarIsNull(DBTVInvoices.DataController.Summary.FooterSummaryValues[7]) then
    Ltemp[3] := DBTVInvoices.DataController.Summary.FooterSummaryValues[7];

// initialise Monitoring data to zero if any of the totals are <> 0
  for index := Trunc(LocalStartDate) - Trunc(DataModuleClient.DepartmentsCurrentMonitoringStart.value)
              to Trunc(LocalEndDate) - trunc(DataModuleClient.DepartmentsCurrentMonitoringStart.value)
    do
    begin
    if Ltemp[0] <> 0 then
      MonSales^.PlanDetail[index] := 0;
    if Ltemp[1] <> 0 then
      MonCogs^.PlanDetail[Index] := 0;
    if Ltemp[2] <> 0 then
      MonGP^.PlanDetail[Index] := 0;
    if Ltemp[3] <> 0 then
      MonBilled^.PlanDetail[Index] := 0;
    end;

  DataModuleClient.ActualInvoiceDetails.First;
  LastDate := 0;
  while DataModuleClient.ActualInvoiceDetails.Eof = False do
    begin
    I := Trunc(DataModuleClient.ActualInvoiceDetailsINV_DATE.Value) - Trunc(DataModuleClient.DepartmentsCurrentMonitoringStart.value);
    if LastDate <> DataModuleClient.ActualInvoiceDetailsINV_DATE.Value then
      begin
      if Ltemp[0] <> 0 then
        MonSales^.PlanDetail[I] := DataModuleClient.ActualInvoiceDetailsNETSALES.value;
      if Ltemp[1] <> 0 then
        MonCogs^.PlanDetail[I] := DataModuleClient.ActualInvoiceDetailsMATERIALSATCOST.value + DataModuleClient.ActualInvoiceDetailsSUBCONTRACTORS.value;
      if Ltemp[2] <> 0 then
        MonGP^.PlanDetail[I] := DataModuleClient.ActualInvoiceDetailsGROSSPROFIT.value;
      if Ltemp[3] <> 0 then
        MonBilled^.PlanDetail[I] := DataModuleClient.ActualInvoiceDetailsUNITSREQUIRED.value;
      LastDate := DataModuleClient.ActualInvoiceDetailsINV_DATE.Value;
      end
    else
      begin
      MonSales^.PlanDetail[I] := MonSales^.PlanDetail[I] + DataModuleClient.ActualInvoiceDetailsNETSALES.value;
      MonCogs^.PlanDetail[I] := MonCogs^.PlanDetail[I] + DataModuleClient.ActualInvoiceDetailsMATERIALSATCOST.value + DataModuleClient.ActualInvoiceDetailsSUBCONTRACTORS.value;
      MonGP^.PlanDetail[I] := MonGP^.PlanDetail[I] + DataModuleClient.ActualInvoiceDetailsGROSSPROFIT.value;
      MonBilled^.PlanDetail[I] := MonBilled^.PlanDetail[I] + DataModuleClient.ActualInvoiceDetailsUNITSREQUIRED.value;
      end;
    DataModuleClient.ActualInvoiceDetails.Next;
    end;
  ModalResult := mrOK;
  Close;
end;

procedure TMonitoringInvoicesF.DeleteBtnClick(Sender: TObject);
begin
  // ask
  DataModuleClient.ActualInvoiceDetails.Delete;
end;

{ ---------------------------------------------------------------------------- }
{ -- setUnitDesc - UnitDesc write property procedure, set the heading of the   }
{                  number of units columns using the value passed              }
{ ---------------------------------------------------------------------------- }
procedure TMonitoringInvoicesF.setUnitsDesc(singvalue, pluralValue: string);
begin
  DBTVInvoicesRECORDEDUNITS.caption := 'Actual '+ Pluralvalue;
  DBTVInvoicesUNITSREQUIRED.Caption := 'Target '+ Pluralvalue;
  DBTVInvoicesAVERAGERATE.Caption := 'GP per '+ Singvalue;
	DBTVInvoicesQUOTE_NUMBER.Caption := DataModuleClient.DepartmentsINVGROUPNAME.AsString + ' ID';
	QuoteBtn.Caption := '&New ' + DataModuleClient.DepartmentsINVGROUPNAME.AsString;
end;

procedure TMonitoringInvoicesF.FormShow(Sender: TObject);
begin
  screen.Cursor := crDefault;
end;

procedure TMonitoringInvoicesF.PrintBtnClick(Sender: TObject);
begin
  // Show Print form
    Application.CreateForm(TPrintInvoicesF, PrintInvoicesF);
    PrintInvoicesF.QuotesStartDate.Date := LocalStartDate;
    PrintInvoicesF.QuotesEndDate.Date := LocalEndDate;
    PrintInvoicesF.InvType := LocalInvType;
    InvoiceO := TInvoiceDetail.create(Integer(localInvType), LocalStartDate, LocalEndDate);
    InvoiceO.RemoveActualInvoiceFilter := false;
    InvoiceO.LoadInvoices;
    PrintInvoicesF.InvoiceO := InvoiceO;
    PrintInvoicesF.ShowModal;
    InvoiceO.Destroy;
    PrintInvoicesF.Free;
end;

procedure TMonitoringInvoicesF.DBTVInvoicesDataControllerSummaryAfterSummary(
  ASender: TcxDataSummary);
begin
// Calculate GP %
  if ASender.FooterSummaryValues[1] <> 0 then
    Asender.FooterSummaryValues[5] := Asender.FooterSummaryValues[4] * 100 /Asender.FooterSummaryValues[1];
// Calculate Unit Rate
  if Asender.FooterSummaryValues[7] <> 0 then
    Asender.FooterSummaryValues[8] := Asender.FooterSummaryValues[4] / Asender.FooterSummaryValues[7];
end;

procedure TMonitoringInvoicesF.QuoteBtnClick(Sender: TObject);
begin
  Application.CreateForm(TQuotesF, QuotesF);
	QuotesF.setUnitsDesc(DataModuleClient.DepartmentsSingular_UnitDesc.AsString, DataModuleClient.DepartmentsPlural_UnitDesc.AsString);
  QuotesF.showModal;
  QuotesF.Release;
end;

procedure TMonitoringInvoicesF.GetTariValue;
var
  GPbal : TDetailedBalArray;
  BilledBal : TDetailedBalArray;
  TargetGP, TargetBilled : Currency;
begin
// LocalStartDate, LocalEndDate
  DataCollect.psDate := LocalStartDate;
  DataCollect.peDate := LocalEndDate;
  DataCollect.getBalances(GPBal, GROSSPROFIT, True, ctNormal);
  DataCollect.GetBalances(BilledBal, BILLED, True, ctNormal);
  TargetGP := DataCollect.GetTotalBalance(GPBal, double(LocalStartDate), double(LocalStartDate), double(LocalEndDate));
  TargetBilled := DataCollect.GetTotalBalance(BilledBal, double(LocalStartDate), double(LocalStartDate), double(LocalEndDate));
  if TargetBilled <> 0 then
    TariAmount.caption := CurrToStrF(Round(TargetGP * 100 / TargetBilled) / 100, ffCurrency, 2)
  else
    TariAmount.caption := '$0';
  TargetUnitsLbl.Caption := 'Targeted ' + DATAMODULECLIENT.DepartmentsPLURAL_UNITDESC.AsString;
  UnitsTarget.Caption := CurrToStrF(TargetBilled, ffNumber, 1);
  TargetGPLbl.Caption := CurrToStrF(TargetGP, ffCurrency, 0);
end;

end.
