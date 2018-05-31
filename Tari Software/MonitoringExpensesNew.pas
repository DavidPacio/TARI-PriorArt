unit MonitoringExpensesNew;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  AOvcTcCurrencyEdit, OvcTCEdt, StdCtrls, OvcTCmmn, OvcTCell, OvcTCStr,
  OvcTCHdr, OvcBase, OvcTable, OvcTbCls, Buttons, ExtCtrls, MegaPanl, auchtypes,
  fcLabel, OvcConst, fcButton, fcImgBtn, fcShapeBtn;

type
  TMonitoringExpensesF = class(TForm)
    MegaPanel1: TMegaPanel;
    BitBtn1: TBitBtn;
    OvcTable1: TOvcTable;
    OvcController1: TOvcController;
    OvcTCColHead1: TOvcTCColHead;
    Label1: TLabel;
    Label3: TLabel;
    OvcTCDate: TOvcTCString;
    AOvcTCCurrency: TAOvcTCCurrency;
    ComboBox1: TComboBox;
    Label2: TLabel;
    OvcTCRowHead1: TOvcTCRowHead;
    Label4: TLabel;
    fcLabel1: TfcLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure OvcTable1GetCellData(Sender: TObject; RowNum,
      ColNum: Integer; var Data: Pointer; Purpose: TOvcCellDataPurpose);
    procedure OvcTable1EndEdit(Sender: TObject;
      Cell: TOvcTableCellAncestor; RowNum, ColNum: Integer;
      var AllowIt: Boolean);
    procedure OvcTable1BeginEdit(Sender: TObject; RowNum, ColNum: Integer;
      var AllowIt: Boolean);
    procedure OvcTable1ActiveCellChanged(Sender: TObject; RowNum,
      ColNum: Integer);
    procedure OvcTable1ActiveCellMoving(Sender: TObject; Command: Word;
      var RowNum, ColNum: Integer);
    procedure FormActivate(Sender: TObject);
  private
    Formactive: boolean;
    OldCellValue: Currency;
    DummyCellValue: Currency;
    Initialised: boolean;
    LastRowEnd: Integer;
    LatestPeriod: Integer;
    LastColEnd: Integer;
    ComboBox1State: Integer;
    YearDates : Array[0 .. NUM_DAYSINYEAR] of string[15];
    MonitorOPTDataRec : TPlanDataRecPtr;
    procedure CalcDetail(rownum, colnum : integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MonitoringExpensesNewF: TMonitoringExpensesF;

implementation

uses DMClient;

{$R *.DFM}

procedure TMonitoringExpensesF.FormCreate(Sender: TObject);
var
  DaysinYear: Integer;
  J: Integer;
  MonitorDataRec : TPlanDataRecPtr;
  TableCol : TOvcTableColumn;
begin
  Initialised := False;
  Formactive := False;
  DataModuleClient.LookupSummaryIntervals.First;
  ComboBox1.Clear;
  while DataModuleClient.LookupSummaryIntervals.eof = False
    do begin
    Combobox1.Items.Add(DataModuleClient.LookupSummaryIntervalsPeriod_Desc.value);
    DataModuleClient.LookupSummaryIntervals.Next;
  end;
  Caption := 'Monitoring Expenses Data Entry - ' + DataModuleClient.BusinessDetailsBusiness_Name.value;
  DataModuleClient.GetConsolidatedList(False);
  Label2.Caption := DataModuleClient.DepartmentsRevenueGroupName.Value;
  fcLabel1.Caption := FormatDateTime('dd-MMM-yy', DataModuleClient.DepartmentsCurrentMonitoringStart.value) +  ' to ' +
  FormatDateTime('dd-MMM-yy', DataModuleClient.DepartmentsCurrentMonitoringEnd.value);

  DataModuleClient.getMonitoringExpData;
  for J := 0 to MonitoringExpDataList.count - 1
    do begin
    MonitorDataRec := MonitoringExpDataList.items[J];
    Tablecol := TOvcTableColumn.Create(OvcTable1);
    Tablecol.Number := J + 2;
    Tablecol.Width := 90;
    TableCol.DefaultCell := AOvcTCCurrency;
    OvcTable1.Columns.Append(TableCol);
    OvcTCColHead1.Headings.Add(MonitorDataRec.AccountTitle);
  end;
  new(MonitorOPTDatarec);
  FillChar(MonitorOPTDatarec^, sizeof(TPlanDataRecType), #0);
  // Get Account Titles
  MonitorOPTDataRec.Accountno := DETAILEDOPT;
  if not DataModuleClient.getBalances(MonitorOPTDataRec.PlanDetail, DETAILEDOPT, False) then
    MonitorOPTDataRec.PlanTotal := 0
  else
    move(MonitorOPTDataRec.PlanDetail, MonitorOPTDatarec.PlanDetaildisk, sizeof(TDetailedBalArray));

  ComboBox1.ItemIndex := strtoint(currtostr(MonitorOPTDataRec.PlanDetail[50]));
  DaysinYear := trunc(DataModuleClient.DepartmentsCurrentMonitoringEnd.value) - trunc(DataModuleClient.DepartmentsCurrentMonitoringStart.value);
  if ComboBox1.ItemIndex < 0 then
    ComboBox1.ItemIndex := 0;
  LatestPeriod := 0;
  if MonitorOPTDataRec.PlanDetail[53] > 0
    then begin
    LatestPeriod := Trunc(MonitorOPTDataRec.PlanDetail[53] - DataModuleClient.DepartmentsCurrentMonitoringStart.value);
    if (LatestPeriod < 0) or (LatestPeriod > DaysinYear) then
      LatestPeriod := 0;
  end;
  for j := 0 to DaysInYear do    // Iterate
    YearDates[j] := FormatDateTime(' dd mmm yyyy ', DataModuleClient.DepartmentsCurrentMonitoringStart.value + j);
  Initialised := True;
  LastColEnd := 0;
  LastRowEnd := 0;
  ComboBox1Change(Sender);
end;

procedure TMonitoringExpensesF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DataModuleClient.MonitoringExploaded = True then
    DataModuleClient.SetMonitoringExpData;
  DataModuleClient.clearMonitorExpDataList;
  DataModuleClient.ClearConsolidatedList;
  Close;
end;

procedure TMonitoringExpensesF.ComboBox1Change(Sender: TObject);
var
  J: Integer;
  daysinyear: integer;
begin
  if Initialised
    then begin
    OvcTable1.StopEditingState(true);
    OvcTable1.AllowRedraw := False;
    ComboBox1State := ComboBox1.Itemindex;
    daysinyear := trunc(DataModuleClient.DepartmentsCurrentMonitoringEnd.value) - trunc(DataModuleClient.DepartmentsCurrentMonitoringStart.value);
    if ComboBox1.ItemIndex > 0 then
      Ovctable1.RowLimit :=  createSummaryIndex(Combobox1.ItemIndex, DataModuleClient.DepartmentsCurrentMonitoringStart.value, DataModuleClient.DepartmentsCurrentMonitoringEnd.value) + 1
    else OvcTable1.RowLimit := DaysinYear + 2;
    for J := 0 to MonitoringExpDataList.count - 1
      do BuildMonitorSummary(j, True);
    if Formactive then
      OvcTable1.SetActiveCell(1, 2);
    OvcTable1.invalidate;
    OvcTable1.AllowRedraw := True;
    OvcTable1.StartEditingState;
  end;
end;

procedure TMonitoringExpensesF.OvcTable1GetCellData(Sender: TObject;
  RowNum, ColNum: Integer; var Data: Pointer;
  Purpose: TOvcCellDataPurpose);
var
  MonitorDataRec : TPlanDataRecPtr;
begin
  if (RowNum = 0) or (colNum = 0) or (Not Initialised) then exit;

  if Colnum = 1
    then begin
    if ComboBox1State = 0 then
      Data := @YearDates[RowNum - 1]
    else
      Data := @YearDates[SummaryPeriodIndexArray[RowNum - 1]];
  end
  else begin
    MonitorDataRec := MonitoringexpDataList.Items[ColNum - 2];
    if ComboBox1State = 0 then
      Data := @MonitorDataRec.PlanDetail[RowNum - 1]
    else
      Data := @MonitorDataRec.PlanSummary[RowNum - 1];
//    Data := @DummyCellValue;
  end;
end;

procedure TMonitoringExpensesF.OvcTable1EndEdit(Sender: TObject;
  Cell: TOvcTableCellAncestor; RowNum, ColNum: Integer;
  var AllowIt: Boolean);
begin
  if {((Colnum <> LastColEnd) or (RowNum <> LastRowEnd)) and }(Colnum > 1) then
    begin
    LastColEnd := Colnum;
    LastRowEnd := Rownum;
    Calcdetail(rownum, colnum);
    OvcTable1.InvalidateRow(Rownum);
    Allowit := True;
  end;
end;

procedure TMonitoringExpensesF.CalcDetail(rownum, colnum : integer);
var
  j: Integer;
  MonitorDataRec : TPlanDataRecPtr;
  temparray : TDetailedBalArray;
  fromperiod, toperiod : integer;
begin
//  CurrentRow := OvcTable3.activeRow;
  MonitorDataRec := MonitoringExpDataList.Items[Colnum - 2];
  if ComboBox1State > 0
    then begin
    if Rownum < 2 then
      fromperiod := 0
    else
      fromperiod := SummaryPeriodIndexArray[rownum - 2] + 1;
    toperiod := SummaryPeriodIndexArray[Rownum - 1];
    // Get current values
    if OldCellvalue <> MonitorDataRec.PlanSummary[rownum - 1]
      then begin
      UpdateFromSummaryBalances(MonitorDataRec.Plandetail,   temparray,
        MonitorDataRec.PlanSummary[Rownum - 1], fromperiod, toperiod);
    end;
  end;
end;

procedure TMonitoringExpensesF.OvcTable1BeginEdit(Sender: TObject; RowNum,
  ColNum: Integer; var AllowIt: Boolean);
var
  MonitorDataRec : TPlanDataRecPtr;
begin
  if (not initialised) or (Colnum < 2) then exit;

  MonitorDataRec := MonitoringExpDataList.Items[ColNum - 2];
  if ComboBox1State = 0 then
    OldCellValue := MonitorDataRec.PlanDetail[RowNum - 1]
  else
    OldCellValue := MonitorDataRec.PlanSummary[RowNum - 1];
end;

procedure TMonitoringExpensesF.OvcTable1ActiveCellChanged(Sender: TObject;
  RowNum, ColNum: Integer);
begin
  OvcTable1.StopEditingState(False);
  OvcTable1.AllowRedraw := False;
//  OvcTable1.invalidateRow(Rownum);
  OvcTable1.AllowRedraw := True;
  OvcTable1.StartEditingState;
end;

procedure TMonitoringExpensesF.OvcTable1ActiveCellMoving(Sender: TObject;
  Command: Word; var RowNum, ColNum: Integer);
begin
  if (RowNum = 0) or (not initialised)then exit;

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
        do begin
        StopEditingState(True);
        AllowRedraw := False;
        if (RowNum < RowLimit) and (ColNum = Colcount)
          then begin
          Inc(RowNum);
          ColNum := 2;
        end;
        StartEditingState;
        AllowRedraw := True;
      end;
    ccLeft:
      with OvcTable1
      do begin
        AllowRedraw := False;
        StopEditingState(True);
        StartEditingState;
        AllowRedraw := True;
      end;
    ccMouse:
      with OvcTable1
      do begin
        AllowRedraw := False;
        StopEditingState(True);
        StartEditingState;
        AllowRedraw := True;
      end;
    ccDown:
      with OvcTable1
      do begin
        AllowRedraw := False;
        StopEditingState(True);
        if (RowNum = ActiveRow) and (RowNum < RowLimit)
        then begin
          IncRow(RowNum, 1);
        end;
        StartEditingState;
        AllowRedraw := True;
      End;
    ccUp:
      with OvcTable1
      do begin
        AllowRedraw := False;
        StopEditingState(True);
        StartEditingState;
        AllowRedraw := True;
      end;
  end;
end;

procedure TMonitoringExpensesF.FormActivate(Sender: TObject);
begin
 Formactive := True;
end;

end.
