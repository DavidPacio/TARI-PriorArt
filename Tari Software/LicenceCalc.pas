 unit LicenceCalc;

interface

uses Windows, Messages, SysUtils, Controls, Classes, auchtypes, ExtCtrls,
     strUtils;

type

  TLicenceRecPtr = ^TLicenceRecType; TLicenceRecType = record
		BusinessName : String;
//    ContactName : String[100];
		FirstName : String;
		LastName : String;
		Address1: String;
		Address2: String;
		Suburb : string;
		State : string;
		Postcode : string;
		Country : string;
		PhoneNumber : string;
		FaxNumber : String;
		EmailAddress : string;
		SerialNumber : String;
		Channel_ID : Integer;
		SiteNumber : Integer;
		LicenceeName : string;
		LicenceType : string;
		BusinessFileName :String;
		AttemptedBusinessName :String;
		ExpiryDate : TDateTime;
		NumberofUsers : integer;
		LicenceNumber : string;
		CountryPhCode : string;
		LongDistCode : String;
		Computername : string;
		OperatingSystemName : String;
    OSVersion : string;
    BusinessID : integer;
    LicenceMethod : integer;  {0 = Manual, 1 = email, 2 = internet}
    UpdateLog : integer;  {really a boolean}
  end;

  function CheckCalc(SiteNumber : integer; LicenceRec : TLicenceRecType): string;

implementation


function standardiseName(const Name : string) : string;
var
  i : integer;
  temp, temp1, temp2 : string;
  c : integer;
begin
  temp := UpperCase(Name);
  // eliminate non standard characters
  for i := 1 to length(temp)
  do begin
    c := Ord(temp[i]);
    if (c < Ord('0')) or ((c > Ord('9')) and (c < Ord('A'))) or (c > Ord('Z')) then
      temp[i] := ' ';
  end;

  // squeeze out any occurence of 'AND'
  repeat
    c := pos(' AND ', temp);
    if (c > 0) then begin
       temp1 := Copy(temp, 1, c);
       if length(temp) > c+4 then
         temp2 := Copy(temp, c+5, length(temp)-c-4)
       else temp2 := '';
       temp := temp1 + temp2;
    end;
  until c = 0;

  // Reduce 'COMPANY' to "CO'
  repeat
    c := pos(' COMPANY', temp);
    if c > 0 then begin
      temp1 := Copy(temp, 1, c+2);
      if length(temp) > c+7 then
        temp2 := Copy(temp, c+8, length(temp)-c-7)
      else temp2 := '';
      temp := temp1 + temp2;
    end;
  until c = 0;

  // remove trailing spaces
  temp := TrimRight(temp);

  // if ' CO' is trailing, remove
  if Copy(temp, length(temp)-2, 3) = ' CO' then
    temp := Copy(temp, 1, length(temp)-3);

  // strip out spaces and return
  result := '';
  for c := 1 to length(temp) do
    if temp[c] <> ' ' then
      result := result + temp[c];
end;


function CheckCalc(SiteNumber : integer; LicenceRec : TLicenceRecType): string;
var
  modifiedBusinessName, modifiedLicenceeName{, modifiedCode}, modifiedSerial : string;
  i : integer;
  CalcValue :Dword;
  ISFileLicence : Boolean;
begin
  ModifiedBusinessName := standardiseName(LicenceRec.BusinessName);
  ModifiedLicenceeName := standardiseName(LicenceRec.LicenceeName);
  Modifiedserial := standardiseName(LicenceRec.SerialNumber);

  // SiteNumber
  CalcValue := SiteNumber;
  isFileLicence := False;
  LicenceRec.LicenceType := 'N'; // Always unless '08' type
  if (Leftstr(LicenceRec.SerialNumber, 2) = '08') then
    begin
    CalcValue := 0; // we ignore the site number
    IsFileLicence := True;
    LicenceRec.LicenceType := 'S';
    end;

  if (LicenceRec.LicenceType = 'S') then
    Begin
    // Business Name
    for i := 1 to Length(ModifiedBusinessName) do
      calcValue :=  (calcValue mod 3633) * 15271 + Ord(ModifiedBusinessName[i]);
    // BusinessFileName
    for i := 1 to Length(LicenceRec.BusinessFileName) do
      calcValue := (calcValue mod 11312) * 12443 + Ord(LicenceRec.BusinessFileName[i]);
    // advisorSerialNumber
    if (isFileLicence) then
      calcValue := (calcValue mod 10401) * 11745 + dword(LicenceRec.Channel_ID);
    end;
  // Licencee Name
  for i := 1 to Length(ModifiedLicenceeName) do
    calcValue :=  (calcValue mod 5234) * 19743 + Ord(ModifiedLicenceeName[i]);
  // SerialNumber
  for i := 1 to Length(Modifiedserial) do
    calcValue :=  (calcValue mod 5122) * 12766 + Ord(Modifiedserial[i]);
//  calcValue := CalcValue + dword(LicenceRec.CustomerNumber);
  // Licence Type
  for i := 1 to Length(LicenceRec.LicenceType) do
    calcValue := (calcValue mod 877) * 10588 + Ord(LicenceRec.LicenceType[i]);
  calcValue := CalcValue + dword(LicenceRec.NumberofUsers);
  CalcValue := CalcValue + DWord(Trunc(LicenceRec.ExpiryDate) * 47);
  while (calcValue < 100000) do
    inc(calcValue, 9653);

  while (calcValue > 999999) do
    dec(calcValue, 765443);

  result := inttostr(CalcValue);
end;


end.
