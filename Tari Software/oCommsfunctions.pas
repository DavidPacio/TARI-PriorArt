{*******************************************************************************

  © Hartley Australia Pty Ltd 1999

  HiCommsFunctions.pas : Communications related functions for use by components.

*******************************************************************************}

unit OCommsFunctions;

interface

uses Classes;

// 26.06.99 djh Moved from HfwCommon
function TranslateMapiErrorCode(MError : integer) : string;
function SendEmail(recipient, cc, bcc, subject, text : string; attachFileB : boolean=false; fileNames : TStringList=nil) : cardinal;
function SendFax(recipient, faxNumber, subject: string; text : TStrings) : cardinal;
function checkmailname(const firstname, surname: string; var displayname, emailaddress : string; dialog : Boolean) : cardinal;
function MAPIEnabled: boolean; // 08.07.99 djh moved from HfwTypes

implementation

uses Windows, mapi, SysUtils;

const  MAPI_REGISTRY_KEY = 'SOFTWARE\Microsoft\Windows Messaging Subsystem';

function TranslateMapiErrorCode(MError : integer) : string;
begin
  case MError of
    MAPI_E_AMBIGUOUS_RECIPIENT:      result := 'An ambiguous recipient name was specified. No message was sent.';
    MAPI_E_ATTACHMENT_NOT_FOUND:     result := 'The specified attachment was not found; no message was sent.';
    MAPI_E_ATTACHMENT_OPEN_FAILURE:  result := 'The specified attachment could not be open; no message was sent.';
    MAPI_E_BAD_RECIPTYPE:            result := 'The type of a recipient was not MAPI_TO, MAPI_CC, or MAPI_BCC. No message was sent.';
    MAPI_E_FAILURE:                  result := 'Error(s) occurred when trying to send the message, but the details were not communicated back to this program; no message was sent.';
    MAPI_E_INSUFFICIENT_MEMORY:      result := 'There was insufficient memory to proceed. No message was sent.';
    MAPI_E_LOGIN_FAILURE:            result := 'Failed to log on to e-mail system; no message was sent.';
    MAPI_E_TEXT_TOO_LARGE:           result := 'The text in the message was too large to sent; the message was not sent.';
    MAPI_E_TOO_MANY_FILES:           result := 'There were too many file attachments; no message was sent.';
    MAPI_E_TOO_MANY_RECIPIENTS:      result := 'There were too many recipients; no message was sent.';
    MAPI_E_UNKNOWN_RECIPIENT:        result := 'A recipient was specified who does not appear in the address list; no message was sent.';
    MAPI_E_USER_ABORT:               result := 'Message aborted at user''s request. No message has been sent.';
    SUCCESS_SUCCESS:                 result := 'Message has been sent.';
    MAPI_E_DISK_FULL:                result := 'Hard Disk is full. No room for your message';
    MAPI_E_ACCESS_DENIED:            result := 'Your email client has denied access. Check installation';
    MAPI_E_TOO_MANY_SESSIONS:        Result := 'Too many sessions open to your email client. Try again later.';
    MAPI_E_ATTACHMENT_WRITE_FAILURE: Result := 'Unable to write to your attached document.';
    MAPI_E_INVALID_MESSAGE:          Result := 'Message Contents or structure is invalid.';
    MAPI_E_INVALID_SESSION:          Result := 'Invalid Session with your email client. Try again later.';
    MAPI_E_TYPE_NOT_SUPPORTED:       Result := 'Message type is not supported by your email client.';
    MAPI_E_MESSAGE_IN_USE:           Result := 'Requested message is in use. Try again later.';
    MAPI_E_NETWORK_FAILURE:          Result := 'Network failure. Try to reconnect later.';
    MAPI_E_INVALID_EDITFIELDS:       Result := 'Invalid edit fields. Check addresses for unusual characters';
    MAPI_E_INVALID_RECIPS:           Result := 'Non existent or invalid recipient addresse(s).';
    MAPI_E_NOT_SUPPORTED:            Result := 'Communication for your email client is not supported.';
  end;
