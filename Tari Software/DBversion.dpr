program DBversion;

uses
  Forms,
  DBUpdate in 'DBUpdate.pas' {DBUpdateF};

{$R *.RES}

begin
  Application.Initialize;
  if not initFailed
    then begin
    Application.Run;
  end
  else
    Application.terminate;
end.
