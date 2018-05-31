unit MaintainUsers;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DMUsers,
  StdCtrls, Buttons, AuchTypes, Variants, DataCollector, LGlobals,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxContainer, cxEdit, cxTextEdit, cxDBEdit,
  cxControls, cxNavigator, cxDBNavigator, db, cxLabel, DMrep1U, cxButtons,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.Menus;

type
  TMaintainUserF = class(TForm)
    cxDBNavigator1: TcxDBNavigator;
    UserNameDBED: TcxDBTextEdit;
    ROLELUCB: TcxDBLookupComboBox;
    PWDDBED: TcxDBTextEdit;
    FIRSTDBED: TcxDBTextEdit;
    MIDDLEDBED: TcxDBTextEdit;
    LASTDBED: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    CountLbl: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    CloseBtn: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure UserNameDBEDChange(Sender: TObject);
    procedure UserNameDBEDExit(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure cxDBNavigator1ButtonsButtonClick(Sender: TObject;
      AButtonIndex: Integer; var ADone: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MaintainUserF: TMaintainUserF;

implementation

{$R *.DFM}

procedure TMaintainUserF.FormShow(Sender: TObject);
begin
  if DMUserM.UsersUSER_NAME.value = 'Admins'
    then
    DMUserM.EditingAdmin := True
  else
    DMUserM.EditingAdmin := False;
  if DMUserM.EditingAdmin then
    cxDBNavigator1.Buttons.Delete.Enabled := False
  else
    cxDBNavigator1.Buttons.Delete.Enabled := True;
  if (not (GGlobals.Servers.currentServer.CurrentUserName  = 'Admins')) and (not (GGlobals.Servers.currentServer.CurrentUserName = 'SYSDBA')) then
  begin
    cxDBNavigator1.Buttons.First.visible := False;
    cxDBNavigator1.Buttons.Prior.visible := False;
    cxDBNavigator1.Buttons.Next.visible := False;
    cxDBNavigator1.Buttons.Last.visible := False;
    cxDBNavigator1.Buttons.Insert.visible := False;
    cxDBNavigator1.Buttons.Delete.visible := False;
    ROLELUCB.Properties.ReadOnly := True;
    ROLELUCB.Style.Color := clBtnFace;
    RoleLUCB.Enabled := False;
  end;
end;

procedure TMaintainUserF.FormCreate(Sender: TObject);
begin
//  Color := GGlobals.FormColour;
  DMrep1.TariButtonList.GetImage(0, CloseBtn.Glyph);
  if DMUserM.Users.active then
    DMUserM.Users.Active := False;
{  DMUserM.Users.SQL.Clear;
  if CurrentUserName = 'Admins' then
    DMUserM.Users.SQL.Add('select * from users for update where User_Name <> SYSDBA;')
  else
    DMUserM.Users.SQL.Add('select * from users for update where User_Name = ' + CurrentUsername +';');
  DMUserM.Users.Active := True;
}
  DMUserM.Users.Filtered := False;{User_Name<>'SYSDBA'}
  if (GGlobals.Servers.currentServer.CurrentUserName = 'Admins') or (GGlobals.Servers.currentServer.CurrentUserName = 'SYSDBA') then
    DMUserM.users.filter := 'User_Name<>''SYSDBA'''
  else
  begin
    DMUserM.users.filter := 'User_Name=''' + GGlobals.Servers.currentServer.CurrentUserName + '''';
  end;
  DMUserM.Users.Filtered := True;
  DMUserM.Users.active := True;
  USERNAMEDBED.Properties.ReadOnly := True;
  UserNameDBED.Style.Color := clBtnFace;
end;

procedure TMaintainUserF.UserNameDBEDChange(Sender: TObject);
begin
  if DMUserM.UsersUser_Name.Value = 'Admins' then
    cxDBNavigator1.Buttons.Delete.Enabled := False
  else
    cxDBNavigator1.Buttons.Delete.Enabled := True;
  Countlbl.Caption := inttostr(DMUserM.Users.recNo) + ' of ' + inttostr(DMuserM.Users.RecordCount);
end;

procedure TMaintainUserF.UserNameDBEDExit(Sender: TObject);
begin
  USERNAMEDBED.Properties.ReadOnly := True;
  UserNameDBED.Style.Color := clBtnFace;
end;

procedure TMaintainUserF.CloseBtnClick(Sender: TObject);
begin
  if DMUserM.DSUsers.State in [dsinsert, dsedit] then
    DMUserM.Users.post;
  Close;
end;

procedure TMaintainUserF.cxDBNavigator1ButtonsButtonClick(Sender: TObject;
  AButtonIndex: Integer; var ADone: Boolean);
begin
  if AButtonIndex = 6 then //Insert
    begin
    USERNAMEDBED.Properties.ReadOnly := False;
    UserNameDBED.Style.Color := clCaptionText;
    USERNAMEDBED.SetFocus;
    end;
end;

end.
