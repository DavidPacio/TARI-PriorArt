unit DMTestCon;

interface

uses
  SysUtils, Classes, DB,
  {$IFDEF Embedded}
  IB_Session511,
  {$ENDIF}
  IB_Components, IB_Session, IBODataset, ExoTrans2, IB_Access;

type
  TDMTestConM = class(TDataModule)
    TESTCONNECTION: TIBODatabase;
    ExoConnection1: TExoConnection;
    ExoClient1: TExoClient;
    procedure ExoConnection1Connected(Sender: TObject);
  private
    { Private declarations }
  public
    EchoConnected : Integer;
    { Public declarations }
  end;

var
  DMTestConM: TDMTestConM;

implementation

{$R *.dfm}

procedure TDMTestConM.ExoConnection1Connected(Sender: TObject);
begin
  EchoConnected := 1;
end;

end.
