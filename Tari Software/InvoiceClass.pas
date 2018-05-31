unit InvoiceClass;

interface

Uses  Windows, Messages, SysUtils, Classes, Graphics,
      AuchTypes, DMClient, variants;

Type
  {$M+}
  TInvoiceDetail = class(TObject)
  private
    { Private declarations }
    FInvoiceList: TList;
    fType : TInvType;
    {Invoice Details file}
    invoiceRec: TInvoiceRecPtr;
    fStartDate : TDateTime;
    fEndDate : TDateTime;
    fNextInvoiceID: integer;
    { Property read/write procedures }
    function getInvoiceCount: integer;

  {Class procedures/functions}
  public
  { Public declarations }
    InvSaved : Boolean;
    LastCreated : integer;
    RemoveActualInvoiceFilter : Boolean;
    constructor Create(invType: integer; StartDate, EndDate : TDateTime);
    destructor Destroy; override;
    property InvoiceCount: integer read getInvoiceCount;
    Property InvoiceList : TList read FInvoiceList;
  published
    function  CreateNewInvoiceRecord: TInvoiceRecPtr;
    function GetInvoice(Index: Integer): TInvoiceRecPtr;
    function GetInvoiceByID(I_ID : integer): Integer;
    function  DeleteInvoice(index: integer): boolean;
    function LocateInvoice(invDate : TDateTime; InvNum : String): integer;
    procedure clearInvoiceList;
    procedure loadInvoices;
    procedure saveInvoices;
    procedure sortInvoiceList(sorttype : TInvoiceSortType);
    procedure CalculateQuotedHours(index : integer; startdate, enddate : TDateTime);
  end;

implementation

{----------------------------------------------------------------------}
{ TInvoiceDetails class                                                }
{----------------------------------------------------------------------}
constructor TInvoiceDetail.Create(InvType: Integer; StartDate, EndDate : TDateTime);
begin

  inherited Create;

  // Set the private variables to the ones passed
  Ftype := TInvType(InvType);
  fStartDate := StartDate;
  fEndDate := EndDate;
  RemoveActualInvoiceFilter := true;  // Usually the case but if it's invoices created for editing, we need to preserve the filter.
  DataModuleClient.SetInvoiceFilter(Integer(InvType), FStartDate, fEnddate);
  FInvoiceList := TList.Create;
  InvSaved := True; // Assume that there is nothing to save;
  DataModuleClient.MaxInvoiceID.Active := True;
  if DataModuleClient.MaxInvoiceIDMax.value > 0 then
    fNextInvoiceID := DataModuleClient.MaxInvoiceIDMax.value + 1
  else
    fNextInvoiceID := 1;
  DataModuleClient.MaxInvoiceID.Active := false;
  Lastcreated := -1;
end;

{------------------------------------------------------------------------------}
{ -- Destroy - Free resourtces used, close files etc.                          }
{------------------------------------------------------------------------------}
destructor TInvoiceDetail.Destroy;
var
  index: integer;
  invRec: TInvoiceRecPtr;
begin
  // Free resources used in the invoice list
  for index := 0 to FInvoiceList.Count - 1
  do begin
    invRec := TInvoiceRecPtr(FInvoiceList.Items[index]);
    dispose(invRec);
  end;

  FInvoiceList.destroy;
  // remove the filter on Invoice table
  if (RemoveActualInvoiceFilter) then
    begin
    DataModuleClient.ActualInvoiceDetails.Active := false;
    DataModuleClient.ActualInvoiceDetails.Filter := '';
    DataModuleClient.ActualInvoiceDetails.Filtered := false;
    DataModuleClient.ActualInvoiceDetails.Active := true;
    end;
  inherited Destroy;
end;

{ ---------------------------------------------------------------------------- }
{ -- GetInvoice - Invoices property read function. Returns the record          }
{                 of the requested invoice                                     }
{ ---------------------------------------------------------------------------- }
function TInvoiceDetail.GetInvoice(Index: Integer): TInvoiceRecPtr;
begin
//  if (Index < 0) or (Index >= FInvoiceList.count) then
//    Index := FInvoiceList.count - 1;
//    raise EHCRevenueGroupEngine.CreateFmt('Invoice Index Error Getting %d', [Index]);
  Result := FInvoiceList.Items[Index];
end;


