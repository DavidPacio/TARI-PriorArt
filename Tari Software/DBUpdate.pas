unit DBUpdate;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, IB_Process,
  IB_Script, IB_Components, LGlobals, DataCollector, IB_StoredProc,
  IB_Access, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxTextEdit, cxMemo, Vcl.Menus, cxButtons;

type
  TDBUpdateF = class(TForm)
    IB_Script1: TIB_Script;
    IB_Connection1: TIB_Connection;
    IB_Transaction1: TIB_Transaction;
    IB_Query1: TIB_Query;
    qryMasterDB: TIB_Query;
    MasterDB: TIB_Connection;
    IB_Transaction2: TIB_Transaction;
    SPCreateBusiness: TIB_StoredProc;
    cxMemo1: TcxMemo;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure IB_Script1Statement(Sender: TIB_Script;
      var Statement: String; var SkipIt: Boolean);
    procedure IB_Script1Error(Sender: TObject; const ERRCODE: Integer;
      ErrorMessage, ErrorCodes: TStringList; const SQLCODE: Integer;
      SQLMessage, SQL: TStringList; var RaiseException: Boolean);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    procedure ConnectMaster;
    procedure ConnectTARGET;
    procedure UpdateGroups;
    procedure UpdateTemplates;
    procedure UpdateAccountTitles;
    procedure CreateBranch;
  public
    { Public declarations }
    Updateto, CurrentVersion : string;
    procedure SetMemo;
  end;

var
  DBUpdateF: TDBUpdateF;
//  Servername2 : string;
  FilePath1, CurrentUser1, CurrentUserPwd1 : string;
  Lineno : Integer;
  UpdateFailed : Boolean;

implementation

{$R *.DFM}


procedure TDBUpdateF.FormCreate(Sender: TObject);
begin
  cxButton2.Enabled := True;
  cxButton1.Enabled := True;
  UpdateFailed := True;
end;

procedure TDBUpdateF.SetMemo;
begin
  cxMemo1.lines.Clear;
  if (CurrentVersion = '1.3.4') and (Updateto = '1.3.5') then
    cxMemo1.Lines.add('Updating Database from version 1.3.4 to 1.3.5');
  if (CurrentVersion = '1.3.4') and (Updateto = '1.3.6') then
    cxMemo1.Lines.add('Updating Database from version 1.3.4 to 1.3.6');
  if (CurrentVersion = '1.3.4') and (Updateto = '1.3.7') then
    cxMemo1.Lines.add('Updating Database from version 1.3.4 to 1.3.7');
  if (CurrentVersion = '1.3.4') and (Updateto = '1.3.8') then
    cxMemo1.Lines.add('Updating Database from version 1.3.4 to 1.3.8');
  if (CurrentVersion = '1.3.5') and (Updateto = '1.3.6') then
    cxMemo1.Lines.add('Updating Database from version 1.3.5 to 1.3.6');
  if (CurrentVersion = '1.3.5') and (Updateto = '1.3.7') then
    cxMemo1.Lines.add('Updating Database from version 1.3.5 to 1.3.7');
  if (CurrentVersion = '1.3.5') and (Updateto = '1.3.8') then
    cxMemo1.Lines.add('Updating Database from version 1.3.5 to 1.3.8');
  if (CurrentVersion = '1.3.5') and (Updateto = '1.3.7') then
    cxMemo1.Lines.add('Updating Database from version 1.3.6 to 1.3.7');
  if (CurrentVersion = '1.3.6') and (Updateto = '1.3.7') then
    cxMemo1.Lines.add('Updating Database from version 1.3.6 to 1.3.7');
  if (CurrentVersion = '1.3.6') and (Updateto = '1.3.8') then
    cxMemo1.Lines.add('Updating Database from version 1.3.6 to 1.3.8');
  if (CurrentVersion = '1.3.7') and (Updateto = '1.3.8') then
    cxMemo1.Lines.add('Updating Database from version 1.3.7 to 1.3.8');
  if (CurrentVersion = '1.3.8') and (Updateto = '1.3.9') then
    cxMemo1.Lines.add('Updating Database from version 1.3.8 to 1.3.9');
end;

