program UserTestProject1;

uses
  Forms,
  UsertestUnit1 in 'UsertestUnit1.pas' {Form1},
  Licence in 'Licence.pas' {LicenceF};
{$R *.res}

begin
  Application.Initialize;
  if initfailed then
    Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
