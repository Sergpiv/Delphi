unit vipusk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Mask, DBCtrls, db, Buttons,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh,
  DBAxisGridsEh, DBGridEh, system.UITypes, EhLibVCL, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  Tform3 = class(TForm)
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBGridEh1: TDBGridEh;
    SpeedButton1: TSpeedButton;
    LabeledEdit1: TLabeledEdit;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Image3: TImage;
    Image1: TImage;
    Image2: TImage;
    procedure FormShow(Sender: TObject);
    procedure glExtSpeedButton1Click(Sender: TObject);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit2Click(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure DBGridEh1CellMouseClick(Grid: TCustomGridEh; Cell: TGridCoord;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
      var Processed: Boolean);
    procedure LabeledEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LabeledEdit1Click(Sender: TObject);
    procedure DBEdit2Change(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image2Click(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form3: Tform3;
 procedure update_query;
implementation

uses mod_dann, zarpl, nezaver;

{$R *.dfm}
procedure Update_query;
var bm:Tbookmark;
begin
  bm:=mod_dann.DataModule1.ADOQuery5.GetBookmark;
mod_dann.DataModule1.ADOQuery5.DisableControls;
mod_dann.DataModule1.ADODataSet_vipusk.Close;
mod_dann.DataModule1.ADODataSet_vipusk.Parameters.ParamByName('p').Value:=zarpl.Form1.ComboBox1.ItemIndex+1;
mod_dann.DataModule1.ADODataSet_vipusk.open;
mod_dann.DataModule1.ADOQuery5.close;
mod_dann.DataModule1.ADOQuery5.open;
mod_dann.DataModule1.ADOQuery5.GotoBookmark(bm);
mod_dann.DataModule1.ADOQuery5.EnableControls;
mod_dann.DataModule1.ADOQuery5.FreeBookmark(bm);
end;
procedure Tform3.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Image1.Visible:=true;
Image2.Visible:=false;
Image3.Visible:=false;
end;

procedure Tform3.FormShow(Sender: TObject);
begin
left:=zarpl.Form1.Width-width+2;
top:=zarpl.Form1.Top+zarpl.Form1.Height-6;
mod_dann.DataModule1.ADOQuery5.Close;
mod_dann.DataModule1.ADOQuery5.open;
mod_dann.DataModule1.ADODataSet_vipusk.Close;
mod_dann.DataModule1.ADODataSet_vipusk.Parameters.ParamByName('p').Value:=zarpl.Form1.ComboBox1.ItemIndex+1;
mod_dann.DataModule1.ADODataSet_vipusk.open;
DBGridEh1DblClick(Sender);
end;


procedure Tform3.glExtSpeedButton1Click(Sender: TObject);
begin
if messagedlg('Вы уверены в удалении всех записей?', mtConfirmation, [mbYes, mbNo], 0)=mrYes
then begin
mod_dann.DataModule1.ADOQuery6.Close;
mod_dann.DataModule1.ADOQuery6.Parameters.ParamByName('p').Value:=zarpl.Form1.ComboBox1.ItemIndex+1;
mod_dann.DataModule1.ADOQuery6.ExecSQL;
update_query;
mod_dann.DataModule1.ADOTable_vipusk.close;
mod_dann.DataModule1.ADOTable_vipusk.open;
if mod_dann.DataModule1.ADOTable_vip_korr.RecordCount>0 then mod_dann.DataModule1.ADOTable_vip_korr.Delete;
     end;
end;


procedure Tform3.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
if zarpl.Form1.ComboBox1.ItemIndex<>0 then  begin
Image1.Visible:=false;
Image2.Visible:=true;
Image3.Visible:=false;
end else begin
  Image1.Visible:=false;
Image2.Visible:=false;
Image3.Visible:=true;
end;
end;

procedure Tform3.Image2Click(Sender: TObject);
var temp:real;
begin
image2.Visible:=false; image1.Visible:=true;
mod_dann.DataModule1.ADOTable_vip_korr.Filtered:=false;if (mod_dann.DataModule1.ADOTable_vip_korr.Locate('cod_dat',zarpl.Form1.ComboBox1.ItemIndex,[])) and (mod_dann.DataModule1.ADOTable_vip_korr.FieldByName('BTZ').asfloat<>0) then
temp:=round((mod_dann.DataModule1.ADOTable_vip_korr.FieldByName('BTZ').asfloat-zarpl.vipusk_zarplata(zarpl.Form1.ComboBox1.ItemIndex))/okrugl)*okrugl else showmessage('Не введены данные БТЗ за прошлый месяц?');
mod_dann.DataModule1.ADOTable_vip_korr.Filtered:=true;
if temp<>0 then
 begin
  if mod_dann.DataModule1.ADOTable_vip_korr.Locate('Cod_dat',zarpl.Form1.ComboBox1.ItemIndex+1,[])
  then begin mod_dann.DataModule1.ADOTable_vip_korr.Edit; mod_dann.DataModule1.ADOTable_vip_korr.FieldByName('korrectiv').Value:=mod_dann.DataModule1.ADOTable_vip_korr.FieldByName('korrectiv').asfloat+temp;
       end
  else  begin mod_dann.DataModule1.ADOTable_vip_korr.Append;mod_dann.DataModule1.ADOTable_vip_korr.FieldByName('Cod_dat').Value:=zarpl.Form1.ComboBox1.ItemIndex+1;
             mod_dann.DataModule1.ADOTable_vip_korr.FieldByName('korrectiv').Value:=temp;
        end;
  mod_dann.DataModule1.ADOTable_vip_korr.Post;showmessage('копирование успешно завершено!');
 end else showmessage('нет данных для копирования')
end;

procedure Tform3.LabeledEdit1Click(Sender: TObject);
begin
 LabeledEdit1.SelectAll
end;

procedure Tform3.LabeledEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=VK_RETURN then begin
if mod_dann.DataModule1.ADOQuery5.FieldByName('vipusk').Value<>null then   begin

if not((mod_dann.DataModule1.ADOtable_vipusk.State=dsinsert) or (mod_dann.DataModule1.ADOtable_vipusk.State=dsedit)) then
mod_dann.DataModule1.ADOtable_vipusk.Edit;
mod_dann.DataModule1.ADOtable_vipusk.FieldByName('cod_dat').Value:=zarpl.Form1.ComboBox1.ItemIndex+1;
mod_dann.DataModule1.ADOtable_vipusk.FieldByName('vipusk').Value:=strtoint(labelededit1.Text);
mod_dann.DataModule1.ADOtable_vipusk.Post;
labelededit1.SelectAll;
update_query;
end else
begin

mod_dann.DataModule1.ADOTable_vipusk.Append;
mod_dann.DataModule1.ADOTable_vipusk.FieldByName('vipusk').Value:=strtoint(labelededit1.Text);
mod_dann.DataModule1.ADOTable_vipusk.FieldByName('cod_dat').Value:=zarpl.Form1.ComboBox1.ItemIndex+1;
mod_dann.DataModule1.ADOTable_vipusk.Post;
labelededit1.SelectAll;
update_query;
end;
end;
end;

procedure Tform3.DBGridEh1CellClick(Column: TColumnEh);
begin
labelededit1.Text:=mod_dann.DataModule1.ADOQuery5.FieldByName('vipusk').AsString;
labelededit1.SetFocus; labelededit1.SelectAll
end;

procedure Tform3.DBGridEh1CellMouseClick(Grid: TCustomGridEh; Cell: TGridCoord;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  var Processed: Boolean);
begin
labelededit1.Text:=mod_dann.DataModule1.ADOQuery5.FieldByName('vipusk').AsString;
labelededit1.SetFocus;labelededit1.SelectAll
end;

procedure Tform3.DBGridEh1DblClick(Sender: TObject);
begin
labelededit1.Text:=mod_dann.DataModule1.ADOQuery5.FieldByName('vipusk').AsString;
labelededit1.SetFocus;labelededit1.SelectAll
end;




procedure Tform3.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=VK_RETURN) and ((mod_dann.DataModule1.ADOTable_vip_korr.State=dsedit) or (mod_dann.DataModule1.ADOTable_vip_korr.State=dsinsert)) then begin mod_dann.DataModule1.ADOTable_vip_korr.Post;
(sender as tdbedit).SelectAll;if assigned(nezav)
then nezav.labelededit2.Text:=floattostr(mod_dann.DataModule1.ADOTable_vip_korr.FieldByName('BTZ').asfloat+zarpl.nezavershenka(zarpl.Form1.ComboBox1.ItemIndex+1)-zarpl.vipusk_zarplata(zarpl.Form1.ComboBox1.ItemIndex+1));  end;
end;

procedure Tform3.DBEdit2Change(Sender: TObject);
begin
if (dbedit2.Text=null) or (dbedit2.Text='') then label2.font.Color:=clblue else
if copy(dbedit2.Text,1,1)='-'
then label2.Font.Color:=clred else label2.font.Color:=clgreen
end;

procedure Tform3.DBEdit2Click(Sender: TObject);
begin
(sender as tdbedit).SelectAll
end;

procedure Tform3.DBEdit2Exit(Sender: TObject);
begin
if (mod_dann.DataModule1.ADOTable_vip_korr.State=dsedit) or (mod_dann.DataModule1.ADOTable_vip_korr.State=dsinsert) then mod_dann.DataModule1.ADOTable_vip_korr.Post;
end;

end.
