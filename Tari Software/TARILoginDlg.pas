unit TARILoginDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	TARILoginU, Splash1;

type
  TTARILoginDlg = class(TComponent)
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

//procedure Register;

implementation

{
procedure Register;
begin
	RegisterComponents('ElanElan', [TTARILoginDlg]);
end;
}
function TTARILoginDlg.Execute(PCurrentUser, UserPwd: Pchar; PCurrentUserRole: Pchar): Integer;
begin

  try
    try
//      DMuserM.Database1.Connected := True;
      TARILogin := TTARILogin.create(Application);
      if PostStartup then
        begin
//        TARILogin.BorderStyle := bsDialog;
				TARILogin.Position := poScreenCenter;
				end
			else
				begin
//				TARILogin.Position := poScreenCenter;
				TARILogin.top := Splash1.SplashForm.top + Splash1.SplashForm.Height;
				TARILogin.left := trunc(abs((Screen.Width - TARILogin.Width) / 2));
        end;
//        TARILogin.BorderStyle := bsNone;
      with TARILogin do
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
      TARILogin.Destroy;
  end;
  except
    raise;
  end;
end;

end.
