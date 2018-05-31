unit LK_HtmlViewer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Htmlview, StdCtrls, Buttons, ToolWin, ComCtrls;

type
  TForm1 = class(TForm)
    HTMLViewer1: THTMLViewer;
    ToolBar1: TToolBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    PrinterSetupDialog1: TPrinterSetupDialog;
    BitBtn4: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormActivate(Sender: TObject);
begin
 HTMLViewer1.Loadfromfile('help\CBA Parables.htm');
end;


procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  HTMLViewer1.Loadfromfile('help\CBA Parables.htm');
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  HtmlViewer1.Print(1, 9999);
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
  PrinterSetupDialog1.execute;
end;

end.
