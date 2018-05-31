unit Invoices;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, AuchTypes, InvoiceClass, Buttons,
  DataCollector, LGlobals, PrintInvoices, DMClient, DMrep1U,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxControls,
  cxGridCustomView, cxGridLevel, cxGrid, cxCustomData, cxDataStorage,
  cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit, cxLabel, cxButtons, Variants,
  cxDBLabel, cxDBEdit, ExtCtrls, db, cxStyles, cxGraphics, cxFilter, cxData,
  cxLookAndFeelPainters, cxLookAndFeels, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, Menus, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

const
  // Grid column constants
  INV_CODE = 0;
  GROSSREVENUE = 1;
  MAT_COST = 2;
  SUB_COST = 3;
  GP = 4;
  GPPERCENT = 5;
  NUMUNITS = 6;
  AVGRATE = 7;

type
  TColTotals = array[GROSSREVENUE..AVGRATE] of currency;

  TInvoicesF = class(TForm)
    cxGLInvoices: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxTvInvoices: TcxGridTableView;
    cxTvInvoicesINVNUMBER: TcxGridColumn;
    cxTvInvoicesGROSSREVENUE: TcxGridColumn;
    cxTvInvoicesMATERIALSCOST: TcxGridColumn;
    cxTvInvoicesSUB_COST: TcxGridColumn;
    cxTvInvoicesGROSSPROFIT: TcxGridColumn;
    cxTvInvoicesGPPC: TcxGridColumn;
    cxTvInvoicesNUMUNITS: TcxGridColumn;
    cxTvInvoicesAVERATE: TcxGridColumn;
    DeleteBtn: TcxButton;
    PrintBtn: TcxButton;
    CloseBtn: TcxButton;
    PeriodDateslabel: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel14: TcxLabel;
    cxDBLabel3: TcxDBLabel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
    procedure cxTvInvoicesDataControllerSummaryAfterSummary(
      ASender: TcxDataSummary);
  private
    { Private declarations }
    ListDeleted: boolean;
    InvoiceO : TInvoiceDetail;
    procedure calculateAverageRate(var rowData: TInvoiceRecPtr);
  public
    procedure setUnitsDesc(singvalue, pluralValue: string);
  end;

  TInvoiceDataSource = class(TcxCustomDataSource)
  private
    FInvoices: TInvoiceDetail;
    FModified: boolean;
  protected
    procedure DeleteRecord(ARecordHandle: TcxDataRecordHandle); override;
    function GetRecordCount: Integer; override;
{    function GetInfoForCompare(ARecordHandle: TcxDataRecordHandle;
      AItemHandle: TcxDataItemHandle; var PValueBuffer: PChar): Boolean; override;
}
    function GetDataBinding(AItemIndex: Integer): TcxGridItemDataBinding;
    Function GetItemHandle(AItemIndex: Integer): TcxDataItemHandle; override;
    function IsNativeCompare: Boolean; override;
    function GetValue(ARecordHandle: TcxDataRecordHandle;
      AItemHandle: TcxDataItemHandle): Variant; override;
    function InsertRecord(ARecordHandle: TcxDataRecordHandle): TcxDataRecordHandle; override;
    function AppendRecord: TcxDataRecordHandle; override;
    procedure SetValue(ARecordHandle: TcxDataRecordHandle;
      AItemHandle: TcxDataItemHandle; const AValue: Variant); override;
  public
    constructor Create(AInvoices: TInvoiceDetail);
    destructor Destroy; override;
    property Modified: boolean read FModified;
  end;




var
  InvoicesF : TInvoicesF;
  LocalInvType : TInvType;
  InvoiceRate : Currency;
  LocalStartDate, LocalEndDate : TDateTime;

  procedure GenerateColumns(AGridTableView: TcxGridTableView);


implementation

{$R *.DFM}


procedure TInvoicesF.FormCreate(Sender: TObject);
begin
  color := GGlobals.FormColour;
  DMrep1.TariButtonList.GetImage(0, CloseBtn.Glyph);
  DMrep1.TariButtonList.GetImage(3, DeleteBtn.Glyph);
  if LocalInvType = AnalysisInv then
		Caption := 'Actual Invoices - ' + DataModuleClient.BusinessesBranch_Name.AsString
  else if LocalInvType = PlanInv then
		Caption := 'Planned Invoices - ' + DataModuleClient.BusinessesBranch_Name.AsString
	else
		Caption := 'Monitoring Invoices - ' + DataModuleClient.BusinessesBranch_Name.AsString;
