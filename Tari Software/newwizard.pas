unit newwizard;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CWTools, StdCtrls, OvcBase, ExtCtrls, MegaPanl, EPStdCmp;

type
  TForm1 = class(TForm)
    EPWizard1: TEPWizard;
    EPWizardPage1: TEPWizardPage;
    MegaPanel1: TMegaPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    EPWizardPage2: TEPWizardPage;
    MegaPanel2: TMegaPanel;
    Label7: TLabel;
    Label6: TLabel;
    OvcController1: TOvcController;
    Memo1: TMemo;
    EPWizardPage3: TEPWizardPage;
    MegaPanel3: TMegaPanel;
    Label8: TLabel;
    Label9: TLabel;
    LastDayofWeekCB: TComboBox;
    Label10: TLabel;
    Label11: TLabel;
    CWDropDownEdit1: TCWDropDownEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

end.
