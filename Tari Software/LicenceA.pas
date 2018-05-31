unit LicenceA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, cxDropDownEdit, cxCalendar, cxMaskEdit,
  cxButtons, cxTextEdit, cxGroupBox, cxContainer, cxEdit, cxLabel, cxPC,
  cxControls, {ACurrencyEdit,} inifiles, DataCollector,
	auchtypes, mapi, ocommsfunctions, LicenceEngine, licenceCalc,
  Mask, comctrls, dateutils, Registry, LGlobals, DMrep1U,
  DMUsers, strutils, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxPCdxBarPopupMenu, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, dxCore;

type

  TLicenceFA = class(TForm)
    PrintDialog1: TPrintDialog;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxGroupBox1: TcxGroupBox;
    cxLabel11: TcxLabel;
    SerialNumber: TcxMaskEdit;
    cxLabel3: TcxLabel;
    cxLabel8: TcxLabel;
    LicenceeNameS: TcxTextEdit;
    cxLabel10: TcxLabel;
    EmailAddressS: TcxTextEdit;
    TrialLicenceBtn: TcxButton;
    cxLabel14: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel2: TcxLabel;
    cxButton1: TcxButton;
    PrintLicReqBtn: TcxButton;
    SendEmailBtn: TcxButton;
    OnLineBtn: TcxButton;
    cxLabel13: TcxLabel;
    CloseBtn: TcxButton;
    cxLabel1: TcxLabel;
    SupplierIDLbl: TcxLabel;
    SupplierID: TcxMaskEdit;
    AdvisorSerialNote: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    SiteIDS: TcxTextEdit;
    cxLabel16: TcxLabel;
    cxLabel17: TcxLabel;
    ExpirydateDE: TcxDateEdit;
    cxLabel18: TcxLabel;
    LicNumber: TcxTextEdit;
    cxLabel7: TcxLabel;
    cxLabel6: TcxLabel;
    cxGroupBox3: TcxGroupBox;
    cxLabel21: TcxLabel;
    cxLabel23: TcxLabel;
    BusinessName: TcxTextEdit;
    StateRegionLbl: TcxLabel;
    Postcodelbl: TcxLabel;
    PhoneNumS: TcxTextEdit;
    Countrylbl: TcxLabel;
    BusinessFileName: TcxTextEdit;
    BusinessFileNameNote: TcxLabel;
    Address: TcxTextEdit;
    Suburb: TcxTextEdit;
    PostCode: TcxTextEdit;
    StateRegion: TcxTextEdit;
    cxLabel22: TcxLabel;
    cxLabel29: TcxLabel;
    cxLabel30: TcxLabel;
    BusinessFileNameLbl: TcxLabel;
    FaxNumS: TcxTextEdit;
    ContactFirstNameS: TcxTextEdit;
    cxLabel19: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel26: TcxLabel;
    Country: TcxComboBox;
    GetBusNameBtn: TcxButton;
    ContactLastNameS: TcxTextEdit;
    cxLabel24: TcxLabel;
    cxLabel25: TcxLabel;
    cxLabel20: TcxLabel;
    procedure FormActivate(Sender: TObject);
    procedure SendEmailBtnClick(Sender: TObject);
    procedure PrintLicReqBtnClick(Sender: TObject);
    procedure ApplyFullLicenceBtnClick(Sender: TObject);
    procedure SerialNumberAfterExit(Sender: TObject);
    procedure TrialLicenceBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OnLineBtnClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ExpirydateDEPropertiesCloseUp(Sender: TObject);
    procedure BusinessNameExit(Sender: TObject);
    procedure GetBusNameBtnClick(Sender: TObject);
    procedure LicenceeNameSEnter(Sender: TObject);
  private
    { Private declarations }
    ApplicationSent : Boolean;
    procedure GetInput;
    procedure SetInput;
    procedure PrepareEmailAttachment(Filename: String);
    function PreparePrintout : TRichEdit;
  public
    { Public declarations }

  end;

var
  LicenceFA: TLicenceFA;

implementation

{$R *.DFM}

