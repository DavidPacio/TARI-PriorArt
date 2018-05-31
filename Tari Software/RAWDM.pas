unit RAWDM;

interface

uses
  SysUtils, Classes, DB, DBTables, Messages, IB_Components, IBODataset,
  SCInterGlobals, Variants, cxStyles, cxClasses, cxGridTableView, dialogs;

type
  TDMInterface = class(TDataModule)
    SRC_Database: TDatabase;
    SCServices: TTable;
    SCServicesIdNumber: TIntegerField;
    SCServicesCategory: TSmallintField;
    SCServicesService: TStringField;
    SCServicesTime1: TSmallintField;
    SC2TARIDB: TIBODatabase;
    IB_Query1: TIB_Query;
    IB_Query2: TIB_Query;
    SCServicesCost: TCurrencyField;
    IB_Query3: TIB_Query;
    SCServicesPoints: TSmallintField;
    SCServicesText1: TStringField;
    SCServicesBreak1: TSmallintField;
    SCServicesCost1: TCurrencyField;
    SCServicesPoints1: TSmallintField;
    SCServicesCount1: TSmallintField;
    SCServicesText2: TStringField;
    SCServicesTime2: TSmallintField;
    SCServicesBreak2: TSmallintField;
    SCServicesCost2: TCurrencyField;
    SCServicesPoints2: TSmallintField;
    SCServicesCount2: TSmallintField;
    SCServicesText3: TStringField;
    SCServicesTime3: TSmallintField;
    SCServicesBreak3: TSmallintField;
    SCServicesCost3: TCurrencyField;
    SCServicesPoints3: TSmallintField;
    SCServicesCount3: TSmallintField;
    SCServicesText4: TStringField;
    SCServicesTime4: TSmallintField;
    SCServicesBreak4: TSmallintField;
    SCServicesCost4: TCurrencyField;
    SCServicesPoints4: TSmallintField;
    SCServicesCount4: TSmallintField;
    SCServicesText5: TStringField;
    SCServicesTime5: TSmallintField;
    SCServicesBreak5: TSmallintField;
    SCServicesCost5: TCurrencyField;
    SCServicesPoints5: TSmallintField;
    SCServicesCount5: TSmallintField;
    SCServicesText6: TStringField;
    SCServicesTime6: TSmallintField;
    SCServicesCost6: TCurrencyField;
    SCServicesPoints6: TSmallintField;
    SCServicesCount6: TSmallintField;
    SCServicesCountFlag: TSmallintField;
    SCServicesActive: TSmallintField;
    SCServicesChemical: TSmallintField;
    SCServicesMainBlock: TSmallintField;
    SCServicesTaxId: TSmallintField;
    procedure SRC_DatabaseAfterConnect(Sender: TObject);
    procedure SRC_DatabaseBeforeConnect(Sender: TObject);
    procedure SC2TARIDBBeforeConnect(Sender: TIB_Connection);
    procedure SC2TARIDBAfterConnect(Sender: TIB_Connection);
    procedure DataModuleCreate(Sender: TObject);
    procedure FBUnitsUpdateCalcFields(DataSet: TDataSet);
    procedure FBStaffReportCalcFields(DataSet: TDataSet);
    procedure qryComponentUpdateAfterEdit(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    SRCPath : String;
    DSTPath : String;
  end;

var
  DMInterface: TDMInterface;

implementation

{$R *.dfm}

procedure TDMInterface.SRC_DatabaseAfterConnect(Sender: TObject);
begin
  SCServices.Active := True;
end;

procedure TDMInterface.SRC_DatabaseBeforeConnect(Sender: TObject);
var
  DBAliases : TstringList;
  I : Integer;
  AliasFound : Boolean;
  AParams: TStringList;
  Dir: string;
begin
  DBAliases := TStringList.Create;
  AliasFound := False;
  session.NetFileDir := ExtractFileDrive(SCPath) + '\';
  try
    Session.GetAliasNames(DBAliases);
    { fill a list box with alias names for the user to select from }
    for I := 0 to DBAliases.Count - 1 do
      if DBAliases[i] = 'SC2TARI' then
        AliasFound := True;
  finally
  DBAliases.Free;
  end;

  if AliasFound then
    begin
    AParams := TStringList.Create;
      try
      // get the current PATH parameter
      Session.GetAliasParams('SC2TARI',AParams);
      Dir := Copy(AParams.Strings[0],6,255);
      // Update the alias parameters
      AParams.Clear;
      AParams.Add('PATH=' + SCPath);
      Session.ModifyAlias('SC2TARI',AParams);
      Session.SaveConfigFile;
      finally
        AParams.Free;
      end;
    end
  else
    begin
    if not Session.IsAlias('SC2TARI') then
      begin
      session.AddStandardAlias('SC2TARI',SCPath,'Paradox');
      end;
    end;
   Scdatabase.AliasName := 'SC2TARI';
end;

procedure TDMInterface.SC2TARIDBBeforeConnect(Sender: TIB_Connection);
begin
  // standard            GGlobals.Servers.CurrentServer.servername
  SC2TARIDB.Server := GGLobals.Servers.CurrentServer.ServerName;
  SC2TARIDB.Username := 'SYSDBA';
  SC2TARIDB.Password := 'masterkey';
  SC2TARIDB.Protocol := GGlobals.Servers.CurrentServer.realprotocol;
end;

procedure TDMInterface.SC2TARIDBAfterConnect(Sender: TIB_Connection);
begin
//  FBTRans.Active := True;
end;

procedure TDMInterface.DataModuleCreate(Sender: TObject);
begin
  SCDatabase.Connected := False;
  SC2TARIDB.Connected := False;
end;


end.
