unit DIYPlanExpenses;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, auchtypes, cxButtons, cxTextEdit, cxDBEdit, cxControls,
  cxContainer, cxEdit, cxLabel, cxCustomData, cxDataStorage, LGlobals,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls, DMrep1U, Businesssetup,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinXmas2008Blue, cxStyles, dxSkinscxPCPainter, cxFilter, cxData,
  cxCurrencyEdit, Menus, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TDIYPlanExpensesF = class(TForm)
    cxLabel3: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel4: TcxLabel;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGridExpenseTableView1: TcxGridTableView;
    cxGridExpenseTableView1Title: TcxGridColumn;
    cxGridExpenseTableView1Amount: TcxGridColumn;
    cxGridExpenseTableView1Column3: TcxGridColumn;
    cxButton2: TcxButton;
    CloseBtn: TcxButton;
    cxButton1: TcxButton;
    cxDBTextEdit1: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
    Initialised : Boolean;
    procedure calculatePastExpenseData(Newamount: Currency; AccountNo: integer);
    procedure SetPeriodLabel;
    procedure SetExpenses;
  public
    { Public declarations }
  protected
  end;

  TExpenseDataSource = class(TcxCustomDataSource)
  private
    FEXPLIST: TList;
    FModified: boolean;
  protected
    function GetRecordCount: Integer; override;
    function GetDataBinding(AItemIndex: Integer): TcxGridItemDataBinding;
    Function GetItemHandle(AItemIndex: Integer): TcxDataItemHandle; override;
    function GetValue(ARecordHandle: TcxDataRecordHandle;
      AItemHandle: TcxDataItemHandle): Variant; override;
    procedure SetValue(ARecordHandle: TcxDataRecordHandle;
      AItemHandle: TcxDataItemHandle; const AValue: Variant); override;
  public
    constructor Create(AEXPList: TList);
    destructor Destroy; override;
    property Modified: boolean read FModified;
  end;

var
  DIYPlanExpensesF: TDIYPlanExpensesF;
  PastSalesTotal : Currency;

implementation

{$R *.DFM}

uses DMClient, DataCollector, PastPeriodSelection;

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
          0:
            DataBinding.ValueTypeClass := TcxStringValueType;
          1, 2:
            DataBinding.ValueTypeClass := TcxCurrencyValueType;
        end;    // case
      end;
    end;    // for
end;

{ TExpenseDataSource }
constructor TExpenseDataSource.Create(AEXPList: TList);
begin
  inherited Create;
  FEXPLIST := AEXPList;
end;

destructor TExpenseDataSource.Destroy;
begin
  inherited Destroy;
end;

function TExpenseDataSource.GetDataBinding(AItemIndex: Integer): TcxGridItemDataBinding;
begin
  Result := TcxCustomGridTableItem(DataController.GetItem(AItemIndex)).DataBinding;
end;

function TExpenseDataSource.GetRecordCount: Integer;
begin
  Result := FExplist.Count;
end;

function TExpenseDataSource.GetValue(ARecordHandle: TcxDataRecordHandle; AItemHandle: TcxDataItemHandle): Variant;
var
  ADataBinding: TcxGridItemDataBinding;
  EXPRec : TPlanDataRecPtr;
begin
  ADataBinding := TcxGridItemDataBinding(AItemHandle);
  EXPRec := FEXPLIST[Integer(ARecordHandle)];
  if (Integer(ADataBinding.Data) <> 0) and (DataModuleClient.DateRangersD_Index.Value <= 0) then
    Result := 0
  else
    begin
    case Integer(ADataBinding.Data) of    //
      0: Result := EXPRec.AccountTitle;
      1: Result := EXPRec.PastBalances[DataModuleClient.DateRangersD_Index.value - 1];
      2:  begin
          if PastSalesTotal > 0 then
            Result := EXPRec.PastBalances[DataModuleClient.DateRangersD_Index.value - 1] * 100 / PastSalesTotal
          else
            Result := 0;
          end;
      end;    // case
    end;
end;

procedure TExpenseDataSource.SetValue(ARecordHandle: TcxDataRecordHandle;
  AItemHandle: TcxDataItemHandle; const AValue: Variant);
var
  ADataBinding: TcxGridItemDataBinding;
  EXPRec : TPlanDataRecPtr;
begin
  ADataBinding := TcxGridItemDataBinding(AItemHandle);
  EXPREc := FEXPLIST[Integer(ARecordHandle)];
  if Integer(ADataBinding.Data) = 1 then    //
    begin
    DIYPlanExpensesF.calculatePastExpenseData(AValue, EXPrec.Accountno);
//    DataChanged;
    end;
end;

function TExpenseDataSource.GetItemHandle(AItemIndex: Integer): TcxDataItemHandle;
begin
	Result := TcxDataItemHandle(GetDataBinding(AItemIndex));
end;

procedure TDIYPlanExpensesF.FormCreate(Sender: TObject);
begin
//  Color := gglobals.FormColour;
  DMrep1.TariButtonList.GetImage(0, CloseBtn.Glyph);
  if DataModuleClient.DateRangers.RecordCount < 2 then
    cxButton1.Visible := False;
  Initialised := False;
  Caption := 'Detailed Expenses - ' + DataModuleClient.BusinessesBRANCH_NAME.AsString;
  DataCollect.psdate := DataModuleClient.DepartmentsCurrentPlanStart.value;
  DataCollect.pedate := DataModuleClient.DepartmentsCurrentPlanEnd.value;
  DataCollect.getPlanningExpData(True);
  Findpastdate;
  GenerateColumns(cxGridExpenseTableView1);
  cxGridExpenseTableView1.DataController.CustomDataSource := TExpenseDataSource.Create(PlanExpDataList);
  SetExpenses;