end;

function SendEmail(recipient, cc, bcc, subject, text : string; attachFileB : boolean; fileNames : TstringList) : cardinal;
var
  I: Integer;
  MapiMessage: TMapiMessage;
  MapiRecip: array[1 .. 3] of TMapiRecipDesc;
  MapiFiles: array[1 .. 2] of TMapiFileDesc;
	TempPath : array[1..2] of PAnsichar; //array[0 .. 200] of char;
  TempFile : array[1..2] of PAnsichar;
  dname, ename : string;
begin
  with MapiMessage do begin
    ulReserved         := 0;
		lpszSubject        := PAnsiChar(AnsiString(subject));
		lpszNoteText       := PAnsiChar(AnsiString(text));
    lpszMessageType    := nil;
    lpszDateReceived   := nil;
		lpszConversationID := nil;
    flFlags            := 0;
    lpOriginator       := nil;
    nRecipCount        := 1;
    lpRecips           := @MapiRecip;
    if attachFileB and (FileNames <> nil)
      then begin
      nFileCount := fileNames.count;
      lpFiles    := @MapiFiles;
      for I := 1 to nFileCount do    // Iterate
        begin
        with MapiFiles[I] do begin
          ulReserved   :=  0;
          flFlags      := 0;
          nPosition    := I - 1;
          Getmem(TempPath[I], 200);
          Getmem(tempfile[I], 200);
					lpszPathName := StrPCopy(TempPath[I], AnsiString(fileNames.strings[I - 1]));
          if fileNames.Strings[I - 1] <> '' then
            lpSzFileName := StrpCopy(TempFile[I], AnsiString(ExtractFileName(fileNames.strings[I - 1])))
         else
            lpszFileName := StrPCopy(lpszFileName,'Blank.htm');
          lpFileType := nil; //StrPCopy(tempType, 'htm');
        end;
      end;    // for
    end
    else begin
      nFileCount := 0;
      lpFiles := nil;
    end;
  end;

  with MapiRecip[1] do begin
    dname := '';
    ename := '';
    if Length(Recipient) > 0 then
      CheckmailName(Recipient, '', dname, ename, True);
    ulReserved   := 0;
    ulRecipClass := MAPI_TO;
		lpszName     := PAnsiChar(AnsiString(dname));
		lpszAddress  := PAnsichar(AnsiString(ename));
		ulEIDSize    := 0;
    lpEntryID    := nil;
  end;

  if cc <> '' then with MapiRecip[MapiMessage.nRecipCount+1] do begin
    dname := '';
    ename := '';
    if Length(cc) > 0 then
      CheckmailName(cc, '', dname, ename, True);
    ulReserved   := 0;
    ulRecipClass := MAPI_CC;
		lpszName     := PAnsiChar(AnsiString(cc));
    lpszAddress  := nil;
    ulEIDSize    := 0;
    lpEntryID    := nil;
    inc (MapiMessage.nRecipCount);
  end;

  if bcc <> '' then with MapiRecip[MapiMessage.nRecipCount+1] do begin
    dname := '';
    ename := '';
    if Length(bcc) > 0 then
      CheckmailName(bcc, '', dname, ename, True);
    ulReserved   := 0;
    ulRecipClass := MAPI_BCC;
		lpszName     := PAnsiChar(AnsiString(bcc));
    lpszAddress  := nil;
    ulEIDSize    := 0;
    lpEntryID    := nil;
    inc (MapiMessage.nRecipCount);
  end;

  result := MapiSendMail(0, 0, MapiMessage, MAPI_LOGON_UI, 0);
  if fileNames <> nil
    then begin
    for I := 1 to fileNames.count do   // Iterate
      begin
      freemem(TempPath[I]);
      freemem(TempFile[I]);
    end;    // for
  end;
//  if attachFileB andthen
//    DeleteFile(FileName);
end;