procedure TDBUpdateF.Button1Click(Sender: TObject);
begin
  lineno := 1;
  IB_Connection1.Disconnect;
  IB_Connection1.Path := FilePath1;
  IB_Connection1.Server := GGlobals.Servers.CurrentServer.ServerName + '/' + GGlobals.Servers.CurrentServer.port;
  IB_Connection1.UserName := 'SYSDBA';
  if length(GGlobals.Servers.CurrentServer.SysdbaPassword) > 0  then
    IB_Connection1.Password := GGlobals.Servers.CurrentServer.SysdbaPassword
  else
    IB_Connection1.Password := 'masterkey';
  IB_Connection1.Protocol := GGlobals.Servers.CurrentServer.realprotocol;
  IB_Connection1.connect;

  if (CurrentVersion = '1.3.3') then
    begin
    cxMemo1.Lines.Add('This database has a very old version (1.3.3)');
    cxMemo1.Lines.Add('Consequently, it can not be updated.');
    cxMemo1.Lines.Add('');
    cxMemo1.Lines.Add('Please create a new file or call support for help.');
    exit;
    end;
  if (CurrentVersion = '1.3.4') and (Updateto = '1.3.5') then
    IB_Script1.SQL.LoadFromFile('proto\Update134-135.sql');
  if (CurrentVersion = '1.3.4') and (Updateto = '1.3.6') then
    IB_Script1.SQL.LoadFromFile('proto\Update134-136.sql');
  if (CurrentVersion = '1.3.4') and (Updateto = '1.3.7') then
    IB_Script1.SQL.LoadFromFile('proto\Update134-137.sql');
  if (CurrentVersion = '1.3.4') and (Updateto = '1.3.8') then
    IB_Script1.SQL.LoadFromFile('proto\Update134-138.sql');
  if (CurrentVersion = '1.3.5') and (Updateto = '1.3.6') then
    IB_Script1.SQL.LoadFromFile('proto\Update135-136.sql');
  if (CurrentVersion = '1.3.5') and (Updateto = '1.3.7') then
    IB_Script1.SQL.LoadFromFile('proto\Update135-137.sql');
  if (CurrentVersion = '1.3.5') and (Updateto = '1.3.8') then
    IB_Script1.SQL.LoadFromFile('proto\Update135-138.sql');
  if (CurrentVersion = '1.3.6') and (Updateto = '1.3.7') then
    IB_Script1.SQL.LoadFromFile('proto\Update136-137.sql');
  if (CurrentVersion = '1.3.6') and (Updateto = '1.3.8') then
    IB_Script1.SQL.LoadFromFile('proto\Update136-138.sql');
  if (CurrentVersion = '1.3.7') and (Updateto = '1.3.8') then
    IB_Script1.SQL.LoadFromFile('proto\Update137-138.sql');
  if (CurrentVersion = '1.3.8') and (Updateto = '1.3.9') then
    IB_Script1.SQL.LoadFromFile('proto\Update138-139.sql');
//  IB_Script1.SQL.Insert(0, 'CONNECT ''' + GGlobals.Servers.CurrentServer.ServerName + ':' + FilePath1 + '''');
//  IB_Script1.SQL.Insert(1, 'USER ''SYSDBA'' PASSWORD ''masterkey'';');
  IB_Script1.Prepare;
  while not IB_script1.prepared do
  begin
    sleep(1000);
  end;    // while
  IB_script1.Execute;
  IB_script1.Unprepare;
  IB_Script1.IB_Transaction.Commit;
  if (Updateto = '1.3.5') or (Updateto = '1.3.6') or (Updateto = '1.3.7') or (CurrentVersion <= '1.3.6') or (Updateto = '1.3.8') then
    begin
    ConnectMaster;
    ConnectTarget;
    UpdateGroups;
    UpdateAccountTitles;
    UpdateTemplates;
    Masterdb.connected := false;
    end;
  if (Updateto = '1.3.8') then
    begin
    // create Business Branch and default "hidden" departments.
    // link all existing departments to this branch
    CreateBranch;
    end;
  Ib_Connection1.DefaultTransaction.Commit;
  IB_Connection1.Disconnect;

  cxMemo1.Lines.Add('Update Successful!');
  GGlobals.DebugOut('DBVersionCheck - Finished');
  UpdateFailed := False;
  cxButton1.Enabled := False;
end;

procedure TDBUpdateF.CreateBranch;
begin
  spCreateBusiness.ParamByName('BUS_NAME').Value := 'Main Business';
  spCreateBusiness.ParamByName('CURR_NAME').Value := 'AUD';
  spCreateBusiness.ParamByName('CURR_SYMBOL').Value := '$';
  spCreateBusiness.ParamByName('CONVERSION').Value := 1.00;
  SPCreateBusiness.Execute;
  SPCreateBusiness.IB_Transaction.Commit;
end;

