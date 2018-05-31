unit Invoices;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OvcBase, OvcTCmmn, OvcTable, AOvcTcCurrencyEdit, OvcTCEdt, OvcTCHdr,
  OvcTCell, OvcTCStr, ExtCtrls, MegaPanl, StdCtrls, ACurrencyEdit,
  fcButton, fcImgBtn, fcShapeBtn, fcLabel;

const
  // Grid column constants
  INV_CODE = 1;
  GROSSREVENUE = 2;
  MAT_COST = 3;
  SUB_COST = 4;
  GP = 5;
  GPPERCENT = 6;
  NUMUNITS = 7;
  AVGRATE = 8;

type
  TInvoiceRecPtr = ^TInvoiceRecType;TinvoiceRecType = record
    Invoice_Id : integer;
    Invoice_Number : array [0..60] of char;
    NetSales: currency;
    MaterialsatCost: currency;
    Subcontractors: currency;
    GrossProfit: currency;
    GrossProfitPc: currency;
    UnitRequired: Currency;
    UnitGPRate: Currency;
  end;

  TInvoicesF = class(TForm)
    OvcController1: TOvcController;
    OvcTable1: TOvcTable;
    OvcTCColHead1: TOvcTCColHead;
    OvcTCRowHead1: TOvcTCRowHead;
    OvcTCString1: TOvcTCString;
    AOvcTCCurrency2: TAOvcTCCurrency;
    AOvcTCCurrency1: TAOvcTCCurrency;
    fcShapeBtn1: TfcShapeBtn;
    ACurrencyEdit1: TACurrencyEdit;
    ACurrencyEdit2: TACurrencyEdit;
    ACurrencyEdit3: TACurrencyEdit;
    ACurrencyEdit4: TACurrencyEdit;
    ACurrencyEdit5: TACurrencyEdit;
    Label1: TLabel;
    MegaPanel1: TMegaPanel;
    Label3: TLabel;
    fcLabel1: TfcLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OvcTable1ActiveCellMoving(Sender: TObject; Command: Word;
      var RowNum, ColNum: Integer);
  private
    { Private declarations }
    InvoiceList : TList;
  public
    { Public declarations }
  end;

var
  InvoicesF: TInvoicesF;

implementation

{$R *.DFM}
uses DMClient;
procedure TInvoicesF.FormCreate(Sender: TObject);
var
  InvoiceRec : TInvoiceRecPtr;
begin
  Caption := 'Detailed Expenses - ' + DataModuleClient.BusinessDetailsBusiness_Name.value;
  Label3.Caption := DataModuleClient.DepartmentsRevenueGroupName.Value;
  fcLabel1.Caption := DataModuleClient.wwSPPastPeriodsStartDate.DisplayText + ' to ' +
  DataModuleClient.wwSPPastPeriodsEndDate.DisplayText;
  with DataModuleClient do
  begin
    ActualInvoiceDetails.Active := False;
    ActualInvoiceDetails.filtered := False;
    ActualInvoiceDetails.Filter := 'Date = ' + wwSPPastPeriodsEndDate.AsString;
    ActualInvoiceDetails.Filtered := True;
    ActualInvoiceDetails.Active := True;
    // load invoices
    InvoiceList := TList.Create;
    ActualInvoiceDetails.First;
    while ActualInvoiceDetails.Eof = False do
      begin
      New(InvoiceRec);
      InvoiceRec.Invoice_Id := ActualInvoiceDetailsInvoice_ID.value;
      strPcopy(InvoiceRec.Invoice_Number, ActualInvoiceDetailsInvoice_Number.value);
      InvoiceRec.netSales := ActualInvoiceDetailsNetSales.Value;
      InvoiceRec.MaterialsatCost := ActualInvoiceDetailsMaterialsatCost.value;
      InvoiceRec.Subcontractors := ActualInvoiceDetailsSubcontractors.value;
      InvoiceRec.UnitRequired := ActualInvoiceDetailsUnitsRequired.value;
      InvoiceList.Add(Invoicerec);
      ActualInvoiceDetails.Next;
    end;    // with
  end;    // while
end;

procedure TInvoicesF.FormClose(Sender: TObject; var Action: TCloseAction);
var
  j: integer;
  invoiceRec : TInvoiceRecPtr;
begin
  // set invoices
  for j := 0 to InvoiceList.Count - 1 do    // Iterate
    begin
    InvoiceRec := TInvoiceRecPtr(InvoiceList.items[j]);
    // see if the record exists
    // if exist, set edit mode
    // else set insert mode.
    // set record and post
  end;    // for
end;

procedure TInvoicesF.OvcTable1ActiveCellMoving(Sender: TObject;
  Command: Word; var RowNum, ColNum: Integer);
begin
  if RowNum = 0 then exit;

  // Make sure any pending edits are up to date, and get the current lines entries
  // if cell contents not legal, exit immediately, staying on the old active cell
  if not OvcTable1.SaveEditedData then begin
    RowNum := OvcTable1.ActiveRow;
    ColNum := OvcTable1.ActiveCol;
    exit;
  end;

  case Command of
    ccRight:
      with OvcTable1
      do
      if (ColNum = GPPERCENT) then
         inc(ColNum)
      else if (ColNum = AVGRATE)
      then begin
        AllowRedraw := False;
        try
          ColNum := INV_CODE;
          SaveEditedData;
          {Make sure any pending edits are up to date, and get the current lines entries
           Also Check to see if last row complete before creating another }
          if (RowNum = invoiceList.count) and (RowNum < 999) and lastLineNotEmpty
          then begin
            CreateNewInvoiceRecord;
            newRowStyle.Height := -1;             // sets default height
            newRowStyle.Hidden := False;
            Rows.Insert(RowLimit,newRowStyle);
          end;
        finally
          if (RowNum < invoiceList.count) then
            inc(RowNum);
          AllowRedraw := True;
        end;
      end;
    ccLeft:
      with OvcTable1 do
      if (ColNum = INV_CODE) and (ColNum = ActiveCol) and (RowNum > LockedRows)
      then begin
        AllowRedraw := False;
        try
          ColNum := NUMUNITS; // = last editable column
        finally
          dec(RowNum);
          AllowRedraw := True;
        end;
      end;
    ccMouse:
      with OvcTable1
      do begin
        AllowRedraw := False;
        if colNum = AVGRATE then
          ColNum := NUMUNITS;
        AllowRedraw := True;
      end;
    ccDown:
      with invoiceTable
      do begin
        AllowRedraw := False;
        if RowNum = ActiveRow
        then begin
          StopEditingState(True);
          StartEditingState;
        end;
        AllowRedraw := True;
      end;
  end;
end;

end.