function SendFax(recipient, faxNumber, subject: string; text : TStrings) : cardinal;
var
	MapiMessage: TMapiMessage;
  MapiRecip: TMapiRecipDesc;
  MapiFiles: array[1 .. 1] of TMapiFileDesc;
	TempPath, TempFile : array[0 .. 200] of Widechar;
begin
	GetTempPath(200, TempPath);
  GetTempFileName(TempPath, 'fax', 0, TempFile);
  text.SaveToFile (TempFile);
  with MapiMessage do begin
    ulReserved   := 0;
		lpszSubject  := PAnsiChar(AnsiString(subject));
    lpszNoteText := nil;
    lpszMessageType := nil;
    lpszDateReceived := nil;
    lpszConversationID := nil;
    flFlags      := 0;
    lpOriginator := nil;
    nRecipCount  := 1;
    lpRecips     := @MapiRecip;
    nFileCount   := 1;
    lpFiles      := @MapiFiles;
  end;

  with MapiFiles[1]  do begin
	  ulReserved   :=  0;
	  flFlags      := 0;
	  nPosition    := 0;
		lpszPathName := PansiChar(@TempFile);
		lpszFileName := PAnsiChar(AnsiString(ExtractFileName(string(TempFile))));
	  lpFileType   := nil;
  end;

  with MapiMessage do begin
    nFileCount := 0;
    lpFiles    := nil;
		lpszNoteText := PAnsiChar(AnsiString(text.text));
  end;

  with MapiRecip do begin
    ulReserved   := 0;
    ulRecipClass := MAPI_TO;
		lpszName     := PAnsiChar(AnsiString(recipient));
		lpszAddress  := PAnsiChar(AnsiString('FAX:'+faxNumber));
    ulEIDSize    := 0;
    lpEntryID    := nil;
  end;

  result := MapiSendMail(0, 0, MapiMessage, MAPI_LOGON_UI, 0);
  DeleteFile(TempFile);
end;

function checkmailname(const firstname, surname: string; var displayname, emailaddress : string; dialog : Boolean) : cardinal;
var
  PMapiRecip: PMapiRecipDesc;
	TempName : array[0 .. 200] of Ansichar;
begin
// try with firstname surname order
  if length(Surname) > 0 then
		StrPCopy(tempname, AnsiString(firstname+' '+surname))
  else
    StrPCopy(tempname, AnsiString(firstname));
  if dialog then
		result := MapiResolveName(0, 0, tempname, MAPI_DIALOG,0, PmapiRecip)
  else
    result := MapiResolveName(0, 0, tempname, MAPI_LOGON_UI, 0, PmapiRecip);
  // this failed
//  if Result > 0
//    then begin
//    StrPCopy(tempname, surname+', '+firstname);
//    result := MapiResolveName(0, 0, tempname, MAPI_DIALOG,0, PmapiRecip);
//  end;
  if Result = 0
    then begin
		DisplayName := String(StrPas(PMapirecip^.lpszName));
    EmailAddress := String(strPas(PMapirecip^.lpszAddress));
  end;
  if PMapiRecip <> nil then
    MapiFreeBuffer(PMapiRecip);
end;


{
  MAPIEnabled
  Checks to see if MAPI is enabled on the current machine and returns the result.
  If MAPI is not enabled then e-mail cannot work.
}
function MAPIEnabled: boolean;
var
  length: longint;
  key: HKEY;
  tempKey : array[0 .. 100] of char;
  DataType: Integer;
begin
  length := 100;

  if RegOpenKeyEx(HKEY_LOCAL_MACHINE, MAPI_REGISTRY_KEY, 0, KEY_ALL_ACCESS, key) <> ERROR_SUCCESS then
    begin
      result := False;
      exit;
    end;

  if RegQueryValueEx(key, 'MAPI', nil,  @DataType, @tempKey, @length) <> ERROR_SUCCESS then
    Result := false
  else
    Result := true;

  RegCloseKey(key);
end;

end.

