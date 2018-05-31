program TestDB;

uses
  Forms,
  testMain in 'testMain.pas' {testMainF},
  DMClient1 in 'DMClient1.pas' {DataModuleClient1: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TtestMainF, testMainF);
//  Application.CreateForm(TDataModuleClient1, DataModuleClient1);
  Application.Run;
end.