end;

procedure TDIYPlanExpensesF.SetExpenses;
var
  I: Integer;
  PlanDataRec : TPlanDataRecPtr;
  PlanExpDataRec : TPlanDataRecPtr;
  TempBal : Currency;
begin
  if DataModuleClient.DateRangersD_Index.value <= 0 then exit;
  PlanDataRec := PlanDataList.Items[GetAccountListIndex(SALES)];
  PastSalesTotal := PlanDataRec.PastBalances[DataModuleClient.DateRangersD_Index.value - 1];
  PlanDataRec := PlanDataList.Items[GetAccountListIndex(TOTALEXPENSES)];
  TempBal := 0;
  for I := 0 to PlanExpDataList.count - 1 do    // Iterate
    begin
    PlanExpDataRec := PlanExpDataList.Items[I];
    if PlanExpDataRec.Accountno <> TOTALOTHEREXPENSES then
      TempBal := Tempbal + PlanExpDataRec.PastBalances[DataModuleClient.DateRangersD_Index.value - 1];
    end;    // for
  PlanExpDataRec := PlanExpDataList.Items[GetExpAccountListIndex(TOTALOTHEREXPENSES)];
  PlanExpDataRec.PastBalances[DataModuleClient.DateRangersD_Index.value - 1] := PlanDataRec.PastBalances[DataModuleClient.DateRangersD_Index.value - 1] - tempbal;
  Initialised := True;
  SetPeriodLabel;
end;

procedure TDIYPlanExpensesF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DataCollect.setPlanningExpData;
  if PlanExpDataList.Count > 0 then
    DataCollect.ClearPlanExpDataList;
end;

procedure TDIYPlanExpensesF.calculatePastExpenseData(Newamount: Currency; AccountNo: integer);
var
  tempbal : Currency;
  PlanExpDataRec : TPlanDataRecPtr;
begin
  if DataModuleClient.DateRangersD_Index.value <= 0 then exit;
  PlanExpDataRec := PlanExpDataList.Items[GetExpAccountListIndex(AccountNo)];
  if (PlanExpDataRec.Accountno <> TOTALOTHEREXPENSES) then
    begin
    TempBal := PlanExpDataRec.PastBalances[DataModuleClient.DateRangersD_Index.value - 1];
    PlanExpDataRec.PastBalances[DataModuleClient.DateRangersD_Index.value - 1] := Newamount;
    PlanExpDataRec := PlanExpDataList.Items[GetExpAccountListIndex(TOTALOTHEREXPENSES)];
    PlanExpDataRec.PastBalances[DataModuleClient.DateRangersD_Index.value - 1] :=
    PlanExpDataRec.PastBalances[DataModuleClient.DateRangersD_Index.value - 1] - Newamount + tempbal;
    end;
end;
{
    ColPastBal: begin
    end;
}
// sortexpenses - If the colnum = ColTitle and ChangedTitle call the DataModule Function
//                The return is the new index + 1 so that the next cell is the correct one
//                else return the current Rownum

procedure TDIYPlanExpensesF.FormShow(Sender: TObject);
begin
  screen.Cursor := crDefault;
end;

procedure TDIYPlanExpensesF.SetPeriodLabel;
begin
  DataModuleClient.DateRangersSTARTDATE.DisplayFormat := GGlobals.GetDateFENH;
  DataModuleClient.DateRangersENDDATE.DisplayFormat := GGlobals.GetDateFENH;
  cxlabel4.caption := DataModuleClient.DateRangersStartDate.DisplayText + ' to ' +
    DataModuleClient.DateRangersEndDate.DisplayText;
  cxLabel4.Refresh;
  cxGridExpenseTableView1.DataController.CustomDataSource.DataChanged;
end;

procedure TDIYPlanExpensesF.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TDIYPlanExpensesF.cxButton2Click(Sender: TObject);
begin
  DataCollect.setPlanningExpData;
  DataCollect.clearPlanExpDataList;
  SelectedType := stExpenses;
  Application.CreateForm(TBusinessSetupF, BusinessSetupF);
  BusinessSetupF.showmodal;
  BusinessSetupF.free;
  DataCollect.psdate := DataModuleClient.DepartmentsCurrentPlanStart.value;
  DataCollect.pedate := DataModuleClient.DepartmentsCurrentPlanEnd.value;
  DataCollect.getPlanningExpData(True);
  TExpenseDataSource(cxGridExpenseTableView1.DataController.CustomDataSource).FEXPLIST := PlanExpDataList;
  sortExpenseList(True);
  SetExpenses;
end;

procedure TDIYPlanExpensesF.cxButton1Click(Sender: TObject);
var
  PlanDataRec : TPlanDataRecPtr;
begin
  if DataModuleClient.DateRangers.RecordCount > 1 then
    begin
    Application.CreateForm(TPastPeriodSelectionF, PastPeriodSelectionF);
    PastPeriodSelectionF.ShowModal;
    PastPeriodSelectionF.Free;
    end;
  if DataModuleClient.DateRangersD_Index.value <= 0 then exit;
  PlanDataRec := PlanDataList.Items[GetAccountListIndex(SALES)];
  PastSalesTotal := PlanDataRec.PastBalances[DataModuleClient.DateRangersD_Index.value - 1];
  SetPeriodlabel;
end;

end.
