unit TARILoginU;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, Dialogs, Auchtypes, DMUsers, ExtCtrls,
  TariHlp, ComCtrls, variants, LGlobals, DMrep1U,
  cxButtons, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinXmas2008Blue,
  Menus, dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TTARILogin = class(TForm)
    ServernameLbl: TcxLabel;
    UserNamelbl: TcxLabel;
    Passwordlbl: TcxLabel;
    UsernameEdit: TcxTextEdit;
    PasswordEdit: TcxTextEdit;
    cxLabel1: TcxLabel;
    OKButton: TcxButton;
    CancelBtn: TcxButton;
    procedure OKButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PasswordEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FUserName : String;
    fuserpwd : string;
    FDbRole : string;
  public
    { Public declarations }
    Property UserName: string read FUserName write FUserName;
    Property UserPassword: string read FUserpwd write FUserpwd;
    Property DatabaseRole: string read FdbRole write FdbRole;
  end;

var
  TARILogin: TTARILogin;

implementation

{$R *.DFM}

procedure TTARILogin.OKButtonClick(Sender: TObject);
var
  varg : Variant;
  NewPword : String;
  CanClose : Boolean;
begin
	UserName := UsernameEdit.text;
  NewPword := PasswordEdit.text;
  Canclose := False;
  DMuserM.Users.Active;
  Varg := Username;
  if (length(Username) > 0) and (DMUserM.Users.Locate('User_Name', Varg, [])) then
  begin
		NewPWord := string(DMUserM.UsersDBPASSWORD.AsAnsiString);
		fdbRole := DMUserM.UsersLOK_ON_ROLE.AsString;
    If (length(PasswordEdit.Text) > 0) and
      (NewPword = PasswordEdit.Text) then
      canclose := True
    else
    begin
      MessageDlg('The Password is Incorrect.' + #13#10 + 'Try Again or Press Cancel' +
        #13#10 + 'If you are a new user, try ''default''', mtInformation, [MbOK], 0);
      PasswordEdit.Setfocus;
    end;
    fUserpwd := NewPword;
  end
  else begin
    MessageDlg('The User Name is Incorrect.' + #13#10 + 'Try Again or Press Cancel',
      mtInformation, [MbOK], 0);
    UsernameEdit.Setfocus;
  end;
  if CanClose then ModalResult := mrOK;
end;

procedure TTARILogin.FormShow(Sender: TObject);
var
  varg : Variant;
begin
  ServernameLbl.Caption := 'Logging on Server - ' + GGLobals.servers.currentServer.ServerName;
  if Username <> '' then  UsernameEdit.text := UserName
  else
    UsernameEdit.text := 'Admins';
  Varg := UsernameEdit.text;
  DMUserM.Users.Locate('User_Name', Varg, []);
	if (Username = 'Admins') and (DMUserM.UsersDBPASSWORD.AsAnsiString = 'admins') then
  begin
		PasswordEdit.Text := String(DMUserM.UsersDBPASSWORD.AsAnsiString);
    OKButton.SetFocus;
  end
  else
    PasswordEdit.Text := '';
end;

procedure TTARILogin.CancelBtnClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TTARILogin.FormCreate(Sender: TObject);
begin
  DMrep1.ButtonGlyphList.GetBitmap(3, CancelBtn.Glyph);
  Left := trunc((screen.width - width) / 2);
  Top := trunc(Screen.Height / 2) + 5;
end;

procedure TTARILogin.PasswordEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) or (Key = VK_TAB)then
    OKButtonClick(Sender);
end;

end.

