program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  DMClient in 'DMClient.pas' {DataModuleClient: TDataModule},
  Planning in 'Planning.pas' {PlanningF};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