procedure TLicenceFA.FormActivate(Sender: TObject);
begin
  ApplicationSent := False;
  SendEmailBtn.visible := MapiEnabled;
  if LicEngine.LicenceRec.LicenceNumber = '' then
    LicEngine.LicenceRec.ExpiryDate := Trunc(now + 14);
  if LicEngine.LicenceRec.ExpiryDate >= Now then
    ExpiryDateDE.Date := LicEngine.LicenceRec.ExpiryDate
  else
    begin
    ExpiryDateDE.date := 0;
    LicEngine.LicenceRec.ExpiryDate := 0;
    end;
  SetInput;
  refresh;
end;

procedure TLicenceFA.GetInput;
var
  tempdate : TDateTime;
begin
  LicEngine.LicenceRec.businessname := Businessname.Text;
  LicEngine.LicenceRec.Address1 := Address.Text;
  LicEngine.LicenceRec.Suburb := Suburb.Text;
  LicEngine.LicenceRec.State := StateRegion.Text;
  LicEngine.LicenceRec.Postcode := Postcode.Text;
  LicEngine.LicenceRec.Country := Country.Text;
  LicEngine.LicenceRec.BusinessFileName := BusinessFileName.Text;
//  LicEngine.LicenceRec.ContactName := ContactFirstNameS.Text + ' + ' + ContactLastNameS.Text;
  LicEngine.LicenceRec.firstName := ContactFirstNameS.Text;
  LicEngine.LicenceRec.LastName := ContactLastNameS.Text;
  LicEngine.LicenceRec.PhoneNumber := PhoneNums.Text;
  LicEngine.LicenceRec.FaxNumber := FaxNums.Text;
  LicEngine.LicenceRec.EmailAddress := EmailaddressS.Text;
  LicEngine.LicenceRec.SerialNumber := SerialNumber.text;
  LicEngine.LicenceRec.Channel_ID := StrToInt(SupplierID.Text);
  LicEngine.LicenceRec.LicenceeName := LicenceeNameS.Text;
  LicEngine.LicenceRec.SiteNumber := strtoint(SiteIDS.Text);
  LicEngine.LicenceRec.LicenceType := 'N';
  LicEngine.LicenceType := LicEngine.LicenceRec.LicenceType;
  LicEngine.LicenceRec.NumberofUsers := 1;
  tempdate := 0;
  LicEngine.LicenceRec.ExpiryDate := 0;
  if ExpiryDateDE.Date > 0 then
    tempDate := ExpiryDateDE.date;
  if tempDate >= trunc(now) then
     LicEngine.LicenceRec.ExpiryDate := trunc(tempdate);
  if Licnumber.Text > '' then
    LicEngine.LicenceRec.LicenceNumber := LicNumber.text;
end;

procedure TLicenceFA.SetInput;
begin
  Businessname.Text := LicEngine.LicenceRec.businessname;
  Address.Text := LicEngine.LicenceRec.Address1;
  Suburb.Text := LicEngine.LicenceRec.Suburb;
  StateRegion.Text := LicEngine.LicenceRec.State;
  Postcode.Text := LicEngine.LicenceRec.Postcode;
  Country.Text := LicEngine.LicenceRec.Country;
  BusinessFileName.Text := LicEngine.LicenceRec.BusinessFileName;
  ContactFirstNameS.Text := LicEngine.LicenceRec.FirstName;
  ContactLastNameS.Text := LicEngine.LicenceRec.LastName;

  PhoneNums.Text := LicEngine.LicenceRec.PhoneNumber;
  FaxNums.Text := LicEngine.LicenceRec.FaxNumber;
  EmailaddressS.Text := LicEngine.LicenceRec.EmailAddress;
  SerialNumber.text := LicEngine.LicenceRec.SerialNumber;
  SupplierID.text := inttostr(LicEngine.LicenceRec.Channel_ID);
  LicenceeNameS.Text := LicEngine.LicenceRec.LicenceeName;
  SiteIDS.Text :=  inttostr(LicEngine.LicenceRec.SiteNumber);
  SupplierID.Text := inttostr(LicEngine.LicenceRec.Channel_ID);
  if LicEngine.LicenceRec.ExpiryDate > 0 then
    ExpiryDateDE.Date := LicEngine.LicenceRec.ExpiryDate
  else
    ExpiryDateDE.Date := now + 7;
  LicNumber.text := LicEngine.LicenceRec.LicenceNumber;
