unit ostat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Data.DB,
  Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.Buttons;

type
  Tostatki = class(TForm)
    DBText1: TDBText;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    SpeedButton1: TSpeedButton;
    DBImage1: TDBImage;
    procedure FormActivate(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1Columns0UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ostatki: Tostatki;

implementation

{$R *.dfm}

uses mod_dann, zarpl;


procedure Tostatki.DBGridEh1Columns0UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
begin
if mod_dann.DataModule1.ADOTable_ostatki.State=dsinsert then
mod_dann.DataModule1.ADOTable_ostatki.FieldByName('kol').Value:=null;
dbgrideh1.SelectedIndex:=2;
end;

procedure Tostatki.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=VK_RETURN  then begin
mod_dann.DataModule1.ADOtable_ostatki.Refresh;
keybd_event(VK_down, 0, 0, 0);
keybd_event(VK_down, 0, KEYEVENTF_KEYUP, 0);
dbgrideh1.SelectedIndex:=0;
end;
end;

procedure Tostatki.FormActivate(Sender: TObject);
begin
mod_dann.DataModule1.ADOTable_ostatki.Active:=false;
mod_dann.DataModule1.ADOTable_ostatki.Active:=true;
end;

procedure Tostatki.SpeedButton1Click(Sender: TObject);
begin
mod_dann.DataModule1.ADOTable_ostatki.MasterFields:='';
if messagedlg('Вы уверены в удалении всех записей?', mtConfirmation, [mbYes, mbNo], 0)=mrYes
then
if mod_dann.DataModule1.ADOTable_ostatki.RecordCount>0 then begin
mod_dann.DataModule1.ADOQuery_del.SQL.Clear;
mod_dann.DataModule1.adoquery_del.SQL.Add('DELETE * FROM ostatki');
mod_dann.DataModule1.ADOTable_ostatki.MasterFields:='';
mod_dann.DataModule1.adoquery_del.ExecSQL;
end;
mod_dann.DataModule1.ADOTable_ostatki.MasterFields:='cod';
  mod_dann.DataModule1.ADOTable_ostatki.close; mod_dann.DataModule1.ADOTable_ostatki.open;
end;

end.
