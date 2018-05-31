unit MYOBSetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MYOBInterGlobals, MYOBDM, StdCtrls, cxButtons, cxLabel, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxShellBrowserDialog, TARIDataModule,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox;

type
  TSCSetupF = class(TForm)
    ShortcutsDB: TcxTextEdit;
    cxLabel1: TcxLabel;
    FindSCDBBtn: TcxButton;
    cxButton1: TcxButton;
    FindFolder: TcxShellBrowserDialog;
    cxLabel2: TcxLabel;
    TARIServiceLU: TcxLookupComboBox;
    cxLabel3: TcxLabel;
    TARIRetailLU: TcxLookupComboBox;
    procedure FindSCDBBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure TARIServiceLUPropertiesEditValueChanged(Sender: TObject);
    procedure TARIRetailLUPropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SCSetupF: TSCSetupF;

implementation

{$R *.dfm}

procedure TSCSetupF.FindSCDBBtnClick(Sender: TObject);
begin
  FindFolder.FolderLabelCaption := 'Shortcuts Database';
  if FindFolder.Execute then
    begin
    ShortcutsDB.Text := FindFolder.Path;
//    DMInterface.SetSCPath(ShortcutsDB.Text);
    end;
end;

procedure TSCSetupF.FormCreate(Sender: TObject);
begin
  color := GGlobals.FormColour;
  ShortcutsDB.Text := DMMYOBInterface.MYOBPath;
  If DMMYOBInterface.GetTARIServiceDept = -1 then
    DMMYOBInterface.SetTARIServiceDept(0, '');
//  ServiceLUCombo.Text := DMInterface.FBSystem_DataSTR_FIELD.Value;
  TARIDM.DepartmentServiceNameListing.Active := False;
  TARIDM.DepartmentServiceNameListing.ParamByName('DEPTID').Value := DMMYOBInterface.GetTARISalesDept;
  TARIDM.DepartmentServiceNameListing.Active := True;
  TARIServiceLU.EditValue := DMMYOBInterface.GetTARIServiceDept;
  TARIDM.DepartmentRetailNameListing.Active := False;
  TARIDM.DepartmentRetailNameListing.ParamByName('DEPTID').Value := DMMYOBInterface.GetTARIServiceDept;
  TARIDM.DepartmentRetailNameListing.Active := True;
  TARIRetailLU.EditValue := DMMYOBInterface.GetTARISalesDept;
end;

procedure TSCSetupF.cxButton1Click(Sender: TObject);
begin
//  DMInterface.SetSCPath(ShortcutsDB.Text);
  DMMYOBInterface.MYOBPath := ShortcutsDB.Text;
end;

procedure TSCSetupF.TARIServiceLUPropertiesEditValueChanged(
  Sender: TObject);
begin
  DMMYOBInterface.SetTARIServiceDept(TARIServiceLU.EditValue, TARIServiceLU.Text);
  TARIDM.DepartmentRetailNameListing.Active := False;
  TARIDM.DepartmentRetailNameListing.ParamByName('DEPTID').Value := DMMYOBInterface.GetTARIServiceDept;
  TARIDM.DepartmentRetailNameListing.Active := True;
end;

procedure TSCSetupF.TARIRetailLUPropertiesEditValueChanged(
  Sender: TObject);
begin
  DMMYOBInterface.SetTARISalesDept(TARIRetailLU.EditValue, TARIRetailLU.Text);
  TARIDM.DepartmentServiceNameListing.Active := False;
  TARIDM.DepartmentServiceNameListing.ParamByName('DEPTID').Value := DMMYOBInterface.GetTARISalesDept;
  TARIDM.DepartmentServiceNameListing.Active := True;
end;

end.
