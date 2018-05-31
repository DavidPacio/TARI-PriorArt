unit DMTariMWCli;

interface

uses
  System.SysUtils, System.Classes, Data.DB, kbmMWClientDataset, kbmMemTable,
  kbmMWCustomConnectionPool, kbmMWCustomDataset, kbmMWStreamFormat,
  kbmMWBinaryStreamFormat, kbmMWCustomTransport, kbmMWClient,
  kbmMWTCPIPIndyClientTransport, MpX509, TlsInternalServer,
  kbmMWSsTLSTransportPlugin, StreamSecII, MPYarrow, SecUtils, Forms,
  kbmMWSecurity, DCPcrypt2, DCPblockciphers, DCPblowfish, DCPsha1, SecComp, LGlobals;

type
  TDMTariMWClient = class(TDataModule)
    kbmMWTCPIPIndyClientTransport1: TkbmMWTCPIPIndyClientTransport;
    kbmMWClientConnectionPool1: TkbmMWClientConnectionPool;
    kbmMWPooledSession1: TkbmMWPooledSession;
    kbmMWBinaryStreamFormat1: TkbmMWBinaryStreamFormat;
    LoginQuery: TkbmMWClientQuery;
    DSLoginQuery: TDataSource;
    DSMonthlyTargets: TDataSource;
    kbmMWClientStoredProc1: TkbmMWClientStoredProc;
    kbmMWClientStoredProc1BALANCE: TBCDField;
    DSStoredProc: TDataSource;
    MemberBusinessesQuery: TkbmMWClientQuery;
    DSMemberBusinesses: TDataSource;
    BusinessQuery: TkbmMWClientQuery;
    DSBusiness: TDataSource;
    PastDataQuery: TkbmMWClientQuery;
    DSPastData: TDataSource;
    PastInvoicesQuery: TkbmMWClientQuery;
    DSPastInvoices: TDataSource;
    kbmMWSsTLSTransportPlugin1: TkbmMWSsTLSTransportPlugin;
    SsPrivateKeyRingComponent1: TSsPrivateKeyRingComponent;
    SimpleTLSInternalServer1: TSimpleTLSInternalServer;
    kbmMWSimpleClient1: TkbmMWSimpleClient;
    TargetDataQuery: TkbmMWClientQuery;
    DSTargetData: TDataSource;
    CurrentInvoicesQuery: TkbmMWClientQuery;
    DSCurrentInvoices: TDataSource;
    MonthlyTargetsQuery: TkbmMWClientQuery;
    TBConnectQuery: TkbmMWClientQuery;
    DSTBConnect: TDataSource;
    AliasQuery: TkbmMWClientQuery;
    MemberBusinessesQueryWithinLocal: TBooleanField;
    MemberBusinessesQueryBusiness_id: TIntegerField;
    MemberBusinessesQueryBusiness_Name: TStringField;
    procedure DataModuleCreate(Sender: TObject);
//    procedure SimpleTLSInternalServer1Password(Sender: TObject;
//      Password: ISecretKey);
    procedure SsPrivateKeyRingComponent1AdminPassword(Sender: TObject;
      Password: ISecretKey);
    procedure SsPrivateKeyRingComponent1Password(Sender: TObject;
      Password: ISecretKey);
    procedure SimpleTLSInternalServer1Password(Sender: TObject;
      Password: ISecretKey);
    procedure MemberBusinessesQueryCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    certPath, ClientPath : String;
  public
    { Public declarations }
    procedure MakeConnections;
    procedure BreakConnections;
    procedure ResolveBusiness;
  end;

var
  DMTariMWClient: TDMTariMWClient;
  CurrentMemberID, CurrentBusinessID : integer;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TDMTariMWClient.DataModuleCreate(Sender: TObject);
var
  localexecName : string;
  localmachineName : string;
begin
   // start code common to both server and client
{ while not MPYarrow.YarrowHasReseeded do begin
   Sleep(100);
   Forms.Application.ProcessMessages;
 end;
 SimpleTLSInternalServer1.LoadRootCertsFromFile('Tari SaaS CA Root.cer');
 // end code common to both server and client
 // The password you use below must match the PFX password specified when the server.pfx file was generated. Here it is '123456789012'.
 // The parameter that follows is the number of the characters in the password.
 // If you use a variable instead of a literal, the length parameter might be set to -1.
 // The type of the password variable is PWideChar.
   SimpleTLSInternalServer1.ImportFromPFX('Client.pfx',TSecretKey.CreateBMPStr('123456789012',12));
 // These two options should be set to false unless you intend to use client certificate authentication
 SimpleTLSInternalServer1.Options.RequestClientCertificate := False;
 SimpleTLSInternalServer1.Options.RequireClientCertificate := False;
 if pkaRSA in SimpleTLSInternalServer1.PublicKeyAlgorithms then
 begin
   SimpleTLSInternalServer1.Options.SignatureRSA := prPrefer;
   SimpleTLSInternalServer1.Options.KeyAgreementRSA := prAllowed;
   SimpleTLSInternalServer1.Options.KeyAgreementDHE := prPrefer;
}   { If your application supports cross scripting to other servers, i.e. the client might execute scripts it gets from the server
     that instructs it to get something from another server, you should also disable all bulk cipher algorithms except ARC4.}
