unit LicenceB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, fcButton, fcImgBtn, fcShapeBtn, fcClearPanel,
  fcButtonGroup, ExtCtrls, ACurrencyEdit, inifiles, DataCollector,
  auchtypes, mapi, ocommsfunctions, licenceCalc, AstringFunctions,
  Mask, ToolEdit, comctrls, dateutils, EPGfxCmp, ovcbase, ovcef, ovcpb,
  ovcpf, Balnhint, wwdbedit, Wwdotdot, Wwdbcomb, wwdbdatetimepicker,
  registry, bmpPanel, LGlobals;

Const LOKONINI = 'Lok_onB.ini';


type

  TLicenceFB = class(TForm)
    PrintDialog1: TPrintDialog;
    MagicHints1: TMagicHints;
    bmpPanel1: TbmpPanel;
    Label5: TLabel;
    Label9: TLabel;
    Label18: TLabel;
    Label16: TLabel;
    ScrollBox1: TScrollBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label17: TLabel;
    Serial: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label4: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    ContactNameS: TEdit;
    PhoneNumS: TEdit;
    FaxNumS: TEdit;
    EmailAddressS: TEdit;
    LicenceeNameS: TEdit;
    BusinessFileNameS: TEdit;
    Address1: TEdit;
    Address2: TEdit;
    Suburb: TEdit;
    State: TEdit;
    Postcode: TEdit;
    CountryList: TwwDBComboBox;
    Label28: TLabel;
    Label21: TLabel;
    PrintLicReqBtn: TBitBtn;
    Label8: TLabel;
    Label29: TLabel;
    EPBorder2: TEPBorder;
    Label13: TLabel;
    ExpiryDate: TwwDBDateTimePicker;
    SiteIDS: TEdit;
    Label7: TLabel;
    BitBtn1: TBitBtn;
    EPBorder1: TEPBorder;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    CompanyIDs: TEdit;
    Label34: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure SendEmailBtn1Click(Sender: TObject);
    procedure PrintLicReqBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure LicenceeNameSEnter(Sender: TObject);
    procedure BusinessFileNameSEnter(Sender: TObject);
    procedure SerialNumberAfterExit(Sender: TObject);
    procedure TrialLicenceBtnClick(Sender: TObject);
  private
    { Private declarations }
    procedure GetInput;
    procedure GetContactDetails;
    procedure SaveContactDetails(BaseFolder: String);
    procedure PrepareEmailAttachment(Filename: String);
    function PreparePrintout : TRichEdit;
    function ValidSerialNumber: Boolean;
    function BlankSerialNumber: Boolean;
    function TestTrialDate: Boolean;
    function GetTrialExpiry: TDateTime;
    procedure SetTrialExpiryDate(ExDate : TDateTime);
    function ConvertDate(Olddate : String): TDateTime;
    function GetSiteNumber(BaseFolder : String): DWord;
    procedure SaveLicence(BaseFolder: String; LicRec : TLicenceRecType);
  public
    { Public declarations }
    function CheckLicenceDetails: TLicCheck;
  end;

const
  BaseChars : array[0..32] of char = ('0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H','J','K','L','M','N','P','Q','R','T','U','V','W','X','Y','Z');
  TRIALKEY = 'Password';

var
  LicenceFB: TLicenceFB;
  LicenceRec : TLicenceRecType;
  NBLicenceRec : TLicenceRecType;
  SiteNumber : DWord;
  NoOfUsers : Integer;
  BusinessLicName : String;
  BusinessLicFile : String;
  LicenceType : string[5];



implementation

{$R *.DFM}

function TLicenceFB.CheckLicenceDetails: TLicCheck;
var
  DataIni : TIniFile;
begin
  result := LCLicOk;
// if ini file does not exist, return False
  BusinessLicName := '';
  BusinessLicFile := '';
  LicenceType := 'S';
  NoOfUsers := 0;
  if fileexists(GGlobals.Licdir + LOKONINI) then
  begin
    DataIni := TiniFile.create(GGlobals.Licdir + LOKONINI);
    LicenceRec.BusinessName := DataIni.ReadString('Licencee Details', ' BusinessName', '');
    LicenceRec.ContactName := Dataini.ReadString('Licencee Details', 'Contact','');
    LicenceRec.address1 := Dataini.ReadString('Licencee Details', 'Address1','');
    LicenceRec.Address2:= Dataini.ReadString('Licencee Details', 'Address2','');
    LicenceRec.Suburb := Dataini.ReadString('Licencee Details', 'Suburb','');
    LicenceRec.State := Dataini.ReadString('Licencee Details', 'State','');
    LicenceRec.Postcode := Dataini.ReadString('Licencee Details', 'Postcode','');
    LicenceRec.Country := Dataini.ReadString('Licencee Details', 'Country','');
    LicenceRec.PhoneNumber := Dataini.ReadString('Licencee Details', 'Phone','');
    LicenceRec.FaxNumber := Dataini.ReadString('Licencee Details', 'Fax','');
    LicenceRec.EmailAddress := Dataini.ReadString('Licencee Details', 'Email','');
    LicenceRec.SerialNumber := DataIni.ReadString('Licence', 'Serial Number', '');
    LicenceRec.BusinessID := DataIni.ReadInteger('Licence','BusinessID', 0);
    LicenceRec.SiteNumber := 0;
    LicenceRec.LicenceType := DataIni.Readstring('Licence', 'Licence Type', 'S');
    LicenceRec.LicenceeName := DataIni.ReadString('Licence', 'Licencee Name', '');
    LicenceRec.LicenceNumber := DataIni.ReadString('Licence', 'Licence Number', '');
    LicenceRec.BusinessID := DataIni.ReadInteger('Licence','BusinessID', 0);
    LicenceRec.ExpiryDate := ConvertDate(DataIni.Readstring('Licence', 'Expiry Date', ''));
    LicenceRec.NumberofUsers := 1;
    LicenceRec.LicenceType := 'S';
    LicenceType := LicenceRec.LicenceType;
    LicenceRec.BusinessName := DataIni.ReadString('Licence', 'Business Name', '');
    BusinessLicName := LicenceRec.BusinessName;
    LicenceRec.BusinessFileName := DataIni.ReadString('Licence', 'Business File Name', '');
    BusinessLicFile := LicenceRec.BusinessFileName + '.FDB';
    Dataini.Free;

    SiteNumber := getSiteNumber(GGlobals.Licdir);

    // if calculation fails to match licence number, return false
    if length(LicenceRec.SerialNumber) < 1 then Result := LCNoLic
    else
    if (LicenceRec.ExpiryDate = 0) or ((LicenceRec.ExpiryDate > 0) and (CompareDate(LicenceRec.ExpiryDate, now) < 0)) then
      Result := LCExpired
    else
    if LicenceRec.LicenceNumber <> checkCalc(SiteNumber, LicenceRec) then
      Result := LCInvalidLic;
  end
  else Result := LCNoLic;
  if (Result = LCLicOK) and (CompareDate(LicenceRec.ExpiryDate, now) >= 0) and (CompareDate(incDay(now, 30 ), LicenceRec.ExpiryDate) > 0) then
    begin
    GGlobals.daystoRun := DaysBetween(IncDay(Licencerec.ExpiryDate, 1), now);
    Result := LCGrace;
  end;
end;

function isSTDTime(northern : Boolean; timez : TTimeZoneInformation; ldate : TDateTime): Boolean;
var
  StdDate, DSDate : TDateTime;
begin
  STDDate := SystemTimetoDateTime(timez.StandardDate);
  DSDate := SystemTimetoDateTime(timez.DayLightDate);
  result := True; // set default
  if northern then  // Northern Hemisphere
    begin
    if ((lDate < STDDate) and (lDate > DSDate)) then
       result := False;
  end;
  if Not Northern then
    begin
    if ((lDate < STDDate) or (lDate > DSDate)) then
       result := False;
  end;
end;

procedure fixdate(var timez: SystemTime; Fdate: _FileTime);
var
  sysdate : SYSTEMTIME;
  tmpdate : TDateTime;
begin
  filetimetosystemtime(fDate, Sysdate);
  timez.wYear := sysdate.wYear;
  if timez.wDay < 5 then
  begin
    tmpdate := EncodeDate(timez.wyear, timez.wMonth, word(1));
    while (DayOfWeek(tmpdate)- 1) <> timez.wDayOfWeek do
      tmpdate := tmpdate + 1;
    Tmpdate := TmpDate + (7 * (timez.wDay - 1));
  end
  else
  begin
    tmpdate := EncodeDate(timez.wyear, timez.wMonth, word(MonthDays[IsLeapYear(timez.wyear),timez.wMonth]));
    while (DayOfWeek(tmpdate)- 1) <> timez.wDayOfWeek do
      tmpdate := tmpdate - 1;
  end;
  decodedate(tmpdate,timez.wyear,timez.wmonth,timez.wday);
end;

{ -- getRootDir - Returns the root directory of the passed directory           }
{ ---------------------------------------------------------------------------- }
function getRootDir(src : string) : string;
var
  c, c2 : integer;
