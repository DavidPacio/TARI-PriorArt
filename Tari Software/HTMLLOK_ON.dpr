program HTMLLOK_ON;

uses
  Forms,
  LK_HtmlViewer in 'LK_HtmlViewer.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
