unit ImpTemplates;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TARIDataModule, SCInterGlobals, DMrep1U, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxLabel, cxContainer, cxEdit, cxTextEdit,
  cxDBEdit, StdCtrls, cxButtons, cxNavigator, cxDBNavigator, db,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, SCDM;

type
  TImpTemplatesF = class(TForm)
    CloseBtn: TcxButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxLabel1: TcxLabel;
    procedure CloseBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ImpTemplatesF: TImpTemplatesF;

implementation

{$R *.dfm}

procedure TImpTemplatesF.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TImpTemplatesF.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  ModalResult := MrOK;
//  TARIDataModule.SourceImpTemplate.Active := False;
//  TARIDataModule.Src_Temp_Details.Active := False;
  Canclose := True;
end;

procedure TImpTemplatesF.FormCreate(Sender: TObject);
begin
  color := GGlobals.FormColour;
  cxGrid1DBTableView1DBColumn1.SortIndex := 0;
end;

end.
