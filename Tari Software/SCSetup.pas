unit SCSetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SCInterGlobals, SCDM, StdCtrls, cxButtons, cxLabel, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxShellBrowserDialog, TARIDataModule,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCheckBox;

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
    UpdateTimeCB: TcxCheckBox;
    UpdatePotentialCB: TcxCheckBox;
    procedure FindSCDBBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure TARIServiceLUPropertiesEditValueChanged(Sender: TObject);
    procedure TARIRetailLUPropertiesEditValueChanged(Sender: TObject);
    procedure UpdateTimeCBPropertiesChange(Sender: TObject);
    procedure UpdatePotentialCBPropertiesChange(Sender: TObject);
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
    DMInterface.SetSCPath(ShortcutsDB.Text);
    end;
end;

procedure TSCSetupF.FormCreate(Sender: TObject);
begin
  color := GGlobals.FormColour;
  ShortcutsDB.Text := DMInterface.SCPath;
  If DMInterface.GetTARIServiceDept = -1 then
    DMInterface.SetTARIServiceDept(0, '');
//  ServiceLUCombo.Text := DMInterface.FBSystem_DataSTR_FIELD.Value;
  TARIDM.DepartmentServiceNameListing.Active := False;
  TARIDM.DepartmentServiceNameListing.ParamByName('DEPTID').Value := DMInterface.GetTARISalesDept;
  TARIDM.DepartmentServiceNameListing.Active := True;
  TARIServiceLU.EditValue := DMInterface.GetTARIServiceDept;
  TARIDM.DepartmentRetailNameListing.Active := False;
  TARIDM.DepartmentRetailNameListing.ParamByName('DEPTID').Value := DMInterface.GetTARIServiceDept;
  TARIDM.DepartmentRetailNameListing.Active := True;
  TARIRetailLU.EditValue := DMInterface.GetTARISalesDept;
  UpdateTimeCB.EditValue := DMInterface.GetUpdateTimeValue;
  UpdatePotentialCB.EditValue := DMInterface.GetUpdatePotentialValue;
end;

procedure TSCSetupF.cxButton1Click(Sender: TObject);
begin
  DMInterface.SetSCPath(ShortcutsDB.Text);
  DMInterface.SCPath := ShortcutsDB.Text;
end;

procedure TSCSetupF.TARIServiceLUPropertiesEditValueChanged(
  Sender: TObject);
begin
  if(TARIServiceLU.EditValue = varnull) then
    DMInterface.DeleteServiceDept;
  DMInterface.SetTARIServiceDept(TARIServiceLU.EditValue, TARIServiceLU.Text);
  TARIDM.DepartmentRetailNameListing.Active := False;
  TARIDM.DepartmentRetailNameListing.ParamByName('DEPTID').Value := DMInterface.GetTARIServiceDept;
  TARIDM.DepartmentRetailNameListing.Active := True;
end;

procedure TSCSetupF.TARIRetailLUPropertiesEditValueChanged(
  Sender: TObject);
begin
  if TARIRetailLU.EditValue = null then
    DMInterface.DeleteSalesDept;
  DMInterface.SetTARISalesDept(TARIRetailLU.EditValue, TARIRetailLU.Text);
  TARIDM.DepartmentServiceNameListing.Active := False;
  TARIDM.DepartmentServiceNameListing.ParamByName('DEPTID').Value := DMInterface.GetTARISalesDept;
  TARIDM.DepartmentServiceNameListing.Active := True;
end;

procedure TSCSetupF.UpdateTimeCBPropertiesChange(Sender: TObject);
begin
  DMInterface.SetUpdateTimeValue(UpdateTimeCB.EditValue);
end;

procedure TSCSetupF.UpdatePotentialCBPropertiesChange(Sender: TObject);
begin
  DMInterface.SetUpdatePotentialValue(UpdatePotentialCB.EditValue);
end;

end.
