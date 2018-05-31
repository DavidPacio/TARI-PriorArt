unit detailExpensesEmpty;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  Buttons,  auchTypes, DMrep1U, LGlobals, Businesssetup, Menus, DateUtils,
  VCLTee.TeEngine, VCLTee.TeeTools, VCLTee.TeePageNumTool, VCLTee.Series,
  VCLTee.TeeProcs, VCLTee.Chart, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxButtons;

Const
  MAXSALESUNIT = 50000;
  FIXBILLED = 0;
  FIXPOTENTIAL = 1;
  FIXSALES = 2;
  FIXGP = 3;
  FIXNOP = 4;
  FIXNP = 5;

type
  TDetailExpensesF = class(TForm)
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    ChartTool1: TPageNumTool;
    CloseBtn: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
  private
    { Private declarations }
    LeftMouseDown : Boolean;
    SelectedSeries : Integer;
    UpdateStart, UpdateEnd : Integer;
    DateIdx : Variant;
  public
    { Public declarations }
    SingularTitle, PluralTitle : string;
    DefPeriod, DefAccount : Integer;
  end;

{
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
}
var
  DetailExpensesF: TDetailExpensesF;
  RecordPtr: TPlanDataRecPtr;
  TotalExpensesRec : TPlanDataRecPtr;
//  initialized : Boolean;
  PeriodIndex : Integer;
  SeriesSize : integer;
  Currentmin : Integer;
  Startpoint : TPoint;
//  Lhistory : TCustomHist;
  ChartDates : TDateTimeArray;
  PointersPerPage : Integer;
  DecPrecision : Integer;
  AllowChartEdit : Boolean;

implementation

uses DataCollector, DMClient, PastPeriodSelection;

{$R *.dfm}

{ TExpenseDataSource }
{
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
  case Integer(ADataBinding.Data) of    //
    0: Result := EXPRec.AccountTitle;
    1:  Begin
        if DataModuleClient.DateRangersD_Index.value > 0 then
          Result := Round(EXPRec.PastBalances[DataModuleClient.DateRangersD_Index.value - 1])
        else
          Result := 0;
        end;
    2: Result := Round(EXPRec.PlanTotal);
  end;    // case
end;

procedure TExpenseDataSource.SetValue(ARecordHandle: TcxDataRecordHandle;
  AItemHandle: TcxDataItemHandle; const AValue: Variant);
var
  ADataBinding: TcxGridItemDataBinding;
  EXPRec : TPlanDataRecPtr;
begin
  ADataBinding := TcxGridItemDataBinding(AItemHandle);
  EXPREc := FEXPLIST[Integer(ARecordHandle)];
  if Integer(ADataBinding.Data) = 2 then    //
    begin
//    DetailExpensesF.AccountChanged(Exprec.Accountno, AValue);
    EXPRec.PlanTotal := aValue;
//    DataChanged;
    end;
end;

function TExpenseDataSource.GetItemHandle(AItemIndex: Integer): TcxDataItemHandle;
begin
  Result := TcxDataItemHandle(GetDataBinding(AItemIndex));
end;
}
procedure TDetailExpensesF.FormCreate(Sender: TObject);
begin
//  Color := GGlobals.FormColour;
//  DMrep1.TariButtonList.GetImage(0, CloseBtn.Glyph);
  DateIdx := DATAMODULECLIENT.DateRangersD_INDEX.Value;
  Width := 1020;
  Height := 760;
//  Initialized := False;
  Caption := 'Target Expense Details - '  + DataModuleClient.BusinessesBRANCH_NAME.AsString;
//  DeptLbl.Caption := 'Department: ' + DataModuleClient.DepartmentsREVENUE_GROUP_NAME.AsString;
//  Chart1.BottomAxis.DateTimeFormat := 'dd' + #13 + 'MMM';
//  Series2.Clear;
  LeftMouseDown := False;
//  Lhistory := TCustomHist.Create;
  DataModuleClient.DateRangersStartDate.DisplayFormat := GGlobals.GetDateFSTD;
  DataModuleClient.DateRangersEndDate.DisplayFormat := GGlobals.GetDateFSTD;
  DataModuleClient.DepartmentsCurrentPlanStart.DisplayFormat := GGlobals.GetDateFSTD;
  DataModuleClient.DepartmentsCurrentPlanEnd.DisplayFormat := GGlobals.GetDateFSTD;
  DATAMODULECLIENT.DateRangers.Locate('D_INDEX', DateIdx, []);
  DataModuleClient.DepartmentsCurrentPlanEnd.DisplayText;
  TotalExpensesRec := PlanDataList.Items[GetAccountListIndex(TOTALEXPENSES)];
  DataCollect.psdate := DataModuleClient.DepartmentsCurrentPlanStart.value;
  DataCollect.pedate := DataModuleClient.DepartmentsCurrentPlanEnd.value;
  DataCollect.getPlanningExpData(False);
  SelectedSeries := 0;
  DATAMODULECLIENT.DateRangers.Locate('D_INDEX', DateIdx, []);
end;


procedure TDetailExpensesF.FormClose(Sender: TObject; var Action: TCloseAction);
var
  I: Integer;
  PlanDataRec : TPlanDataRecPtr;
  PlanDataexpRec : TPlanDataRecPtr;
  j : integer;
  TotalExpensestemp : currency;
begin
  screen.Cursor := crHourGlass;
end;

procedure TDetailExpensesF.FormShow(Sender: TObject);
begin
  screen.Cursor := crDefault;
end;

procedure TDetailExpensesF.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

end.
