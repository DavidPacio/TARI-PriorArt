unit BackupRestore;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
	Dialogs, ExtCtrls, StdCtrls, Buttons, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
	dxSkinXmas2008Blue, Menus, IB_Components, cxMaskEdit,
  cxDropDownEdit, cxLabel, cxTextEdit, cxButtons, cxGroupBox,
	DataCollector, DMClient, DMUsers, DBemail, idGlobal, oCommsfunctions, DMrep1U, LGlobals,
	strUtils, dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, Data.DB, uADStanIntf,
  uADPhysManager, uADPhysIB, uADPhysIBWrapper, uADStanDef;

type
  TBackupFrm = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    cxGroupBox5: TcxGroupBox;
    SelectBackupBtn: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    EditBackupName: TcxButton;
    BackupFile: TcxTextEdit;
    BackUpName: TcxTextEdit;
    cxButton1: TcxButton;
    ZipDestBtn: TcxButton;
    ZipDest: TcxTextEdit;
    ZIPFileBtn: TcxButton;
    Zipdestselectioncb: TcxComboBox;
    SendZippedBtn: TcxButton;
    SelectzipRestoreBtn: TcxButton;
    Zipfiletorestore: TcxTextEdit;
    UnzipBtn: TcxButton;
    EditRestoreDBNameBtn: TcxButton;
    SelectRestoreBtn: TcxButton;
    StartRestoreBtn: TcxButton;
    NewDBName: TcxTextEdit;
    RestoreFilename: TcxTextEdit;
    CloseBtn: TcxButton;
    ActiveModified: TcxLabel;
    ZipModified: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel5: TcxLabel;
    ADPhysIBDriverLink1: TADPhysIBDriverLink;
    ADIBBackup1: TADIBBackup;
    ADIBRestore1: TADIBRestore;
    procedure SelectBackupBtnClick(Sender: TObject);
    procedure StartBackupBtnClick(Sender: TObject);
    procedure FBBackupService1Attach(Sender: TObject);
    procedure ZipDestBtnClick(Sender: TObject);
    procedure ZIPFileBtnClick(Sender: TObject);
    procedure SelectzipRestoreBtnClick(Sender: TObject);
    procedure UnzipBtnClick(Sender: TObject);
    procedure TariZipKitConfirmOverwrite(var Name: String;
      var Confirm: Boolean);
    procedure SelectRestoreBtnClick(Sender: TObject);
    procedure StartRestoreBtnClick(Sender: TObject);
    procedure SendZippedBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EditBackupNameClick(Sender: TObject);
    procedure EditRestoreDBNameBtnClick(Sender: TObject);
    procedure FBRestoreService1Attach(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BackupFrm: TBackupFrm;

implementation

{$R *.dfm}

procedure TBackupFrm.SelectBackupBtnClick(Sender: TObject);
var
	FileOpen : TOpenDialog;
	FileDateTime : TDateTime;
begin
  FileOpen := TOpenDialog.Create(Self);
  FileOpen.DefaultExt := 'fdb';
  FileOpen.FileName := '*.fdb';
  FileOpen.Filter := 'Firebird Database (fdb)|*.fdb';
  FileOpen.FilterIndex := 1;
  FileOpen.InitialDir := GGlobals.Servers.CurrentServer.NetworkFolder + 'Data';
  FileOpen.Options := [ofHideReadOnly, ofNoChangeDir, ofFileMustExist, ofEnableSizing];
  if FileOpen.Execute() then
    begin
    BackupFile.text := ExtractFileName(FileOpen.FileName);
    BackupName.Text := changefileExt(BackupFile.text, '.fbk');
    RestoreFilename.Text := BackupName.Text;
		NewDBName.Text := BackupFile.Text;
		if FileAge(FileOpen.FileName, FileDateTime, True) then
			ActiveModified.Caption := DateTimeToStr(FileDateTime);
    BackupFile.SetFocus;
    end;
  FileOpen.Free;
end;

procedure TBackupFrm.StartBackupBtnClick(Sender: TObject);
var
  protocolinuse : String;
//  Lprotocol : TProtocol;
begin
//   ADIBBackup1.Backup;
//  IBBackupService1.BackupFile.Clear;
  ADIBBackup1.BackupFiles.Clear;
	if Fileexists(GGlobals.Servers.CurrentServer.NetworkFolder + 'Backup\' + BackupName.text) then
	begin
		if Messagedlg('Overwrite Backup File - ' + BackupName.Text, mtWarning, [mbYes,mbNo], 0) = mrNo then
			exit;
	end;
//  IBBackupService1.DatabaseName := GGlobals.Servers.CurrentServer.ServerPath + 'data\' + BackupFile.text;
  ADIBBackup1.Database := GGlobals.Servers.CurrentServer.ServerPath + 'data\' + BackupFile.text;
//  IBBackupService1.BackupFile.Add(GGlobals.Servers.CurrentServer.ServerPath + 'Backup\' + backupName.text);
  ADIBBackup1.BackupFiles.Add(GGlobals.Servers.CurrentServer.ServerPath + 'Backup\' + backupName.text);
	if Not GGlobals.Servers.CurrentServer.isEmbedded then
		begin
//		IBBackupService1.ServerName := GGlobals.Servers.CurrentServer.servername + '/' + GGlobals.Servers.CurrentServer.port;
    ADIBBackup1.Host := GGlobals.Servers.CurrentServer.servername + '/' + GGlobals.Servers.CurrentServer.port;
		protocolinuse := GGlobals.Servers.CurrentServer.Protocol;
		if (protocolinuse = 'NetBEUI') or (protocolinuse = 'TCP_IP') then
//			lprotocol := TCP

//		else
			begin
//			if ansisametext(IBBackupService1.ServerName, GetMachineName) then
				ADIBBackup1.Protocol := ipTCPIP; //lprotocol := Local
//			else
				; //lprotocol := TCP;
			end;
//		IBBackupService1.Protocol := lprotocol;
		end
  else
    begin
//    IBBackupService1.ServerName := '';
//    IBBackupService1.Protocol := Local;
    end;

// start
//  IBBackupService1.active := True;
//  IBBackupService1.ServiceStart;
  ADIBBackup1.Backup;
end;

procedure TBackupFrm.FBBackupService1Attach(Sender: TObject);
begin
  ZipDestBtn.SetFocus;
end;

procedure TBackupFrm.ZipDestBtnClick(Sender: TObject);
var
//  tmp : string;
  FileOpen : TOpenDialog;

begin
  ForceCurrentdirectory := True;
  FileOpen := TOpenDialog.Create(Self);
  FileOpen.DefaultExt := 'zip';
  FileOpen.FileName := changefileExt(BackupName.text, '.zip');
  FileOpen.Filter := 'Zip Files (zip)|*.zip';
  FileOpen.FilterIndex := 1;
  FileOpen.InitialDir := 'My Documents';
  FileOpen.Options := [ofHideReadOnly, ofPathMustExist, ofEnableSizing];
  if FileOpen.Execute() then
  begin
    if length(BackupName.text) > 0 then
      ZipDest.Text := ExtractFilePath(FileOpen.FileName) + changefileExt(BackupName.text, '.zip')
    else
      ZipDest.Text := FileOpen.FileName;
    ZipDest.SetFocus;
  end;
//  FileOpen.Free;
end;

procedure TBackupFrm.ZIPFileBtnClick(Sender: TObject);
begin
  if length(BackupName.text) > 0 then
  begin
//    TariZipKit.BaseDirectory := GGlobals.Servers.CurrentServer.NetworkFolder + 'Backup\';
		// Setup ZIP FileName
//    TariZipKit.FileName := ZipDest.text;
//    TariZipKit.OpenArchive(TariZipKit.FileName);
//    TariZipKit.addfiles(BackupName.text, Integer(1));
//    TariZipKit.CloseArchive;
;
  end;
  Zipdestselectioncb.SetFocus;
end;

procedure TBackupFrm.SelectzipRestoreBtnClick(Sender: TObject);
var
	FileOpen : TOpenDialog;
	FileDateTime : TDateTime;
begin
  ForceCurrentdirectory := False;
  FileOpen := TOpenDialog.Create(Self);
  FileOpen.DefaultExt := 'zip';
  FileOpen.FileName := '*.zip';
  FileOpen.Filter := 'Zip Files (zip)|*.zip';
  FileOpen.FilterIndex := 1;
  FileOpen.InitialDir := 'My Documents';
  FileOpen.Options := [ofHideReadOnly, ofFileMustExist, ofEnableSizing];
  if FileOpen.Execute() then
  begin
		ZipFileTorestore.text := FileOpen.FileName;
		if Fileage(FileOpen.FileName, FileDateTime, True) then
			ZipModified.Caption := DateTimeToStr(FileDateTime);
    RestoreFilename.Text := GGlobals.Servers.CurrentServer.ServerPath + 'Backup\' + changefileExt(ExtractFileName(FileOpen.FileName),'.fbk');
    NewDBName.Text := changefileExt(RestoreFilename.Text, '.fdb');
    ZipFileToRestore.SetFocus;
  end;
  FileOpen.Free;
end;

procedure TBackupFrm.UnzipBtnClick(Sender: TObject);
begin
//  TariZipKit.FileName := ZipFiletoRestore.Text;
//  TariZipkit.BaseDirectory := GGlobals.Servers.CurrentServer.ServerPath + 'Backup\';
//  tariZipKit.ExtractFiles('*.fbk');
	RestoreFilename.SetFocus;
end;

procedure TBackupFrm.TariZipKitConfirmOverwrite(var Name: String;
  var Confirm: Boolean);
begin
  Confirm := False;
  if messagedlg('Overwrite Backup File - ' + Name, mtwarning, [mbYes, mbNo], 0) = mrYes then
    Confirm := True
  else
  begin
    if (length(restoreFilename.text) > 0) and (not Ansisametext(Name, RestoreFileName.Text)) then
    begin
      Name := RestoreFileName.Text;
      Confirm := True;
    end
    else
      MessageDlg('File was not extracted. Change the Name of the Backup File to restore from - ' + RestoreFileName.Text, mtinformation, [mbOK], 0);
  end;
end;

procedure TBackupFrm.SelectRestoreBtnClick(Sender: TObject);
var
  FileOpen : TOpenDialog;
begin
  FileOpen := TOpenDialog.Create(Self);
  FileOpen.DefaultExt := 'fbk';
  FileOpen.FileName := '*.fbk';
  FileOpen.Filter := 'Firebird DB Backup (fbk)|*.fbk';
  FileOpen.FilterIndex := 1;
  FileOpen.InitialDir := GGlobals.Servers.CurrentServer.NetworkFolder + 'Backup';
  FileOpen.Options := [ofHideReadOnly, ofNoChangeDir, ofFileMustExist, ofEnableSizing];
  if FileOpen.Execute() then
    begin
    RestoreFileName.text := ExtractFileName(FileOpen.FileName);
    NewDBName.Text := changefileExt(RestoreFileName.text, '.fdb');
    RestoreFilename.SetFocus;
    end;
  FileOpen.Free;
end;

procedure TBackupFrm.StartRestoreBtnClick(Sender: TObject);
//var
//  protocolinuse : String;
//  Lprotocol : TProtocol;
begin
  ADIBRestore1.options := [roCreate];
	if Fileexists(GGlobals.Servers.CurrentServer.NetworkFolder + 'Data\' + NewDBName.text) then
	begin
		if Messagedlg('Overwrite Database File - ' + NewDBName.Text, mtWarning, [mbYes,mbNo], 0) = mrYES then
      ADIBRestore1.options := [roReplace];
	end;
//  IBRestoreService1.DatabaseName.Clear;
  ADIBRestore1.Database := GGlobals.Servers.CurrentServer.ServerPath + 'data\' + NewDBName.text;
//  IBRestoreService1.DatabaseName.Add(GGlobals.Servers.CurrentServer.ServerPath + 'data\' + NewDBName.text);
//  IBRestoreService1.BackupFile.Clear;
  ADIBRestore1.BackupFiles.Clear;
//  IBRestoreService1.BackupFile.Add(GGlobals.Servers.CurrentServer.ServerPath + 'Backup\' + RestoreFileName.text);
  ADIBRestore1.BackupFiles.add(GGlobals.Servers.CurrentServer.ServerPath + 'Backup\' + RestoreFileName.text);
	if Not GGlobals.Servers.CurrentServer.isEmbedded then
		begin
//    IBRestoreService1.ServerName := GGlobals.Servers.CurrentServer.servername + '/' + GGlobals.Servers.CurrentServer.port;
    ADIBRestore1.Host := GGlobals.Servers.CurrentServer.servername + '/' + GGlobals.Servers.CurrentServer.port;
    ADIBRestore1.Protocol := ipTCPIP;
		//protocolinuse := GGlobals.Servers.CurrentServer.Protocol;
//    if (protocolinuse = 'NetBEUI') or (protocolinuse = 'TCP_IP') then
//      lprotocol := TCP
//    else
//      begin
//      if ansisametext(IBRestoreService1.ServerName, GetMachineName) then
//        lprotocol := Local
//      else
//        lprotocol := TCP;
//			end;
//		IBRestoreService1.Protocol := lprotocol;
		;
//		end
//	else
//		begin
//    IBRestoreService1.ServerName := '';
//    IBRestoreService1.Protocol := Local;
		end;
    ADIBRestore1.Restore;
// start
//  IBRestoreService1.active := True;
//  IBRestoreService1.ServiceStart;
end;

procedure TBackupFrm.SendZippedBtnClick(Sender: TObject);
begin
  if Zipdestselectioncb.ItemIndex = 0 then
  begin
  // sending zip to floppy
    if not CopyFileto(ZipDest.text, 'a:\' + ExtractFileName(ZipDest.Text)) then
      ShowMessage('Error copying file: ' + ZipDest.text)
    else
      ShowMessage('Copy Successful');
  end
  else
  begin
  // launch dbemail
    if Not MAPIEnabled then
    begin
      ShowMessage('The email Client software is unavailable for sending the email.');
      exit;
    end;

    if FileExists(ZipDest.text) then
    begin
      Application.CreateForm(TDBEmailF, DBEmailF);
      dbemailf.AttachedFile.Caption := ZipDest.text;
      DBEmailf.ShowModal;
      dbemailF.Free;
    end
    else
      MessageDlg('The Zip file does not exist. Please correct and try again', MtWarning, [mbok], 0);
  end;
end;

procedure TBackupFrm.FormActivate(Sender: TObject);
begin
  caption := 'Backup and Restore for server - ' + GGlobals.Servers.CurrentServer.ServerName;
end;

procedure TBackupFrm.EditBackupNameClick(Sender: TObject);
begin
  BackupName.SetFocus;
end;

procedure TBackupFrm.EditRestoreDBNameBtnClick(Sender: TObject);
begin
  NewDBName.SetFocus;
end;

procedure TBackupFrm.FBRestoreService1Attach(Sender: TObject);
begin
  CloseBtn.SetFocus;
end;

procedure TBackupFrm.FormCreate(Sender: TObject);
begin
//  Color := GGLobals.FormColour;
  DMrep1.TariButtonList.GetImage(0, CloseBtn.Glyph);
end;

procedure TBackupFrm.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

end.
