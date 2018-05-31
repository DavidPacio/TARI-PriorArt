program MYOBInterface;

uses
  Forms,
  MYOBMain in 'MYOBMain.pas' {MyobMainF},
  DMMYOB in 'DMMYOB.pas' {DMMYOBData: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMyobMainF, MyobMainF);
  Application.Run;
end.
