unit TARIStaff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,SCInterGlobals, SCDM, Grids, DBGrids, StdCtrls, cxButtons,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxContainer, cxEdit,
  cxLabel, cxDBLabel, cxNavigator, cxDBNavigator, cxCurrencyEdit, cxDBEdit,
  cxTextEdit, cxGroupBox, cxCheckBox;

type
  TTARIStaffF = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    CloseBtn: TcxButton;
    cxLabel1: TcxLabel;
    ActiveOnlyCB: TcxCheckBox;
    cxGrid1DBTableView1LASTNAME: TcxGridDBColumn;
    cxGrid1DBTableView1FIRSTNAME: TcxGridDBColumn;
    cxGrid1DBTableView1PRODUCER: TcxGridDBColumn;
    cxGrid1DBTableView1IS_ACTIVE: TcxGridDBColumn;
//    procedure FormShow(Sender: TObject);
//    procedure FormHide(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComponentLabourUnitsExit(Sender: TObject);
    procedure ActiveOnlyCBPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FormStarted : Boolean;
  end;

var
  TARIStaffF: TTARIStaffF;

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
procedure TTARIStaffF.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TTARIStaffF.FormCreate(Sender: TObject);
begin
  color := GGlobals.FormColour;
  FormStarted := False;
  ActiveOnlyCB.Checked := DMInterface.GetStaffActive;
end;

procedure TTARIStaffF.ComponentLabourUnitsExit(Sender: TObject);
begin
  if FormStarted then
    begin
    cxGrid1DBTableView1.DataController.BeginFullUpdate;
    DMInterface.ComponentLU.Refresh;
    DMInterface.SPUpdateComponents.ExecProc;
    DMInterface.FBUnitsUpdate.Refresh;
    cxGrid1DBTableView1.DataController.EndFullUpdate;
    end;

end;

procedure TTARIStaffF.ActiveOnlyCBPropertiesChange(Sender: TObject);
begin
  // if True we filter the Services
  DMInterface.FBStaff.Active := False;
  if ActiveOnlyCB.Checked then
    begin
    DMInterface.FBStaff.Filter := 'IS_ACTIVE = 1';
    DMInterface.FBStaff.Filtered := True;
    end
  else
    begin
    DMInterface.FBStaff.Filter := '';
    DMInterface.FBStaff.Filtered := False;
    end;
  DMInterface.SetStaffActive(ActiveOnlyCB.Checked);
  DMInterface.FBStaff.Active := True;
end;

end.