//   SimpleTLSInternalServer1.TLSSetupServer;
//   SimpleTLSInternalServer1.TLSSetupClient;
// end;
// kbmMWTCPIPIndyClientTransport1.Active := true;
  // Connect a simple client to the server via the given transport.
  {
  if TLS then
    kbmMWTCPIPIndyClientTransport1.Plugin := kbmMWSsTLSTransportPlugin1
  else
    kbmMWTCPIPIndyClientTransport1.Plugin := '';
  }
  localexecName := extractFileName(Application.ExeName);
  localmachineName := GetMachineName;
  {$ifdef DEBUG}
  LocalExecName := 'test';
  {$ENDIF}
  if localexecName = 'Tari.exe' then  // This is because when its corporated into Tari for Business, this will be true ALWAYS
    begin
    if (localmachineName = 'Devwin7') or (localmachineName = 'Devwork1') or (localmachineName = 'KeithWin7') then
      kbmMWTCPIPIndyClientTransport1.Host := 'DEVWIN7'
    else
      kbmMWTCPIPIndyClientTransport1.Host := 'www.Tari.com.au';   // 202.129.79.205
    certPath := 'Tari SaaS CA Root.cer';
    ClientPath := 'client.pfx';
    end
  else
    begin
    kbmMWTCPIPIndyClientTransport1.Host := '192.168.22.4';
    certPath := 'Tari SaaS CA Root.cer';
    ClientPath := 'client.pfx';
    end;
end;

procedure TDMTariMWClient.MakeConnections;
begin
  SimpleTLSInternalServer1.LoadRootCertsFromFile(certPath);
  SimpleTLSInternalServer1.ImportFromPFX(ClientPath,TSecretKey.CreateBMPStr('abc',3));
//    kbmMWTCPIPIndyClientTransport1.enActive := true;
  kbmMWClientConnectionPool1.Active := True;
  kbmMWTCPIPIndyClientTransport1.Active := true;
  kbmMWSimpleClient1.Connect;
end;

procedure TDMTariMWClient.MemberBusinessesQueryCalcFields(DataSet: TDataSet);
var
  varg : variant;
begin
  memberBusinessesQuerywithinLocal.Value := False;
  if aliasquery.Active then
    begin
    varg := MemberBusinessesQuery.FieldByName('Business_ID').AsVariant;
    if (aliasquery.RecordCount > 0) and (aliasquery.Locate('BUSINESS_ID', varg, [])) then
      memberBusinessesQuerywithinLocal.Value := True;
    end;
end;

procedure TDMTariMWClient.BreakConnections;
begin
  kbmMWSimpleClient1.Disconnect;
  kbmMWTCPIPIndyClientTransport1.Active := False;
  kbmMWClientConnectionPool1.Active := False;
  // now make suer the following are inactive.
  LoginQuery.Active := false;
  MemberBusinessesQuery.Active := false;
end;

procedure TDMTariMWCLient.ResolveBusiness;
begin
  PastDataQuery.Resolve();
  PastInvoicesQuery.Resolve();
  TargetDataQuery.Resolve();
  CurrentInvoicesQuery.Resolve();
  MonthlyTargetsQuery.Resolve();
  TBConnectQuery.Resolve();
  BusinessQuery.Resolve();
  BusinessQuery.Active := false;
  PastDataQuery.Active := false;
  PastInvoicesQuery.Active := false;
  TargetDataQuery.Active := false;
  CurrentInvoicesQuery.Active := false;
  MonthlyTargetsQuery.Active := false;
  TBConnectQuery.Active := false;
end;

procedure TDMTariMWClient.SimpleTLSInternalServer1Password(Sender: TObject;
  Password: ISecretKey);
begin
  Password.SetLength(3);
  Password.SetKeyStrAt('abc',0);
end;

procedure TDMTariMWClient.SsPrivateKeyRingComponent1AdminPassword(
  Sender: TObject; Password: ISecretKey);
begin
  // This event occurs when the private key ring needs write access to the pkr
  // file.
  // This password is less important, unless you save the private key ring as a
  // *.pkr file. If you import all of the keys and certificates from the *.pfx
  // you can change this password into anything, as long as it is not empty.
  Password.SetLength(3);
  Password.SetKeyStrAt('abc',0);
end;

{procedure TDMTariMWClient.SimpleTLSInternalServer1Password(Sender: TObject;
  Password: ISecretKey);
begin
  Password.SetKeyStr('Kupunn480705', True);
end;
}

procedure TDMTariMWClient.SsPrivateKeyRingComponent1Password(Sender: TObject;
  Password: ISecretKey);
begin
  // This event occurs when the private key ring needs write access to the pkr
  // file.
  // This password is less important, unless you save the private key ring as a
  // *.pkr file. If you import all of the keys and certificates from the *.pfx
  // you can change this password into anything, as long as it is not empty.
  Password.SetLength(3);
  Password.SetKeyStrAt('abc',0);
end;

end.
