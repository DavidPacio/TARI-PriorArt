unit testMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Menus, ImgList, ComCtrls, ToolWin, Buttons, Grids, Wwdbigrd,
  Wwdbgrid, registry, DBCtrls, Mask, wwdbedit, wwSpeedButton, dbtables,
  wwDBNavigator, ExtCtrls, wwclearpanel, MegaPanl, fcButton, fcImgBtn,
  consts, auchtypes, ShellAPI, inifiles;

type
  TtestMainF = class(TForm)
    MainMenu1: TMainMenu;
    Menu_File: TMenuItem;
    Menu_Data_Entry: TMenuItem;
    Menu_File_New: TMenuItem;
    Menu_File_Open: TMenuItem;
    Menu_File_Exit: TMenuItem;
    Menu_Reports: TMenuItem;
    Meni_Help: TMenuItem;
    ToolBar1: TToolBar;
    SpeedNew: TSpeedButton;
    SpeedOpen: TSpeedButton;
    ToolButton1: TToolButton;
    SpeedReport: TSpeedButton;
    SpeedTarget: TSpeedButton;
    SpeedButton1: TSpeedButton;
    ToolButton2: TToolButton;
    FileOpenDlg: TOpenDialog;
    Utilities: TMenuItem;
    Util_Logonadmin: TMenuItem;
    UtilUsers: TMenuItem;
    DataPlaning: TMenuItem;
    DataMonitor: TMenuItem;
    N1: TMenuItem;
    ToolButton3: TToolButton;
    wwDBEdit2: TwwDBEdit;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    MegaPanel1: TMegaPanel;
    Label1: TLabel;
    wwDBNavigator1: TwwDBNavigator;
    wwDBNavigator1First: TwwNavButton;
    wwDBNavigator1Prior: TwwNavButton;
    wwDBNavigator1Next: TwwNavButton;
    wwDBNavigator1Last: TwwNavButton;
    wwDBNavigator1Insert: TwwNavButton;
    wwDBNavigator1Delete: TwwNavButton;
    wwDBNavigator1Edit: TwwNavButton;
    wwDBNavigator1Post: TwwNavButton;
    wwDBNavigator1Cancel: TwwNavButton;
    wwDBNavigator1Refresh: TwwNavButton;
    Label8: TLabel;
    wwDBEdit1: TwwDBEdit;
    Label2: TLabel;
    wwDBEdit3: TwwDBEdit;
    Label3: TLabel;
    wwDBEdit4: TwwDBEdit;
    Label4: TLabel;
    wwDBEdit5: TwwDBEdit;
    Label5: TLabel;
    DBCheckBox1: TDBCheckBox;
    Label6: TLabel;
    wwDBEdit6: TwwDBEdit;
    Label7: TLabel;
    LastDayofWeekCB: TComboBox;
    MegaPanel2: TMegaPanel;
    NewDialog: TSaveDialog;
    C1: TMenuItem;
    C2: TMenuItem;
    R1: TMenuItem;
    procedure Menu_File_ExitClick(Sender: TObject);
    procedure SpeedOpenClick(Sender: TObject);
    procedure SpeedNewClick(Sender: TObject);
    procedure SpeedCloseClick(Sender: TObject);
    procedure Util_LogonadminClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure wwDBEdit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
//    procedure UtilUsersClick(Sender: TObject);
//    procedure C1Click(Sender: TObject);
    procedure C2Click(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure Menu_File_OpenClick(Sender: TObject);
    procedure wwDBEdit2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  testMainF: TtestMainF;
  PStartDate: TDateTime;
  PEndDate: TDateTime;
  Initfailed : Boolean;

implementation

{$R *.DFM}
uses DMClient1, OpDAO36, AMiscFunctions;

// Global sections
var
  dbengine : DAOEngine = nil;
  Database : DAODatabase = nil;
  PUsername, PUserPwd : array[0..40] of char;
  CurrentDBVersion : string;
  FileVersion : string;
//  LoginDlg: TDoItLoginDlg;
//  i : integer;

{ Input dialog }

function InputPwdQuery(const ACaption, APrompt: string;
  var Value: string; Setting : Boolean): Boolean;
var
  Form: TForm;
  Prompt: TLabel;
  Edit: TEdit;
  Edit2: TEdit;
  LoopResult : Boolean;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;

  function GetAveCharSize(Canvas: TCanvas): TPoint;
  var
    I: Integer;
    Buffer: array[0..51] of Char;
  begin
    for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
    for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
    GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(Result));
    Result.X := Result.X div 52;
  end;
