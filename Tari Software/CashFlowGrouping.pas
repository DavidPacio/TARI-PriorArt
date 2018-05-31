unit CashFlowGrouping;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxButtons, cxEdit, cxLabel, cxControls, cxContainer,
  cxCheckListBox, DMClient, DMUsers, LGlobals;
type
  TCashFlowGroupingF = class(TForm)
    DeptList: TcxCheckListBox;
    cxLabel4: TcxLabel;
    CloseBtn: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure DeptListExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CashFlowGroupingF: TCashFlowGroupingF;

implementation

uses DMrep1U;

{$R *.dfm}

procedure TCashFlowGroupingF.FormCreate(Sender: TObject);
Var
  J : Integer;
  Varg : Variant;
begin
  color := gglobals.FormColour;
  DMrep1.ButtonGlyphList.GetBitmap(0, CloseBtn.Glyph);

  Varg := VarArrayCreate([0, 1], varVariant);
  Varg[0] := DataModuleClient.DepartmentsDEPT_ID.Value;
  DataModuleClient.DeptRef.indexName := 'DEPTNAMEIDX';
  DataModuleClient.DeptRef.First;
  J := 0;
  while DataModuleClient.DeptRef.eof = False do
    begin
    with TcxCheckListBoxItems(DeptList.Items).Add do
      begin
      Text := DataModuleClient.DeptRefRevenue_Group_Name.Value;
      Tag := DataModuleClient.DeptRefDEPT_ID.Value;
      end;    // with
    Varg[1] := DataModuleClient.DeptRefDEPT_ID.Value;
    if DataModuleClient.CashDeptGroup.Locate('DEPT_ID;LINKED_ID', varg, []) then
      DeptList.items.Items[J].Checked := True
    else
      DeptList.items.Items[J].Checked := False;
    DataModuleClient.DeptRef.next;
    inc(J);
    end;    // while
end;

procedure TCashFlowGroupingF.DeptListExit(Sender: TObject);
Var
  I : Integer;
  Varg : Variant;
  LinkExists : Boolean;
begin
  Varg := VarArrayCreate([0, 1], varVariant);
  Varg[0] := DataModuleClient.DepartmentsDEPT_ID.Value;
  for I := 0 to DeptList.Items.Count - 1 do   // Iterate
    begin
    Varg[1] := DeptList.Items[I].Tag;
    LinkExists := False;
    if DataModuleClient.CashDeptGroup.Locate('DEPT_ID;LINKED_ID', varg, []) then
      begin
      if not DeptList.Items[I].Checked then
        DataModuleClient.CashDeptGroup.Delete
      else
        LinkExists := True;
      end;
    if (Not LinkExists) and (DeptList.Items[I].Checked) then
      begin
      DataModuleClient.CashDeptGroup.Insert;
      DataModuleClient.CashDeptGroupDEPT_ID.Value := DataModuleClient.DepartmentsDEPT_ID.Value;
      DataModuleClient.CashDeptGroupLINKED_ID.Value := DeptList.Items[I].Tag;
      DataModuleClient.CashDeptGroup.Post;
      end;
    end;
  DataModuleClient.FixCashDeptGroup;
end;    // for

end.