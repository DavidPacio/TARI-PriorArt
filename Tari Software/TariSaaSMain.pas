unit TariSaaSMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxTextEdit, cxLabel, dxSkinsForm, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, Data.DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, cxCurrencyEdit, cxDBEdit, data.fmtbcd, Vcl.Grids, IB_ArrayGrid, IB_Utils;

type
  TTariSaaSMainF = class(TForm)
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    UsernameTxt: TcxTextEdit;
    Passwordtxt: TcxTextEdit;
    LoginBtn: TcxButton;
    LogoutBtn: TcxButton;
    dxSkinController1: TdxSkinController;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1BUSINESS_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1CITY: TcxGridDBColumn;
    cxGrid1DBTableView1CURRENCY_SYM: TcxGridDBColumn;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxDBCurrencyEdit1: TcxDBCurrencyEdit;
    BalanceEdit: TcxCurrencyEdit;
    IB_ArrayGrid1: TIB_ArrayGrid;
    procedure LoginBtnClick(Sender: TObject);
    procedure LogoutBtnClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
  private
    { Private declarations }
    arraypos:integer;
    Bals:array[0..11] of int64;
    Balances:array[0..11] of Currency;
  public
    { Public declarations }
  end;

var
  TariSaaSMainF: TTariSaaSMainF;

implementation

{$R *.dfm}

uses DMTariSaaS;

procedure TTariSaaSMainF.cxButton1Click(Sender: TObject);
var
  I: Integer;
  TmpSc : smallint;
  Padchar : ansichar;
  dim : smallint;
  bufsize : integer;
  buffer : pointer;
  moveBuf : pointer;
begin
  if (DMTSaaS.TARI_FB.Connected) then
    begin
    if (dmtSaaS.DetailedTargetIBQry.Active) then
      begin
//      dmtSaaS.Detailed_TargetsQry.Edit;
//      dmtSaaS.Detailed_TargetsQryBALANCES.PutArray(@Balances, 8 * 12);
      DmtSaaS.DetailedTargetIBQry.Post;
      dmtSaaS.DetailedTargetIBQry.Active := false;
      end
    else
      begin
      DMTSaas.Detailed_TargetsQry.ParamByName('BUSINESSID').AsInteger := 1;
      DmtSaaS.Detailed_TargetsQry.ParamByName('ACCOUNTID').AsInteger := 2020;
      dmtsaas.Detailed_TargetsQry.Prepare;
      dmtSaaS.Detailed_TargetsQry.Active := True;

      dmtSaaS.Detailed_TargetsQryBALANCES.GetArray(@bals, dmtSaaS.Detailed_TargetsQryBALANCES.ElementByteLength * dmtSaaS.Detailed_TargetsQryBALANCES.ElementCount);
      tmpSc := dmtSaaS.Detailed_TargetsQryBALANCES.ArrayDesc.array_desc_scale - 256;
//      ScaleExtended( int64( aBuf^ ), tmpSc );
      for I := 0 to dmtSaaS.Detailed_TargetsQryBALANCES.ElementCount - 1 do
        begin
        Balances[i] := ScaleExtended( Bals[i], tmpSc );
        end;
      dmtSaaS.DetailedTargetIBQry.ParamByName('BUSINESSID').AsInteger := 1;
      dmtSaaS.DetailedTargetIBQry.ParamByName('ACCOUNTID').AsInteger := 100;
      dmtSaaS.DetailedTargetIBQry.Prepare;
      dmtsaas.DetailedTargetIBQry.Active := true;
      end;
    end;
end;

procedure TTariSaaSMainF.cxButton2Click(Sender: TObject);
begin
  if arraypos >= 0 then
    balances[arraypos] := Balanceedit.Value;
  if (arraypos < 11) then
    inc(arrayPos);
  BalanceEdit.Value := Balances[arraypos];
end;

procedure TTariSaaSMainF.cxButton3Click(Sender: TObject);
begin
  if arraypos >= 0 then
    balances[arraypos] := Balanceedit.Value;
  if (arraypos > 0) then
    dec(arraypos);
  BalanceEdit.Value := Balances[arraypos];
end;

procedure TTariSaaSMainF.LoginBtnClick(Sender: TObject);
begin
  arraypos := -1;
  if (DMTSaaS.DoHttpLogin(UserNametxt.Text, Passwordtxt.Text)) then
    begin
    DMTSaaS.ConnectDB(MemberID);
    LoginBtn.Enabled := false;
    LogoutBtn.Enabled := true;
    end;
end;

procedure TTariSaaSMainF.LogoutBtnClick(Sender: TObject);
begin
  DMTSaas.DisconnectDB;
  LogoutBtn.Enabled := false;
  LoginBtn.Enabled := true;
end;

end.
