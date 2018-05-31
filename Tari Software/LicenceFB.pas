unit LicenceFB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, fcButton, fcImgBtn, fcShapeBtn, fcClearPanel,
  fcButtonGroup, ExtCtrls, MegaPanl, ACurrencyEdit, inifiles, DataCollector,
  auchtypes, mapi, ocommsfunctions, licenceCalc, AstringFunctions,
  Mask, ToolEdit, comctrls;

type

  TLicenceFBF = class(TForm)
    DateEdit1: TDateEdit;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    ContactNameS: TEdit;
    PhoneNumS: TEdit;
    FaxNumS: TEdit;
    EmailAddressS: TEdit;
    BusinessName: TEdit;
    Label1: TLabel;
    Label8: TLabel;
    Label2: TLabel;
    LicenceeNameS: TEdit;
    CustomerNumberS: TEdit;
    SiteIDS: TEdit;
    Label15: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BusName: TEdit;
    BusinessFileNameS: TEdit;
    Label7: TLabel;
    Label13: TLabel;
    BitBtn2: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    LicNumber: TEdit;
    PrintLicReqBtn: TBitBtn;
    SendEmailBtn: TBitBtn;
    BitBtn1: TBitBtn;
//    procedure SendEmailBtnClick(Sender: TObject);
//    procedure BusNameExit(Sender: TObject);
//    procedure BitBtn2Click(Sender: TObject);
//    procedure BusNameEnter(Sender: TObject);
//    procedure BusinessFileNameSEnter(Sender: TObject);
  private
    { Private declarations }
//    procedure GetInput;
//    procedure GetContactDetails;
//    procedure SaveContactDetails(BaseFolder: String);
//    procedure PrepareEmailAttachment(Filename: String);
//    function PreparePrintout : TRichEdit;
//    procedure SetButtons;
  public
    { Public declarations }
    function CheckLicenceDetails: TLicCheck;
  end;

var
  LicenceFBF: TLicenceFBF;
  LicenceRec : TLicenceRecType;
  SiteNumber : DWord;
  NoOfUsers : Integer;
  BusinessLicName : String;
  BusinessLicFile : String;
  LicenceType : string[5];
//  function SetUserCount(Maxusers : Integer): integer;
//  function RemoveUserCount(slot : Integer): integer;
//  function GetSiteNumber(BaseFolder : String): DWord;
//  procedure SaveLicence(BaseFolder: String);


implementation

{$R *.DFM}

function TLicenceFBF.CheckLicenceDetails: TLicCheck;
var
  DataIni : TIniFile;
  NotebookSites : string;
  NoNotebooks : Integer;
  NoteBookSite : string;
  Noteexpiry : TDateTime;
begin
  result := LCLicOk;
