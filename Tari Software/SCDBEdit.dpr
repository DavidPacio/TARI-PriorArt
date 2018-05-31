program SCDBEdit;

uses
  Forms,
  SCDBUpdate in 'SCDBUpdate.pas' {SCDBUpdateF},
  SCDM in 'SCDM.pas' {DMInterface: TDataModule},
  SCInterGlobals in 'SCInterGlobals.pas';

{$R *.res}

begin
  Application.Initialize;
  if GGlobals.initfailed = False then
    begin
    Application.CreateForm(TSCDBUpdateF, SCDBUpdateF);
  Application.Run;
    end
  else
    Application.Terminate;
end.
