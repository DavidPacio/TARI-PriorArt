unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxRadioGroup, cxEdit, cxControls, cxContainer;

type
  TForm1 = class(TForm)
    PastDatesRG: TcxRadioGroup;
    procedure PastDatesRGClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  NoRecords : integer;

implementation

{$R *.dfm}

procedure TForm1.PastDatesRGClick(Sender: TObject);
var
  Newindex : integer;
begin
  newindex := PastDatesRG.ItemIndex;
  close;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  NewItem : TcxRadioGroupItem;
begin
  norecords := 3;
  PastDatesRG.Properties.Items.BeginUpdate;
  PastDatesRG.Properties.Items.Clear;
  TcxRadioGroupItem(PastDatesRG.Properties.Items.Add).Caption := '1-Jul-2000 to 30-Jun-2001';
  TcxRadioGroupItem(PastDatesRG.Properties.Items.Add).Caption := '1-Jul-2001 to 30-Jun-2002';
  TcxRadioGroupItem(PastDatesRG.Properties.Items.Add).Caption := '1-Jul-2002 to 30-Jun-2003';
  PastDatesRG.Properties.Items.EndUpdate;
  Height :=108 + (NoRecords - 2) * 36;
  PastDatesRG.ItemIndex := -1;
end;

end.