begin
  Result := False;
  Form := TForm.Create(Application);
  with Form do
    try
      Canvas.Font := Font;
      DialogUnits := GetAveCharSize(Canvas);
      BorderStyle := bsDialog;
      Caption := ACaption;
      ClientWidth := MulDiv(180, DialogUnits.X, 4);
      if setting then
        ClientHeight := MulDiv(82, DialogUnits.Y, 8)
      else
        ClientHeight := MulDiv(63, DialogUnits.Y, 8);
      Position := poScreenCenter;
      Prompt := TLabel.Create(Form);
      with Prompt do
      begin
        Parent := Form;
        AutoSize := True;
        Left := MulDiv(8, DialogUnits.X, 4);
        Top := MulDiv(8, DialogUnits.Y, 8);
        Caption := APrompt;
      end;
      Edit := TEdit.Create(Form);
      Edit2 := TEdit.Create(Form);
      with Edit do
      begin
        Parent := Form;
        Left := Prompt.Left;
        Top := MulDiv(19, DialogUnits.Y, 8);
        Width := MulDiv(164, DialogUnits.X, 4);
        MaxLength := 255;
        PasswordChar := '*';
        Text := Value;
        SelectAll;
      end;
      with Edit2 do
        begin
        Parent := Form;
        Left := Prompt.Left;
        Top := MulDiv(38, DialogUnits.Y, 8);
        Width := MulDiv(164, DialogUnits.X, 4);
        MaxLength := 255;
        PasswordChar := '*';
        Text := Value;
        SelectAll;
      end;
      if setting then
        ButtonTop := MulDiv(60, DialogUnits.Y, 8)
      else
        ButtonTop := MulDiv(41, DialogUnits.Y, 8);
      ButtonWidth := MulDiv(50, DialogUnits.X, 4);
      ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Caption := SMsgDlgOK;
        ModalResult := mrOk;
        Default := True;
        SetBounds(MulDiv(38, DialogUnits.X, 4), ButtonTop, ButtonWidth,
       ButtonHeight);
      end;
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Caption := SMsgDlgCancel;
        ModalResult := mrCancel;
        Cancel := True;
        SetBounds(MulDiv(92, DialogUnits.X, 4), ButtonTop, ButtonWidth,
          ButtonHeight);
      end;
      LoopResult := false;
      while LoopResult = False do
        begin
        ActiveControl := Edit;
        if ShowModal = mrOk then
          begin
          if (Not Setting) or (Setting and (Edit.text = Edit2.text))
            then begin
            Value := Edit.Text;
            Result := True;
            LoopResult := True;
          end
          else if Setting then MessageDlg('Both passwords must be the same.' + #13#10 +
          'Try Again', mtInformation, [mbOk], 0);
        end
        else begin
          Result := False;
          Value := '';
          LoopResult := True;
        end;
      end;    // while
    finally
      Form.Free;
    end;
end;

Procedure SetRegistry;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if CurrentDBPath = ''
      then begin
      if Reg.OpenKey('\SOFTWARE\Opus\DirectAccess\Configuration\Aliases\Beu', True)
        then CurrentDBPath := Reg.ReadString('Path');
      Reg.CloseKey;
    end;
    if Reg.OpenKey('\SOFTWARE\Hartley Australia Pty Ltd\Focus\MRU', True)
      then begin
      Reg.WriteString('User', CurrentUserName);
      Reg.WriteString('DataBase', CurrentDBPath);
    end;
    if Reg.OpenKey('\SOFTWARE\Hartley Australia Pty Ltd\Focus\Default Planning Period', True)
      then begin
      Reg.WriteDateTime('Start Date', PStartDate);
      Reg.WriteDateTime('End Date', PEndDate);
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