// if ini file does not exist, return False
  BusinessLicName := '';
  BusinessLicFile := '';
  LicenceType := 'N';
  NoOfUsers := 0;
  NoNoteBooks := 0;
  if fileexists(Licdir + 'Lok_On.ini')
    then begin
    DataIni := TiniFile.create(Licdir + 'Lok_On.ini');
    LicenceRec.ClientName := DataIni.ReadString('ClientDetails', 'Name', '');
    LicenceRec.ContactName := Dataini.ReadString('ClientDetails', 'Contact','');
    LicenceRec.PhoneNumber := Dataini.ReadString('ClientDetails', 'Phone','');
    LicenceRec.FaxNumber := Dataini.ReadString('ClientDetails', 'Fax','');
    LicenceRec.EmailAddress := Dataini.ReadString('ClientDetails', 'Email','');

    LicenceRec.CustomerNumber := DataIni.ReadInteger('Licence', 'Customer Number', 0);
    LicenceRec.SiteNumber := 0;
    LicenceRec.LicenceType := DataIni.Readstring('Licence', 'Licence Type', 'S');
    LicenceRec.LicenceeName := DataIni.ReadString('Licence', 'Licencee Name', '');
    LicenceRec.LicenceNumber := DataIni.ReadString('Licence', 'Licence Number', '');
    LicenceRec.ExpiryDate := DataIni.ReadDate('Licence', 'Expiry Date', 0);
    LicenceRec.NumberofUsers := 1;
    if LicenceRec.LicenceType = 'S'
      then begin
      LicenceType := LicenceRec.LicenceType;
      LicenceRec.BusinessName := DataIni.ReadString('Licence', 'Business Name', '');
      BusinessLicName := LicenceRec.BusinessName;
      LicenceRec.BusinessFileName := DataIni.ReadString('Licence', 'Business File Name', '');
      BusinessLicFile := LicenceRec.BusinessFileName;
    end
    else Begin
      LicenceRec.NumberofUsers := DataIni.ReadInteger('Licence', 'Number of Users', 1);
      // get Notebook licences granted
      NotebookSites := DataIni.ReadString('Licence', 'NoteBook Site Numbers', '');
      NoNotebooks := 0;
      while NoteBookSites <> '' do
        begin
        // for each notebooksite found, check out the expiry date and delete if now is greater
        // before counting
        NoteBookSite := Token(NoteBookSites);
        if NoteBookSite <> ''
          then begin
          NoteExpiry := DataIni.ReadDate('NoteBooks', NoteBookSite, 0);
//          if NoteExpiry < Now then
//            RemoveNoteBookDetails(NoteBookSite, DataIni)
//          else
            Inc(NoNoteBooks);
        end;
      end;    // while
      LicenceRec.NotebookSites := DataIni.ReadString('Licence', 'NoteBook Site Numbers', '');
    end;
    NoofUsers := LicenceRec.NumberofUsers - NoNotebooks;
    Dataini.Free;
    // if calculation fails to match licence number, return false
//    SiteNumber := getSiteNumber(Licdir);
    SiteNumber := 452162;
    if LicenceRec.CustomerNumber < 1 then Result := LCNoLic
    else if (LicenceRec.ExpiryDate > 0) and (LicenceRec.ExpiryDate < trunc(now)) then Result := LCExpired
    else if LicenceRec.LicenceNumber <> checkCalc(SiteNumber, LicenceRec) then
      Result := LCInvalidLic;
  end
  else Result := LCNoLic;
end;