//  Label3.Caption := convertAccelCharToAmpersand(DataModuleClient.DepartmentsRevenue_Group_Name.Value);
 PeriodDateslabel.Caption := FormatDateTime(GGlobals.GetDateFENH, LocalStartDate) +  ' to ' +
  FormatDateTime(GGlobals.GetDateFENH, LocalEndDate);
  GenerateColumns(cxTvInvoices);
  InvoiceO := TInvoiceDetail.create(Integer(localInvType), LocalStartDate, LocalEndDate);
  cxTvInvoices.DataController.CustomDataSource := TInvoiceDataSource.Create(InvoiceO);

  InvoiceO.LoadInvoices;
  cxTvInvoices.DataController.CustomDataSource.DataChanged;
  ListDeleted := False;
//  if InvoiceO.InvoiceCount = 0 then
  cxTvInvoices.DataController.Append;
end;

procedure TInvoicesF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  InvoiceO.destroy;
  Action := caFree;
end;
  
procedure TInvoicesF.CloseBtnClick(Sender: TObject);
begin
  Findpastdate;
  invoiceO.SaveInvoices;
  FindPastDate;
  ModalResult := mrOK;
  Close;
end;

{ ---------------------------------------------------------------------------- }
{ -- calculateAverageRate - Calculates the avergare rate amount for the passed }
{                           invoice details record                             }
{ ---------------------------------------------------------------------------- }
procedure TInvoicesF.calculateAverageRate(var rowData: TInvoiceRecPtr);
begin
  if RowData^.Units <> 0 then
    RowData^.Rate := RowData^.gross / RowData^.Units
  else
    RowData^.Rate := 0;
  if RowData^.NetSales <> 0 then
    RowData^.gppc := RowData^.gross  * 100 / RowData^.NetSales
  else
    RowData^.gppc := 0;
end;

procedure TInvoicesF.DeleteBtnClick(Sender: TObject);
begin
  cxTvInvoices.DataController.DeleteRecord(cxTvInvoices.DataController.GetFocusedRowIndex);
end;

{ ---------------------------------------------------------------------------- }
{ -- setUnitDesc - UnitDesc write property procedure, set the heading of the   }
{                  number of units columns using the value passed              }
{ ---------------------------------------------------------------------------- }
procedure TInvoicesF.setUnitsDesc(singvalue, pluralValue: string);
begin
  cxTvInvoices.Columns[6].Caption := 'No of '+ Pluralvalue;
  cxTvInvoices.Columns[7].Caption := 'Gross Profit per '+ Singvalue + '*';
end;

procedure TInvoicesF.PrintBtnClick(Sender: TObject);
begin
  // Save current work
  if Invoiceo.InvoiceCount > 0 then
    begin
    InvoiceO.saveInvoices;
    // Show Print form
    Application.CreateForm(TPrintInvoicesF, PrintInvoicesF);
    PrintInvoicesF.QuotesStartDate.Date := LocalStartDate;
    PrintInvoicesF.QuotesEndDate.Date := LocalEndDate;
    PrintInvoicesF.InvType := LocalInvType;
    PrintInvoicesF.InvoiceO := invoiceO;
    PrintInvoicesF.ShowModal;
    PrintInvoicesF.Free;
    end
  else
    messagedlg('There are no invoices to print.', mtinformation, [mbOK], 0);
end;

{ TInvoiceDataSource }
constructor TInvoiceDataSource.Create(AInvoices: TInvoiceDetail);
begin
  inherited Create;
  FInvoices := AInvoices;
end;

destructor TInvoiceDataSource.Destroy;
begin
  inherited Destroy;
end;

procedure TInvoiceDataSource.DeleteRecord(
  ARecordHandle: TcxDataRecordHandle);
begin
  if Finvoices.InvoiceCount > 0 then
    FInvoices.DeleteInvoice(Integer(ARecordHandle));
  DataChanged;
  if Finvoices.InvoiceCount = 0 then
    InvoicesF.cxTvInvoices.DataController.Append;
end;

function TInvoiceDataSource.GetDataBinding(AItemIndex: Integer): TcxGridItemDataBinding;
begin
  Result := TcxCustomGridTableItem(DataController.GetItem(AItemIndex)).DataBinding;
end;

{
function TInvoiceDataSource.GetInfoForCompare(ARecordHandle: TcxDataRecordHandle;
  AItemHandle: TcxDataItemHandle; var PValueBuffer: PChar): Boolean;
var
  ADataBinding: TcxGridItemDataBinding;
  InvoiceRec : TInvoiceRecPtr;
  Tmpstr : string;
begin
  ADataBinding := TcxGridItemDataBinding(AItemHandle);
  Invoicerec := Finvoices.GetInvoice(Integer(ARecordHandle));
  case Integer(ADataBinding.Data) of    //
    1: PValueBuffer := strPcopy(InvoiceRec.PInvoice_Number, InvoiceRec.Invoice_Number);
    2: PValueBuffer := PChar(@InvoiceRec.NetSales);
    3: PValueBuffer := PChar(@InvoiceRec.materials);
    4: PValueBuffer := PChar(@InvoiceRec.subcon);
    5: PValueBuffer := PChar(@InvoiceRec.gross);
    6: PValueBuffer := PChar(@InvoiceRec.gppc);
    7: PValueBuffer := PChar(@InvoiceRec.Units);
    8: PValueBuffer := PChar(@InvoiceRec.Rate);
  end;
  tmpstr := strpas(Pvaluebuffer);    // case
  Result := True;
end;
}