begin
  if StrLComp(PChar(src), '\\', 2) = 0 then
  begin
    c := Pos('\', Copy(src, 3, length(src)));
    if c = 0 then
      raise Exception.Create('Unrecognised file name: ' + src);
    c2 := Pos('\', Copy(src, 3+c, length(src)));
    if c2 = 0 then
      result := src + '\'
    else
      result := Copy(src, 1, c+c2+2);
  end
  else
  if src[1] = '\' then
  begin
    result := '\';
  end
  else if src[2] = ':' then
  begin
    result := src[1] + src[2] + '\';
  end
  else
    raise Exception.Create('Unrecognised file name: ' + src);
end;

function getfilesystemname(filepath : string):string;
var
  volSerialNo : Cardinal;
  maxCompLen, fsFlags : DWORD;
  rootdir : string;
  fsname : array[0..255] of char;
begin
  rootDir := getRootDir(filepath);
  GetVolumeInformation(PChar(rootDir), nil, 0, @volSerialNo, maxCompLen, fsFlags, fsname, 255);
  Result := strpas(fsname);
end;


function TLicenceFB.GetSiteNumber(BaseFolder: string): DWord;
var
  FileNameC : array [0..200] of char;
  Fname, fsName : String;
  FileHandle : THandle;
  CreationTime, LastAccessTime, WriteTime : TFileTime;
  CrDate, TodayDate, StdDate, DSDate : TDateTime;
  tmpST : SYSTEMTIME;
  tzone : TTimeZoneInformation;
  adjust : longint;
  NorthernHemi, CrisStd, TodayisSTD : Boolean;
  AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Word;
begin
  Fname := Basefolder + '.Serial';
  strPcopy(FileNameC, Fname);
  if Not FileExists(Fname) then
    FileHandle := createfile(FileNameC, DWord(GENERIC_WRITE),
      DWord(FILE_SHARE_WRITE), nil, DWord(CREATE_NEW),DWord(FILE_ATTRIBUTE_HIDDEN), 0)
  else
    FileHandle := createfile(FileNameC, DWord(GENERIC_READ),
      DWord(FILE_SHARE_READ), nil, DWord(OPEN_EXISTING),DWord(FILE_ATTRIBUTE_HIDDEN), 0);

  if FileHandle = INVALID_HANDLE_VALUE then
  begin
    GetLastError;
    Result := 0;
  end
  else
  begin
    if GetFileTime(hfile(FileHandle), @CreationTime, @LastAccessTime, @WriteTime) then
    begin
      fsname := getfilesystemname(fname);
      if CreationTime.dwLowDateTime <> 0 then CreationTime := WriteTime;
      if (fsname = 'FAT') or (fsname = 'FAT32') then
      begin
        getTimeZoneInformation(tZone);
        if tzone.StandardDate.wMonth <> 0 then
        begin
          if tzone.standarddate.wYear = 0 then fixdate(tzone.Standarddate, CreationTime);
          if tzone.Daylightdate.wYear = 0 then fixdate(tzone.DaylightDate, CreationTime);
          todayDate := now();
          fileTimetoSystemtime(CreationTime, tmpST);
          crDate := SystemTimeToDateTime(tmpST);
          STDDate := SystemTimetoDateTime(tzone.StandardDate);
          DSDate := SystemTimetoDateTime(tzone.DayLightDate);
          if (STDDate < DSDate) then  // Southern Hemisphere
            NorthernHemi := False
          else
            NorthernHemi := True;
          crisSTD := isStdTime(NorthernHemi, tzone, crdate);
          todayisSTD := isSTDTime(NorthernHemi, tzone, todayDate);
          if crisSTD <> todayisSTD then
          begin
            if crisSTD then
              adjust := -tzone.DaylightBias
            else
              adjust := tzone.DaylightBias;
            int64(CreationTime) := int64(CreationTime) + (int64(600000000) * (adjust));
          end;
        end;
      end;
      fileTimetoSystemtime(CreationTime, tmpST);
      crDate := SystemTimeToDateTime(tmpST);
      DecodeDateTime(crdate, AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond);
      ASecond := 0;
      AMillisecond := 0;
      CRDate := EncodeDateTime(AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond);
      DateTimeToSystemTime(CrDate, tmpST);
      SystemTimeToFileTime(tmpSt, CreationTime);
      if CreationTime.dwLowDateTime <> 0 then
        Result := CreationTime.dwHighDateTime Mod 999999 + CreationTime.dwLowDateTime mod 1000000
      else
        Result := WriteTime.dwHighDateTime Mod 999999 + WriteTime.dwLowDateTime mod 1000000;
    end
    else
      Result := 0;
    CloseHandle(FileHandle);
  end;
//  ONLY WORKS FOR NT, ME and Later versions
//  if GetFileAttributesEx(FileNameC, GetFileExInfoStandard, @FileInfo) then
//    Result := FileInfo.ftCreationTime.dwHighDateTime Mod 999999 + FileInfo.ftCreationTime.dwLowDateTime mod 1000000
//  else
//    result := 0;
  if Result = 0 then Result := 654321;   // A default Value
end;

// Create or open the common file.
// Starting at offset attempt a lock until user count is greater than maxusers
// Return -1 is failure else return the slot used
{function SetUserCount(Maxusers : Integer): integer;
var
  Fi`½ìq‡Kj™a2tÆRYá"]ZÛQàÉõüxıdjlì¦ë°_tìéÂ&¸ù‰éÌµ=GÃÿ¨õ,ÏºQÚ`Jä6İYØXPà€â>uÉ•;‰‚Ö¦ñìğ…h	Ûî–«ù2üÒÇF*ÑØ@›İÀà«k"ªš]Y9ı©'Dl…%F±ãNª2ğÚ™¡à±«Ğ¯“'ëgv9˜Raö"7Çhö¦tÊwé–Vp…ñÛ¤ï¬½ûL)‰ŒÇÿ¼ğMÓhšãgvÍ¦¡˜oğ#Øu~–L#ã©
µõ­ó²LA ²wˆ»ğÅO—>ìÃíÃÔR±8«¨Èi¬·SÄˆÛËÖc$ÌVÚrÊºKÇokôÀ	·=‘+«7ìÇÌ„ŠnjzÅTÓ‚íÇäÅ˜,NƒrËB<1bÆ™àL¯!OÉçÎß@Ş›ï8ˆ:º¾ÍôQßRëşÓ;’½Şú;ı.Â„«ğÆ¡ŒèöÁõ1®Çì@ÆOziöÙĞ•tÉÏ–ùw„e1º–qÚD1™ÀÍ‹tÏ[ºöy+g,‚¹÷èÓäß·„qg±ú•Ë#¬¯-©ó·ph4t(ÇwDCz€g.¡Â<ãæŞ
õù=Çé{Fşˆ¦ÓÈÎR”ê}êõ9şK+ıŸòêõÁ†/¹ÂX]g.‰ä~>âÇçÖçã	”üOÿ—Ö:^pd¸&¾‰‡NÓíÅYŠŞj™øğ+š‡›~0ª»È(+À†ÑÂ¼„Ôc²¿²ÙåõğœãI%´QÆ–ÃNbï¾=«»^g‘‹‰¢ûå*Õ4ò+wØ‰şet x­«ŠapêâÛ-Q4Ô]¹)ÃÀÈ°wéØ+ÎB3ĞxÔù&*yñš¦¢ŠæÁÿ?“ÂaàÂ@&_Ù¨^ˆ{J°Ü€.¦o²€şİŞ"ßiÀ=ŞnˆİO=Êô…Á÷Õô6!EÊ£Š	6)©ó—ÎTİ7rÈLÙßßC(L$ÁÖïâÌ²õy?8İ"ˆ0%±?_H^-Ò·äÆî4>4Ñ8ÀÎæÊgÆz(q^ğÎÆÎ†»¬œ3Í]-@±š†9µ—¹,WÛ/|ôj£]Œ—	v÷ÚˆÚ€oB	ï‹İÙı¯°W´—
¤€OÙ‹Ë|’†æ<#˜îÍ„¨ 	ñãÕzË€`GFÑ8£¢òoš}rÁ§Ú´„|(–ŠjØOÃ×ÀH›.c™µPû£‰±õûŠ¿I*´y,Î‹¡ÓÊv:ì’<ºXÄJA§wx²8®ËÌ@¦%)Bg[D‹PÆ¢]8åËÔ¯X¦~™cÁ90¶ÎSô‘EZ{ìaüş¢
f´›B†\ïË×d7¸¡“%.hq8¾—Ü®~ÔbGäÙÜÃ GÿÆĞç cR"Ré“¦ŞëkWÃ.Wq*•~ÿ âeS	I dÄtÊ,]'!!(1W>ZQ|s¹¦ÃO‹ø;ë³.´‚F5«•d/ŠSPİÕ²§Â‡˜§ ‹ŒõùóĞñm¦ĞÜŞ²FŸÙFğÌg^>KôîâŠ?>*+f©Ì¬„ºÆ«?UmÔ’î²=XŒ²m’æßÿ8p‘Bç¼»Ş¾ºIøÏ‰©a s pÖ^6Œ`ØıvÆQìšz
 ?Æ ‹Ş,]”Õ4EÍà5¤š}