function TInvoiceDetail.GetInvoiceByID(I_ID : integer): Integer;
var
  I: Integer;
  InvoiceRec : TInvoiceRecPtr;
begin
  Result := -1;
  for I := 0 to FInvoiceList.Count - 1 do    // Iterate
    begin
    InvoiceRec := FInvoiceList.Items[I];
    if InvoiceRec.Invoice_ID = I_ID then
      begin
      Result := I;
      Break;
      end;
    end;    // for
end;

function TInvoiceDetail.LocateInvoice(invDate : TDateTime; InvNum : String): integer;
var
  I: Integer;
  InvoiceRec : TInvoiceRecPtr;
begin
  Result := -1;
  for I := 0 to FInvoiceList.Count - 1 do    // Iterate
    begin
    InvoiceRec := FInvoiceList.Items[I];
    if (InvoiceRec.Invoice_Date = invdate) and (InvoiceRec.Invoice_Number = invNum) then
      begin
      Result := I;
      Break;
      end;
    end;    // for
end;


{ ---------------------------------------------------------------------------- }
{ -- getInvoiceCount - Returns the number of invoices in the list              }
{ ---------------------------------------------------------------------------- }
function TInvoiceDetail.getInvoiceCount: integer;
begin
  result := FInvoiceList.Count;
end;

{ ---------------------------------------------------------------------------- }
{ -- loadInvoices- Retrieves invoices in sequence, allocates memory            }
{                  for it and then adds it to the internal list                }
{ ---------------------------------------------------------------------------- }
Procedure TInvoiceDetail.loadInvoices;
begin
  with DataModuleClient do
  begin
    ActualInvoiceDetails.First;
    while ActualInvoiceDetails.eof = False do
    begin
      new(invoiceRec);
      InvoiceRec.Depart_ID := ActualInvoiceDetailsDept_id.value;
      InvoiceRec.Inv_Type := TInvType(ActualInvoiceDetailsInvoiceType.Value);
      InvoiceRec.Invoice_Date := ActualInvoiceDetailsInv_Date.Value;
      InvoiceRec.Invoice_LDate := 0;
      InvoiceRec.Invoice_ID := ActualInvoiceDetailsInvoice_ID.Value;
			InvoiceRec.Quote_Number := ActualInvoiceDetailsQuote_Number.AsString;
      InvoiceRec.Quote_Index := -1;
			InvoiceRec.Invoice_Number := ActualInvoiceDetailsInvoice_Number.AsString;
      InvoiceRec.NetSales := ActualInvoiceDetailsNetSales.Value;
      InvoiceRec.Materials := ActualInvoiceDetailsMaterialsAtCost.Value;
      InvoiceRec.Subcon := ActualInvoiceDetailsSubcontractors.Value;
      InvoiceRec.Units := ActualInvoiceDetailsUnitsRequired.Value;
      InvoiceRec.TsUnits := ActualInvoiceDetailsRecordedUnits.value;
      InvoiceRec.LastInv := Boolean(ActualInvoiceDetailsOrderComplete.value);
      InvoiceRec.ToComplete := ActualInvoiceDetailsUnitsToRun.value;
      InvoiceRec.Gross := InvoiceRec.NetSales - InvoiceRec.Materials - InvoiceRec.subcon;
      if InvoiceRec.Units <> 0 then
        InvoiceRec.Rate := InvoiceRec.Gross / InvoiceRec.Units
      else
        InvoiceRec.Rate := 0;
      if InvoiceRec.NetSales <> 0 then
        InvoiceRec.gppc := InvoiceRec.Gross * 100 / InvoiceRec.NetSales
      else
        InvoiceRec.gppc := 0;
    FInvoiceList.Add(invoicerec);
    ActualInvoiceDetails.next;
    end;    // while
  end;    // with
  InvSaved := False;
end;

{ ---------------------------------------------------------------------------- }
{ -- saveInvoice - Update the invoice file with the passed invoice record      }
{ ---------------------------------------------------------------------------- }
Procedure TInvoiceDetail.saveInvoices;
var
  j: Integer;
