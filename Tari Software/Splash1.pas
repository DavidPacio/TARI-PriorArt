unit Splash1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, LGlobals, Extctrls, jpeg, cxControls,
  cxContainer, cxEdit, cxProgressBar, cxLabel, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinXmas2008Blue, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint;

type
  TSplashForm = class(TForm)
    Timer: TTimer;
    Image1: TImage;
		ProgressBar: TcxProgressBar;
    StartLabel: TcxLabel;
    procedure TimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Initialisation : Boolean;
    initfailed : Boolean; //= False;
    ClosingApp : Boolean; //= False;
  end;

var
  SplashForm: TSplashForm;
  Fader1, AlphaSteps : integer;

implementation

{$R *.DFM}

procedure TSplashForm.TimerTimer(Sender: TObject);
begin
  if Fader1 = 0 then
    begin
    Timer.Enabled := False;
    Close;
    end
  else
    begin
    AlphaBlendValue := AlphaBlendValue - AlphaSteps;
    dec(Fader1);
    Timer.Enabled := True;
    end;
end;

procedure TSplashForm.FormCreate(Sender: TObject);
begin
  initfailed := False;
  ClosingApp := False;
  initialisation := True;
  Color := GGlobals.FormColour;
  Left := trunc((screen.width - width) / 2);
  Top := trunc(Screen.Height / 2 - 300) + 10;
  ProgressBar.Position := 1;
  Refresh;
end;

procedure TSplashForm.FormShow(Sender: TObject);
begin
 Update;
end;

end.