Q L:ü^­ì>ÿEí†º‡ºÅ»Ì7{cĞÏ¯4Œµ†UÒ²1+¨CüXe9Xª6éÏ•Ÿ	ÆK~5*ŒR†LàR×€ ,K/XUÈøâ8ú{8"#6¹M#ÇA×eíñÇ:ÿØ…ÂcW%áÅ[|°)7‰€"Ô–0:#øã)„æå'.%ËEm ûÈ _8¸»Ÿ¾skŞ -yãüîò¥aêAº¡éøã[8hŸ(7‚N™í™şiE	¨ƒ@×C‘ú´’ÎëÆ±S÷¿¹¸GÒƒÆæ›ÍLÉ(ßx•#)n‚¡-HÜq“-vÜœı=ü†uŞ[Æ‘§¡jpuuu:6>0!uoh…©yÌ“Şnªë&·"»Lşğ‰¬Õ·fÒ¶ëÃIÉt5¢Õ‰˜üôÙÒoµñDÏcj!\‹ÈØ-ó?Şw-é·áÖï@ÕsìDÉ©ÅN!ÒÍ½¦Mßå2ÿ]ii‘Æs4
•b©Áeâ›50înÒ(¢Ç‰BÆşw(àê€–0±›)s8õÿçÏL§Î‰|ì¬e¹ˆ¿Vx¶ƒ~QLë¿®—H‰H#o¸·:+à:ş»g¯¬Œg5Mò-åÍÜ™UÄˆ†®ÂŠaæ&9lí6HÍš\™^·í2ÓF¦ø¾BÚ
ŠŠ‹‚ĞİF/úÀ˜şdXß™kM„4iòŒã+`™çFÖTK^¹µ´Â`‘6ñQü8äŞ‡ƒÓ¦aÓ\š†£ÈNRræŒïÑ_€•¬îƒ4¿ø-á±®ÎË¸á‰ê8ÙÖÍ
K—l;ÖU°h[clWü2²ÊŸçş¡¾¹ªÍÀ‚ù¨g¤B·Œºµ‚‹øÂ˜Ìä¬_×ÑYÀ‘
œÁÍ¬¿­AÕ[»€gëÌÒ6ÇT¼©u›ºO\86„¨V—IÃ}™*{|ıŒJÅ—W®ÜBAûÄÈ],Ú¶ƒæí!å!ü‹a@?X‡ÜpÏˆ(ƒ3NB1wÆÑçÈ·¼$ÔŞö&ıÜ(¨Yÿ ÔÌŠÄÄƒ÷¿‚/ë¦ü­´ß#U‰àÅ;-´íM”ÃÅ®ü½á¡ift¡òQ˜¬Xæ0ıƒÀ½*O7¾"1Uní®¸]ŸòĞÀ•üåÕyÅÓ$@•Ÿ1~qÙÔìõwzÖÌ6ûèæ˜?KÓ¡¹*ºŞ“}˜ñ­rª=¢¥d¦JK#ö…­œÈ«ĞoU,È´X¾Dº	¾×|è²3?Ô|o	›É›å†U¾¨ûĞ¥ß¼XAE‹p:ÓÀı¼/ªèb«	Î‘¦ª¶Ê&Ğ°µ#°0XèáÛ¹§?Æ%sfŸÀL	#]Z —®5ş  ]ßè—ÒØC_ŸúÇƒ%ã©HÖîôÊàbÙ ã!…Ÿs%÷’´÷òŞYµÕ1}ÎıÆÉÒ¢ãÓ«~8".KAÓêÿ÷Jğ¼Ã‡	|yË<¿9‡sEƒÆw=DKd9¾¯°wsÿ/vñõÈÎ(À×¥º!uÉ__é„âö QÕZ‡Œ6º	¶Dôô°j3Z¹øØÎƒ¸'gp$›E‰ÖhÓt	,“ÆÅõÙšˆšHa<”ÄÃ/ÌÆòæ”´aQxç\¦ûÏå©Ãzö_Ø™£öA©Ã9Á+3î×¦N4Öc¥¹¹§°ñ	3-Á_â&ÏJRÿq‰­§ÙEâF)#R‰A^GsÜúQŞYÇÙÊ<`Î­FöÙzïå›	ÃÓÇG)v¯ìn´,*gÂÇ-ƒ¥3¯;. ö„Je‘ÏV¸Ÿ9èÄâ«:Ù÷ ÚAf„¼Cì€tZÜR#¾ú.¼][g3á–uN
î*{ãµ}ñ°fw9ú¥×ÙOSÌ{±ÅÈ¨\›¢%MŞcñ§ŠçÊÖø.$k/:ĞšPuĞµ°“Æh4¤yÂŞóçÛzQ+Šş)hQ#U´‚0i{™×ƒÁâÆõ•ß„˜’Ûio¼‡Í n²fÚz“ÉŞé:mÒŒÖüJÛ’–¨aõN,mB¶Ì5Ç@÷2Ù&/H ƒšÑ” p½ùgöW°ÛÀZupry²9q•ï×ØLãöú–ˆ*ùY'gqT
©kä%°
äYµÜâô7•˜êí•º¨ZLdÀíX“Ÿ‰ò½™¤Ü…LXüJ¨“¤ü„#ØŞÅİ™Úë¾ÀÙÜ®o¶7kÜsìÙWè^ëvj¬&%4ı”¦j•…ÂíŒ¸¾èªk—±‚Já±°†WoójH!ŒsS1BB÷f±äoU7;µü=jL
ÏÄÈÂÃF	|¯?UÆëùï¯×ß	µù°~úĞ A§§G}O5Â+ğÌôÅÍDï€¹M-³£PÏóº¿¿?ÍáúSVâ%½GiRICËëNÃ0&õ±Š‰]Â2J	k ¡ö‰ç§ÎÙ´Ä™ª­iClƒïŠbúßkÈ7Ù.Şïdjõibš•áØìÁ¹‰ªFå ã¾6ŒıpŒºâBm”?CŠ¶8#è˜m\×ÚÎ„­³ô¯âwSüRœS…dYƒÔs«A›æÅ¥=û™Á@*@•ÜJòÈßWÉ@.Vİt‹ÏJÆC[fGï‘Ï\Ê™òâ>–Á©hÓ–ş¸ÈúÏBÛÚ˜YìÕÔ®j‘SˆçrÀÎxg4
w=ú®Gş‹Ò˜ÖŠ”uûg’„ébD¸ûeø<¦®ùå_K(ˆ¬æ¤ö¯¿´î]´;Ó)ÃŞÎê½ŞNÎ´ŸÏºîyGñî|/Û»ˆ	¥8b:FÖ’ÅÙèNÑZ'[ÚCèİ¼Ë÷øÿzëØ¾Œ€< ö|a‚ 4:y`HTk¾XxÓÜî„Y{îYûAKUu>,Š«=L;ä%hâ”÷‰v0G€0ÿ­¦óæ—DÉ)# ¢¾Ç/¤Z@Ì>h”İJ'cˆÄÛÌÓdHTµÑÕ§ú¤ó—kÈŸÕ¨ŠØ,œŒÍR˜ğmÎeŞzäæ5LB=`gÉIoFuˆrÈû/¥FØÃÊ|ÅÒ²éŒXŠ Š‹Ä'0;600480Ø‰‹qñÿ§—uÔÑ±éŞDø¿àÎ•—o†9ÀÆoÒÜ3ÍÂsâ`’.qfI×ºñÙÙíÌô¥Ì³_É«mYU®D –1‚ñßRq»ÒKLû5ÃO¸U”Ø5Îş?õëåé5Èà€Š ØàŞ0ß;¶»…óƒ	}WWèÔkÖ¿¥ËË{ŸŸXDg{õ!ú«¬¢L{×+Dcìz?‰“08ch¶^Õ·Ü0mßÚiÕ*äš{³U‰¦ÊHğ^|õOÄ+=×µü6¯sîğù]ï‰ˆîTW#f¤•Á§ëÇa/~˜Cå¯Úßİ¾Æl¿›B¾äƒ·zŠŞÁmÜZŒñÎãÑ2>ü±J|Ü´÷DƒÔÊÅ“!O*B’¿Â’ú“­ÚÅ´&mpÂh»êBŞDZ­Cil_™Œiq»-ÂÃ~Bn
fÒô©2…ü)#\	om·¸]( .´½Â¡Æ@wÙşÏÈğµè½Ø6—ÿÙÎØÙİk#NßÏ‹‘Í®ìUø÷Á<KŠgÇ:õ1å=`åhkì¨åuôKíKÉ‹àIÄp_.•K:=&½œ%	AR”4óÙXy‚X`«ªòmÎ
œªÈiõ*dûıo¹_[x#/*üÛçÈ’“ŞïáÉÃ:¿KK;`Ö6QœçhU'÷ĞƒHÎëŒ¿è²Cz¾Ãïxİ{n%GHÈF?•¡bE¯¾Ûİ2rKërŠy¶ªfØ²;°)Án¶ı[Ü^3»xcâ‰PŒ<G4…•ŞäÊÅıi“‘ªüôê¨Í«Ê_É¦§üÄ][2¿çÍ4«XeÊˆ©bÓ«™äÀÌ}&5™¬1ŠäA`e‡9ó‹ıL@9Ä×ù¬R&#Õó…H¼ÉÂ×l’÷Ù;¶¬¯-k
ÇéYÅ½½ò'-¶2Õ•ièâ?Î|&±d ÉÉ¾ùsüøªš…|v]~¾hn?´XÊĞ RİéDS›ı8ûòkÆ•ÿÓ-zƒ Ì/øvŠƒğtí“vWC˜À¼V-n¦¡şñö*Ä•igÓïY€7/'±şÄe¾»„•¥Ok•k­ªÙÓ¨şİ…5—úÿ.IŒñOËBPßÄŞÙĞ¤Ïå±SE…Ôùzk¦/¢?û÷!Â_Mœ»ñEHÌ~2Mc¼³YÛ*…ÑŞõ·T´‘úåÍôE’xy‹$JKZ¬òÜ9.@÷ST¼1È.Y§(²Ûùï$¼Ô‹2Ï¡=9EÊ—€€÷š.¹I3¾©kAYÒu+C\+gTøPa¦»Fş~SÍyì©ÚİÈ«{£ÀAT‡"Xn`¡ˆü¤ÜpÚâUm ¼‰P4Ü»Àoy
Ôh˜¯ÚMâ®îáÿÜéª•¯ùBÕ8MÈq	Bâ('÷kñ‘Ï¼[ÅŞğ´šEé@ú¦‘K'´ÜI–épl?ioïú”]L"â}Ûİ±Ô@4²L†€àEı—vN^&Nõ‚Ií~yNmé¦†¼„¸'	€Ş	ûÇXëëxÕó´Ş—·u<HlbõEv5„ñLœY©Úı,­½ôÚlÓ ¥Y«ôT~BGÒ–6ë¿[Ì ŠŠçÇ‹Å8>‘–¸t¸ì%ù5q0J¯Ê¾¡ÛÕå%pĞTÁç}|
Î>&ÎÅà"ÚX^8­Û›ı¸åŞ¹nÎË˜´½Eİ	dûÈÓÌ–„‰äQ-ÚZTğ|Ö¨¶˜tÄ•¼¿ùânì’Ñ¥ş{o2¸!mqK”âÈØœ’ÏßÛöšªÈ€ 	õ"á‹:bÎÆ(€L¯J‰ĞPâˆä,Ì1÷Ñ•_«%ğ%Ÿ`ª"É@¦ğâÍVXú—èƒ,zÊ•¾3PøVjhS5ˆ÷³%.ê„ÅR·?ƒ¯İBe§ˆ/t¼ˆ¶Á&4ÙCÄö§²rz‹Wù»Ó¶Ó(½Åãô®û‰®®ğñıÔm¥…"/cØ7—“ÉoC)PÓ!Ğ¨!Ëñ‰hk~Ÿ¼#ù
Ú'}kğ¢€Ú ÓXçaG%reö[cìİã òÿëÌAÑTQNñÌ*Òë&9ià‘øs!ŒâòÄÉÎıı÷ƒç?x²±×5IÑˆCa¨"ÅæÀ=?¯8Á£}/bÑ©É­ä *wÜ°*aõğL"Vª°íˆA yÀÖ’ò½I‹>‰ú½f;½¬œØgyoÀÚ±9qsÎyP^‹Ü1hsË#-"A5j!!J–»;pQKu~ı¡‘Åµ«M/0z>HÚ'Éò¨	,„•µ­¦…æ«ÀdQi©+ïÎß×wÈÿ·|g½Ô6=»!*¼ó¸Œßã»€Ã¨Ş5…±‰fÎ˜1ß½Ì–-æåªŠô>qæ>Îs÷f?dÓw4½+Sşw`YS?:ä	"=èÃÚrjU¹ÖÌ”¥'p3°S³á@~eb0ƒúÈLp­$ánÑuÇXó¨ ¦n7}¨+÷¾; c Íİ‡Ğ‹{îÃÇÍhtãåL§/_ƒ&ş¶«Ñ¡Ï6'p+ÎÎÙÉëJØyaî}e>Àüİ÷òzƒÑ9¸-tÇƒ~H?ü+˜ÿŞ4´u¦†ï¤bJÁåÜX¢¢}ÜYY‰ÍŠ³D÷E._.(vAÄ³û{š;G ªmmûDW'¥©|DûºÆíÜƒ"G.ØÙóX¿ÉÏÅ)È5u0!4<9&ryurĞ¡är|!é =66^.ª×¦Í}ÄÑL35õÓ VŠ®=
ué¥\Î)ö˜\¤†ÖLÂÉ!1‰ŞZ6
ñˆT\V#tÜ®ôrpÉšMVsÒå6C´¢ŞQ;å0Ïƒ:0Ğ Q—<uùÂÛ”…°äáÁÆài:ÓNÈÎKaÏŠïÈ”ÂzØjD~Y°Ÿ6bv2*QNhŒ{…Yâ‰¢olºP×•™`Ø:q,ËÊ£/? FÓ±†ÓMy¶ò}<ÿà±¸>$¦ˆB‡ÆZz\Øè$ó‡¸ KQÉLäqÀT9y'9”çrÂ¢¹º@*_[gÙ­8 Ê?i!Ö|¾fl9Ã‚^¯õívÕ,+ùxYfÃ™‚,à¼lÖ\Çê®…`$·=õómT0û‰a‹ßEÕ…jĞ¹ QğƒªpÅÍÍŠã„“³ü ‚×ÈÕöSŠ'Ÿr_‰Š©óöˆ`—ú³~‡ú!‡!‘‚oœô÷J¾ıà·ğ‚‚.«[µ˜ÿùæ®ËÄšÖ†QG‡M¶¯wà¨ŞRÛŠ¼öTåÖÄbMËk‰˜ƒNÆdêŸÏŠïÇ„èãòÕ½¤é,ğ@â+yÏÉ¯òÜ7ò³öÿ²Ê¯w@Áè^üË–´
Ã#Ç‰ƒÆÇWZ‹÷?¶¨ÙE şn;6MJÔ'y­¨“ÓÊk§
cûÆìDos
É(öÀ˜8û¡)kM†ïõM´RJrØÃZ/íH¥KQ$Z^D:ŞAöïˆü¸ÊSG­ÀÂîÂÎfŸèÓDúVî¢.…J^Ë.ÔÿCÜ‰†ËdÌâû…[Ã£\FY•†ŞH z­œW§,68[¾ÂÀ%¬ †(jâ¢µN…ù~¡ˆ¼®ÇÁ{ÿ§÷ŸŒšË$·wà×º²IŒ¸’qZjÃ©Œlª§º(ÈÏÌÊöÆàùƒ$3Á¬ÉQ„c³IòbG<ÅÁO`ç˜w„z‹æUV£ı›¼)€ûì¥òÔíÛ„&ÏnëIAñéÜßTBæ;bvØMkí®`]´éJ¸P-~,é_ÂÁ3cîa"Ûª‘§.GaÃ”ôÄXMğ"|(·üæ0céøqi'ıp³¹!7°›Í–‰%#w1@½TÒmÖ“ãæŞğ'Ôî]<ÇÈ˜õ_¿µÍC‚•Õe’#x4¦‚¨€^ËãÅÉ¶ç]dWé˜Va$õÊß‹Šc-O…‹îÏÊXÆÕí‘MŒãáFİÇSÜbë¤b=‡Å’âÕ‘İÜ5£8ÅËØãï™ó
„/	¦Ë·”ì¿UŞ°ä““¦N€1‰ÆokGZlD¼ElìƒW0Ùû]¦ÏR–ÔcbzäF¥‹+?;ã°Õi¹ÿ!'±Cßçë‚ÆâtS!`¨Œ×†-ˆPŸ×êÿëÜ“Í¯»ºÈU:ÌÁ‡úáÿ{]ëÎÏÓüK‘€ñ÷^\Ø¹¨ØùØ¾™ÒöWÿ½EÄgµàDáºÏI¡?¢e¦I™Á¶"ß[XzncHò\®4jU®°Õ°[õ?ßNöÛÉ)“É»jœ’rûVÈÈ~•Ğ’N‡üƒdßp%¨Jš¶Êîé â>ÕÀù®ûÊ`d‘ÍM¹¡¬‹$æ¾dÌ•WÍùä–yÖ!ü‡+†ñĞ®è
uÏ$Œ™è$u?ç
É¯hĞ6Á˜Š,à¦Á“;sy*R†«ArhØlµ8ğÆÂã5ö×
?~¨{ĞÑcã„úÄÕõiòÄß_—óN:Ñìö¿ô‚XáT‹™;
•áv÷BuLIå´QÉánr-¶†qUI-*V<Ô¬Vç§osæQşóèÍ[ ı_)\×ÛÁQoàh6gS0¸_oÏÒµ·ËŠÔŞ1´x¥1ÏC}> I®µ€ÙœÓ%Wo
5pg’ş¨ùí´JFê î„JÍÓ³¸ND3l«6\”F›ÎÙf€0ã<KW…O'Ò6Âøj¶Iµ˜öúÈñŞQÇè$rŸ²…p½IZ"İ€vø¬ÊCŸO$ÇT‚œ'ä …B«Y”# 1ÜôKMƒIØ4Ò-Ü/)š•JëJ(:—éCÔÚ 6Ì³q4~u²ú%ª›9ö¢3h3A~È¼{bÀt•jiÅ»•›ÄÃ…ğê¡ÆhÃï’	¢JÇéV°Ü¯ÏC2~É^›ù¥Œ‡øºshİZ¨·ÚoşSÛÆÅÛÒPèÎHÁ^ÍöÉÊŠ=iŸ|“¤ôœÕ™›NˆŠÓ'÷oDËºæhiÜ„-WNQ”àÉ#lÏ+¤§Á†dÂÁ&ûS´‡İÄı"Cïu$ÎŒùVåÙøê¾øß‰ÔGŒ&Äá(Ïñ¯Ï§^XÑl­¹x•oºó}#ªV`ìœ÷‹¢bNe—]¾EVq´‹COåÊãwøX3'm™ß2ƒÁ“¯š‹ÅúˆÍ.å~96¦Ìw-8³€ÎËK÷q×m«¨ÍIçIù?	éÂß+üÿ<{›Uá	´LÜÊô‚İZ’c¹HÔ‚ãKØğŒÀ>ŒÒB8RóÕı6è£Á– `eÜµøë/z’ŠçÍó¦Ö™·@ü@.)²æ;Î¡óÏm)RøÚÎáNÇØF4+æûv˜İ;FÂ£@İ|¯èrä)9±)—£Tñ&g³0Áyrõ5këxnĞ¡~ˆMŞ~ Æ„gu«#(*9nnw7…&n?6ìİ¨¢ŠŠï+Ù1;<{ÌÕ´Å4èÓ­]í©ƒO'a“~öùyxİÈ£\½ßÒø‚…Äàü!.– ÿù'4¢¹µ‰l7ßdW5ãïí5ú¶®»8õñtµàŠf“„ØåÊÔé=ûóšäÙI¸¦¸ÎPq5¶FpÕeS—ùj°'Q‹×©FõÎyô‹ÖqÃÏ9ÓjÄfİNğ¨˜íCÍZV>2|{·è Ü(9Š=nsYğ#3p-YÊÍ3ád0jH™UVr‘7ÈÏÙ‚ì²Ó<»½¦q†ùü½ß„ÍÕ…ÚD·"”³wzXŒHŸïíP×€ª˜ñŒ>–IÄĞ!öÎvÂV˜	½ oõØ—«üBğš‚‘Kà/QÿÒo‡Â#°ÚÌäåç«É Ğ]ÎªD¤æ&3Çf?ıÃ¨ÆÕã\ûeYï?ÿ¹Š‡ß,Œj–/çÆ¡ÍN@’>HíNúÌ–V>`>K>îcB<söS€aÒ ­Jüğ6¢#%6ôOBŸõî~w†9õQåw‰—Mëó{ßA©œÛÀßË°Œ¬è*¢koøúaê½‡‡’À×!5â!C7£Êz7Qç
´^ |Éæ8ªÇE¼=_”£<L¤İª¢»¦,xBÉŞŞùÉsƒ™ÀÉd|‘ş%EüÒZ¹¿™1’:¸K~xgòøµ8Š6ÿ}Vi	«Nšuÿ.ËŞÊÃÅ’,ØÏÏ¦“íÅÑ¬äX§N‚oËFn×Bg¶•Û•ÊI½¦Má/t¾_èO§*;soÉ¨ÖU|OÁØàtŸıs8Ö´~°A ¯ÜÇû>E4©U%eOÚŠ(9TŞXÌÃËàî©‚ßÄw]œ­Â\2.œ°XMG]ÉoTØ‹ª÷ª¤â—yÜ?wÀO°ŒÆõ…/)¹¯e"ÿ8VÑ`{¯àÙÓ¦ù‘µOüón„€¶;šã¹J'§<{fñÎİØSŞ¼¦¾ıáÈ9ğºùğ©
ÄqyÚ¹”dÌÉ«óğ.Ô0aşYÌ~\k¯»0îÕúÍï¥°Œz]üúÆO¨ÂSº()Ko‰ú¤X0)c…98—{»5¾ãdêJÃ+^œÉ…·ÏÔ]ŸãçEQgyé–SÒlĞŒö^&øÚßÓ­8µÓì€°ŠæC—ÆB*SuSññû;¹¦
ÁÄÓG˜ŞoIZC,C»jÛ\«ÊŒ„ÈÓËÍjËß(ä61·¨‹ÏŒÊÛÈ‹Œ´™ÎT“
«ÔyŒ©\œÌH¯ÚöáÂ^˜œ£¾‚·iXvÅï
´
€J[5ñƒ¶OŒ4Ú!Élh£×ç6Îï8,e½5êÄ®F²yá[×ÒWÉ¢é¾ªMXïé¸G|S1•¾Şo(½íeï©q“5éÈ³u8¹7#ĞiÏÄÈÍãÅÑ[¡fW¾ãP}¥Äó!F†ÑkÜ¬\¬Úr¾e–kÌA+y-‘	0ñ"¾·îÄ¥nû?ÈeÑ¯h
”¾éç\ñ„zC˜1‚bê9A¾§2f?{U•5ÃØ„5µæwÓ¾u{€İlôólöH7ÚP»•F¸]8áØ©±?©ëÈâÄcÅ¦—™!İÊV¶tã’‰ëf­´{‡ctç–?ÊË£òÛæêÑëg§Çüª+÷]a¨^Ú¤Ãv½O]eu•›’5µÕjå5™šJ÷¶:;iáŒœó^wßÚÏßòk®7f4ÏâBÀ§ÿqÔcZÏãÛ¸‘¸¥FE4R@7ÌÆĞÖ9„ Æ¢ä•Æ'İÌ)˜º0Å
#İI4§ÿÙùªOªûí´ÿÚn2+h_ru½RöUgá(T8­‡ìú—ò1[ŸÛŞ@EµâÃÕ„É÷gÔıJZÉ N «%WÁw-™‹ŠÈ35X7Æxœ”}/IùŸjX$¥ĞëˆkŞ÷Å—¤<“Ù¨Tmku']ªâ'>ŠÃÍ‰Á†¢ó½YzvÈËDp]¿Ö˜QLk€¯TªÊ¬ãRSYÄ£`)§Zğ´K¥`©cu(2ôyğ˜Ş bh÷ilİŒI‹§ÌÌ„Åú§OĞìsr€q4KEºçR–Œš…Šáš.f®ú¶]İˆT<Z|E°qÎœè[ˆØáI,£Áù)hL·ZŸWœJ_+Ï0ô
«‹¦Ò³XSúÚEßÉö(Gd]IlöXE cä»«°Y(–¦Lş¨¼Ÿ•_uëQdb©€âŒÎoî„Aâ‘Õ‚0âÒãQpäL:€ Y{CÃ…ìHıîëÌö©˜_ÄjøË¸¹ÅPK¿R×N†½–)?®†WkÓşßôÓğù—«wax¼±­F(Wg&˜ëDi€Ø)LVÂKHÔ_Îh‘S•„rÛE•[LĞÊ5H=Ua’Öö‹¯óÑ”Ë&ª¹/¸Æ›|iFå7eÂÑä3×[â‹S¿[Ø‚C:Ü)úºùô|µ!dƒh÷—’Š7%Q½F‘©SÂ€Õd£ıÿ3ìğBá]dÔPF‹aideêN^«¾¿ˆî…«ø¾e¿¾]gU¿~æv`XşÏÓÚï\úK>H¿ŞŠË-Ãw®ÅCîîè·–ÛlÍ‰õ5›÷/»÷1kÇ¹ÖBf}XKÇ0ÌÌËEÆSnÂXÛøå–	¸†³-Z‰D¿í›˜²Š­ÅqdÍ5Ñ°ÆÃÈuåÄºÇ½zÄèÍØÊ'ã%80u~uru<60;6ÀÓÏñ¹\£õ(We
ÒêH¶EÜşá …\ÿPòª¡°2ê€
ûÊÓ“ªÃß‘şùÖöÄmXÂPAŠ2€)³ÎJöİ’äoécªÿĞPUùB–«Ÿx€¬Œh8ÁÑıÉÓ‰…«4˜ãcå„‘%JÕqp'gy}µñ:èƒ‡fŒ! [P)Ûdı'pÔkù'I»’)üË¶İñèU.TrÏ8€Ô¥òVsåíÁã¡ªÆA†ÁÄÍš›˜š˜AèŒú_L;¿Àæåôo1RÄäIñ±Î¸ı¡„½Î…:ÕÀPòŠ	ÚDÁœœÍÈlšKÙ¾¢Ì"¬İXÓÛxî˜[ñcÍé4p‘Üõö	†àÊsÛhÏEñÛ€i„"Oškß’:ò…" ¹Dì9Ó~í>ò¤%TÔ÷MÜç#KY°Dì™ G­Ğ‰úÅœ‰ _º<Fü„cB #šV]	›‹^ÃåÃ$*r‚æ¤î±‰WB™RÎ«Á?‘Q7Ê&9ƒxÙßYWZTvfˆ€T“Çl BlŠ‚RÑ†‹XÄ‰Ä››:s‘pMb4ßÉíö¹œñï Åš‡íà­³cxGh¡qq{PÌ'–Q«ËŠ3è°Ÿ~VeÏS0[{;ºÅDªğŒË©IÔì!Á²Îçö•™‚ë
«7bëRÚ•<¢e=€Æ 6.Ô¦'ÌâÔÕ+ö£I«=zc g{—İšH¡p·M9d¢YïÒ&6ŸE›ÈñØ§ôqıƒæ'ÆĞ3%óDFµì«m^Ux&´ƒÃõ‹?ú[1†¡·¸NiÔá¤üÕ
‰ëÄIÛÄ¯ÈÅÕ›ÈÙÑëdö~êş/ÈÖ€qcWL]xô“>œL¯imó5Î0åœñj$(i;ÈáÙá7Äø¦hDâ¢?sÔ¯AnÌt¾Üê¥©*udVÙfuV¸ş-	) †ªÆÙßËú£[¢@«ğ€®*n1ñ¨dîsÉşšc#±ù#Tª'øÕ¾@İ\Ç@²‰[¡Çù)©¹„|C#§Í#S¼÷”¸29şüµ|IŞıK³?îQOĞG>Šğ2SØå×İgxRĞd*ùàUêkƒó›£àå¶Baék4ï[ ¼×(»®i%ÖBŠæÂÏü„hÌ}B'Ú›[59xdSš:ÎWkË¯¯	úº‹™H@®²Ã]°KŠí'aæ€´I	% cÆ°áVz8má›JJĞ£Äy÷xsÆ·ËôÎÇéºùÍŞ|Söi‹Ú¹ùÑ–ÿÌñÔú“[–>…÷CEÎ¿ª÷g ÷vRRj‡nÕ;¥é!ÿŠĞÅc›İ†&¿\u‘½ÎöVLÛ[L`F\}r¶•Å){, Bñ:	c=|±	6ãD$Ç!*›Ä–¤Š#ñ˜mpíƒ»[n}¼¦Ï¸HsãÕø&í…ê³³Üz©·	„v¨lîˆÿ<½*„Ón ŒN$€mEB¹“Àñf¿&/ĞOº¥®&ùyzM³yù-!BAµ@ŒëU­İĞã[«„EeËOgìqÛm¯p·º¿x¸@y‰íÈ›Ì‰†xZÓÛ°×›Ãé×¶‡BÆ[×É‹Êj*Ë,”*'yÀ¯	ÌfbC¨“H
ÖÁ®¤àçJ•îm—º½ÏÊ®üºê^1ËãÅÄŸy=Ü ‘º\b“GaMÅÙÉÿVM©ÆÀöÈVËÕÃ—mŠW«ÕF™'mä¬†Åa/Éıc‡ºìCŞDüf¶CÇŠsÚ[°¥#Öko!ê[=ãà¯¨·Ì/İ*¬ÃëÁ¤)àÚÌøís$æÅ9?¼f„iÎê«èüÓõöóF7öG-<ÿÅ ¢qûÌ„şD“$èÙmEŒˆ‡g«Î•›Á&ûi8Şƒkİi‡×¢[vµ%6Ávİ…œ~Aæa––Å-YHZ€ÛŒ¶kƒüĞ±,dFëcË8×â{Î#}j¾´Ï=F|ˆ«ÚTu¸F#M”ÉZÈ1‹‰¨¯†g|ˆ*èH‚!‚
ÇŠ¥4Ï£ÑJ´êÖœç_Y4
|É²'ààtoâ¥óµ¦yRs¼WjC¡á)K±vÚ2I¦I‡}¢3ïo£
cl¼¦ŠX/O—§ò÷œpªO®ãQlÌ”˜SÓÅÅÅgÒÂ«ÂÀô´á­¢2gz–ŸUw‘¹üE }ƒJÚ	¨(I`f„Ï;Å9óõš48şÉÂ™^‰æ½ÿq´».›OûàÈÁæ#Ã–…\XÇ øÜW1HJgq©H,îöÇ«¢Áà:×Ey­©</¾ëå«:LµÌƒ×ğE¢ôVÑıÌî¶çœÜT'®Ğòˆ³9}¯ÙÅ;L¾Ø	«KÀ¶ÊS4ü!ëŠšİ?¦J åíÎLRˆ¨Üu÷D	kQ“Õ#Ï‡‚ÏÇÙÎáJcèÇRÖ6•¯5ê­¿|æ,†Ó`kûtİ5›şÂ±è»5;,ÑøÎ³(Â×ë×/‰öŒä^«	ÀÄÓrxÈ '¬ˆÇ­İõ²*êşË­²‰{8²;úåS/^I•®ÒCb{Ş¨­é¯KÅPœP+6ªƒçÄ’¦d“·ÿU›N)Ïaü  d{Ä£Œ†‹mï%&<;0&&ryu<ÆfÛÍ ÀkG]ƒÓÇØüùÒî “˜Àc–JKLŠÁg¥:PÖ¡çX˜™èRÆèªDSIÂ_ñ"—–edsIŞbÊ.Ïém¯\´d8èåÓèRâÄt‰¯ÏP0Q‰¸¯±İ=Â}IX€ÀSĞ~vUÎÀµq¶*¯Û—‡gVL'ˆTvğdÀÒONÚŸí.áŸ°ñÖ¦ùdaa!ÏøÎÀ®ØŒd(_cœ“O-¹¹~C1\‚ïH,i‰CÀŞr²ÂYéˆÔø[Şõ!IáÊÛvŸ—o®Q²ÀÜyñ­Osı­›ŞšÏ„L·şÆâèßòÙğ©Ï5ÕlÁG¹·5EòÀAú‹¶ÊôÄxlÃ*É*Í:DÕõÊ0£dLİ4pÊXJ6‡pg#_ùà‚é•JB¦:ˆaxş6ŠÏxş¯ì¬ß¢€÷óIN!èHc–ƒ|®«bÌ íˆq¥Ÿ°ZÃ÷şëËúW	Ø1ŒÖ×ğÈ™¬/Å:»ÉŞê€´‹Gs_7)ÒNıéÖÒå 8ïi~©(êmÏCMĞC+‡X9E7röKO`XÖ3Ç 'ö^7§Ò"zìõè„Å$Ê»äu5üªtë„§./5EöĞ<šdĞ©G«Õª•÷¾ªcá¦8+`¯‰5è„ÑAŞ‡xğwÆÊ‡„qhÂKšÌîËßÅäççV‰#©wÁ/Ÿóáâğ»0™È¶«u¦E3×¾2Æ—‘‚v)Fä#oQÍçg¯æí•?h»ÿWmFó5kSxÑY/UoI‚N}ıÜtèÚRüo|
 Æ;ÕãLå—+n“G~2ÅJçË˜7ä,§@­v6ŒÇvqÍµ6Ô–~Ú¯¶<03<½”’lUŸFÿ@„„´S$¦‘aŠ–Œí·Çå«İ»i–˜ğ¶4Üˆşg ©7òß`Æ¢ü%wÿ9vr×9ı´å–TYB{Çù;ª6™¬q4Á¶ÀqÄóQC^ìl¬A˜Á´‡ˆÿYg{G£+ÇèÃ¢oûx‚´êğ1ÌwÒŞö¿Ò„_B•z—zMq‰júï^¢g:C60îHAqÑcyH•F 2‹8§ÄíX´Æ¡#Ÿ]·z\ÌâŠûNãİ
œ—Û—øN˜ò£3ÑÀ•,KkVÂÕÍ]¶ÍÒ			V¹A8'ÄßÇĞÃ`×Î€¹ÿƒ‘¦«§< @x"Î“à†`éû(`0²Qğ¸ñşûË2»•!Ñ³rV”’T‡ÓJ§ØÎJ±9×ôßşYWV‘
mØËj°Jú_Qí©Í÷4òı»¡À²ÑƒÒlo7òüÓ÷ã4á7>Û34JëŠ{º(Ä Ù^Øb6ÍäxÙíÍsØÚIgºşRÕû¾ÇÓ·ÜKL'ã‘—„®‚X¹dáM/üëT¹·	í©n>(Ö]^.1íƒ„Ğ'3Ó^NQCuü6ªùd(À+Úæ~å—fêßªÎµi:İ£Ü^£ÇÆÓ‹¥ªÕ«L”Ãåµ•Ù>é›ô„º”däÕİâCbÍ¤ zC‘ïÆMÙB§d€p±º8+n1}¤ú”Æ·Í‚ûüàÑâ8-­ş’…
ç³EÓ‡Š¬©û³èŸğâE&MŞL\áÚgÊZ…ı•û-Ògß¯ˆû´¨šÂzLÕ'ÃĞb4pôÆçÄ¹ıYrÄf¯“Ãcş›ãĞÔ\,®òªóÚ‚ó
b$-Åê)Çé£EåİéÆ– à#v?ü¸UÆd·NÒ¨,kxVB2ƒ‡§.vƒUÙ`Øéœ—j\îˆQ±ëÁvi§Ù‰ĞlJOl| °L;;‰3ïºÜÁ¼7ÌI‹ˆ‰`ÍL­ş·w™'®ò1JŒšF0&Ríïå÷Œ-0«<¦S `® °ï¿Ñüh–ÏÂƒ%’„WÄ3øş}ÓhEÁÍ8)ô£±©fÚ\0 „ˆôAt h(ŞĞ™fUˆèUôïÎÂÒq”ÂíHû¦ÛN’<Ş•ŠDÌ
r"Ù'±Ù†ĞüÎa¡©¦)òŞEª¥NeœÑƒÄ…>£Óª—S•ÜBN­Ou¤Â>…°usï!Â4IõµÎ¥ù¦÷sH 
´œ9ˆâ;–MÓà«y—×=Éİs¤ÅÎ«	"V«J÷—¡ïşÆÜì4˜Á*ÿîÆJ¾ßŒƒ%Z‹%ƒ²\Ûïaş±ÍÔ9åpøŸw>3y„_‘.«$zÛkğALêc–Øódß²Š\1ÄıúU´Ÿš¦€–º|î<&‰ÂÿÇãJ‡[’Ö;7ÍhI¯­¬òóÿ·…F7ĞfÑ—"àÁ¬CæÂ›‡iıä¡Ã1(µLi¹Ÿ¤Q’!ö
Bv£ùRjqŒFÅ/÷¸1.NwÄ¨"{9²]¸0Øo$eİ‘Ï..À1¨gê8,rÃÛ pÁ0`{êR‚hÙ­¨9ÈÚ›G»²Ív‡ğ¦è‹ó·_öAS¯ş+–5•Ïâ@:Z®üÉøŠpoôR ‡Æ™…ïHKÊ“å5ípyìÅÈÒëµàøÙ‚†ËY@ïƒ
§e|ÍE©‚î˜ûÈNbÑ.9>‹ÊÜ!ÀDn®¼ 7•Â_^âæ©È\ İ~Å]Û¸“"º÷`‚ì¾11„ÁŞ˜ÃÊ ¥˜GZ¸Şšk­‚ÍbG‹Aslu~ur18<å€öñÖf¼Ã¾hœºøqó¼É¸OFcŸªEîi³İó-÷éZºšl˜¬Ç‹è¤OÆ®ãWõ7Šäm›šçíq®¸j'_	„/W#]ÜB+®Ï"<frëìâ»6<ÊQÃ.;ïo`áœ(Ş)	<BáÌ ®G‹i‹LŠ %@r…“uzá|ûJÆ@Ş´
Ê€wš¼&QZ6"è¼2x‰®¿€óMêD]N²jó}7×A¨Î ÎÜ¡Ôa%'_ÊWÛn¹lø)oÍ/’‹H¹HïÜÉë°Àúºÿ\ÏÆ¦hY8ó,Ò'=/6¤ÇİPß.Ã¸ƒ59P²"¥$pW«Xô×?8F¿–Ó8<“ì@—^¨±ÂXà9Äpò£›Ã»pwDcĞ¸gBY‹áĞ§û‡šAlZâ‰îû.£èuŸ®Ll(ßïtY”ù¥ŸFØ®¯qôÄ¼Íó]-‘º_¦»4kZ‡ÖÈÔ‘yPÍ·°ú_ÓÌ¼bZË˜ıàÁ°Œş4Ğ->W>éš´h¥’³_¶M¤Y•¼åBŠ&èK“hŞ‹´&¨qÆ+
6S#9Ûã½Y¹µüp\Fy±”‚¬(˜‚äC™{
RúöEI¢Zúï³é$$'jøF;‡š[¿[†g£¨TàA6îGf/&ÊèwÌ÷97U‡BŒ™®bôM|l ßÎ¹ßÎÎ¯ŠŠ±¾‚‚öıŸÊŠ‰“Š€Ia"Nu=S+Y·KÈ´Ç¾ßÏßĞ¶˜Yßû4¾#ãH‚@ö¹Eñ:ål/Ğl:Ğ+ÜDØ}ü˜â.DğmxA¾ğ^V¿òu' ?P\`ˆÓùĞ›—¦
ß°S'ôtm¯EtÓf‘C'šKg©‰üVÁ´
"}¦å¬U§ÛÉ]oL* në¥y ¸§ñQQ<ÆräT3RîdİÛ‘1ì‰Öİ‘¼GN8†şj]ñ÷	˜Vo€"?=İ6I2¢G6¯ÔßkÜŸ¼?¦Ä°´äF9§6T'%gh€üÔ~«£Ãs/J-1ğâäºCÉŸ Öß²z‹Îã£ƒ†R?Ù5)ÉşWâ®ÆÅŸª#Œêœså2Ÿ¡©iYáSî]ùi”k¢2èO‹Z”IùÆƒ#~¦´ùvêzMz´Ùç<çœ‡ê4¯8“©¬¹—ŠÌGoÄÒ·ûVØ+<ùUd“Gªrr"|ƒ+Ë¼öé¿³i{éìÄ8O¾SlaÉ BLiÌGkçÙÛ,z°FN!RK×	µË‘¾üüZ—Hz¥õkhPªæ>ûâ‚ó6fü½3‘vÏN‘Nmb·cMI&‚æ"Cc¯y`å’V3®^™ÌÍèAXÀŠÊ÷ñ”M—,g@×TÏ*|âeÑ¨/	©NàhéŠÓSgó‚šÕ(ııUz¾Qªø°V½_7·Ùß€­‹'Qühøüèæë¤Ÿ©[{'Áœ«	û×4$Ì±Ç–#ºÇ_İz,¤À¥ƒGŠuw(Šì¯ıŠ×É¬›ğ÷¢o=TËÇÏŠ€&–*+/Guvš¡Y¼Ÿ°šÃÅíïšÈ²¶ÏÎY×üQn& …Ë]á¢J÷{{°Ï½;t}	/ú@×Ï%ü”	ÿ¢ŸRa~µƒ:tİBRk"É×^ğˆ‚(NèüpQ=mk¶ÒXß8§¬”½b‚ùRj5‚‘w_çTÇx8¯şlÓs¨¬…ïV¿3kV¼0çúM†¢\¨å¿½–\ ƒY›ÏÜ³š.hˆÅ¢)™ « "™IÌ,½ÃºOøÃ²ñf‡ªF½3¤ÛW¾áQ>§¾õT	O‹|ÉDÏw¿MhÓ¦œÀ]:ùL?”sRÃ¯>YB¼®È	k±2§n5èÎæÌ¨à¶W­öĞ½2Vaä%Ñ¿À`Ä‡Ò=îüÍáá˜„"ÍÑºÃÂüƒ2‚bT@û	¯Y´WØÅRÛ[ââCBrr¤§ºSµº[ˆƒÏx²»ZºQğBî¼’ìÃ)£
XªZúYo2ïí!âI2«_Ûãî„]^©Ô!U8¨Äß  µV@(q”VÄ‘R?,1Â3Ï7Ëë"ál”›Õš]t]j‘ğ6{6ğ€R®â]E—Úu	‚,ª|#2ªò‘›f†©H_ ¸õ ğ­|jarçğÀFğÙ?"îúöÑ‰á´©Ø €l@l&ÉQ¢îKœ¬1ôZ¬ËA¾¤ŞĞ_M+rˆ¯yïÏæ€R{ÔZ¤økLÁ¤ ´H¾¤Ç‡)ê‚óYí,E{ŸDma¦cNv£zd)öƒİÆLçZ·7îÖu˜›n;0 ³‡úš€š‹Îİ‹L‚çWù†ŠéÅÄÔac!wÜ…'E¸×…ÿßÛ­‰º„»Ğ±mNeìPCrjò"CÜ®n÷$´O½$Æ2®¥l äÅƒyÂ^P$¤óUÎ¨+°^á¤”™JÊ¤X,, ä_.–hø“øñ»ªı,àv­JöÖªÛÏ
±ç•v·ª‚™¡a¨Yû•vp0oHøz³jœÈ=‰Ü¡—˜—ÈÂ4YšYH‘ò’µUë0«±™ØÊ†øû¿06Í·©Ğ¢{°/¾®
èQ9uí[òs„ÑkMÜXY­DŒz	º}ÿŸƒ¦™Ëô:ƒ‡ÿÛ¥oÛæÃÆê.É60&&{!0-!«âgáªïĞ’}W6Ğ³CÏ	İFäRYwa<Ñ!„š$·’ê¹Ğ”sá–‹´åŠê”ÔMHuVu|ì­;èømÄøİâV–&Ó'QÆ3Ë
ŞD¤üCı/Q°ı—¨-›“@#8ªlõÁpyqL—Ø·M£_°EççËXåy_×µZÈ‡®½Glş¼Ñ¯›è ‹a/˜û_Úb•XõaóŠ8z.ÏY}$Oxë^oQ ×ï«g$†È×Ò‰4‰±Y…DÅ¸ÌFÂp´¾ÖÜRĞ[G¿vA•=2:P)*°m"+ÉÏÅÇıÓw‚[v}Y
ãİ1ZG{ÿı¬wÖ#ı¶_z¬#Ê	{ci½ŠQØ+[³ø:nL†{Æuì2j9bXt’ˆ+àf\Zæwí¨ˆàu—uÒÁ½İ¼ò˜{'¨”Ëlã†æ?³Kõ”Í–´à”İl&Œ*Ğòv~íDFg|{ÕBcb’?f6ıKäñ¥ÿ¬ÿ´Šáš¥ÂAkı×3¸|WGÓßèÁ?Jã«D»¼›X–üê`ğÅgÜçÍ¶Œ¢£¥m?Òü”tAC»ù_½AKwPPÒşL«òŠ.¤„#F„Ş¶	›b4¥3¹¿ë©ëI=T©ïËŸ„[¤ÿ1õ—luL±"1¯ÄÂÆÆ¾ş[Ä¯ª³80WI6DÕBÉ’ãğ§í®"ı¹E0Z{gíÑKõ˜04Í»àl¥x@µà·×J`Ñ½­k›ú]L£Û~Øü~ëæ–¤†BİwÙßÅğ3…±qˆË,ÒÉW£µÊf*;Ì²ÁĞ#š€á“”½½¼B‡Ô©ww×$dLST%Âø½îßñ‚xæªÇk!ÅĞ,ëç¾;ç°u_z³=„¦«aµÇVš@Öhßö1<è„èÍíöÄQùñ¤)d–ÛÿKj”‘o£Ü”
¢ëeÄ^ÚáLšCÙåA€µ496†Zæ²·ƒÕ ÷~ñÍõ#bHØÀ´–şÑ‚ŠÆ‘ÚÛÓËO•&C—ósŞ‰ÃÄÖH¨TI~¬üN;xÚÙD‚Ó&›º{›@UJ¡‚Î”ÉæİÕ×Ï Æ¢I¶ƒ¥`æÔ¾ÑR(-ë§dÄ	€†ÉÊ¿­©âùxÈòúÁ¢j†ô5úéK:.¤jáÕJGÇ¤å‰¯)8çWŠ
”…ŒÆø…¬Qy-‹ƒÂrëêù¶?a ó†şğÌÚäbkÌ¬¯-¨²-F“MÆ±£ï^kÆfÃtu£S¯:û£2®ŞYîS¹¢éúZJ¸xåñpÙtçxw¸ş1Ûµ¤Ö×GÂ6!ßCÔ 8òJ4À¦±µEÏZ]FjxKá®eXæ@Ÿ(¥™ŒÑ¦+B{Lµâ—äÕ2pçÀV[Š•øûİÁ‘À=ı9¤É®êt¤h_p^—_;’FÎ0lÉQ í­@1²¤Ó!q+@ÑÅzŠ,ßŞ•ğˆÌà&ÅœOD”âX°Uß3FÕ¹KèÏUÎï?"T¿ÆP„NHbÓX#F¦şÌ®™'¦ µ¡Q#.gœX°RhZÃËk°9
‡ô ÛÈê÷$‘SÒƒ[°Eïy´xWoSË)øi_×<bD´™Ñ“A°òŠ›İ¾‘aZ€¼½Z Š‹ÃÌSÆGÄÍßÃĞËÜÜçå~?2ƒf7üºİÚG¬’¢¦7¾J~é‰À¯§NûŞa‹ª û[›×P8®Ïßº´ÚP˜É«èqŞËÚÇ¿D,ä¤âø£rAÒÉÁoÛxØjÎ¶ûº¹yLCFãig ]k‚/_ MŞºLŠ½¦¼½ß“äô€gÌvé:f:MÉëN¬iC£G¹‰ş˜/»ÖÑ²Ñ,iÙºè*½{
b«0jœW–ı¥&:T„ÑÁâ”®ÿjİ;Ü¿§·HvØÚcÚ2pZÁFrYfsß—‹†˜·Øcİ8½ÄŠÄÎ¸£ÔUKõ†æ_ïÅÕ‹Y 	}4¡±'y‹:ª¬Òecïõİ#&¤AòÒİÚÊ+áÚéaš ‚éÑQ	/Bzó³ÑKŒƒùX (^~Ğ*aû¾–q‰$Ã!€´Àœöâò¶î\†î¹Æıö¸i|C_­†²ö‚mcaÔÅşÿïÆdplßî|è2è×x˜d™ ‰ÇÏÂª­‡Ã¾4™ºôK¤_Ñ‹<gRÜŠÆìfÒÀƒZZ£êI„¤L!°mƒŠßÁıÎK'w`IÚÀË@@âJÕÂøid ¢ŠÇ¢E"íÖ²Ö"Ş¿<¾úÚ^6l¾ü#¥ˆµñŸ6^şv”wiÔ)ñ/"Åu»ç@.`±“Ì‡ñHÉ3D_™ÅïùK†ËœÔÂo[òŸÀS`•Å„í¾0¨ :œõ¤8ĞCr¤ÓHı¿Î}å£5G9Åøÿ¦¸Y€ÁG’ÛôÙàûR×Î-’¨$8ÎloãW÷¾ä«kT­ÛÆê+ÅËiç*U‚dÁ‰´°ª`û0:ú,gW<°ÛæïhƒÛ-¢¼A¼Êò×ÈÀ¯î…OWÉE_§ÙW wæóeHÀÆ«ZáíÖ×ÌØ À˜„Ï•éLgİH„mü4ø3m£§É°hœ@wfÚø1N¿§‰J2ÎF¨ã"¿§ ‹jè>!0'01uohu49&À‰¨'Ã\ÉCŞÓ¤1Šš‹Úÿµå3³àO)ŠóçáO'ÍİÄ™lgê“PåÕˆ7²_WE‘¤à\EïcÀpÏö.L£.OÑOÊ{ë¯û˜É¶±ËOÌ-‰øZó‹fü/ŞÇ×‰WWÑ+º’HœÌ ÊöíÃŒwnI³–£9æˆ÷è2€½x_a`P÷äîW;¿ëÎ Z<öFæÓ‡ ²¿\jàÑ(e¢ÆöÜº$Ó— şİ|Í<|ğPäcp8üVö]&£‹ÚT´»vÊp%¹…-ïÃ­©‚ıä$· w{`kƒñşƒ<7ûƒ‰ŠÄzM…	H`an[q€©‹Ôœgáï`ˆ‚õ"œväE4€6sÊD8º´\Wä°nôÉA•‚*ZVVà´íÙ Nç$\âµÖ’êú†V“­ÆŞÚ ‡a¢mg¯îËÆÂË¡Jú×èQ‚¼ŒÑÀ>7†;<­vEG¬øïuuMf‘S-%·ûÈîğ— lœz@ßlo3‡3Ø_QY­´ oZ×/ ¯6×B:ôÒoys½„<¾ ?j[-%®»bê?PeÃoÎVş7—yàwwÌe’Òƒs8oÀéˆ`´É©c“½‘w¼LÛ¸)}æ‡P„Ş3şÂÖŞÁHZÎWÙı\Û×;{«‰åT¯XĞîDfƒ)Ä‰õ{-Z#Ğ 1Gh!'|Šçä¾$ÇÁ¸ø§¢ö„Hrœx7„IèVkÜL+ædu“#½¸§Ñ<–û=A¤H±.¶¨‹æSJ1\¯¿njZ³Üşˆ0àœ9Œ_Ì£Á·«Ş è0€4¦ËÆØÉº$£‰‚„"ã&Z|`¹i×ÌšãYì¿9ã¿/@Ã
Ö=5ò‚ÙØ*‰ú¥ƒ9?ìÈåtèÑ/ÔØÃ Ãs!İÊYPì›òÈ(ĞuÌGÂxÅãOõº•İi‘IQñvØbsÇEÂZ.>-rŒ:+£švà3Ñ7´0¢ÑåËlVşlı+H‘„Æââí9Ô²0ä*ÚëMïštx¹®Ÿßæ¤Ö°—˜ÈğN!µl<½Ş„w;£–$ë)Ş‹nOo¯ÎÜé-Šöİ<O{luóÎWÿûˆÖ´‚šÚíºXêà¥XÇ7xÂ"à‰”×ãØƒ‹ÙLÇ‡—ÅÆ®÷@[ãÇ^{˜Édš	Q7«riÀ˜¸6d4ø×àüŞ‰±ú•Ê3ÉüY]¥®dd^üMŸİÆë"úßåºíVƒ$d°’Jaè¦ Ÿ™;Ùœêˆ‹XÌ§x’ß?¯Â›A9Ã.CíÂ» —í¿}j‹éWêZƒØé @Õ;úŸ9ğ¿:O­¯İ5¿¥È~56C›ÓÁæeˆÇŸô‹?òY'1"íŒİˆËâ…s^Äa!ºªÜNæPÍ³’&[§ğ4ä"ÙŒ¤ßïzó8ß‰{Å0©gtXPëeÁ/¼„‰‰KÔtGpæïmŒh!sàî¶ËWp¯$†ÆÓ™Cì°†ëşÍù`Ôd^í÷g¹ºB‚W§Ğ¿È¸œiÅ‚©Àm%èAÔC©q¤Ù^:œÌŠÙÇ—•¬G‘gÊKÙ¥†ùIlAæ ïç±Æ±ŒD†Ê²„Œ×GœP×ê@Öíh×¸6÷"HÏ[+½èNª¹¿EkŠÎ ·gú!Bk’2ÆÍSâmTÃ¾¥¤EkY ¦öšˆ×Í/e¿ÜY*’`À^ë@Å/§[aÅ*ŠjNˆYU{ƒ¨¿§¿(e”¾½Åê QÔLSPî~„ÌhşÓÜæã“$³´J’¨OÆƒüŒe|ÌÑŸ€ÉšÊ´M½ç+ÁîÛî4àçš pÖóeÈş#¥„°q)e\·Oê?#$ŠÃÍƒÇ#Öä“%Ç†Sª†vö´¼[%
©Œµ3úÀJÛ^¤Ë9­­ş«¯_P‡9fÎAë(s® Öî<ÿƒOÒo×§BS~Ü”lP)¥Rv1øBœñÔG¶%´ÌüÔñé‚Wv\ú2çİÍ•x,DÁkÎŞkéº8©½K7{
»¨fFş˜é&9ÌÔ{ƒŠÚq»ødw2ãû{Ú‰Í›ˆÅh};]§—£~ü(!tó©„ J
˜ğ/_€æÑ×ÂÛ˜µ’Ë#½(¿Nq–ÓàØ¸ñqz"nòÃ˜!kŠbjòøÏÌŞŸ¥Äÿsgp0"nÃÎ‘Âì’ †Eúñ¸´ôeåb}=ål•I$ÄFÿégÇVŸfğU;ì.»°¢³êçØ El\áŸgÑ:’ıø¾•³F/Y4ÍpÈ€%ÁïBtE«óvsk7Au´¬Y'q|°Ã'ĞáØÔ´d]Û¾xò[ü&£ªÀ_àŸ8Á§™í•Ç†ÂL->…èÿ;Ân;•üĞ+ê;Ñ|ER!£)VI‚°
öZu‘ŠŠ‹óäl$˜ÒpÙH ²…µ~ØèÀdèøê§ğÍnOAuÿõÁ® Q84ÒnIrÈúÃ,b|)j!ØäòDÓ-òÉ¦ÒÜ£Ù”ğKä\`³¤ü¢-âº8DâğLKå@úNşŞT»­Ô™®Úì"Fl”Š^LŒ¢Š±+[ó¦‹ØŸ™>Näûzpp4'±²ä+ÃÄÈÌ)}:"yu`|n†­ı’ßÚË zûTôaFŞì2CeÒJ,Üº£‘fè“„ÄÒ#İ(Nê•Ì¦Ä_ˆÅS$åĞÊ—ƒõ]ƒâŸcıÄNïC)ìÆK+#âŸ°À¤9ÏØÂÇô˜F_6_¶²’ØU·§h4Â”f€Û'ä&`Õ&ŒúÇ¬zÀ’š°KË‰²2¯£´Ä™Åróä'¦y…r4ÖsRVC±jZÁ}#è?%,
ëzÍ×î‚é}wÄ"$0‘4noÿ¦UÓN3êkå2{„¥›¯ZƒUE´`ÜêÄc¥ÖÄ˜è9ÂÓŠäÈ–ƒO™JŒ¹…ĞwGÚ™H›\á¸åÆ±ÆÎ_—Šj€ÙÄj·­sÙÅíÒÂ¬ls[Ìê…æ#¸r12Ûl±¢77¾_qè>òt-já—É×ºy Fi¿à?C‘LÍ‹á‹÷û>©.ÍšöPG[smn–^«’å}µ¦şØÂÆìĞÕF‹`Ê
…ÆC¬_§ADiØYå‚Bó@K¹ˆ¢¹™®H¡‹¸GÄ&îĞ§‹s„«‹
‡(m$|ĞG;1dD§˜À¸. Ú@Dk£¶ŠÂWä¶µÊÊ­ÌÆtÆšö\7lÍ¹#toJÀ›ˆƒLûµ‰ËÆ„á0Óâ!o|Yˆ±}!=0»5 ¤äíQë†2rVm¹—•Ö¯6Y@Œ™¶Š¶ªõ%†Ÿ¼ÅúwêÁR‰@KHÓ2™^üg¦rIİ/æ½…¸óË«YzáDÎñİ}´á¸óK4­º=cÜ¢i"…ï¶¼Jw¨â¯¨›ÌÇÉÈĞOÈŞ3"Òê8q×˜•`÷VºOQjÙ/pp¤y`l\à‹Z8ø-.ÂåQîÎ™(óü(Ñgó†‹Àât¿ê’ô"s<K¡¥VÚ/ş6“Ó®5`õ*oÒé¹‡QJŠ0m=±à.‰Aì¾Œ¾¹˜ŞàÄ Ò¬`ş’ÕÁ¹¨­±¹bk ‰B'8òÇt2tøøç‚yÇ#ıå•ğKGq+®ˆn„ïO8šjô€l\–ºÙÀÍªèH´Ò×ÀCI(ğÃ‘²ˆ¢…ËØš,•ÖÃG‚ÜDÁ¨jüÙGÈìJŞ'¥ñM¯™Ã:Æw:İ‡à60¦KA?¥Ïš²9VÈy¿X”ÙŞ‹öº¢Úİwƒ®Ù.·§G·¾’ÖËÊ–ã¡Æ¼šKJsèµºÔĞÉé;Yñ®ùŞÙÀùz%Ê«yHdyÈÒßÊìªäÉ‡ÄäNm.>ºËã,_Ì	çŸ¦êë›“ÉÏIÿÜ_½,‰ø…ø‡qQHÔá¡{·a ^§ı"ç“ÊÍfê~² ‡´Î:ÌMÏJÆ
MP‹5Ú(:½FâºG³Móêş™ÒéxÛ@z`ÇçÈ.îwûí­÷“˜@’
$ˆRøÄA±N¤`&ZÀÖÄAƒi¸ƒûvÂ$~¨×Nõõ²ÿd`í¿L½Á@¶O•vÍ=ÕÜ‹Ñ±A)IrÖ•\I	-î,†ÔKºIÃ=ŒÙ¯ûÔ öFÎ×Ñb¾e1é¡ÕG¨n>ÖgaËe]E {„Â\¬)~D­Vtn­¶M+I·GîÄ¬‹¿z-´ıY:{(‰`®)LÇ$ìŠF¨ÁMkÊ§êÂ‚¦Ó‹ÿè[E­Ev»«pá„ª³ä‡·! ¿€§çíÎ.±sŞá”:åM4CÏÉœÍ£pG	éäIòğˆ~iPŸÆŞ‹–“bXWÏ‘¦¡À¨JÍî¶3Fœ>°ªŞîtûô$Ë–ƒÅhÌù÷I&„Ô¥>x²Şİ}¼‰`¾í}Í^eÏÙôoH¿
ú>j 	)°ßÏ(ó~¹ª
,™y’‰/;®İÆ\ù+4– fÅÛù[~÷ZMiAXq÷Ş˜‘[@¥]«Ëì¡n=§b.3Q§{ŠUÏÆJ^Ü³›ÈWËÁcpN‹6¹T-Âc©ZÖU—7¿x«„Æ~å[öÇ†~Æ}…öˆ­¦óÏæ^‘ DìâM§ÃîûûAææe’î³cDªèÒ¹½º½‚Ÿª˜÷d“½,óQr@ß(’Wò>‡üshSâŠŞÃÍöÅ£j@
»îÎÉÇŞÈdĞŠÛBj¥C†òº©ÁĞ!-s ˆÓö:±nÉÔ6Ş1ïrÄ&–ÿju‚çµ§k6Ê¸új¸»+’U·rÂÚ—³ëh%Âr:íæäòbœïd¸×ùËºaEö×ƒÖ_½¸'Yÿo°•Õøèæl<YìõÒèüONôÁu£4
<£HØáÌ¾î=—"½™íq¡IÑËDßÚğ–ÃËš¹{AĞ(°|‰ÎŞhÙ`éBD†šPÈÓ©ã÷pÌî«Sİ‡ŸÓ†ŠûÆó‰-HK7â©Êw»bŠ§¾SÅZ*b›Ê"Çi%ÂN^‘êµuëÿYRDb B5M”?à°ôØM¯ÍZÆò‘†t}|‡¹J ‚ÆøDƒOGxG>„¸?¦	ìmÃ'©!mG„‰×î¥ØGrôŠ¼4ˆ^Õ¹	’M_¼ûÂ/‘l±Ã@úQ*IØ”.ïs¢YÄÄ"Ró”×Ñ †Ê_üß›œ|é—R7TË=ì†‹ÕyÄ.!­÷&şîTŞ?Øl şÀœ>§Ê—¦»Z|	(É€f Š‹Y«âã¸»ŠŠÜ"Ä(0uuihu0;2!=jF^õSK‡ •ŸPS<nï™,0ßæŸ¼EågpA!¾Â÷O£:‡Q²¥ 8”~œ µy×ÁJRÏa§$]:Z|‰KËn¿UùÂ]6ŞŠ‘“°®­üşc’FR‚ê±Èb«PqÊŸ2­£å~‚æˆÔ«ÏQ'Xõi¡$:üŒ Ë;æ¸Ğ[”Ü7²Ì[–“ÿæD¦ÔL¯JŒ½* ÄğŸŒ…bÂœU½ø
ÃôÕeS‡‡†œ×XÙü½
s­ÚSCp±…åÚÉºÃ>™·àùa‰‚ÌçÄg„hÈ³ËZ=¸®h<ídÚWñ\ci2¾	åÜ‰½ÁkcÀÄC˜=Ö²4y¸ËGÜ—oNÂŒæ>0İ]¯´ú#æìÓ…›,6Ş‡°óÆÕ	`ãs2ÚvB‘×–fªSv}Ò9ÑZØ_¿óÈÙÉŠ+b5°ÅjdATÇk/;Àœ_4%üy‡øŒM”Ö:æ¶q€Ãs¾W5Ø‹uèĞ{Òhš~Òq:Çú¦”£¸ÕmÍ_¨ô”¢â!—ombÃa¡9–º&ÈÜV{Á}g
?KÿÇYİ¦§>' Š‹°êâ÷ÄÊIÉßëÎ.ƒj£í\mÅcÏ§­úsØØ’d¥Î¤©ËÀë±M3I€«šÓÂ¼¨ße´mF®ªÉIÕcÕF Å»¿£×gX2˜áƒÿÈ¬l+;&’cõ¼²³7£'×âÙç©·OyŸ2÷Cªô¡öÎíbïÎr7¥ÌÊÙÑŸ«¥Ì5våŸ¡à—í1ğ¼,’·˜ˆg&ñ¨Q¬@à×Ôfé8K®§y@®ÅDÜ™Îdd¸7tXÓai6 |O?Óğ“Ä?ö™¤;Ù)€¶Õ\ß/[Ş#­P£Ê½†ÙŞ“7Ú›*»Ïu{é#4Š<j“@?ŒuM^–ZöÂ'áÃè›×ÕT¹‡‹—PÓ÷H:ŸT/ ,q_ª¯ZÔ›‡ÃÎ€A¦Ò’Jí·ûm^çöŠ÷EA+S‰0¬GœFG Š‹Œ¡MÎ-eâãˆ“cÊºš‚˜Çõ@¯hÉö}|ÎüÏÎKèpÚˆ‹õÅËÍ——Qoë°‰ıäTşQX\¿X 8Ç°"¾5‰ô"å>ÅÒ“µŠ:ƒÈÖU¡fDÚoÃÔ#KP‰9wmP&ßCnÿ\=·Ï­€Â¢iroM#I±!´ûğ¬·ÙåğÅŞß‚¯n/>sš±ı$D#õKú¶C@vkBF[^õ*P„“”¸w×Ïeõô¶è7–„•À–ÛæyÎt0.‹œ®<™øE6Ï;È6"Jácék|Ÿåæğ¶Ì7ß–À9ug:zıÅÙÉÓ…(‡úÚj‚¾I·¶åŠrc¬Šc¨È[ÙíQZõ-;5:3¢`ª­é1a!&\¢°ç…Î³Š¿èùìµæ¼hKr}MÛŒ“Ü|“ƒˆj›AÉ€ÇÕÎÍ¸­È¬ãl@ò4¬àÖ¯(pÿ0Àƒ-àQé->Ë#ƒdâTà‚º¹AñV½h#ÂÅ+¶èüy-ü°éu»Ò¯P‹§£6'©ğNÊ9a}ìk-Î8‡9¦â›ş«¿[ªÌO	úûíâ%øƒÓàwp°º¶Ë‚`æ;¹é|uz¬ëğî›«M9´ÑüŠªö	J‘‚›r7÷ˆiÍ•ÎÂÄ8Ç÷Nû˜•/g˜hÒtáÎ$GÔ™¸µl¼†ÃHXçë˜ƒ—¹#}ˆÁËd];™“!«pÙf˜£îåÏº(QÇ@uL”hL«×v=ÁÃ}ZZÏêÛ©×â"ş+8UL¸LŠïÙÃ¡Æs'3³ë…‰¨ô„®j)¹dñ[v­2¬Œ.™ÿÆ° éëü!;úÃç¿cvÉ(TÈ"<£WM‡•idƒ"ä]¾"6j 8vRg RÇ£“UÙ\<36÷) l“NÔ\˜?&ğ&¾††è°’GóTI()m«ø¶@Ô¨ƒ'©Âb„NœHk~y¬…öxê¼Iã¶` ¾ÀaÜÈá­,÷½}[™íËjù«rzW`×ë¡2“Æ ¤ÛF¤n´H`Z€×û§œª¤©¿úŠøÎĞäNÓiÏßnÏÌ±ş0şçÖj
şHİT0ş_ššúÑÁVÌÍèS?p=9şöGÎÊÄÜÔ_V=š¿P{¼?…ÌÒ£°øLĞ´ >º
x2Q+|ÁÎe-Û¿öè¼Í­ÂÆ‰<~%qv¨RÑJÜ%L<*JÿÑÒ½ÖŞËÓüÚØ†Sö¯ã÷²2}ÎúÖÙøÍW)Tà/ o
x²å¾¸È
íëz2ë`¨+3IôñÖujş…ãÄ8«ã’»Ğª‹4‡öÕ ’ln[a‹›&Œ×@ÎÁ›
İ‡dIØ…ŞüËFFß1òğÿÍ[šO¢ØåÌÍÓôWéÚÈôÀ–gã¢*¶Ö\ãğ.à‡é™à²ãbÛ[°h›ù\î†¨Fy‹_PÉç)š'’$Wc™âGá¢¾k¹Vê¹§I¹!Vë0_û®Şqœ-÷S2byÛóJc÷$pî;Fè-*.k‡/ò€«œ¢%	jÙÁ®•ÀÙvâóíÛçBWâ`õj /¦Vè†Šæšc1;1uøÆ³‹ŸÚÕõâ}Ô—ïiº–:ã‚nÍšù²z',ùê³¢ß¯a}ú)µú”&¥(`”êô-V1ZQ¤˜†‹í³#KÊ½Mp}ÆÛñRÕî?‹÷ÅQh¿r™úÃò­B¿¿Ey„ŞVè_/´2ø$ônPÉ¿Ö‘zÓÉ£¨ ©@ÛQ÷>=
®Óåyîî5!x[W"–ŒtZB”„x! ¡‰¾”oÙô½§mÄâŒ®Ô_+©Z~gåêm„Sş!JlŠâ3Ë`4¼›*K»Èû£¸ş‘8–ÎÑJÕæÊ÷ôO¨J‚—È"Î.JDxväåG”aÎƒ*dã›ú'cïÛIkK–ªô/_»Ğ«×+ŠÙ˜áW¶í¨TÂ«'T¨b‹®¾çÖ&p7,áìÃKÔÀ£áº»LoŠäš¸Üä‹_2İÏä—‹ÚÄ¶s–Øøô	Ä´[´š‰g(…JÌgXU'±-¤M î—Yaˆ>ƒ¾ÁTh¤%±„^ŞGó.r³åşK×şøM6_©š©kòÂ¯±îA—6W÷àCŞŸâsn—Í l*á°˜´×|2¡š·¤2ÔJKÓW
ADÌ$üòö9/+¼•†Íg{•:V­òË3N–wÂºs‘ŞÜ6K›Æ„Ì!†ÈÏ2ìú3ğ akØÑŞ­f÷÷%zÀ†J•áÓVw„†¢ÜõI^‘úİ;åeßŠ›ÃOªÏüÙİS•HVçg%I]‘§¡‡ µŒÜ¶!àÅp…¯‘@ºHub®ôä·\“¤uçÕü]_ IÎ?¡#	ƒ­¢FÁjÍ‰¸ıïÈ§l/Ï únfP"tÒuZ®³ÔC‰ä½…1$·
ZÙé[óWÇÑs†„Pn±?Lÿddöµı#—Â¥m€S‹†¢&QBoà#Àui01YÜKSËZÂ­Õ×İ"¿¿	—ëâ#4s$€Cê0ŠÜ§b°İğnêŸ–9ÃºšÂ~0£HŸüÔ°Ò	Ô¯¾,F»Á2¶¶óÎ2‡Û®T;¸"çÌÍDT€¤ÿaM¿€æ¼A±êJÿÛT°à—lé±Jh‚Š9d: ëÙèÖ‰s¡æÓê³¶h§¯¢’)äÑepÄÜFd˜‘¦®¸ZFÅëå	ÂÉázÁ‚ìc"É‚qe` Q)tåQúUıÆÀ„XãĞ6 ã,É¥¹uÚ!´ —9QœAšsÀL&ÿ¹jçÖÚ<£”úXÒù“/Z˜»&"8\óÜ"6$)ÏGÍ¯®5í;ÌrºÍ¯—É,ÿ%b® ¤AûwD8ÿÀ_PÅ:Êò»®–9wè¨;A,ÂÍ¤ËÅwºÄêÿÍ€ãBÊ®c¶ŞèI³»óFñ{ïL©P¨L×Ç"Gg6^É—{í¹ã7ÊEâ2ó¾ßZVƒÙ[kBD“Œø ö@O&rà‚Â~âbàM˜¸‹—ÓÏ¤4ºÿù$úÄa
[™†ì^ÏÜ©ç0SˆáŠÅ&g×â«®F¹p­vê“bİÌ»'ìïgşVÖJ»“’ı·>‹Êªš±Şàk&á&‚™	g„ÕK	"Ôê¬kÈóúòovŸWİ°y¡{ˆÔÄV:RáwŠ†Ü¶¿äDQ£4(‡"yæhCn•Ğ2¡ÊÉq®¯†à1ØƒKM'ıø({êŠâE1SÈYLœ6¬`ñCÇÎÈ‹Èü˜LW[
X³=Ÿf]½’v ¢Jj‘ŒŠÚÏ …éX9¾Gÿ9âßbÃc4ïÒLì.ì|ZŠÅ‚É‚ 1›‘¼™rÓlş×Ñî»I”¦^àr‰è±ñ`*k\GĞ%‚`¢­°
Mu ±hñ†Ñ×™+±ª¼Ä™ño„ĞAÓ?ÓPş€t³	x·':ù†‹úÇÈ+æÏÄÌßøæQ€—gÃÓÓ€3tÌ×ß“/5ì›~İ€œúK9ş6²kWXpsºCôHX•ò^ƒÔè‘Ü$åxÒ£€‡€u¶õÉ‡’ì2ÏÖl³”5WºÏp™ïÕ…NİÌÎ5÷àõNÔ@œÈ@µ«stòÔÇ¸Š{É>³µê£ °­Aaá Ğå°P3›ä®æËÇÏÀ“İJ¡´Ø°+ßYxjûŞ6ª…äpş50èV Õ1íÃcÑF/¹÷&w»ş’€Ä|å“r
ÑÇµ.åô¤IÑ/²'âÚğ‡JµøW‹Ğ’ì¯v(òÈfÏİŠŞJ¤Ø½Dï”‘NÏºXwD.w§»¨|ÿÉu…C™YlVaà
²Ê’Ú¬Ç†èNAµ kmCŒ¬	ùéUe½coÍ€]Óàƒéw\Š‘pÃ\Uy‚ê²©¦ë“§T¯ÈpÈˆë+‰÷úíÓÀĞĞ˜7(ìéW
m6¦çyP«ÌÓ>rUj èRñÊ™6‘Ù.wªêÇ—€ƒl.FZ†(÷ÜÌ‘)ŞÉÃÉûlìñ˜`p‡mæÎ]¡mÁº¸Ãİ`'‡ILÆû›YhoêŠüŒEQ;'ÂNÅ3ÑÊpŞÑœjëï› Ÿ}p¡rñEÃÊ}¼ÇMÊSïNw&„RˆÓ};´ØŞËæf«¢ÎÕÍøO)_ÖÆK¾ÍíˆÎèŸ+-5Qá+UçÊ—Šù.Ì$0nX_uuuu0;1nX¯É¨K•Ò©pšRÁî­1