//  Varg : Variant;
//  QID : Integer;
begin
  DataModuleClient.SetInvoiceFilter(Integer(fType), FStartDate, fEnddate);
  // first delete old invoice details
  with DataModuleClient do
  begin
    ActualInvoiceDetails.first;
    while ActualInvoiceDetails.eof = False do ActualInvoiceDetails.Delete;
  end;
  // second sort invoices into as entered order
  SortInvoiceList(stAsEntered);
  // thirdly save invoices
  with DataModuleClient do
  begin
    for j := 0 to InvoiceCount - 1 do    // Iterate
    begin
      InvoiceRec := GetInvoice(j);
      ActualInvoiceDetails.Insert;
      ActualInvoiceDetailsDept_id.value :=  InvoiceRec.Depart_ID;
      ActualInvoiceDetailsInvoiceType.Value := Integer(InvoiceRec.Inv_Type);
      if InvoiceRec.Invoice_Date < 30000 then
        InvoiceRec.Invoice_Date := fEndDate;
      ActualInvoiceDetailsInv_Date.Value := InvoiceRec.Invoice_Date;
      ActualInvoiceDetailsInvoice_ID.Value := InvoiceRec.Invoice_ID;
			ActualInvoiceDetailsQuote_Number.AsString := InvoiceRec.Quote_Number;
      ActualInvoiceDetailsInvoice_Number.AsString := InvoiceRec.Invoice_Number;
      ActualInvoiceDetailsNetSales.Value := InvoiceRec.NetSales;
      ActualInvoiceDetailsMaterialsAtCost.Value := InvoiceRec.Materials;
      ActualInvoiceDetailsSubcontractors.Value := InvoiceRec.Subcon;
      ActualInvoiceDetailsUnitsRequired.Value := InvoiceRec.Units;
      ActualInvoiceDetailsRecordedUnits.value := InvoiceRec.TsUnits;
      if Invoicerec.LastInv then
        ActualInvoiceDetailsOrderComplete.value := 1
      else
        ActualInvoiceDetailsOrderComplete.value := 0;
      ActualInvoiceDetailsUnitsToRun.value := InvoiceRec.ToComplete;

      ActualInvoiceDetails.Post;
    end;    // for
  end;    // with
  InvSaved := True;
end;

{ ---------------------------------------------------------------------------- }
{ -- clearInvoiceList - Frees the memory allocated to items in the list and    }
{                       clears the list ready for reloading.                   }
{ ---------------------------------------------------------------------------- }
procedure TInvoiceDetail.clearInvoiceList;
var
  index: integer;
  invRec: TInvoiceRecPtr;
begin
  for index := 0 to FInvoiceList.Count - 1
  do begin
    invRec := GetInvoice(Index);
    dispose(invRec);
  end;

  FInvoiceList.Clear;
end;

{ ---------------------------------------------------------------------------- }
{ -- sortInvoiceList - sort invoices in several ways before output             }
{ ---------------------------------------------------------------------------- }
procedure TInvoiceDetail.sortInvoiceList(sortType: TInvoiceSortType);

  function SortOnAsEntered(item1, Item2: pointer): integer;
  begin  // Highest contribution to the lowest
    if TInvoiceRecPtr(item1).Invoice_ID < TInvoiceRecPtr(item2).Invoice_ID
      then Result := -1
    else if TInvoiceRecPtr(item1).Invoice_ID > TInvoiceRecPtr(item2).Invoice_ID
      then Result := 1
    else begin
      result := 0;
    end;
  end;
  function SortOnContribution(item1, Item2: pointer): integer;
  begin  // Highest contribution to the lowest
    if TInvoiceRecPtr(item1).Rate > TInvoiceRecPtr(item2).Rate
      then Result := -1
    else if TInvoiceRecPtr(item1).Rate < TInvoiceRecPtr(item2).Rate
      then Result := 1
    else begin
      result := 0;
    end;
  end;
  function SortOnGrossRevenue(item1, Item2: pointer): integer;
  begin  // Greatest Revenue to the lowest
    if TInvoiceRecPtr(item1).NetSales > TInvoiceRecPtr(item2).NetSales
      then Result := -1
    else if TInvoiceRecPtr(item1).NetSales < TInvoiceRecPtr(item2).NetSales
      then Result := 1
    else begin
      result := 0;
    end;
  end;
  function SortOnGrossProfitPC(item1, Item2: pointer): integer;
  begin  // Greatest GP PC to the lowest
    if TInvoiceRecPtr(item1).gppc > TInvoiceRecPtr(item2).gppc
      then Result := -1
    else if TInvoiceRecPtr(item1).gppc < TInvoiceRecPtr(item2).gppc
      then Result := 1
    else begin
      result := 0;
    end;
  end;
  function SortOnInvoiceCode(item1, Item2: pointer): integer;
  begin  // Ascending order
    if TInvoiceRecPtr(item1).invoice_number < TInvoiceRecPtr(item2).invoice_number
      then Result := -1
    else if TInvoiceRecPtr(item1).invoice_number > TInvoiceRecPtr(item2).invoice_number
      then Result := 1
    else begin
      result := 0;
    end;
  end;
  function SortOnDate(item1, Item2: pointer): integer;
  begin  // Ascending date order. If dates are equal then Invoice ID
    if TInvoiceRecPtr(item1).invoice_Date < TInvoiceRecPtr(item2).invoice_Date
      then Result := -1
    else if TInvoiceRecPtr(item1).invoice_Date > TInvoiceRecPtr(item2).invoice_Date
      then Result := 1
    else begin
      if TInvoiceRecPtr(item1).Invoice_Number < TInvoiceRecPtr(item2).Invoice_Number
        then Result := -1
      else if TInvoiceRecPtr(item1).Invoice_Number > TInvoiceRecPtr(item2).Invoice_Number
        then Result := 1
      else begin
        if TInvoiceRecPtr(item1).Invoice_ID < TInvoiceRecPtr(item2).Invoice_ID
          then Result := -1
        else if TInvoiceRecPtr(item1).Invoice_ID > TInvoiceRecPtr(item2).Invoice_ID
          then Result := 1
        else
          result := 0;
      end;
    end;
  end;