procedure TDBUpdateF.IB_Script1Statement(Sender: TIB_Script;
  var Statement: String; var SkipIt: Boolean);
begin
  cxMemo1.Lines.Add('Executing Line - ' + inttostr(Lineno));
  Skipit := False;
  inc(Lineno);
end;

procedure TDBUpdateF.IB_Script1Error(Sender: TObject;
  const ERRCODE: Integer; ErrorMessage, ErrorCodes: TStringList;
  const SQLCODE: Integer; SQLMessage, SQL: TStringList;
  var RaiseException: Boolean);
begin
  cxMemo1.lines.add('Error - ' + IB_script1.CurrentSQL);
  RaiseException := False;
end;

procedure TDBUpdateF.BitBtn2Click(Sender: TObject);
begin
  IB_Transaction1.Commit;
  IB_Connection1.Connected := False;
  if UpdateFailed then
    ModalResult := mrCancel
  else
    ModalResult := mrOk;
end;

procedure TDBUpdateF.UpdateGroups;
begin
  try
    try
    IB_Query1.SQL.Clear;
    IB_Query1.SQL.Add('SELECT * FROM ACCOUNT_GROUPS');
    IB_Query1.SQL.Add('FOR UPDATE;');
    IB_Query1.Prepare;
    IB_Query1.Open;
    qryMasterDB.SQL.Clear;
    qryMasterDB.SQL.Add('SELECT * FROM ACCOUNT_GROUPS');
    qryMasterdb.Prepare;
    qryMasterdb.Open;
    if (Updateto = '1.3.6') or (Updateto = '1.3.7') then
      begin
      IB_Query1.First;
      while IB_Query1.Eof = False do
        begin
        IB_Query1.Delete;
        IB_Query1.next;
        end;    // while
      end;
    qryMasterdb.First;
    while qryMasterdb.Eof = False do
      begin
      IB_Query1.Insert;
      IB_Query1.fieldbyName('ACCOUNT_GRP_ID').value := qryMasterdb.FieldByName('ACCOUNT_GRP_ID').value;
      IB_Query1.fieldbyName('GROUP_NAME').value := qryMasterdb.FieldByName('GROUP_NAME').value;
      IB_Query1.fieldbyName('GROUP_DR_SIGN').value := qryMasterdb.FieldByName('GROUP_DR_SIGN').value;
      IB_Query1.Post;
      qryMasterdb.Next;
      end;    // while
    finally
    qrymasterdb.Close;
    qrymasterdb.Unprepare;
    IB_Query1.Unprepare;
    end;
  except
  end;
end;

procedure TDBUpdateF.UpdateTemplates;
begin
  try
    try
    IB_Query1.SQL.Clear;
    IB_Query1.SQL.Add('SELECT * FROM IMPORT_TEMPLATES');
    IB_Query1.SQL.Add('FOR UPDATE;');
    IB_Query1.Prepare;
    IB_Query1.Open;
    qryMasterDB.SQL.Clear;
    qryMasterDB.SQL.Add('SELECT * FROM IMPORT_TEMPLATES');
    qryMasterdb.Prepare;
    qryMasterdb.Open;
    if (Updateto = '1.3.6') then
      begin
      qryMasterdb.First;
      while qryMasterdb.Eof = False do
        begin
        IB_Query1.Insert;
        IB_Query1.fieldbyName('TEMPLATE_ID').value := qryMasterdb.FieldByName('TEMPLATE_ID').value;
          IB_Query1.fieldbyName('TEMPLATE_NAME').value := qryMasterdb.FieldByName('TEMPLATE_NAME').value;
        IB_Query1.Post;
        qryMasterdb.Next;
        end;    // while
      end;
    finally
    qrymasterdb.Close;
    qrymasterdb.Unprepare;
    IB_Query1.Unprepare;
    end;
  except
  end;