Procedure GetRegistry;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('\SOFTWARE\Hartley Australia Pty Ltd\Focus', True)
      then begin
      ProtoType := Reg.ReadString('ProtoTypeFile');
      Basedir := Reg.ReadString('BaseFolder');
    end;
    if Reg.OpenKey('\SOFTWARE\Hartley Australia Pty Ltd\Focus\MRU', True)
      then begin
      CurrentUserName := Reg.ReadString('User');
      StrPcopy(PUserName, CurrentUserName);
      StrPcopy(PUserPwd, '');
      CurrentDBPath := Reg.ReadString('DataBase');
    end;
    if Reg.OpenKey('\SOFTWARE\Hartley Australia Pty Ltd\Focus\Default Planning Period', True)
      then begin
      PStartDate := Reg.ReadDateTime('Start Date');
      PEndDate := Reg.ReadDateTime('End Date');
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

function CheckDIYDatabase( filename: string): string;
var
  i : integer;
begin
  Result := '';
  try try
    dbengine := CreateEngine();
    // the last _ is a connect string
    Database := dbengine.OpenDatabase(Filename, True, False, ';PWD=GEarSyStem' );
    with Database.OpenRecordset('DiySystem', dbOpenDynaset, _, _)
      do try try
      MoveFirst();
      CurrentDBPwd := '';
      for i := 0 to Fields.Count - 1 do
        with fields[i] do
        try
          if (Name = 'Version')
            then Result := Value;
          if (Name = 'Password') and (TVarData(Value).VType <> varNull) then
            CurrentDBPWD := String(Value);
        finally
          free;
        end; {Field}
      finally
        free;
      end;
    except
    end; {Recordset}
  finally
    dbengine.free;
    Database.free;
  end;
  except
  end;
end;

function ExecuteFile(const FileName, Params, DefaultDir: string;
  ShowCmd: Integer): Boolean;
var
  zFileName, zParams, zDir: array[0..200] of Char;
  Startupinfo : TStartUpInfo;
  Processinfo : TProcessInformation;
  ChildHandle : THandle;