end;

procedure TLicenceFA.SendEmailBtnClick(Sender: TObject);
var
//  EmailAttachment : TStrings;
  emailText, attachedFiles : TStringList;
  MError: Cardinal;
  emailAddress, bccAddress : string;
  AttachmentFile : string;
  toNameS : string;
  p : pChar;
begin
//  if (Length(LicenceeNameS.text) < 1) then
//     LicenceeNameS.Text := BusinessName.Text;
  if (Length(LicenceeNameS.text) < 1) then
    begin
    MessageDlg('Please enter your Business Name and/or Licencee Name', MTInformation, [MBOk], 0);
    LicenceeNameS.SetFocus;
    exit;
    end;
  if not LicEngine.ValidSerialNumber(SerialNumber.text) then
    begin
    Messagedlg('Please enter the correct serial number found on the CD', MTInformation, [MBOK], 0);
    SerialNumber.SetFocus;
    exit;
    end;
  Screen.Cursor := crHourglass;
  getinput;
  LicEngine.SaveLicenceRecord;
  AttachmentFile := GGlobals.Basedir + 'TariLicRequest.lok';
  try
    prepareEmailAttachment(Attachmentfile);
    Emailtext := TStringList.Create;
    AttachedFiles := TStringList.Create;
    AttachedFiles.add(Attachmentfile);
    try
      with emailtext do
      begin
        toNameS := 'Admin (TARI for Business Licencing)';
        p := strScan(PChar(toNameS), ':');
        if p <> nil then toNameS := string(p+1);
        Add('To:' + #9 + toNameS);
        Add('');
        Add('Date:' + #9 + FormatDateTime('dddd d mmmm yyyy h:nn am/pm', Now));
        Add('');
        Add('Please supply a TARI for Business licence number as per attachment:');
      end;    // with
      emailAddress := 'trevorwatters@icloud.com';
      bccAddress := '';
      MError := SendEmail(emailAddress, '', bccAddress, 'TARI for Business Licence Application', emailText.Text, True, attachedfiles);
//      MError := SendEmail(emailAddress, '', bccAddress, globalsT.licenceT.ProgramName + ' Licence Application', emailText.Text);
      case MError of
        MAPI_E_USER_ABORT,
        SUCCESS_SUCCESS:
        begin
          MESSAGEDLG('Email has been sent.' + #13#10 + 'Please press the ''Close Button'' and wait for the email licence to be received.', mtinformation, [mbOK], 0);
//       messagedlg('Benchmark One will now close.', mtInformation, [mbOK], 0);
//        modalResult := mrOK;
        //Close;
        end;
      else
        begin
          MessageDlg('Error sending mail.' + #13#10 + 'The email may have been sent anyway, please call 1800 62 64 65', mtError, [mbOK], 0);
        end;
      end;
    finally
      emailText.Free;
      AttachedFiles.free;
      ApplicationSent := True;
      TrialLicenceBtn.Enabled := True;
    end;
  finally
    screen.Cursor := crDefault;
  end;
end;

procedure TLicenceFA.PrepareEmailAttachment(Filename: String);
var
  DataIni : TIniFile;
begin
  if fileexists(fileName) then deletefile(fileName);
  DataIni := TiniFile.create(filename);
  DataIni.WriteString('Licencee Details', 'Business Name', LicEngine.LicenceRec.businessname);
//  DataIni.WriteString('Licencee Details', 'Contact', LicEngine.LicenceRec.ContactName);
  DataIni.WriteString('Licencee Details', 'FirstName', LicEngine.LicenceRec.FirstName);
  DataIni.WriteString('Licencee Details', 'LastName', LicEngine.LicenceRec.LastName);
  DataIni.WriteString('Licencee Details', 'Address', LicEngine.LicenceRec.Address1);
  DataIni.WriteString('Licencee Details', 'Suburb', LicEngine.LicenceRec.Suburb);
  DataIni.WriteString('Licencee Details', 'State', LicEngine.LicenceRec.State);
  DataIni.WriteString('Licencee Details', 'Post Code', LicEngine.LicenceRec.Postcode);
  DataIni.WriteString('Licencee Details', 'Country', LicEngine.LicenceRec.Country);
  DataIni.WriteString('Licencee Details', 'Phone', LicEngine.LicenceRec.PhoneNumber);
  DataIni.WriteString('Licencee Details', 'Fax', LicEngine.LicenceRec.FaxNumber);
  DataIni.WriteString('Licencee Details', 'Email', LicEngine.LicenceRec.EmailAddress);
  DataIni.WriteString('Licence', 'Serial Number', LicEngine.LicenceRec.SerialNumber);
  DataIni.WriteInteger('Licence', 'Supplier ID', LicEngine.LicenceRec.Channel_ID);
  DataIni.WriteString('Licence', 'Computer Name', GGlobals.servers.CurrentServer.ServerName);
  DataIni.writeString('Licence', 'Operating System', GGlobals.GetOperatingSystem);
  DataIni.Writeinteger('Licence', 'Site Number', LicEngine.LicenceRec.SiteNumber);
  DataIni.WriteInteger('Licence', 'BusinessID', LicEngine.LicenceRec.BusinessID);
  DataIni.Writestring('Licence', 'Licence Type', LicEngine.LicenceRec.LicenceType);
  DataIni.WriteString('Licence', 'Licencee Name', LicEngine.LicenceRec.LicenceeName);
  DataIni.WriteString('Licence', 'BusinessFileName', LicEngine.LicenceRec.BusinessFileName);
  DataIni.WriteString('Licence', 'Licence Number', LicEngine.LicenceRec.LicenceNumber);
  if LicEngine.LicenceRec.ExpiryDate > 0 then
    DataIni.WriteString('Licence', 'Expiry Date', FormatDateTime('yyyy/mm/dd', LicEngine.LicenceRec.ExpiryDate));
  DataIni.WriteString('Licence', 'Version', Versioninfo);
  Dataini.Free;
end;

procedure TLicenceFA.PrintLicReqBtnClick(Sender: TObject);
var
  richEd : TRichEdit;
begin
//  if (Length(LicenceeNameS.text) < 1) then
//     LicenceeNameS.Text := BusinessName.Text;
  if (Length(LicenceeNameS.text) < 1) then
    begin
    MessageDlg('Please enter your Business Name and/or Licencee Name', MtInformation, [MbOK], 0);
    LicenceeNameS.SetFocus;
    exit;
    end;
  if not LicEngine.ValidSerialNumber(SerialNumber.text) then
  begin
    MessageDlg('Please enter the correct serial number found on the CD', MtInformation, [MbOK], 0);
    SerialNumber.SetFocus;
    exit;
  end;
  Screen.Cursor := crHourglass;
  getinput;
  LicEngine.SaveLicenceRecord;
  richEd := nil;
  try
    richEd := preparePrintout;
    if PrintDialog1.Execute then
    begin
      richEd.Print('Printing ... ');
//      ModalResult := mrOK;
      //Close;
      ApplicationSent := True;
      TrialLicenceBtn.Enabled := True;
    end
    else MessageDlg('Printout Cancelled.', mtInformation, [mbOK], 0);
  finally
    screen.Cursor := crDefault;
    richEd.Free;

  end;
end;

function TLicenceFA.PreparePrintout : TRichEdit;
begin
  result := TRichEdit.Create(self);
  with result do
  begin
    visible := false;
    Parent := Self;
    paragraph.tabcount:=1;
    paragraph.Tab[0] := 120;
    paragraph.FirstIndent := 20;
    defAttributes.Height := 16;
    defAttributes.Name := 'Arial';
    with Lines do
    begin
      Clear;
      Add('');
      Add('');
      Selattributes.Style := [fsBold];
      Add('Fax this Licence request to ''Focus Based Management Pty Ltd'' on (02) 9454 8566');
      Selattributes.Style := [];
      Add('');
      Add('To:' + #9 + 'Admin');
      Add('Date:' + #9 + FormatDateTime('dddd d mmmm yyyy h:nn am/pm', Now));
      Add('');
      Add('From:' + #9 + LicenceeNameS.Text);
      Add(#9 + ContactFirstNameS.Text + ' ' + ContactLastNameS.Text);
      Add('');
      Add('Phone:' + #9 + 'Please Enter before faxing (____)______________________');
      Add('Fax:' + #9 + 'Please Enter before faxing (____)______________________');
      Add('Email Address:' + #9 + EmailAddressS.Text);
      Add('');
      Add('Please supply a TARI for Business licence number as detailed below:');
      paragraph.Tab[0] := 170;
      Add('');
      Add('Serial Number:' + #9 + SerialNumber.Text);
      Add('Computer Name:' + #9 + GGlobals.Servers.CurrentServer.ServerName);
      Add('Operating System:' + #9 + GGlobals.GetOperatingSystem);
      Add('Site Number:' + #9 + SiteIDS.text);
//      Add('Business ID:' + #9 + CompanyIDs.text);
      Add('Business Name:' + #9 + BusinessName.Text);
      Add('Business File Name:' + #9 + BusinessFileName.Text);
      Add('Licencee Name:' + #9 + LicenceeNameS.Text);
      if Leftstr(SerialNumber.Text, 2) = '07' then
        Add('Licence Type:'  + #9 + 'Site')
      else
        begin
        Add('Licence Type:'  + #9 + 'File');
        Add('Supplier ID:'  + #9 + SupplierID.Text);
        end;
//      if trunc(DateEdit1.date) > trunc(now) then
//        Add('Licence Expiry Date:' + #9 + DateEdit1.text);
      if CompareDate(ExpiryDateDE.Date, now) >= 0 then
        Add('Licence Expiry Date:' + #9 + formatDateTime('c', ExpiryDateDE.date));
      Add('TARI for Business Release:' + #9 + VersionInfo);
      Add('');
    end;
  end;
end;

procedure TLicenceFA.ApplyFullLicenceBtnClick(Sender: TObject);
var
  ret : TLicCheck;
begin
  if Length(LicNumber.Text) < 1 then
    messagedlg('You need a Licence Number before you can check your licence.', mtWarning, [mbOK], 0)
  else
  if Not LicEngine.ValidSerialNumber(SerialNumber.text) then
    messagedlg('Please enter the Serial Number from the CD or your licence.', mtWarning, [MBOK], 0)
  else
    begin
    getinput;
    LicEngine.LicenceRec.LicenceMethod := 0;
    LicEngine.SaveLicenceRecord;
    ret := LicEngine.CheckLicenceDetails;
    if (ret = LCLicOk) or (ret = LCGrace) then
      messagedlg('TARI for Business is licenced.' + #13#10 + 'Press the ''Close'' button to start using TARI for Business', mtInformation, [MBOK], 0)
    else
      messagedlg('Licencing has failed. Please check the details you have entered against with the Licence details.', mtWarning, [MBOK], 0);
    end;
end;

procedure TLicenceFA.SerialNumberAfterExit(Sender: TObject);
begin
  if (not LicEngine.BlankSerialNumber(SerialNumber.text)) and (not LicEngine.ValidSerialNumber(SerialNumber.text)) then
    SerialNumber.SetFocus;
end;

procedure TLicenceFA.TrialLicenceBtnClick(Sender: TObject);
begin
  if LicEngine.TestTrialDate then
    begin
//    DateEdit1.Date := incDay(Now, 5);
    if Not LicEngine.ValidSerialNumber(SerialNumber.text) then
      begin
      Messagedlg('Please enter the serial number on your CD and try again.', MtInformation, [MbOK], 0);
      exit;
      end;

    ExpiryDateDE.Date := incDay(Now, 5);
    getinput;

    LicEngine.SiteNumber := LicEngine.getSiteNumber(GGlobals.Licdir);
    LicEngine.LicenceRec.LicenceNumber := checkCalc(LicEngine.SiteNumber, LicEngine.LicenceRec);
    LicNumber.Text := LicEngine.LicenceRec.LicenceNumber;
//    SetTrialExpiryDate(DateEdit1.Date);
    LicEngine.SetTrialExpiryDate(ExpiryDateDE.Date);
    LicEngine.SaveLicenceRecord;
    end
  else
    Messagedlg('Your trial date has been set. A full licence is required', MtWarning, [MbOK], 0);
end;

procedure TLicenceFA.FormCreate(Sender: TObject);
begin
//  color := GGlobals.FormColour;
  DMrep1.TariButtonList.GetImage(0, CloseBtn.Glyph);
  if (GGlobals.DemoFileLicenced) then
    begin
    GetBusNameBtn.Visible := True;
    GetBusNameBtn.Enabled := True;
    end
  else
    begin
    GetBusNameBtn.Visible := False;
    GetBusNameBtn.Enabled := False;
    end;
    
  if not GGlobals.FileLicence then
    begin
    BusinessFileNameLbl.Visible := False;
    BusinessFileName.Visible := False;
    BusinessFileName.Enabled := False;
    BusinessFileNameNote.Visible := False;
    SupplierIDLbl.Visible := False;
    SupplierID.Enabled := False;
    SupplierID.Visible := False;
    AdvisorSerialNote.Visible := False;
    end
  else
    begin
    BusinessFileNameLbl.Visible := True;
    BusinessFileName.Visible := True;
    BusinessFileName.Enabled := True;
    BusinessFileNameNote.Visible := True;
    SupplierIDLbl.Visible := True;
    SupplierID.Enabled := True;
    SupplierID.Visible := True;
    AdvisorSerialNote.Visible := True;
    end;
end;

procedure TLicenceFA.OnLineBtnClick(Sender: TObject);
begin
  getinput;
  LicEngine.LicenceRec.Computername := GGlobals.servers.CurrentServer.ServerName;
  LicEngine.LicenceRec.OperatingSystemName := GGlobals.GetOperatingSystem;
  LicEngine.LicenceRec.OSVersion := Versioninfo;
//  LicEngine.SaveLicenceRecord;
  Licengine.LicenceRec.UpdateLog := 1; //set here on user action and reset after trying server
  DMUserM.DMLicrec := @LicEngine.LicenceRec;
  if (Leftstr(Licengine.LicenceRec.SerialNumber, 2) = '09') then
    begin
    LicEngine.LicenceRec.LicenceNumber := checkCalc(LicEngine.SiteNumber, LicEngine.LicenceRec);
    LicEngine.SaveLicenceRecord;
    end
  else
    begin
    if (DMUserM.DoHttpLicence(True) and (LicEngine.LicenceRec.LicenceNumber = checkCalc(LicEngine.SiteNumber, LicEngine.LicenceRec))) then
      begin
      messagedlg('TARI for Business is licenced.' + #13#10 + 'Press the ''Close'' button to start using  for Business', mtInformation, [MBOK], 0);
      LicEngine.SaveLicenceRecord;
      end
    end;
  setInput;
end;

procedure TLicenceFA.Button1Click(Sender: TObject);
begin
// refresh;
// repaint;
end;

procedure TLicenceFA.ExpirydateDEPropertiesCloseUp(Sender: TObject);
begin
//  ExpirydateDE.EditValue := nil;
//  ExpirydateDE.Date := nil;
end;

procedure TLicenceFA.BusinessNameExit(Sender: TObject);
begin
  if Length(BusinessName.text) > 0 then
    begin
    if (not GGlobals.FileLicence) and (not GGlobals.LicenceThisFile) then
      BusinessFileName.Text := BusinessName.text + '.FDB';
    LicenceeNames.Text := BusinessName.text;
    end;
end;

procedure TLicenceFA.GetBusNameBtnClick(Sender: TObject);
begin
  BusinessName.Text := LicEngine.GetCurrentBusinessName;
  BusinessFileName.Text := LicEngine.GetCurrentFileName;
  LicenceeNameS.Text := '';
  SerialNumber.Text := '';
  ContactFirstNameS.Text := '';
  ContactLastNameS.Text := '';
  EmailAddressS.Text := '';
  SupplierID.Text := '';
end;

procedure TLicenceFA.LicenceeNameSEnter(Sender: TObject);
begin
  if LicenceeNameS.Text = '' then
    LicenceeNameS.Text := BusinessName.Text;
end;

end.
