unit TargetDisclaimer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TextTemplateConverter;

type
  TTargetDisclaimerF = class(TForm)
    TextTemplateConverter1: TTextTemplateConverter;
    TextRetriever: TMemo;
  private
    { Private declarations }
    function GetDisclaimerRef(Filename: String; dosubstitution : boolean): String;
  public
    { Public declarations }
    AddDisclaimer : Boolean;
    ForwardRef, DisclaimerText : string;
    procedure LoadDisclaimers(ClientName, periodend, currentdate: string);
  end;

var
  TargetDisclaimerF: TTargetDisclaimerF;

implementation

{$R *.dfm}

function TTargetDisclaimerF.GetDisclaimerRef(Filename: String; dosubstitution : boolean): String;
begin
  TextRetriever.Lines.Clear;
  if fileexists(Filename) then
    TextRetriever.Lines.LoadFromFile(Filename);
  if dosubstitution then
    Result := TextTemplateConverter1.Convert(TextRetriever.Text)
  else
    Result := TextRetriever.Text;
end;

procedure TTargetDisclaimerF.LoadDisclaimers(ClientName, periodend, currentdate: string);
begin
  ForwardRef := GetDisclaimerRef('DisclaimRef.txt', false);
  TextTemplateConverter1.Params.Items[0].Value := ClientName;
  TextTemplateConverter1.Params.Items[0].Value := periodend;
  TextTemplateConverter1.Params.Items[0].Value := Currentdate;
  DisclaimerText := GetDisclaimerRef('Disclaimer.txt', true);
  if (length(Forwardref) = 0) or (length(DisclaimerText) = 0) then
    AddDisclaimer := False
  else
    AddDisclaimer := True;
end;

end.