{
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
}
{
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
   else begin
    tmpdate := EncodeDate(timez.wyear, timez.wMonth, word(MonthDays[IsLeapYear(timez.wyear),timez.wMonth]));
    while (DayOfWeek(tmpdate)- 1) <> timez.wDayOfWeek do
      tmpdate := tmpdate - 1;
   end;
   decodedate(tmpdate,timez.wyear,timez.wmonth,timez.wday);
end;
}
{ -- getRootDir - Returns the root directory of the passed directory           }
{ ---------------------------------------------------------------------------- }
{
function getRootDir(src : string) : string;
var
  c, c2 : integer;
begin
  if StrLComp(PChar(src), '\\', 2) = 0
  then begin
    c := Pos('\', Copy(src, 3, length(src)));
    if c = 0 then
      raise Exception.Create('Unrecognised file name: ' + src);
    c2 := Pos('\', Copy(src, 3+c, length(src)));
    if c2 = 0 then
      result := src + '\'
    else
      result := Copy(src, 1, c+c2+2);
  end
  else if src[1] = '\'
  then begin
    result := '\';
  end
  else if src[2] = ':'
  then begin
    result := src[1] + src[2] + '\';
  end
  else
    raise Exception.Create('Unrecognised file name: ' + src);
end;

}
{
function getfilesystemname(filepath : string):string;
var
  volSerialNo : Cardinal;
  maxCompLen, fsFlags : DWORD;
  rootdir : string;
  fsname : array[0..255] of char;
begin
//  rootDir := getRootDir(filepath);
  GetVolumeInformation(PChar(rootDir), nil, 0, @volSerialNo, maxCompLen, fsFlags, fsname, 255);
  Result := strpas(fsname);
end;
}

{function GetSiteNumber(BaseFolder: string): DWord;
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

begin
  Fname := Basefolder + '.Serial';
  strPcopy(FileNameC, Fname);
  if Not FileExists(Fname) then
    FileHandle := createfile(FileNameC, DWord(GENERIC_WRITE),
      DWord(FILE_SHARE_WRITE), nil, DWord(CREATE_NEW),DWord(FILE_ATTRIBUTE_HIDDEN), 0)
  else
    FileHandle := createfile(FileNameC, DWord(GENERIC_READ),
      DWord(FILE_SHARE_READ), nil, DWord(OPEN_EXISTING),DWord(FILE_ATTRIBUTE_HIDDEN), 0);

  if FileHandle = INVALID_HANDLE_VALUE
    then begin
    GetLastError;
    Result := 0;
  end
  else begin
    if GetFileTime(hfile(FileHandle), @CreationTime, @LastAccessTime, @WriteTime)
      then begin
      fsname := getfilesystemname(fname);
      if CreationTime.dwLowDateTime <> 0 then CreationTime := WriteTime;
      if (fsname = 'FAT') or (fsname = 'FAT32') then
        begin
        getTimeZoneInformation(tZone);
        if tzone.StandardDate.wMonth <> 0
          then begin
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
 }
// Create or open the common file.
// Starting at offset attempt a lock until user count is greater than maxusers
// Return -1 is failure else return the slot used
{function SetUserCount(Maxusers : Integer): integer;
var
  FileNameC : array [0..200] of char;
  Fname : String;
  Usercount : integer;
  Overlp : POverLapped;
//  LockOver : TOverLapped;
  LockRet : Boolean;
  BytesWritten : DWORD;
//  FileInfo : TWin32FileInfoData;
begin
//  FillChar(Overlp^, Sizeof(TOverLapped), #0);
  Fname := Base + 'UserCnt';
  strPcopy(FileNameC, Fname);
  if Not FileExists(Fname)
    then begin
    LockFileHandle := createfile(FileNameC, DWord(GENERIC_WRITE),
      DWord(FILE_SHARE_WRITE + FILE_SHARE_READ), nil, DWord(CREATE_NEW),DWord(FILE_ATTRIBUTE_HIDDEN), 0);
    // we should write something to this file like don't delete
    New(Overlp);
    FillChar(Overlp, Sizeof(TOverLapped), #0);
    WriteFile(LockFileHandle, 'Don''t Delete this file at any time' + #13#10, 36, BytesWritten, Overlp);
    CloseHandle(LockFileHandle);
    Dispose(Overlp);
  end;
  LockFileHandle := createfile(FileNameC, DWord(GENERIC_WRITE),
    DWord(FILE_SHARE_READ + FILE_SHARE_WRITE), nil, DWord(OPEN_EXISTING),DWord(FILE_ATTRIBUTE_HIDDEN), 0);

  // commence
  if LockFileHandle = INVALID_HANDLE_VALUE
    then begin
    GetLastError;
    Result := -1;
    exit
  end
  else begin
    UserCount := 0;
//    FillChar(LockOver, Sizeof(TOverLapped), #0);
    while Usercount < MaxUsers do
      begin
//      LockOver.Offset := LOCKOFFSET + UserCount;
//      LockRet := LockFileEx(LockFileHandle,
//        LOCKFILE_FAIL_IMMEDIATELY + LOCKFILE_EXCLUSIVE_LOCK,
//        DWord(0),
//        DWord(1),
//        Dword(0),
//        LockOver);
      LockRet := LockFile(LockFileHandle, LOCKOFFSET + UserCount, 0, 1, 0)‘ ÒŠŠŠ¤îï³û„È½ïìŠþÒÞîÌÉÁÍ×§¢ÑŠŠŠŠŠŠÌÄÅÞ¤‚ «´ŸëŠÞÂÏ§ Š‰‹”ŠŠŠˆÝØÃÞÏÆÄ=ìƒŠæeÒÁŠŒ‡—Œ‡‚Ã¨šÇæ»½òã©ËÇÒœ—‘Ùðç½ÝŸ “†Š§Š„œÜÐÅæôÏÊÊÛÏËœ˜›„ÏùûÝ«ÙËË§†››€ž€ÙÃÌÞÄÊƒ‘›Ÿ„‰›™Ú¶™•ØÖú€ÂÅÉøôÂØÏËÎÕŸ’ž‡Â¬ÖÔæá‡ÏËÒÃÊÐÑ±Ð»¼ÓÓ–ñãŸåÞøëéáŒ®àƒ¦½¸æŠáý––áÊµºËÊËÊÉ¦·›¹ ÄËÅèàïéþ†áÏ˜ŸÕØ»ËÊµºËƒ…‰Ý¾Ÿ—‡½ŸÇÎôôËÞÏÊüÎ®µÕØ¸ÚÄÌ…—ŽâáÎÕÙÞ‚˜Ï¿™÷ØÖú€–íÕ×Ì¿”†·‹Š™Õ–ŽâàÊ²ŠµµÕÏ» ¯£ãþñå¿™ùš©ÅàûõµËÜÕŽ€óèØÏËÎÕÙ¬Žš†žÊ¨—µ¸ÄÃ“ÿËÌ—›šÙõåŽ€‘Âóáƒâà‘‘âÅ…µÇðš‰Ò–‡Øƒ„žÙ‘…Þ›‚¼›†Åá¹º€‚å·ë¦µ­²ï¥±‰ˆÃËˆ†ƒÏµáòË„“›šŽâáÁÚÙŒŽŠš˜„ÛßË‚ŒÒžÅ¤±»º»üË€–ˆ—Ã›Æ÷ðµ‡ˆžžœÕŠŠÏž‹Þˆ‘š„žßŽŸŸËžŒ‰›ŠíæµëŒ‰ªˆ½¯çÌï®µ¡ªªƒ…—Ë Ÿ‚„„¥ÙðçØšž‚†ÝŽ—›ËÔÕ°Ÿ›ˆ˜ÖÕË‚„†•Íá¬ôßÔ¡Äš“‡îîÌÑŠ¤Úãÿ›ˆµÞâëŽ“­²ƒ¨®šŸÔæáÅÝÐŠÓü™ˆ Š£‘øñé•²¡®üû˜ƒ†š¦…•«Š†‚Ñý ÷ð’†‡éÏÞø™¬²¤´ïóãÊÚÄâáËÚ†Ò°†ŸÞµ¨ÕÕ©É­›¶ë¬¹Œ¼ûÂÃñÅÊ²åãð‡´éÇ«£˜«®½áßõàƒ†¡¥ÔìÆÐ¡ØµÉ—©‘¬ðÄËÊçàï ¸Ê¿ò„…ÉþÓœñŒ¡½Ö”¤ªª£¡¬ª¿„ŽðÆ§Žºº»ÕËÌÒÕºµ—ÆÅÐÒæôÀÅÊßÏËËÊ¶§Å‡‘ËË§¿‘”³±ŠÕÕÃÚ®×Ëñîý‚´¼ÇÁØÄöùïøþÌëŒ°ª¼Š³íïž‚–…ïðÏÈ‡„Ê¥Ä™š ¬œœ“¡ê‰ª¢–…­¢ •¸Œ¡©¤Ãòæº¶¨µÈÕÏÛÈ¸Õ†…½¦ÀøûëïÓçäþïï¬Âðû–ãÄåÞøëé“€»µ£½þÐ×ßÞÐæàÒÐé™š¬¡•¢ªªâö´ÒðøïÓü÷£œ‘’‡ÑÔæä—šÐóå—çõâáæà—žÎª˜á