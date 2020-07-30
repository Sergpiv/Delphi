unit rekvisiti;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, inifiles, EhLibVCL, Vcl.Buttons, FileCtrl, db,
  Vcl.DBCtrls;

type
  Trecvisit = class(TForm)
    DBGridEh1: TDBGridEh;
    Label1: TLabel;
    DBGridEh2: TDBGridEh;
    Label2: TLabel;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  recvisit: Trecvisit;

implementation

{$R *.dfm}

uses mod_dann;



procedure Trecvisit.FormShow(Sender: TObject);
var myLookup: Variant;
begin
myLookup:=mod_dann.DataModule1.ADOTable_recvisit_dobavl.Lookup('name_rec','BASE_PATH','znach');
if myLookup<>null then edit1.Text:=myLookup else edit1.Text:='';
end;

procedure Trecvisit.SpeedButton1Click(Sender: TObject);
var chosenDirectory:string;
begin   if  SelectDirectory('Выберите каталог', '::{20D04FE0-3AEA-1069-A2D8-08002B30309D}', chosenDirectory) then
if mod_dann.DataModule1.ADOTable_recvisit_dobavl.Locate('name_rec','BASE_PATH',[])
then begin
if not(mod_dann.DataModule1.ADOTable_recvisit_dobavl.State in [dsEdit]) then  mod_dann.DataModule1.ADOTable_recvisit_dobavl.Edit;
mod_dann.DataModule1.ADOTable_recvisit_dobavl.FieldByName('znach').Value:=chosenDirectory;
mod_dann.DataModule1.ADOTable_recvisit_dobavl.post;
edit1.Text:=chosenDirectory;
  end  else
 begin
 if not(mod_dann.DataModule1.ADOTable_recvisit_dobavl.State in [dsInsert]) then
mod_dann.DataModule1.ADOTable_recvisit_dobavl.Insert;
mod_dann.DataModule1.ADOTable_recvisit_dobavl.FieldByName('name_rec').Value:='BASE_PATH';
mod_dann.DataModule1.ADOTable_recvisit_dobavl.FieldByName('rus').asstring:='Каталог загрузки баз';
mod_dann.DataModule1.ADOTable_recvisit_dobavl.FieldByName('znach').asstring:=chosenDirectory;
mod_dann.DataModule1.ADOTable_recvisit_dobavl.Post;
edit1.Text:=chosenDirectory;
 end else showmessage('Каталог не выбран!!!')
end;

end.
