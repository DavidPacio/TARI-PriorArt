unit DBemail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,
  DataCollector, registry, mapi, ocommsfunctions, DMrep1U, LGlobals,
  cxControls, cxContainer, cxEdit, cxLabel, cxTextEdit, cxButtons, cxMemo,
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
  TDBEmailF = class(TForm)
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    AttachedFile: TcxLabel;
    cxLabel6: TcxLabel;
    Memo1: TcxMemo;
    Sendemailbtn: TcxButton;
    EmailAddresseb: TcxTextEdit;
    EmailSubject: TcxTextEdit;
    CloseBtn: TcxButton;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SendemailbtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
  private
    { Private declarations }
    Procedure SetLastemail;
    procedure GetemailRegistry;
  public
    { Public declarations }
  end;

var
  DBEmailF: TDBEmailF;

implementation

{$R *.dfm}

Procedure TDBEmailF.SetLastemail;
var
  Reg: TRegistry;
//  licserver : string;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('\SOFTWARE\Focus Based Management\' + PRODUCT_NAME + '\MRU', True) then
    begin
      Reg.WriteString('EmailAddress', EmailAddresseb.text);
    end;
  finally
    Reg.Free;
  end;
end;

procedure TDBEmailF.GetemailRegistry;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('\SOFTWARE\Focus Based Management\' + PRODUCT_NAME + '\MRU', False) then
    begin
      EmailAddressEb.Text := Reg.ReadString('EmailAddress');
    end;
  finally
    Reg.Free;
  end;
end;

procedure TDBEmailF.FormActivate(Sender: TObject);
begin
  GetemailRegistry;
end;

procedure TDBEmailF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SetLastemail;
end;

procedure TDBEmailF.SendemailbtnClick(Sender: TObject);
var
//  EmailAttachment : TStrings;
//  emailText,
  attachedFiles : TStringList;
  MError: Cardinal;
  emailAddress, bccAddress : string;
  AttachmentFile : string;
//  toNameS : string;
//  p : pChar;
begin
  Screen.Cursor := crHourglass;
  AttachmentFile := AttachedFile.caption;
//  Memo1.Lines.
  try
    AttachedFiles := TStringList.Create;
    AttachedFiles.add(Attachmentfile);
    try
      emailAddress := EmailAddresseb.text;
      bccAddress := '';
      MError := SendEmail(emailAddress, '', bccAddress, EmailSubject.text, Memo1.Text, True, attachedfiles);
    finally
      AttachedFiles.free;
    end;
      case MError of
      MAPI_E_USER_ABORT,
      SUCCESS_SUCCESS:
        begin
        Showmessage('Email Sent!');
        end;
      else
        begin
        MessageDlg('Error sending mail', mtError, [mbOK], 0);
        end;
      end;
  finally
    screen.Cursor := crDefault;
  end;
end;

procedure TDBEmailF.FormCreate(Sender: TObject);
begin
//  Color := GGlobals.FormColour;
  DMrep1.TariButtonList.GetImage(0, CloseBtn.Glyph);
end;

procedure TDBEmailF.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

end.