// Second Part
  try
    try
    IB_Query1.SQL.Clear;
    IB_Query1.SQL.Add('SELECT * FROM TEMPLATE_DETAILS');
    IB_Query1.SQL.Add('FOR UPDATE;');
    IB_Query1.Prepare;
    IB_Query1.Open;
    qryMasterDB.SQL.Clear;
    qryMasterDB.SQL.Add('SELECT * FROM TEMPLATE_DETAILS');
    qryMasterdb.Prepare;
    qryMasterdb.Open;
    if (Updateto = '1.3.6') then
      begin
      qryMasterdb.First;
      while qryMasterdb.Eof = False do
        begin
        IB_Query1.Insert;
        IB_Query1.fieldbyName('TEMPLATE_ID').value := qryMasterdb.FieldByName('TEMPLATE_ID').value;
        IB_Query1.fieldbyName('SOURCE_ID').value := qryMasterdb.FieldByName('SOURCE_ID').value;
        IB_Query1.fieldbyName('ACCOUNT_NUMBER').value := qryMasterdb.FieldByName('ACCOUNT_NUMBER').value;
        IB_Query1.Post;
        qryMasterdb.Next;
        end;    // while
      end;
    finally
    qrymasterdb.Close;
    qrymasterdb.Unprepare;
    IB_Query1.Unprepare;
    end;
  except
  end;
end;

procedure TDBUpdateF.ConnectMaster;
begin
  MasterDB.server := GGlobals.Servers.CurrentServer.ServerName + '/' + GGlobals.Servers.CurrentServer.port;
  MasterDB.Path := GGlobals.Servers.CurrentServer.ServerPath + 'proto' + slashchar + 'MASTER.FDB';
  GGlobals.DebugOut('DBVersionCheck - Path = ' + MasterDB.Path);
  Masterdb.username := 'SYSDBA'; //'Admins';
  if length(GGLobals.Servers.CurrentServer.SysdbaPassword) > 0 then
    MasterDB.password := GGLobals.Servers.CurrentServer.SysdbaPassword
  else
    MasterDB.password := 'masterkey'; //GGlobals.Adminpwd;
  Masterdb.SQLRole := 'FBMADMIN';
  Masterdb.Protocol := GGlobals.Servers.CurrentServer.realprotocol;
  GGlobals.DebugOut('DBVersionCheck - after Protocol');
  Masterdb.connect;
end;

procedure TDBUpdateF.ConnectTarget;
begin
  IB_Connection1.Disconnect;
  IB_Connection1.Path := FilePath1;
  IB_Connection1.Server := GGlobals.Servers.CurrentServer.ServerName + '/' + GGlobals.Servers.CurrentServer.port;
  IB_Connection1.UserName := 'SYSDBA'; //'Admins';
  if length(GGLobals.Servers.CurrentServer.SysdbaPassword) > 0 then
    IB_Connection1.Password := GGLobals.Servers.CurrentServer.SysdbaPassword
  else
    IB_Connection1.Password := 'masterkey'; //GGlobals.Adminpwd;
  IB_Connection1.SQLRole := 'FBMADMIN';
  IB_Connection1.Protocol := GGlobals.Servers.CurrentServer.realprotocol;
  IB_Connection1.connect;
end;

