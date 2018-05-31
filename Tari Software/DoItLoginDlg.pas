unit DoItLoginDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DoItLoginU;

type
  TDoItLoginDlg = class(TComponent)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    PostStartup : Boolean;
    function Execute(PCurrentUser, UserPwd: Pchar; PCurrentUserRole: Pchar): Integer;  published
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('ElanElan', [TDoItLoginDlg]);
end;

function TDoItLoginDlg.Execute(PCurrentUser, UserPwd: Pchar; PCurrentUserRole: Pchar): Integer;
begin

  try
    try
//      DMuserM.Database1.Connected := True;
      DoITLogin := TDoItLogin.create(Application);
      if PostStartup then
        begin
        DoITLogin.BorderStyle := bsSingle;
        DoITLogin.Position := poScreenCenter;
        DoITLogin.Height := 207;
        end
      else
        DoITLogin.BorderStyle := bsNone;
      with DoItLogin do
        begin
        Username := StrPas(PCurrentUser);
        DatabaseRole := StrPas(PCurrentUserRole);
        Result := Showmodal;
        if Result = mrOK // entered password correctly
          then begin
          StrPcopy(PCurrentUser, Username);
          StrPcopy(PCurrentUserRole, DatabaseRole);
          strPcopy(Userpwd, UserPassword);
          Result := mrOK;
          end
        else  Result := mrCancel;
        end;
    finally
      DoItLogin.Destroy;
  end;
  except
    raise;
  end;
//  DMuserM.Destroy;
end;

end.