function TInvoiceDataSource.GetRecordCount: Integer;
begin
  Result := FInvoices.InvoiceCount;
end;

function TInvoiceDataSource.GetValue(ARecordHandle: TcxDataRecordHandle; AItemHandle: TcxDataItemHandle): Variant;
var
  ADataBinding: TcxGridItemDataBinding;
  InvoiceRec : TInvoiceRecPtr;
begin
  ADataBinding := TcxGridItemDataBinding(AItemHandle);
  Invoicerec := Finvoices.GetInvoice(Integer(ARecordHandle));
  case Integer(ADataBinding.Data) of    //
    1: Result := InvoiceRec.Invoice_Number;
    2: Result := InvoiceRec.NetSales;
    3: Result := InvoiceRec.materials;
    4: Result := InvoiceRec.subcon;
    5: Result := InvoiceRec.gross;
    6: Result := InvoiceRec.gppc;
    7: Result := InvoiceRec.Units;
    8: Result := InvoiceRec.Rate;
  end;    // case
end;

function TInvoiceDataSource.IsNativeCompare: Boolean;
begin
  Result := False;
end;

function TInvoiceDataSource.InsertRecord(
  ARecordHandle: TcxDataRecordHandle): TcxDataRecordHandle;
begin
  FInvoices.CreateNewInvoiceRecord;
  Result := TcxDataRecordHandle(FInvoices.lastcreated);
  Datachanged;
end;

procedure TInvoiceDataSource.SetValue(ARecordHandle: TcxDataRecordHandle;
  AItemHandle: TcxDataItemHandle; const AValue: Variant);
var
  ADataBinding: TcxGridItemDataBinding;
  InvoiceRec : TInvoiceRecPtr;
begin
  ADataBinding := TcxGridItemDataBinding(AItemHandle);
  Invoicerec := Finvoices.GetInvoice(Integer(ARecordHandle));
  case Integer(ADataBinding.Data) of    //
    INV_CODE + 1:
      InvoiceRec.Invoice_Number := AValue;
    GROSSREVENUE + 1:
      InvoiceRec.NetSales := AValue;
    MAT_COST + 1:
      InvoiceRec.materials := AValue;
    SUB_COST + 1:
      InvoiceRec.subcon := AValue;
    GP + 1:
      begin
      InvoiceRec.gross := AValue;
      Invoicerec.materials := InvoiceRec.NetSales - InvoiceRec.subcon - InvoiceRec.gross;
      end;
    NUMUNITS + 1:
      InvoiceRec.Units := AValue;
  end;
  Invoicerec.Gross := InvoiceRec.NetSales - InvoiceRec.materials - InvoiceRec.subcon;
  InvoicesF.calculateAverageRate(InvoiceRec);
//  DataChanged;
//  InvoicesF.calculateTotals;
end;

function TInvoiceDataSource.AppendRecord: TcxDataRecordHandle;
begin
  FInvoices.CreateNewInvoiceRecord;
  Result := Pointer(FInvoices.LastCreated);
  DataChanged;
end;

function TInvoiceDataSource.GetItemHandle(AItemIndex: Integer): TcxDataItemHandle;
begin
  Result := TcxDataItemHandle(GetDataBinding(AItemIndex));
end;

procedure GenerateColumns(AGridTableView: TcxGridTableView);
var
  I: Integer;
begin
  for I := 0 to AGridTableView.ColumnCount - 1 do    // Iterate
    begin
    with AGridTableView.Columns[I] do
      begin
       DataBinding.Data := Pointer(Tag);
        case tag of    //
          1:
            DataBinding.ValueTypeClass := TcxStringValueType;
          2, 3, 4, 5, 6, 7, 8:
            DataBinding.ValueTypeClass := TcxCurrencyValueType;
        end;    // case
      end;
    end;    // for
end;

procedure TInvoicesF.cxTvInvoicesDataControllerSummaryAfterSummary(
  ASender: TcxDataSummary);
begin
// Calculate GP %
  if ASender.FooterSummaryValues[0] <> 0 then
    Asender.FooterSummaryValues[4] := Asender.FooterSummaryValues[3] * 100 /Asender.FooterSummaryValues[0];
// Calculate Unit Rate
  if Asender.FooterSummaryValues[5] <> 0 then
    Asender.FooterSummaryValues[6] := Asender.FooterSummaryValues[3] / Asender.FooterSummaryValues[5];
  if not VarIsNull(Asender.FooterSummaryValues[6]) then
    InvoiceRate := Asender.FooterSummaryValues[6];
end;

end.