procedure TDBUpdateF.UpdateAccountTitles;
//var
//  varg : Variant;
begin
  try
    try
    IB_Query1.SQL.Clear;
    IB_Query1.SQL.Add('SELECT * FROM ACCOUNT_TITLES');
    IB_Query1.SQL.Add('FOR UPDATE;');
    IB_Query1.Prepare;
    IB_Query1.Open;
    qryMasterDB.SQL.Clear;
    qryMasterDB.SQL.Add('SELECT * FROM ACCOUNT_TITLES');
{    if (Updateto = '1.3.6') then
      qryMasterdb.SQL.Append('where (ACCOUNT_NUMBER > 990) and (ACCOUNT_NUMBER < 1600);')
    else
      qryMasterdb.SQL.Append('where (ACCOUNT_NUMBER > 990) and (ACCOUNT_NUMBER < 1600);');
}
    qryMasterdb.Prepare;
    qryMasterdb.Open;
    if (UpdateTo = '1.3.7') then
      begin
{      IB_Query1.First;
      while IB_Query1.Eof = False do
        begin
        if ((IB_Query1.fieldbyName('ACCOUNT_NUMBER').value > 211)  and (IB_Query1.fieldbyName('ACCOUNT_NUMBER').value < 980)
           and (length(IB_Query1.fieldbyName('ACCOUNT_TITLE').value) < 2))then
          IB_Query1.Delete
        else
          begin
          varg := IB_Query1.fieldbyName('ACCOUNT_NUMBER').value;
          IB_Query1.Edit;
          if (qryMasterDB.Locate('ACCOUNT_NUMBER', varg, [])) and (qryMasterdb.FieldByName('ACCOUNT_GROUP').IsNotNull) then
            IB_Query1.fieldbyName('ACCOUNT_GROUP').value := qryMasterdb.FieldByName('ACCOUNT_GROUP').value;
          if ((IB_Query1.fieldbyName('ACCOUNT_NUMBER').value > 990)  and (IB_Query1.fieldbyName('ACCOUNT_NUMBER').value < 1600)) then
            IB_Query1.fieldbyName('ACCOUNT_TITLE').value := qryMasterdb.FieldByName('ACCOUNT_TITLE').value;
          IB_Query1.fieldbyName('NON_CASH').value := 0;
          IB_Query1.fieldbyName('WAGE_ACCOUNT').value := 0;
          IB_Query1.fieldbyName('INTEREST_ACCOUNT').value := 0;
          IB_Query1.Post;
          IB_Query1.Next;
          end;
        end;    // while
}
      IB_Query1.First;
      while IB_Query1.Eof = False do
        begin
        if ((IB_Query1.fieldbyName('ACCOUNT_NUMBER').value > 990)  and (IB_Query1.fieldbyName('ACCOUNT_NUMBER').value < 1600))
           or ((IB_Query1.fieldbyName('ACCOUNT_NUMBER').value > 211)  and (IB_Query1.fieldbyName('ACCOUNT_NUMBER').value < 980)
           and (length(IB_Query1.fieldbyName('ACCOUNT_TITLE').value) < 2))then
          IB_Query1.Delete
        else
          IB_Query1.next;
        end;    // while
      end;
    IB_Query1.First;
    qryMasterdb.First;
    while qryMasterdb.Eof = False do
      begin
      if (qryMasterdb.FieldByName('ACCOUNT_NUMBER').value > 990) and (qryMasterdb.FieldByName('ACCOUNT_NUMBER').value < 1600) then
        begin
        IB_Query1.Insert;
        IB_Query1.fieldbyName('ACCOUNT_NUMBER').value := qryMasterdb.FieldByName('ACCOUNT_NUMBER').value;
        IB_Query1.fieldbyName('ACCOUNT_GROUP').value := qryMasterdb.FieldByName('ACCOUNT_GROUP').value;
        IB_Query1.fieldbyName('ACCOUNT_TITLE').value := qryMasterdb.FieldByName('ACCOUNT_TITLE').value;
        IB_Query1.fieldbyName('STATIC_VALUE').value := qryMasterdb.FieldByName('STATIC_VALUE').value;
        IB_Query1.fieldbyName('NON_CASH').value := qryMasterdb.FieldByName('NON_CASH').value;
        IB_Query1.fieldbyName('WAGE_ACCOUNT').value := qryMasterdb.FieldByName('WAGE_ACCOUNT').value;
        IB_Query1.fieldbyName('INTEREST_ACCOUNT').value := qryMasterdb.FieldByName('INTEREST_ACCOUNT').value;
        IB_Query1.fieldbyName('ACCOUNT_SUBTITLE').value := qryMasterdb.FieldByName('ACCOUNT_SUBTITLE').value;
        IB_Query1.fieldbyName('DR_CASHFLOW_ACCOUNT').value := qryMasterdb.FieldByName('DR_CASHFLOW_ACCOUNT').value;
        IB_Query1.fieldbyName('CR_CASHFLOW_ACCOUNT').value := qryMasterdb.FieldByName('CR_CASHFLOW_ACCOUNT').value;
        IB_Query1.Post;
        end;
      qryMasterdb.Next;
      end;    // while

    // Fix up Non Cash Field
    while IB_Query1.Eof = False do
      begin
      IB_Query1.Edit;
      if (IB_query1.FieldByName('ACCOUNT_NUMBER').Value < 991) or (IB_query1.FieldByName('ACCOUNT_NUMBER').Value > 1600) then
        begin
        if IB_Query1.FieldByName('ACCOUNT_NUMBER').Value = 360 then
          IB_Query1.FieldByName('NON_CASH').Value := 1
        else
          IB_Query1.FieldByName('NON_CASH').Value := 0;
        if IB_Query1.FieldByName('WAGE_ACCOUNT').IsNull then
          IB_Query1.FieldByName('WAGE_ACCOUNT').Value := 0;
        if IB_Query1.FieldByName('ACCOUNT_TITLE').Value = 'Interest' then // was interest
          IB_Query1.FieldByName('INTEREST_ACCOUNT').Value := 1
        else
          IB_Query1.FieldByName('INTEREST_ACCOUNT').Value := 0;
        end;
      IB_Query1.Post;
      IB_Query1.Next;
      end;    // while
    finally
    qrymasterdb.Close;
    qrymasterdb.Unprepare;
    IB_Query1.Unprepare;
    end;
  except
  end;
end;


end.
