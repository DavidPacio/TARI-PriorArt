unit TARIMYOBTIMES;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,MYOBInterGlobals, MYOBDM, Grids, DBGrids, StdCtrls, cxButtons,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxContainer, cxEdit,
  cxLabel, cxDBLabel, cxNavigator, cxDBNavigator, cxCurrencyEdit, cxDBEdit,
  cxTextEdit, cxGroupBox;

type
  TTARITimesF = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1PRODUCT_ID: TcxGridDBColumn;
    cxGrid1DBTableView1PROD_GROUP: TcxGridDBColumn;
    cxGrid1DBTableView1DESCRIPTION: TcxGridDBColumn;
    cxGrid1DBTableView1SELLING_PRICE: TcxGridDBColumn;
    cxGrid1DBTableView1UNITS_LABOUR: TcxGridDBColumn;
    cxGrid1DBTableView1TARI_Rate: TcxGridDBColumn;
    CloseBtn: TcxButton;
    cxLabel1: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    ComponentDesc: TcxDBTextEdit;
    ComponentSellingPrice: TcxDBCurrencyEdit;
    ComponentLabourUnits: TcxDBCurrencyEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxDBNavigator1: TcxDBNavigator;
    cxDBLabel1: TcxDBLabel;
    cxLabel5: TcxLabel;
//    procedure FormShow(Sender: TObject);
//    procedure FormHide(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComponentLabourUnitsExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FormStarted : Boolean;
  end;

var
  TARITimesF: TTARITimesF;

implementation

{$R *.dfm}
{
procedure TTARITimesF.FormShow(Sender: TObject);
begin
    DMInterface.SCHistory.active := False;
    DMInterface.SCHistory.Filter := '(Date >= ''01/10/2005'') AND (Date <= ''31/10/2005'')';
    DMInterface.SCHistory.Filtered := True;
    DMInterface.SCHistory.Active := True;
end;

procedure TTARITimesF.FormHide(Sender: TObject);
begin
    DMInterface.SCHistory.active := False;
    DMInterface.SCHistory.Filter := '';
    DMInterface.SCHistory.Filtered := False;
    DMInterface.SCHistory.Active := True;

end;
}
procedure TTARITimesF.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TTARITimesF.FormCreate(Sender: TObject);
begin
  color := GGlobals.FormColour;
  FormStarted := False;
end;

procedure TTARITimesF.ComponentLabourUnitsExit(Sender: TObject);
begin
  if FormStarted then
    begin
    cxGrid1DBTableView1.DataController.BeginFullUpdate;
//    DMInterface.ComponentLU.Refresh;
//    DMInterface.SPUpdateComponents.ExecProc;
//    DMInterface.FBUnitsUpdate.Refresh;
    cxGrid1DBTableView1.DataController.EndFullUpdate;
    end;

end;

end.

