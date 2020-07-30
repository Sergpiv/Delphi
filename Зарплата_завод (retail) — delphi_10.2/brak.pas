unit brak;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh, data.db,
  Vcl.StdCtrls, Vcl.ExtCtrls, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, Vcl.Buttons, system.UITypes, EhLibVCL, Vcl.Imaging.pngimage;

type
  Tbrak_form = class(TForm)
    SpeedButton1: TSpeedButton;
    DBGridEh1: TDBGridEh;
    LabeledEdit1: TLabeledEdit;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1Columns2OpenDropDownForm(Grid: TCustomDBGridEh;
      Column: TColumnEh; Button: TEditButtonEh; var DropDownForm: TCustomForm;
      DynParams: TDynVarsEh);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  brak_form: Tbrak_form;

implementation

{$R *.dfm}

uses mod_dann, zarpl, Detal, nezaver;



procedure Tbrak_form.DBGridEh1Columns2OpenDropDownForm(Grid: TCustomDBGridEh;
  Column: TColumnEh; Button: TEditButtonEh; var DropDownForm: TCustomForm;
  DynParams: TDynVarsEh);
begin
mod_dann.DataModule1.ADOTable_detal.Locate('cod',mod_dann.DataModule1.ADOTable_brak.FieldByName('cod_det').Value,[]);
end;

procedure Tbrak_form.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=VK_RETURN) and (mod_dann.DataModule1.ADOTable_brak.State in [dsedit, dsinsert]) then begin mod_dann.DataModule1.ADOTable_brak.post;


mod_dann.DataModule1.ADOTable_brak.Refresh;
 if dbgrideh1.SelectedIndex=2 then begin
keybd_event(VK_down, 0, 0, 0);
keybd_event(VK_down, 0, KEYEVENTF_KEYUP, 0);
dbgrideh1.SelectedIndex:=0; end;

labelededit1.Text:=floattostr(zarpl.brak_det(zarpl.Form1.ComboBox1.ItemIndex+1));
end;
end;

procedure Tbrak_form.FormActivate(Sender: TObject);
begin
labelededit1.Text:=floattostr(zarpl.brak_det(zarpl.Form1.ComboBox1.ItemIndex+1));
end;

procedure Tbrak_form.FormShow(Sender: TObject);
begin
left:=zarpl.Form1.Width-11;
if assigned(detal.Form2) then top:=detal.Form2.Height-4 else top:=2;
if assigned(nezaver.nezav) then left:=nezaver.nezav.left+nezaver.nezav.Width-13 else left:=zarpl.Form1.Width-11;
end;

procedure Tbrak_form.SpeedButton1Click(Sender: TObject);
begin
if messagedlg('Вы уверены в удалении всех записей?', mtConfirmation, [mbYes, mbNo], 0)=mrYes
then
if mod_dann.DataModule1.ADOTable_brak.RecordCount>0 then begin
mod_dann.DataModule1.ADOQuery_del_brak.Parameters.ParamByName('p').Value:=zarpl.Form1.ComboBox1.ItemIndex+1;
  mod_dann.DataModule1.ADOQuery_del_brak.execsql;
  mod_dann.DataModule1.ADOTable_brak.close; mod_dann.DataModule1.ADOTable_brak.open;
  brak_form.Activate
end;


end;

end.


