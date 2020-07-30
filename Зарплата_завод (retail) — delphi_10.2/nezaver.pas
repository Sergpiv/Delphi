unit nezaver;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh, data.db,
  Vcl.StdCtrls, Vcl.ExtCtrls, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, Vcl.Buttons, system.UITypes, EhLibVCL, Vcl.Imaging.pngimage;

type
  Tnezav = class(TForm)
    DBGridEh1: TDBGridEh;
    LabeledEdit1: TLabeledEdit;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    SpeedButton1: TSpeedButton;
    LabeledEdit2: TLabeledEdit;
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGridEh1Columns2OpenDropDownForm(Grid: TCustomDBGridEh;
      Column: TColumnEh; Button: TEditButtonEh; var DropDownForm: TCustomForm;
      DynParams: TDynVarsEh);
    procedure LabeledEdit2Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  nezav: Tnezav;

implementation

{$R *.dfm}

uses mod_dann, zarpl, Detal, brak;






procedure Tnezav.DBGridEh1Columns2OpenDropDownForm(Grid: TCustomDBGridEh;
  Column: TColumnEh; Button: TEditButtonEh; var DropDownForm: TCustomForm;
  DynParams: TDynVarsEh);
begin
mod_dann.DataModule1.ADOTable_detal.Locate('cod',mod_dann.DataModule1.ADOTable_nezav.FieldByName('cod_det').Value,[]);
end;

procedure Tnezav.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=VK_RETURN) and (mod_dann.DataModule1.ADOTable_nezav.State in [dsedit, dsinsert]) then begin mod_dann.DataModule1.ADOTable_nezav.post;


mod_dann.DataModule1.ADOTable_nezav.Refresh;
 if dbgrideh1.SelectedIndex=2 then begin
keybd_event(VK_down, 0, 0, 0);
keybd_event(VK_down, 0, KEYEVENTF_KEYUP, 0);
dbgrideh1.SelectedIndex:=0; end;

labelededit1.Text:=floattostr(zarpl.nezavershenka(zarpl.Form1.ComboBox1.ItemIndex+1));end;
end;

procedure Tnezav.FormActivate(Sender: TObject);
begin
labelededit1.Text:=floattostr(zarpl.nezavershenka(zarpl.Form1.ComboBox1.ItemIndex+1));
labelededit2.Text:=floattostr(okrugl*round((mod_dann.DataModule1.ADOTable_vip_korr.FieldByName('BTZ').asfloat+zarpl.nezavershenka(zarpl.Form1.ComboBox1.ItemIndex+1)-zarpl.vipusk_zarplata(zarpl.Form1.ComboBox1.ItemIndex+1))/okrugl));
end;






procedure Tnezav.FormHide(Sender: TObject);
begin
if assigned(brak.brak_form) then brak.brak_form.Left:=left;

end;

procedure Tnezav.FormShow(Sender: TObject);
begin
left:=zarpl.Form1.Width-11;
if assigned(detal.Form2) then top:=detal.Form2.Height-4 else top:=2;
if assigned(brak.brak_form) then brak.brak_form.Left:=left+width-13;

end;

procedure Tnezav.LabeledEdit2Change(Sender: TObject);
begin
if copy(labelededit2.Text,1,1)='-' then labelededit2.Font.Color:=clred else labelededit2.Font.Color:=clgreen

end;


procedure Tnezav.SpeedButton1Click(Sender: TObject);
begin
if messagedlg('Вы уверены в удалении всех записей?', mtConfirmation, [mbYes, mbNo], 0)=mrYes
then
if mod_dann.DataModule1.ADOTable_nezav.RecordCount>0 then begin
mod_dann.DataModule1.ADOQuery_del_nezav.Parameters.ParamByName('p').Value:=zarpl.Form1.ComboBox1.ItemIndex+1;
  mod_dann.DataModule1.ADOQuery_del_nezav.execsql;
  mod_dann.DataModule1.ADOTable_nezav.close; mod_dann.DataModule1.ADOTable_nezav.open;
  nezav.Activate
end;

end;

end.