begin
{List as entered
List in Contribution Order (Descending)
List in Gross Revenue (Descending)
List in Gross Profit % (Descending)
List in Invoice Code (Ascending)}
   case sortType of
   stAsEntered: FInvoiceList.Sort(@SortOnAsEntered);
   stAverageRate: FInvoiceList.Sort(@SortOnContribution);
   stSales: FInvoiceList.Sort(@SortOnGrossrevenue);
   stGPPC: FInvoiceList.Sort(@SortOnGrossProfitPC);
   stInvoiceNumber: FInvoiceList.Sort(@SortOnInvoiceCode);
   stDate: FInvoiceList.Sort(@SortOnDate);
   end;
end;

{ ---------------------------------------------------------------------------- }
{ -- CreateNewInvoiceRecord - Creates a new invoice record.                    }
{ ---------------------------------------------------------------------------- }
function TInvoiceDetail.CreateNewInvoiceRecord: TInvoiceRecPtr;
var
  invRec: TInvoiceRecPtr;
begin
  new(invRec);
  FillChar(invRec^, sizeof(TInvoiceRec), #0);
  invRec.Depart_ID := DataModuleClient.DepartmentsDept_ID.Value;
  invRec.Invoice_ID := fNextInvoiceID;
  invRec.Inv_Type := fType;
  InvRec.Quote_Index := 0;
  invRec.Invoice_Date := fEndDate;
  Inc(fNextInvoiceID);
  Lastcreated := FInvoiceList.Add(invRec);
  result := invRec;
end;

{ ---------------------------------------------------------------------------- }
{ -- DeleteInvoice - Deletes an invoice from the index element of invoice list }
{ ---------------------------------------------------------------------------- }
function TInvoiceDetail.DeleteInvoice(index: integer): boolean;
var
  invRec: TInvoiceRecPtr;
begin
  if (index < 0) or (index >= FInvoiceList.count) then
    result := false
  else begin
    result := True;

    // Get the recored we are about to delete
    invRec := TInvoiceRecPtr(FInvoiceList.Items[index]);
    dispose(invRec);
    FInvoiceList.Delete(index);
  end;
end;

procedure TInvoiceDetail.CalculateQuotedHours(index : integer; startdate, enddate : TDateTime);
var
  I: Integer;
  FoundQuote, InvoicingComplete: boolean;
  invRec, InvRecLU: TInvoiceRecPtr;
  InvoicedSales : Currency;
  varg : Variant;
  NumInvDB, NumInvList : Integer;
begin
  invRec := TInvoiceRecPtr(FInvoiceList.Items[index]);
  NumInvDB := 0;
  NumInvList := 0;
  FoundQuote := False;
  if (Length(InvRec.Quote_Number) > 0) and (InvRec.Quote_Number <> 'No Group')
    then begin
    varg := VarArraycreate([0,2], VarVariant);
    Varg[0] := DataModuleClient.DepartmentsDept_ID.Value;
    Varg[1] := StrtoInt(InvRec.Quote_number);
    DataModuleClient.QuotesLU.refresh;
    InvoicedSales := 0;
//    InvoicedHours := 0;
    InvoicingComplete := False;
    if DataModuleClient.QuotesLU.locate('Dept_ID; Quote_Number', Varg, [])
      then begin
      DataModuleClient.InvQuoteLU.Active := True;
      FoundQuote := True;
      DataModuleClient.InvQuoteLU.first;
      while DataModuleClient.InvQuoteLU.Eof = False do
        begin
        if (InvRec.Invoice_ID <> DataModuleClient.InvQuoteLUInvoice_ID.value) and
          ((DataModuleClient.InvQuoteLUInv_Date.value < StartDate) or
           (DataModuleClient.InvQuoteLUInv_Date.value > EndDate))
          then begin
          inc(NumInvDb);
          InvoicedSales := InvoicedSales + DataModuleClient.InvQuoteLUNetSales.Value;
          if (DataModuleClient.InvQuoteLUOrderComplete.value > 1) then
            InvoicingComplete := True;
        end;
        DataModuleClient.InvQuoteLU.Next;
      end;  // while
      // find out how many invoices in the list refer to this Quote
      for I := 0 to FInvoiceList.count - 1 do    // Iterate
        begin
        invRecLU := TInvoiceRecPtr(FInvoiceList.Items[I]);

        if InvRecLU.Quote_Number = InvRec.Quote_Number
          then begin
          inc(NumInvList);
          InvoicedSales := InvoicedSales + InvRecLu.NetSales;
          if InvRecLU.LastInv then
            InvoicingComplete := True;
        end;
      end;    // for
//        begin
//          InvoicedHours := InvoicedHours + DataModuleClient.InvQuoteLUUnitsRequired.Value;
//        end;
      if (InvoicedSales < DataModuleClient.QuotesLUQ_Value.value) or (InvoicingComplete = False)
        then InvoicedSales := DataModuleClient.QuotesLUQ_Value.value;
      if InvoicedSales <= 0 then
        FoundQuote := True
      else begin
        if (NumInvDb + NumInvList) = 1
          then begin
          if InvRec.LastInv then
            InvRec.Units := DataModuleClient.QuotesLUTargetUnits.Value
          else
            InvRec.Units := DataModuleClient.QuotesLUTargetUnits.Value * InvRec.NetSales / InvoicedSales;
        end
        else begin
          if NumInvDB > 0
            then begin
            DataModuleClient.InvQuoteLU.first;
            while (DataModuleClient.InvQuoteLU.Eof = False) and (NumInvDB > 0) do
              begin
              if (InvRec.Invoice_ID <> DataModuleClient.InvQuoteLUInvoice_ID.value) and
                ((DataModuleClient.InvQuoteLUInv_Date.value < StartDate) or
                (DataModuleClient.InvQuoteLUInv_Date.value > EndDate))
                then begin
                dec(NumInvDb);
                DataModuleClient.InvQuoteLU.Edit;
                DataModuleClient.InvQuoteLUUnitsRequired.value :=
                  DataModuleClient.QuotesLUTargetUnits.Value * DataModuleClient.InvQuoteLUNetSales.Value / InvoicedSales;
                DataModuleClient.InvQuoteLU.Post;
              end;
              DataModuleClient.InvQuoteLU.Next;
            end;  // while
          end;
          if NumInvList > 0
            then begin
            for I := 0 to FInvoiceList.count - 1 do    // Iterate
              begin
              invRecLU := TInvoiceRecPtr(FInvoiceList.Items[I]);
              if InvRecLU.Quote_Number = InvRec.Quote_Number
                then begin
//                Dec(NumInvList);
                InvRecLU.Units := DataModuleClient.QuotesLUTargetUnits.Value * InvRecLU.NetSales / InvoicedSales;
              end;
            end;    // for
          end;
        end;
      end;
      DataModuleClient.InvQuoteLU.Active := False;
    end;
  end;
  If not FoundQuote then InvRec.Units := InvRec.TSunits;
end;

end.
