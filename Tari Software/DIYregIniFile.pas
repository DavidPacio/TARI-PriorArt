{*******************************************************************************

  DIY  © 2000 Hartley Australia Ltd

  DIYregiInifile.PAS:
  History
  26.0500 Created
*******************************************************************************}

unit DIYregIniFile;

interface

uses SysUtils, WinTypes, Registry, Inifiles, registryIniFile, graphics,
     filectrl, DBLink;

const
{---- Main HIL registry key ----}
  HARTLEY_REGISTRY_KEY          = 'SOFTWARE\Hartley International Ltd';
  
{---- HC Registry keys constants ----}
  HARTLEY_HC_REGISTRY_KEY      = HARTLEY_REGISTRY_KEY+'\Hartley Consultant\1.0';
  HARTLEY_HC_REGISTRY_KEY_DIR  = HARTLEY_HC_REGISTRY_KEY+'\Directory Setup';
  HARTLEY_HC_REGISTRY_KEY_OPT  = HARTLEY_HC_REGISTRY_KEY+'\Options';
  HARTLEY_HC_REGISTRY_KEY_PROG = HARTLEY_HC_REGISTRY_KEY+'\Program Directory';

type
//  THCregistryIniFile = class(TCustomRegistryIniFile)
  TDIYRegIniFile = class(TCustomIniFile)
  public
    constructor Create(baseDirOverride : string); override;
  Protected
    procedure setCurrentSection(const Name : string); override;
  published
    property currentSection;
    function readString(const Name : string) : string; override;
  end;

implementation

{ ---------------------------------------------------------------------------- }
{ -- Create - Create the class, baseDirOverride will override the base         }
{             directory stored in the registry                                 }
{ ---------------------------------------------------------------------------- }
constructor THCregistryIniFile.Create(baseDirOverride : string);
var
  baseDir : string;
begin
  inherited Create(baseDirOverride);

  if baseDirOverride <> '' then
    baseDir := baseDirOverride
  else begin
    baseDir := inherited readString('Base Directory');
    if baseDir = ''
    then begin
      baseDir := 'c:\hc';
      inherited writeString('Base Directory', baseDir);
    end;
  end;

  // Don't accept illegal base directories without a fight!
  if not DirectoryExists(baseDir) then
    raise EbadBaseDir.Create(baseDir + ': This directory does not exist. Please create this directory using Explorer, or select another.');
  if not FileExists(baseDir + '\hc.ini') then
    raise EnoHcIni.Create(baseDir + ': There is no hc.ini file in this directory. Please create or copy a suitable file, or select another directory.'); // jm 01.10.98 Change ha.ini to hc.ini in message text

  inifile := TiniFile.Create(baseDir + '\hc.ini');
end;

{ ---------------------------------------------------------------------------- }
{ -- SetCurrentSection - Set the currenct regitry section to the one passed    }
{ ---------------------------------------------------------------------------- }
procedure THCregistryIniFile.SetCurrentSection(const Name : string);
begin
  FcurrentSection := Name;
  closeKey;
  openKey('\' + HARTLEY_HC_REGISTRY_KEY + '\' + Name, true);
end;

{ ---------------------------------------------------------------------------- }
{ -- ReadString - reads a string from the current section                      }
{ ---------------------------------------------------------------------------- }
function THCregistryIniFile.ReadString(const Name : string) : string;
begin
  result := '';

  try
    result := inherited readString(Name);
  except
    ;
  end;
  if result = '' then
    result := inifile.readString(FcurrentSection, Name, '');
end;


end.
