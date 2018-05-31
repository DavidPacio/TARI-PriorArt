unit TARIParablesSplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, cxControls, cxContainer, cxEdit, cxCheckBox, StdCtrls,
  cxButtons, LGlobals, ShellAPI, DMrep1U, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TTariParablesSplashF = class(TForm)
    ExitBtn: TcxButton;
    StartupCB: TcxCheckBox;
    cxLabel1: TcxLabel;
    ViewTARIParablesBtn: TcxButton;
    procedure ViewTARIParablesBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure StartupCBClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TariParablesSplashF: TTariParablesSplashF;

implementation

{$R *.dfm}

procedure TTariParablesSplashF.ViewTARIParablesBtnClick(Sender: TObject);
var
  ConcatfileS, directory, params  : array[0..200] of char;
begin
 strPcopy(directory, GGlobals.BaseDir);
 strPcopy(params, '');
 strPcopy(ConcatfileS, 'Help\TARI Parables.pdf');
 ShellExecute(0, nil, concatfileS, nil, directory, SW_SHOWNORMAL );
end;

procedure TTariParablesSplashF.FormCreate(Sender: TObject);
begin
  Color := GGlobals.FormColour;
  if GGlobals.Servers.TARISplashCount = 0 then
    CxLabel1.Caption := 'TARI Parables' + #13#10 + 'Real Life Case Studies'
  else
    CxLabel1.Caption := 'TARI Parables' + #13#10 + 'Real Life Case Studies' + #13#10 + 'A Great Way to Learn';
end;

procedure TTariParablesSplashF.StartupCBClick(Sender: TObject);
begin
  Inc(GGlobals.Servers.TARISplashCount);    
end;

end.
