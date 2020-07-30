unit shabl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ExtCtrls, Data.DB, Data.Win.ADODB, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh;

type
  TShablon = class(TForm)
    DBNavigator1: TDBNavigator;
    DBText1: TDBText;
    ADODataSet1: TADODataSet;
    DataSource1: TDataSource;
    DBGridEh1: TDBGridEh;
    labeltext1: TLabeledEdit;
    procedure DBGridEh1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGridEh1Columns1OpenDropDownForm(Grid: TCustomDBGridEh;
      Column: TColumnEh; Button: TEditButtonEh; var DropDownForm: TCustomForm;
      DynParams: TDynVarsEh);
    procedure labeltext1Change(Sender: TObject);
    procedure labeltext1Click(Sender: TObject);
    procedure labeltext1Exit(Sender: TObject);
    procedure DBGridEh1Columns0UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Shablon: TShablon;

implementation

{$R *.dfm}

uses mod_dann;

procedure TShablon.DBGridEh1Columns0UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
begin
mod_dann.DataModule1.ADOtable_shablon.FieldByName('Cod_rascenki').Value:=null;
end;

procedure TShablon.DBGridEh1Columns1OpenDropDownForm(Grid: TCustomDBGridEh;
  Column: TColumnEh; Button: TEditButtonEh; var DropDownForm: TCustomForm;
  DynParams: TDynVarsEh);
begin
mod_dann.DataModule1.ADOTable_detal.Locate('cod',DataModule1.ADOtable_shablon.FieldByName('cod_detali').Value,[]);
end;

procedure TShablon.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if ((key=VK_RETURN)  or (key=VK_down)) then begin
ADOdataset1.Refresh;
 if dbgrideh1.SelectedIndex=1 then begin
keybd_event(VK_down, 0, 0, 0);
keybd_event(VK_down, 0, KEYEVENTF_KEYUP, 0);
dbgrideh1.SelectedIndex:=0; end;
end;
end;

procedure TShablon.DBGridEh1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 mod_dann.DataModule1.ADOTable_detal.Locate('cod',DataModule1.ADOtable_shablon.FieldByName('cod_detali').Value,[]);
end;



procedure TShablon.FormCreate(Sender: TObject);
begin
adodataset1.Close;
adodataset1.Open
end;


procedure TShablon.FormShow(Sender: TObject);
begin
mod_dann.DataModule1.ADOTable_shablon.MasterSource:=datasource1;
end;

procedure TShablon.labeltext1Change(Sender: TObject);
begin
if labeltext1.Text<>'' then
adodataset1.Locate('Familia',labeltext1.Text,[locaseinsensitive, lopartialkey]);
end;

procedure TShablon.labeltext1Click(Sender: TObject);
begin
LoadKeyboardLayout('00000419',KLF_ACTIVATE);
labeltext1.Text:=''
end;

procedure TShablon.labeltext1Exit(Sender: TObject);
begin
labeltext1.Text:=''
end;

end.