begin
  FillChar(Startupinfo, Sizeof(TStartupInfo), #0);
  FillChar(ProcessInfo, Sizeof(TProcessInformation), #0);
  Startupinfo.cb := sizeof(TStartUpInfo);
  Startupinfo.lpReserved := nil;
  Startupinfo.lpDesktop := nil;
  Startupinfo.cbReserved2 := 0;
  StartupInfo.lpReserved2 := nil;
  Result := CreateProcess(StrPCopy(zFileName, FileName),
                          StrPCopy(zParams, FileName + ' ' + Params),
                          nil,
                          nil,
                          False,
                          CREATE_NEW_CONSOLE,
                          nil, //lpEnvironment
                          StrPCopy(zDir, DefaultDir),
                          StartUpinfo,
                          ProcessInfo);
  ChildHandle := OpenProcess(SYNCHRONIZE or STANDARD_RIGHTS_REQUIRED, False, ProcessInfo.dwProcessID);
  WaitforSingleObject(ChildHandle, INFINITE);
end;

Function OpenClientDB(Filename: string): Boolean;
var
  i: Integer;
  dbpass : string;
begin
  Result := False;  // Assume the worst
  // First Test the New database. If it fails, exit or stick with the existing
  Fileversion := CheckDIYDatabase(FileName);
  if Fileversion = CurrentDBVersion
    then begin
    Result := True;
    if (Length(CurrentDBPWD) > 0) Then
      If (InputPwdQuery('Database Password', 'Enter the Password', dbpass, False))
        then begin
        if CurrentDBPWD <> EncryptPassword(lowercase(dbPass)) then Result := False;
      end
      else Result := False;
    if Result = True
      then begin
      DataModuleClient1.ClienTIBODatabase.Connected := False;
      with DataModuleClient1.ClienTIBODatabase
        do begin
        Params.Values['PATH'] := FileName;
        Params.Values['USER NAME'] := 'Admin';
        Params.Values['CONNECT'] := ';PWD=GEarSyStem';
        DataModuleClient1.ClienTIBODatabase.LoginPrompt := False;
      end;
      try
        DataModuleClient1.ClienTIBODatabase.Connected := True;
      except
        on E: EDBEngineError do begin
          for i:= 0 to E.ErrorCount - 1 do begin
          // Create/truncate a file for errors and convert Native Error into strings
            if E.Errors[i].NativeError = E_DAO_InvalidPassword
              then begin
              ;
            end;
          end;
        end;
        else raise;
      end;
    end;
  end;
end;

procedure TtestMainF.Menu_File_ExitClick(Sender: TObject);
begin
Application.Terminate;
end;

procedure TtestMainF.SpeedOpenClick(Sender: TObject);
//var
//  tmp : string;
//  PwdOK : Boolean;
begin
//  PwdOk := False;
  DataModuleClient1.ClienTIBODatabase.Connected := False;
  FileOpenDlg.InitialDir := BaseDir + '\Data';
  if FileOpenDlg.Execute() and (not OpenClientDb(FileOpenDlg.FileName))
    then begin
    if Fileversion > '' // problem of doing this before thenmain form is created
      then begin
      // Try for an update
      if ExecuteFile(BaseDir + '\DBVersion.exe', '\F ' + FileOpenDlg.FileName, BaseDir, SW_SHOW) then
        OpenClientDB(FileOpenDlg.FileName);
    end
    else MessageDlg('The database you attempted to open is not of the correct type.'
         + #13#10 + 'If you consider it to be of the correct type, please forward'
         + #13#10 + 'it to our support staff.', mtInformation, [mbOk], 0);
  end;
end;

procedure TtestMainF.SpeedNewClick(Sender: TObject);
var
  MasterC, FileC : array[0..200] of char;
begin
// REINSTALL DIY
  NewDialog.InitialDir := BaseDir;
  if NewDialog.Execute()
    then begin
    DataModuleClient1.ClienTIBODatabase.Connected := False;
    StrPcopy(MasterC, ProtoType);
    StrPCopy(Filec, NewDialog.fileName);
    if CopyFile(MasterC, FileC, LongBool(True))
      then begin
      if not OpenClientDB(NewDialog.FileName)
       then OpenClientDB(CurrentDBPath); // Open Previous One
    end;
  end;
end;

procedure TtestMainF.SpeedCloseClick(Sender: TObject);
begin
//  ListUserNames;
end;

procedure TtestMainF.Util_LogonadminClick(Sender: TObject);
begin
//  LoginDlg := TDoItLoginDlg.create(application);
  StrPcopy(PuserName, 'Admin');
  StrPcopy(PuserPwd, 'admins');
//  if LoginDlg.execute(SecureDBName, PUserName, CurrentUserAccess) = mrOK
//    then begin
    CurrentUserName := StrPas(PUserName);
    if DataModuleClient1.ClienTIBODatabase.Connected = True then
      UtilUsers.Enabled := True;
//  end;
end;

procedure TtestMainF.FormCreate(Sender: TObject);
begin
 if CurrentUserAccess > 0 then
   UtilUsers.Enabled := False
 else
   UtilUsers.Enabled := True;
end;

procedure TtestMainF.wwDBEdit1Change(Sender: TObject);
begin
 LastDayofWeekCB.ItemIndex := DataModuleClient1.DepartmentsLastDayOfWeek.value;
end;

procedure TtestMainF.FormShow(Sender: TObject);
begin
  LastDayofWeekCB.ItemIndex := DataModuleClient1.DepartmentsLastDayOfWeek.value;
  if not OpenClientDB(CurrentDBPath)
    then begin
    if Fileversion = '' // problem of doing this before thenmain form is created
      then begin
      TestMainF.FileOpenDlg.InitialDir := BaseDir + '\Data';
      if TestMainF.FileOpenDlg.Execute() then
        OpenClientDb(testMainF.FileOpenDlg.FileName);
    end
    else begin
    // Try for an update
    if ExecuteFile(BaseDir + '\DBVersion.exe', '\F ' + CurrentDBPath, BaseDir, SW_SHOW) then
      OpenClientDB(CurrentDBPath);
    end;
  end;
end;


procedure TtestMainF.C2Click(Sender: TObject);
var
  Encryptedpwd : string;
  NewPwd : String;
begin
  if (InputPwdQuery('Set Database Password', 'Enter New Password (Twice)', NewPwd, True))
    then begin
    if length(NewPwd) > 0 then
      EncryptedPwd := encryptPassword(lowercase(Newpwd))
    else
      EncryptedPwd := '';
    DataModuleClient1.SetDbPassword(EncryptedPwd);
  end;
end;

procedure TtestMainF.R1Click(Sender: TObject);
var
  dn, sn : string;
  OldPwd : Widestring;
  varg : variant;
begin
// Disconnect current Database
  DataModuleClient1.ClienTIBODatabase.Connected := False;
  FileOpenDlg.InitialDir := BaseDir + '\Data';
  if FileOpenDlg.Execute()
    then begin
    dn := FileOpenDlg.FileName;
    sn:= ChangeFileExt( dn, '.~jt' );
    DeleteFile( sn );
    OldPwd := 'GEarSyStem';
    varg := '';
    if not RenameFile( dn, sn ) then Exit;
    try try
      dbengine := CreateEngine();  //FileOpenDlg.FileName
      Database := dbengine.OpenDatabase(sn, True, False, ';PWD=GEarSyStem' );
      Database.NewPassword(OldPwd, varg);
      DataBase.Close;
      Database.Free;
      dbEngine.CompacTIBODatabase(sn, dn, _, _, _ );
    finally
      Database := dbengine.OpenDatabase(sn, True, False, ';PWD=' );
      Database.NewPassword(varg, OldPwd);
      DataBase.Close;
      Database.free;
      dbengine.free;
    end;
    except
      RenameFile( sn, dn );
      Raise;
    end;
  DeleteFile( sn );
  end;
  OpenClientDB(CurrentDBPath);
end;

function GetDBVersion(Filename: string): string;
var
  i : integer;
begin
  Result := '';
  try try
    dbengine := CreateEngine();
    // the last _ is a connect string
    Database := dbengine.OpenDatabase(Filename, True, False, ';PWD=GEarSyStem' );
    with Database.OpenRecordset('DiySystem', dbOpenDynaset, _, _)
      do try try
      MoveFirst();
      for i := 0 to Fields.Count - 1 do
        with fields[i] do
        try
          if (Name = 'Version')
            then Result := value;
        finally
          free;
        end; {Field}
      finally
        free;
      end;
    except
    end; {Recordset}
  finally
    dbengine.free;
    Database.free;
  end;
  except
  end;
end;


procedure TtestMainF.Menu_File_OpenClick(Sender: TObject);
begin
  SpeedOpenClick(Sender);
end;

Procedure GetIniInfo(var SecureDB: string);
var
  BaseIni : TIniFile;
begin
  BaseIni := TiniFile.create(Basedir + '\Focus.ini');
  SecureDB := BaseIni.ReadString('Securedb', 'DBPath', BaseDir + '\FocusSecure.mdb');
  Baseini.Free;
end;

procedure TtestMainF.wwDBEdit2Exit(Sender: TObject);
begin
DataModuleClient1.BusinessDetails.Post;
end;

Initialization
  // Set defaults for Planning period just in case nothing has been stored
  PstartDate := now;
  PEndDate := now + 365;
//   Find out who was the last user and what database was opened
  getRegistry;
  CurrentDBVersion := GetDBVersion(ProtoType);
  GetIniInfo(SecureDBPath);
  initFailed := False;
//  LoginDlg := TDoItLoginDlg.create(application);
//  if LoginDlg.execute(SecureDBPath, PUserName, CurrentUserAccess) = mrOK
//    then begin
    CurrentUserName := StrPas(PUserName);
    Application.CreateForm(TDataModuleClient1, DataModuleClient1);
//    LoginDlg.Destroy;
//  end
//  else
//    initfailed := True;

Finalization
// store who the user was and the name of the Database from the registry.
  SetRegistry;
end.
