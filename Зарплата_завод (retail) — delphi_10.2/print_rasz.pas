unit print_rasz;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.StdCtrls,DB, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef, FireDAC.Phys.SQLite,FireDAC.Phys.SQLiteWrapper,
  FireDAC.Comp.UI, FireDAC.Comp.Client,system.uitypes, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  Data.Win.ADODB, Vcl.CategoryButtons, Vcl.ExtCtrls;

type
  Tpr_rasz = class(TForm)
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    DBGridEh3: TDBGridEh;
    FDConnection1: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    SpeedButton2: TSpeedButton;
    ADOQuery1: TADOQuery;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    SpeedButton1: TSpeedButton;
    procedure DBGridEh1RowDetailPanelShow(Sender: TCustomDBGridEh;
      var CanShow: Boolean);
    procedure DBGridEh1RowDetailPanelHide(Sender: TCustomDBGridEh;
      var CanHide: Boolean);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh2RowDetailPanelHide(Sender: TCustomDBGridEh;
      var CanHide: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  pr_rasz: Tpr_rasz;

implementation

{$R *.dfm}

uses mod_dann, Detal;





procedure Tpr_rasz.DBGridEh1RowDetailPanelHide(Sender: TCustomDBGridEh;
  var CanHide: Boolean);
begin
dbgrideh2.RowDetailPanel.Visible:=false;
if mod_dann.DataModule1.ADOTable_rasz.State=dsedit then mod_dann.DataModule1.ADOTable_rasz.Post;

mod_dann.DataModule1.ADOQuery_delete_print_table.Parameters.ParamByName('cod_rabotn').Value:=mod_dann.DataModule1.ADOTable_rabotn.FieldByName('cod').Value;
mod_dann.DataModule1.ADOQuery_delete_print_table.ExecSQL;

mod_dann.DataModule1.ADOQuery_insert_print_table.Parameters.ParamByName('cod_rabotn').Value:=mod_dann.DataModule1.ADOTable_rabotn.FieldByName('cod').Value;
mod_dann.DataModule1.ADOQuery_insert_print_table.ExecSQL;

end;

procedure Tpr_rasz.DBGridEh1RowDetailPanelShow(Sender: TCustomDBGridEh;
  var CanShow: Boolean);
begin
mod_dann.DataModule1.ADOQuery_null_print.ExecSQL;
mod_dann.DataModule1.ADOQuery_rasz_Update_Print.Parameters.ParamByName('cod_rab').Value:=mod_dann.DataModule1.ADOTable_rabotn.FieldByName('cod').Value;
mod_dann.DataModule1.ADOQuery_rasz_Update_Print.ExecSQL;
mod_dann.DataModule1.ADOTable_rasz.close;
mod_dann.DataModule1.ADOTable_rasz.open;



end;

procedure Tpr_rasz.DBGridEh2RowDetailPanelHide(Sender: TCustomDBGridEh;
  var CanHide: Boolean);
begin
if mod_dann.DataModule1.ADOTable_rasz.State=dsedit then begin mod_dann.DataModule1.ADOTable_rasz.Post;
end;

end;





procedure Tpr_rasz.FormClose(Sender: TObject; var Action: TCloseAction);
begin     dbgrideh1.RowDetailPanel.Visible:=false;
end;

procedure Tpr_rasz.FormShow(Sender: TObject);
begin
mod_dann.DataModule1.ADOQuery_null_print.ExecSQL;
mod_dann.DataModule1.ADOTable_rasz.close;
mod_dann.DataModule1.ADOTable_rasz.open;
dbgrideh1.RowDetailPanel.Visible:=false;
dbgrideh2.RowDetailPanel.Visible:=false;
end;



procedure Tpr_rasz.SpeedButton1Click(Sender: TObject);
begin
if messagedlg('Вы уверены в удалении всех записей для расценок?', mtConfirmation, [mbYes, mbNo], 0)=mrYes
then
 if mod_dann.DataModule1.ADOTable_print_rasc.RecordCount>0 then begin
 mod_dann.DataModule1.ADOQuery_del.SQL.Clear;
  case radiogroup1.ItemIndex of
   0:mod_dann.DataModule1.ADOQuery_del.SQL.Add('delete * from print_raszenka where cod_rab='+mod_dann.DataModule1.ADOTable_rabotn.FieldByName('cod').AsString);
   1:mod_dann.DataModule1.ADOQuery_del.SQL.Add('delete * from print_raszenka');
  end;
  dbgrideh1.RowDetailPanel.Visible:=false;
 mod_dann.DataModule1.ADOQuery_del.ExecSQL;
 showmessage('Данные удалены!!!')
 end;
end;

procedure Tpr_rasz.SpeedButton2Click(Sender: TObject);
var adoQuery:TADOQuery; st:string; bmt:Tbookmark;
begin
bmt:=mod_dann.DataModule1.ADOTable_detal.GetBookmark;
mod_dann.DataModule1.ADOTable_rasz.DisableControls;
mod_dann.DataModule1.ADOTable_detal.DisableControls;
mod_dann.DataModule1.ADOTable_rasz.MasterSource:=nil;
dbgrideh1.RowDetailPanel.Visible:=false;
if mod_dann.DataModule1.ADOTable_rasz.State=dsedit then begin
mod_dann.DataModule1.ADOQuery_insert_print_table.Parameters.ParamByName('cod_rabotn').Value:=mod_dann.DataModule1.ADOTable_rabotn.FieldByName('cod').Value;
mod_dann.DataModule1.ADOQuery_insert_print_table.ExecSQL;  end;
  deletefile('rasz.db');
fdconnection1.Connected:=false;
fdconnection1.Connected:=true;

fdconnection1.ExecSQL('CREATE TABLE Tabel (cod_rab INTEGER PRIMARY KEY, Tab INTEGER)');
 adoquery:=Tadoquery.Create(self);
 adoquery.Connection:=mod_dann.DataModule1.ADOConnection1;
 adoquery.SQL.Text:='SELECT print_raszenka.cod_rab, rabotniki.Tab FROM rabotniki INNER JOIN print_raszenka ON rabotniki.Cod = print_raszenka.cod_rab GROUP BY print_raszenka.cod_rab, rabotniki.Tab;';
adoquery.Active:=false;
adoquery.Active:=true;
adoquery.First;
while not adoquery.Eof do
begin
fdconnection1.ExecSQL('INSERT INTO Tabel VALUES('+adoquery.FieldByName('cod_rab').AsString+', '+adoquery.FieldByName('Tab').AsString+')');
  adoquery.Next;
end;

fdconnection1.ExecSQL('CREATE TABLE Print_raszenka (cod_rab INTEGER, cod_det INTEGER, cod_rasz INTEGER)');
mod_dann.DataModule1.ADOTable_print_rasc.First;
while not mod_dann.DataModule1.ADOTable_print_rasc.Eof do
begin
fdconnection1.ExecSQL('INSERT INTO Print_raszenka VALUES('+mod_dann.DataModule1.ADOTable_print_rasc.FieldByName('cod_rab').AsString+', '+mod_dann.DataModule1.ADOTable_print_rasc.FieldByName('Cod_det').AsString+', '+mod_dann.DataModule1.ADOTable_print_rasc.FieldByName('cod_rasz').AsString+')');
  mod_dann.DataModule1.ADOTable_print_rasc.Next;
end;
fdconnection1.ExecSQL('CREATE UNIQUE INDEX ind_name ON Print_raszenka(cod_rab, cod_det, cod_rasz)');

fdconnection1.ExecSQL('CREATE TABLE Detal (cod INTEGER PRIMARY KEY, detal TEXT)');
mod_dann.DataModule1.ADOTable_detal.First;
while not mod_dann.DataModule1.ADOTable_detal.Eof do
begin
fdconnection1.ExecSQL('INSERT INTO Detal VALUES('+mod_dann.DataModule1.ADOTable_detal.FieldByName('cod').AsString+', "'+mod_dann.DataModule1.ADOTable_detal.FieldByName('Detal').AsString+'")');
  mod_dann.DataModule1.ADOTable_detal.Next;
end;

fdconnection1.ExecSQL('CREATE TABLE Raszenki (cod INTEGER, nomer_operazii TEXT, raszenka Real, poasnenie TEXT)');

mod_dann.DataModule1.ADOTable_rasz.First;
while not mod_dann.DataModule1.ADOTable_rasz.Eof do
begin
if mod_dann.DataModule1.ADOTable_rasz.FieldByName('Raszenka').Value<>null then st:=stringreplace(mod_dann.DataModule1.ADOTable_rasz.FieldByName('Raszenka').asstring,',','.',[]) else st:='0';

fdconnection1.ExecSQL('INSERT INTO Raszenki VALUES('+mod_dann.DataModule1.ADOTable_rasz.FieldByName('Cod').AsString+', "'+mod_dann.DataModule1.ADOTable_rasz.FieldByName('Nomer_operazii').AsString+'", '+st+', "'+mod_dann.DataModule1.ADOTable_rasz.FieldByName('Poasnenie').AsString+'")');
  mod_dann.DataModule1.ADOTable_rasz.Next;
end;
mod_dann.DataModule1.ADOTable_rasz.MasterSource:=mod_dann.DataModule1.DataSource3;
mod_dann.DataModule1.ADOTable_detal.GotoBookmark(bmt);
mod_dann.DataModule1.ADOTable_detal.EnableControls;
mod_dann.DataModule1.ADOTable_detal.FreeBookmark(bmt);
mod_dann.DataModule1.ADOTable_rasz.EnableControls;
fdconnection1.Connected:=false;
showmessage('База данных создана!!!')
end;

end.
