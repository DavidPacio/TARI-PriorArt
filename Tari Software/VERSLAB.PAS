{
Unit        : verslab.pas
Description : A TCustomLabel derivative that displays Win32 VersionInfo data
Version     : 1.00, 15 June 1997
Status      : Freeware
Contact     : Marc Evans, marc@leviathn.demon.co.uk
}


unit verslab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

const
    {The order of this array must be the same as the VersionResources
    enum type as that is used for the index lookup}
    VersionLookup: array[0..8, 0..1] of string = (
                    ('CompanyName', 'Company Name:'),
                    ('FileDescription', 'File Description:'),
                    ('FileVersion', 'File Version:'),
                    ('InternalName', 'Internal Name:'),
                    ('LegalCopyright', 'Legal Copyright:'),
                    ('OriginalFilename', 'Original Filename:'),
                    ('ProductName', 'Product Name:'),
                    ('ProductVersion', 'Product Version:'),
                    ('Comments', 'Comments:'));

type
    TVersionResources = (vrCompanyName, vrFileDescription, vrFileVersion,
                         vrInternalName, vrLegalCopyright, vrOriginalFilename,
                         vrProductName, vrProductVersion, vrComments);

type
  TVersionLabel = class(TCustomLabel)
  private
    { Private declarations }
    FVersionResource: TVersionResources;
    FInfoPrefix: string;
    FShowInfoPrefix: boolean;
    FVersionResourceKey: string;
    FLangCharset: string;

    procedure SetupInfoPrefix;
    procedure SetupResourceKey;
    function GetInfo: string;
    procedure SetupCaption;
  protected
    { Protected declarations }
    procedure SetInfoPrefix(Value: String);
    function GetInfoPrefix: string;
    procedure SetVersionResource(Value: TVersionResources);
    procedure SetShowInfoPrefix(Value: boolean);
    procedure SetVersionResourceKey(Value: string);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  published
    { Published declarations }
    property VersionResource: TVersionResources read FVersionResource
                                                write SetVersionResource;
    property VersionResourceKey: string read FVersionResourceKey
                                         write SetVersionResourceKey;
    property InfoPrefix: String read GetInfoPrefix write SetInfoPrefix;
    property ShowInfoPrefix: boolean read FShowInfoPrefix write SetShowInfoPrefix;
    property LangCharset: string read FLangCharset write FLangCharset;    
    property WordWrap;
    property Align;
    property Color;
    property Font;
    property AutoSize;
    property Alignment;
    property ParentFont;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TVersionLabel]);
end;

constructor TVersionLabel.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);
    WordWrap := false;
    Autosize := true;
    ShowInfoPrefix := true;
    LangCharset :='080904E4';   {0409 is US prefix I think}
    VersionResource := vrFileVersion;
end;

destructor TVersionLabel.Destroy;
begin
    inherited Destroy;
end;

procedure TVersionLabel.SetVersionResource(Value: TVersionResources);
begin
    FVersionResource := Value;
    SetupResourceKey;
    SetupInfoPrefix;
end;

procedure TVersionLabel.SetupInfoPrefix;
var s: string;
begin
    s := VersionLookup[Integer(Self.VersionResource), 1];
    InfoPrefix := s;
end;

procedure TVersionLabel.SetupResourceKey;
var s: string;
begin
    s := VersionLookup[Integer(Self.VersionResource), 0];
    VersionResourceKey := s;
end;

function TVersionLabel.GetInfo: string;
var dump : cardinal;
    s: integer;
    vallen: cardinal;
    buffer, VersionValue: pchar;
    VersionPointer: pchar;
begin
    if csDesigning in Self.ComponentState then result := '< No design info >'
    else
    begin
        s := GetFileVersionInfoSize(pchar(Application.Exename), dump);
        if  s = 0 then
        begin
            Result := '< No Data Available >';
        end
        else
        begin
            buffer := StrAlloc(s+1);
            GetFileVersionInfo(Pchar(Application.Exename), 0, s, buffer);
            if VerQueryValue(buffer, pchar('\\StringFileInfo\\'+LangCharSet+'\\'+
                             VersionResourceKey),
                             pointer(VersionPointer), vallen) then
            begin
                if (Vallen > 1) then
                begin
                    VersionValue := StrAlloc(vallen+1);
                    StrLCopy(VersionValue, VersionPointer, vallen);
                    Result := VersionValue;
                    StrDispose(Buffer);
                    StrDispose(VersionValue);
                end
                else Result := 'No Version Info';
            end
            else result := 'Error retrieving version info';
        end;
    end;
    if ShowInfoPrefix then Result := InfoPrefix+' '+Result;
end;

procedure TVersionLabel.SetInfoPrefix(Value: String);
begin
    if FInfoPrefix = Value then exit;
    FInfoPrefix := Value;
    {The caption needs to be recalculated everytime the prefix is
    changed, otherwise the detaults override the user specified one}
    SetupCaption;
end;

procedure TVersionLabel.SetVersionResourceKey(Value: string);
begin
    if FVersionResourceKey = Value then exit;
    FVersionResourceKey := Value;
    InfoPrefix := Value;
end;

function TVersionLabel.GetInfoPrefix: string;
begin
    result := FInfoPrefix;
end;

procedure TVersionLabel.SetShowInfoPrefix(Value: boolean);
begin
    if FShowInfoPrefix = value then exit;
    FShowInfoPrefix := Value;
    SetupCaption;
end;

procedure TVersionLabel.SetupCaption;
begin
    Caption := GetInfo;
end;

end.
