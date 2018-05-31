{*******************************************************************************

  Tari for Business
  © 2004 Auchinlea Pty Ltd

*******************************************************************************}
unit About;

interface

uses
  Windows, Classes, Graphics, Forms, Controls, StdCtrls, ExtCtrls, SysUtils,
  ShellApi, Dialogs, verslab, jpeg, cxControls,
  cxContainer, cxEdit, cxLabel, LGLobals, DMRep1U, cxButtons,
  cxGroupBox, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  Vcl.Menus, dxGDIPlusClasses;


{ TEPAboutDialogFm }
type
  TAboutDialogFm = class(TForm)
    Image2: TImage;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxButton1: TcxButton;
    CloseBtn: TcxButton;
    cxGroupBox1: TcxGroupBox;
    VersionLbl: TcxLabel;
    cxLabel3: TcxLabel;
    MemoryLb: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    ResourcesLb: TcxLabel;
    DbVersionLabel: TcxLabel;
    Image1: TImage;
    procedure CustomBtClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


{ TEPAboutDialog }
type
  TAboutDialog = class(TComponent)
  private
    { Private declarations }
    FCustomButton: String;
    FLicenceNo: String;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); reintroduce; override;
    procedure Execute;
  published
    { Published declarations }
    property CustomButton: String read FCustomButton write FCustomButton;
    property LicenceNo: String read FLicenceNo write FLicenceNo;
  end;

var
  dbversion : string;

implementation

uses auchTypes, DataCollector;

{$R *.DFM}

{ ---------------------------------------------------------------------------- }
{ -- GetFreesystemResources - Returns the amoun of free system resources       }
{ ---------------------------------------------------------------------------- }
function GetFreesystemResources(Mode: Integer): Integer;
var
  _MyGetFreeSystemResources32: function(Mode: Integer): Integer stdcall;
  RSRC32DLL: THandle;
begin
  Result := 100;

  RSRC32DLL := LoadLibrary('RSRC32.DLL');
  if (RSRC32DLL <> 0) then
    begin
      @_MyGetFreeSystemResources32 := GetProcAddress(RSRC32DLL, '_MyGetFreeSystemResources32@4');
      Result := _MyGetFreeSystemResources32(Mode);
      FreeLibrary(RSRC32DLL);
    end;
end;

{ ---------------------------------------------------------------------------- }
{ -- TFocusAboutDialog                                                             }
{ ---------------------------------------------------------------------------- }
constructor TAboutDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

{ ---------------------------------------------------------------------------- }
{ -- Execute - Executes the about dialog, filling in the free resources and    }
{              program version numbers.                                        }
{ ---------------------------------------------------------------------------- }
procedure TAboutDialog.Execute;
var
  AboutDialogFm: TAboutDialogFm;
  MS: TMemoryStatus;
begin
  AboutDialogFm := TAboutDialogFm.Create(Self);
  AboutDialogFm.versionLbl.caption := 'Release ' + versioninfo;
  try

    GlobalMemoryStatus(MS);
    AboutDialogFm.MemoryLb.Caption := FormatFloat(AboutDialogFm.MemoryLb.Caption,
      MS.dwTotalPhys / 1024);
    AboutDialogFm.ResourcesLb.Caption := Format(AboutDialogFm.ResourcesLb.Caption,
      [GetFreeSystemResources(0)]);

    AboutDialogFm.ShowModal;
  finally
    AboutDialogFm.Free;
  end;
end;

{ ---------------------------------------------------------------------------- }
{ -- CustomBtClick - The 'Visit Our Web Site' button has been clicked so       }
{                    launch the default internet browser go to FBM web site   }
{ ---------------------------------------------------------------------------- }
procedure TAboutDialogFm.CustomBtClick(Sender: TObject);
begin
  if (ShellExecute(Handle, 'open', 'http://www.Tari.com.au',
     '', '', SW_SHOWNORMAL) < 32) then
    MessageDlg('Unable to start web browser. Make sure you have properly'#13+
      'setup Internet access on your system.', mtError, [mbOK], 0)
end;

{ ---------------------------------------------------------------------------- }
{ -- FormClose - Close the forms and free resources                            }
{ ---------------------------------------------------------------------------- }
procedure TAboutDialogFm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TAboutDialogFm.FormActivate(Sender: TObject);
begin
  Dbversionlabel.Caption := dbversion;
end;

procedure TAboutDialogFm.FormCreate(Sender: TObject);
begin
//  Color := GGlobals.FormColour;
  DMrep1.TariButtonList.GetImage(0, CloseBtn.Glyph);
end;

procedure TAboutDialogFm.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

end.
