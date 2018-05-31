unit DMTariSaaS;

interface

uses
  System.SysUtils, System.Classes, Data.DB, IBODataset, IB_Components, IB_Access, IB_ArrayGrid,
  clMultiDC, clSingleDC, clUploader, clHtmlParser, clHttpRequest, clConnection, vcl.dialogs;
type
  TDMTSaas = class(TDataModule)
    TARI_FB: TIBODatabase;
    MembersTbl: TIBOTable;
    DSMembers: TDataSource;
    MembersTblID: TIntegerField;
    MembersTblFIRSTNAME: TStringField;
    MembersTblLASTNAME: TStringField;
    MembersTblUSERNAME: TStringField;
    MembersTblPASS_WORD: TStringField;
    MembersTblAUTHORITY_LEVEL: TSmallintField;
    MembersTblLAST_BUSINESS_ID: TIntegerField;
    MembersTblCONSULTANT_CODE: TStringField;
    DSMemberBusinesses: TDataSource;
    BusinessesLUTbl: TIBOTable;
    BusinessesLUTblID: TIntegerField;
    BusinessesLUTblBUSINESS_NAME: TStringField;
    BusinessesLUTblCITY: TStringField;
    BusinessesLUTblSAMPLEDATA: TSmallintField;
    BusinessesLUTblCONSOLIDATED: TSmallintField;
    BusinessesLUTblFLAGGED_DELETE: TSmallintField;
    BusinessesLUTblCURRENCY_SYM: TStringField;
    DSBusinesses: TDataSource;
    InvoicesTbl: TIBOTable;
    InvoicesTblID: TIntegerField;
    InvoicesTblBUSINESS_ID: TIntegerField;
    InvoicesTblINV_DATE: TDateField;
    InvoicesTblINV_NO: TStringField;
    InvoicesTblINV_SALE: TBCDField;
    InvoicesTblINV_COGS: TBCDField;
    InvoicesTblINV_UNITS: TBCDField;
    InvoicesTblINV_ITEMS: TBCDField;
    InvoicesTblISQUOTE: TSmallintField;
    InvoicesTblISPAST: TSmallintField;
    DSInvoices: TDataSource;
    YearDataTbl: TIBOTable;
    YearDataTblID: TIntegerField;
    YearDataTblBUSINESS_ID: TIntegerField;
    YearDataTblPS_DATE: TDateField;
    YearDataTblPE_DATE: TDateField;
    YearDataTblISPLAN: TSmallintField;
    YearDataTblSALES: TBCDField;
    YearDataTblGROSSPROFIT: TBCDField;
    YearDataTblTOTAL_EXPENSES: TBCDField;
    YearDataTblPOTENTIAL_UNITS: TBCDField;
    YearDataTblBILLED_UNITS: TBCDField;
    DSYearData: TDataSource;
    clInternetConnection1: TclInternetConnection;
    clHttpRequest1: TclHttpRequest;
    clHtmlParser1: TclHtmlParser;
    clUploader1: TclUploader;
    MembersBusinessesqry: TIBOQuery;
    MembersBusinessesqryBUSINESS_ID: TIntegerField;
    MembersBusinessesqryBUSINESS_NAME: TStringField;
    MembersBusinessesqryCITY: TStringField;
    MembersBusinessesqryCURRENCY_SYM: TStringField;
    Detailed_TargetsQry: TIBOQuery;
    DSDetailedTargets: TDataSource;
    Detailed_TargetsQrySTART_PERIOD: TSmallintField;
    Detailed_TargetsQryBALANCES: TIBOArrayField;
    IB_DSDetailedTargets: TIB_DataSource;
    DetailedTargetIBQry: TIB_Query;
  private
    { Private declarations }
  public
    { Public declarations }
    Function ConnectDB(UserID:integer):Boolean;
    procedure DisconnectDB;
    function DoHttpLogin(UserName, PSWord: String): Boolean;
  end;

var
  DMTSaas: TDMTSaas;
  MemberId : integer;
  MemberFirst, MemberLast : string;

implementation


{$R *.dfm}

function TDMTSaaS.ConnectDb(UserID:Integer):Boolean;
var
  norec : integer;
begin
  if tari_fb.Connected then
    DisconnectDB;
  TARI_FB.Username := 'TARI_RCLIENT';
  Tari_FB.Password := 'taboonnurate';
  Tari_FB.Path := 'tarisaas';
  result := false;
  try
    Tari_fb.Connect;
  finally
    if tari_fb.Connected then
      begin
      Memberstbl.Active := true;
      if (memberstbl.Locate('ID', variant(UserID), [])) then
        begin
        result := true;
        MembersBusinessesqry.ParamByName('MEMBERID').AsInteger := UserID;
        MembersBusinessesqry.Active := true;
 //       BusinessesLUtbl.Active := true;
 //       invoicestbl.Active := true;
 //       DetailedTargetstbl.Active := true;
 //       YearDatatbl.Active := True;
        end;
      end;
  end;
end;

procedure TDMTSaaS.DisconnectDB;
begin
 TARI_FB.Disconnect;
end;

function TDMTSaaS.DoHttpLogin(UserName, PSWord: String): Boolean;
var
  I : Integer;
//  initError : Boolean;
	LErrorMessage : string;
begin
  result := False;
	clHttpRequest1.Clear;
	clHttpRequest1.AddFormField('UserName', Username);
	clHttpRequest1.AddFormField('Password', PSWord);
  clUploader1.UseHTTPRequest := True;
  clUploader1.UserName := 'FBM';
  clUploader1.Password := 'fbmmaster';
  clUploader1.URL := 'https://webapp.tari.com.au/TariBusinessLogin.php';
  try
    clUploader1.Start(false);
  finally
    clUploader1.Stop;
//    clUploader1.URL := 'http://www.fbm.com.au/FBMLicence.php';
//    clUploader1.Start(False);
  end;

  clHtmlparser1.Clear;
  clhtmlparser1.ParseMethod := pmAll;
  clhtmlparser1.Parse(clUploader1.HttpResponse);
  for I := 0 to clHtmlParser1.Tags.Count - 1 do    // Iterate
    begin
    if (clHtmlParser1.tags.Items[i].Name = 'input') and (clHtmlParser1.tags.Items[i].AttributeValue('name') = 'ErrorMessage') then
      LErrorMessage := clHtmlParser1.tags.Items[i].AttributeValue('value');
    if (length(LErrorMessage) > 0) then
      begin
      messagedlg('Login Error:' + #13#10 + LErrorMessage, mtError, [Mbok], 0);
      break;
      end
    else
      begin
      if (clHtmlParser1.tags.Items[i].Name = 'input') and (clHtmlParser1.tags.Items[i].AttributeValue('name') = 'ID') then
        begin
        Result := true;
        MemberID := strtoint(clHtmlParser1.tags.Items[i].AttributeValue('value'));
        end;
      if (clHtmlParser1.tags.Items[i].Name = 'input') and (clHtmlParser1.tags.Items[i].AttributeValue('name') = 'FirstName') then
        MemberFirst := clHtmlParser1.tags.Items[i].AttributeValue('value');
      if (clHtmlParser1.tags.Items[i].Name = 'input') and (clHtmlParser1.tags.Items[i].AttributeValue('name') = 'LastName') then
        MemberLast := clHtmlParser1.tags.Items[i].AttributeValue('value');
      end;
    end;    // for
end;

end.
