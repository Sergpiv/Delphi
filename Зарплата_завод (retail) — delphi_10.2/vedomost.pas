unit vedomost;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, DBCtrlsEh,
  Vcl.ComCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  Vcl.Buttons, PrnDbgeh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, printers, PrViewEh,
  Vcl.CategoryButtons, db, Vcl.Menus, Vcl.WinXCalendars, Vcl.Samples.Spin;

type
  Tkalend = class(TForm)
    DBGridEh1: TDBGridEh;
    PrintDBGridEh1: TPrintDBGridEh;
    SpeedButton1: TSpeedButton;
    CategoryButtons1: TCategoryButtons;
    Label1: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CategoryButtons1CategoryCollapase(Sender: TObject;
      const Category: TButtonCategory);
    procedure CategoryButtons1Categories1Items0Click(Sender: TObject);
    procedure CategoryButtons1Categories1Items1Click(Sender: TObject);
    procedure CategoryButtons1Categories0Items1Click(Sender: TObject);
    procedure CategoryButtons1Categories0Items0Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  kalend: Tkalend;i:integer;

implementation

{$R *.dfm}

uses mod_dann, zarpl, System.DateUtils;



procedure Tkalend.CategoryButtons1Categories0Items0Click(Sender: TObject);
begin
with mod_dann.DataModule1.ADOStoredProc_KTU do
begin
First;
while not eof do
begin
for i := 1 to 31 do
if  mod_dann.DataModule1.ADOTable_koephizient.FieldByName(inttostr(i)).Value=null then begin mod_dann.DataModule1.ADOTable_koephizient.edit; mod_dann.DataModule1.ADOTable_koephizient.FieldByName(inttostr(i)).Value:='1';mod_dann.DataModule1.ADOTable_koephizient.Post;end;
next;
end;
Close;
Open;
end;
end;

procedure Tkalend.CategoryButtons1Categories0Items1Click(Sender: TObject);
begin
with mod_dann.DataModule1.ADOStoredProc_KTU do
begin
for i := 1 to 31 do
if  mod_dann.DataModule1.ADOTable_koephizient.FieldByName(inttostr(i)).Value=null then begin mod_dann.DataModule1.ADOTable_koephizient.edit; mod_dann.DataModule1.ADOTable_koephizient.FieldByName(inttostr(i)).Value:='1';mod_dann.DataModule1.ADOTable_koephizient.Post;end;
Close;
Open;
end;
end;

procedure Tkalend.CategoryButtons1Categories1Items0Click(Sender: TObject);
begin
with mod_dann.DataModule1.ADOStoredProc_KTU do
begin
First;
while not Eof do begin
for i := 1 to 31 do begin
if not (mod_dann.DataModule1.ADOTable_koephizient.FieldByName(inttostr(i)).Value=null) then if ((mod_dann.DataModule1.ADOTable_koephizient.FieldByName(inttostr(i)).AsString<>'В') and (mod_dann.DataModule1.ADOTable_koephizient.FieldByName(inttostr(i)).AsString<>'#')) then begin mod_dann.DataModule1.ADOTable_koephizient.Edit; mod_dann.DataModule1.ADOTable_koephizient.FieldByName(inttostr(i)).Value:=null;mod_dann.DataModule1.ADOTable_koephizient.Post;
end;
 end;
next;
end;
Close;
Open;
end;

end;

procedure Tkalend.CategoryButtons1Categories1Items1Click(Sender: TObject);
var SavePlace: TBookmark;
begin
with mod_dann.DataModule1.ADOStoredProc_KTU do
begin
SavePlace:=GetBookmark;
for i := 1 to 31 do
if not (mod_dann.DataModule1.ADOTable_koephizient.FieldByName(inttostr(i)).Value=null) then if ((mod_dann.DataModule1.ADOTable_koephizient.FieldByName(inttostr(i)).AsString<>'B') and (mod_dann.DataModule1.ADOTable_koephizient.FieldByName(inttostr(i)).AsString<>'В') and (mod_dann.DataModule1.ADOTable_koephizient.FieldByName(inttostr(i)).AsString<>'#')) then begin mod_dann.DataModule1.ADOTable_koephizient.Edit; mod_dann.DataModule1.ADOTable_koephizient.FieldByName(inttostr(i)).Value:=null;mod_dann.DataModule1.ADOTable_koephizient.Post;
end;
Close;
Open;
GotoBookmark(SavePlace);
FreeBookmark(SavePlace);
end;
end;

procedure Tkalend.CategoryButtons1CategoryCollapase(Sender: TObject;
  const Category: TButtonCategory);
begin
if not Category.Collapsed then CategoryButtons1.Categories[abs(category.Index-1)].Collapsed:=not category.Collapsed;
 if CategoryButtons1.Height=80 then CategoryButtons1.Height:=40 else CategoryButtons1.Height:=80
end;




procedure Tkalend.DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
var
  holdColor: TColor;
begin
  holdColor := DBGrideh1.Canvas.Brush.Color; {сохраняем оригинальный цвет}
    if (Column.Field.AsString='В') or (Column.Field.AsString='B') then DBGrideh1.Canvas.Brush.Color := clred;
    if Column.Field.AsString='#' then DBGrideh1.Canvas.Brush.Color := clblack;
      DBGrideh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      DBGrideh1.Canvas.Brush.Color := holdColor;
end;



procedure Tkalend.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var FS: TFormatSettings; fl:double; str:string; bk:tbookmark;
begin   fs.DecimalSeparator:='.';
if key=vk_return then  if dbgrideh1.DataSource.DataSet.State in [dsedit, dsinsert] then
 begin  dbgrideh1.DataSource.DataSet.Post; mod_dann.DataModule1.ADOTable_koephizient.Edit;
try
fl:=strtofloat(DBGrideh1.Columns[dbgrideh1.SelectedIndex].DisplayText,fs);
str:=floattostr(fl);
except
str:=DBGrideh1.Columns[dbgrideh1.SelectedIndex].DisplayText
end;

mod_dann.DataModule1.ADOTable_koephizient.FieldByName(inttostr(dbgrideh1.SelectedIndex-3)).Value:=str; mod_dann.DataModule1.ADOTable_koephizient.Post;
 bk:=mod_dann.DataModule1.ADOStoredProc_KTU.GetBookmark;
 mod_dann.DataModule1.ADOStoredProc_KTU.DisableControls;
 mod_dann.DataModule1.ADOStoredProc_KTU.Close;  mod_dann.DataModule1.ADOStoredProc_KTU.open;
 mod_dann.DataModule1.ADOStoredProc_KTU.GotoBookmark(bk);
  mod_dann.DataModule1.ADOStoredProc_KTU.EnableControls;
 mod_dann.DataModule1.ADOStoredProc_KTU.FreeBookmark(bk);
   DBGrideh1.EditorMode:=true
 end
end;


procedure Tkalend.FormShow(Sender: TObject);
var str_day, str_day_b:string;
begin   str_day:='';str_day_b:='';
for i:=4 to 34 do  begin
dbgrideh1.Columns[i].Width:=23;
dbgrideh1.Columns[i].Alignment:=tacenter;
DBGridEh1.Columns[i].Title.Caption := 'Ежедневные коэффициенты трудового участия|числа месяца|'+inttostr(i-3);

end;
mod_dann.DataModule1.ADOStoredProc_KTU.Close;
mod_dann.DataModule1.ADOStoredProc_KTU.Open;
mod_dann.DataModule1.ADOTable_koephizient.Close;
mod_dann.DataModule1.ADOTable_koephizient.Open;
if (mod_dann.DataModule1.ADOTable_koephizient.RecordCount<>0) or (mod_dann.DataModule1.ADOStoredProc_KTU.RecordCount=0)then exit;
for i:=1 to DaysInAMonth(yearof(date), zarpl.Form1.ComboBox1.ItemIndex+1) do
if DayOfTheWeek(encodedate(yearof(date), zarpl.Form1.ComboBox1.ItemIndex+1,i)) in [6,7] then begin str_day:=str_day+', '+inttostr(i);str_day_b:=str_day_b+', ''В'''; end;
for i:=DaysInAMonth(yearof(date), zarpl.Form1.ComboBox1.ItemIndex+1)+1 to 31 do begin str_day:=str_day+', '+inttostr(i);str_day_b:=str_day_b+', ''#'''; end;
str_day:=str_day+')';

mod_dann.DataModule1.ADOQuery_vichodnoi.SQL.Clear;
mod_dann.DataModule1.ADOQuery_vichodnoi.SQL.Add('INSERT INTO koephizient ( cod_rabotn, cod_dat'+str_day);
mod_dann.DataModule1.ADOQuery_vichodnoi.SQL.Add('SELECT rabotniki.Cod, '+inttostr(zarpl.Form1.ComboBox1.ItemIndex+1)+str_day_b);
mod_dann.DataModule1.ADOQuery_vichodnoi.SQL.Add('FROM rabotniki');
mod_dann.DataModule1.ADOQuery_vichodnoi.SQL.Add('WHERE (((rabotniki.proz_nal) Is Not Null))');
mod_dann.DataModule1.ADOQuery_vichodnoi.ExecSQL;
mod_dann.DataModule1.ADOTable_koephizient.Close;
mod_dann.DataModule1.ADOTable_koephizient.Open;
mod_dann.DataModule1.ADOStoredProc_KTU.Close;
mod_dann.DataModule1.ADOStoredProc_KTU.Open;
end;


procedure Tkalend.N1Click(Sender: TObject);
begin
DBGrideh1.EditorMode:=true;
dbgrideh1.DataSource.DataSet.Edit;
mod_dann.DataModule1.ADOTable_koephizient.Edit;
if sender=n1 then
begin
mod_dann.DataModule1.ADOTable_koephizient.FieldByName(dbgrideh1.Columns[dbgrideh1.SelectedIndex].FieldName).AsString:='А';
dbgrideh1.DataSource.DataSet.FieldByName(dbgrideh1.Columns[dbgrideh1.SelectedIndex].FieldName).AsString:='А';
end else
if sender=n2 then
begin
mod_dann.DataModule1.ADOTable_koephizient.FieldByName(dbgrideh1.Columns[dbgrideh1.SelectedIndex].FieldName).AsString:='О';
dbgrideh1.DataSource.DataSet.FieldByName(dbgrideh1.Columns[dbgrideh1.SelectedIndex].FieldName).AsString:='О';
end
else
if sender=n3 then
begin
mod_dann.DataModule1.ADOTable_koephizient.FieldByName(dbgrideh1.Columns[dbgrideh1.SelectedIndex].FieldName).AsString:='Б';
dbgrideh1.DataSource.DataSet.FieldByName(dbgrideh1.Columns[dbgrideh1.SelectedIndex].FieldName).AsString:='Б';
end
else
begin
mod_dann.DataModule1.ADOTable_koephizient.FieldByName(dbgrideh1.Columns[dbgrideh1.SelectedIndex].FieldName).AsString:='П';
dbgrideh1.DataSource.DataSet.FieldByName(dbgrideh1.Columns[dbgrideh1.SelectedIndex].FieldName).AsString:='П';
end;

mod_dann.DataModule1.ADOTable_koephizient.post;
DBGrideh1.EditorMode:=false;
end;

procedure Tkalend.N2Click(Sender: TObject);
begin
n1.OnClick(n2)
end;

procedure Tkalend.N3Click(Sender: TObject);
begin
n1.OnClick(n3)
end;

procedure Tkalend.N4Click(Sender: TObject);
begin
n1.OnClick(n4)
end;

procedure Tkalend.SpeedButton1Click(Sender: TObject);
var st:string;
begin
dbgrideh1.Columns.Items[36].Visible:=false;
Printerpreview.Orientation := poLandscape;
printdbgrideh1.BeforeGridText.Delete(0);
printdbgrideh1.BeforeGridText.insert(0,'Ведомость');
for i:=1 to printdbgrideh1.BeforeGridText.Count-1 do
printdbgrideh1.BeforeGridText.Delete(1);
st:='учёта ежедневных коэффициентов трудового участия бригады -';

if mod_dann.DataModule1.ADOTable_recvisit_dobavl.Locate('name_rec','BRIGADA',[]) then st:=st+mod_dann.DataModule1.ADOTable_recvisit_dobavl.FieldByName('znach').asstring+'-                 цеха -';
if mod_dann.DataModule1.ADOTable_recvisit_dobavl.Locate('name_rec','ZECH',[]) then st:=st+mod_dann.DataModule1.ADOTable_recvisit_dobavl.FieldByName('znach').asstring+'-';
printdbgrideh1.BeforeGridText.insert(1,st);
st:=zarpl.Form1.ComboBox1.Text+' '+inttostr(CurrentYear)+' г.                           бригадир ';
if mod_dann.DataModule1.ADOTable_recvisit_dobavl.Locate('name_rec','BRIGADIR',[]) then st:=st+mod_dann.DataModule1.ADOTable_recvisit_dobavl.FieldByName('znach').asstring;
printdbgrideh1.BeforeGridText.insert(6, st);
for I := 1 to 3 do printdbgrideh1.BeforeGridText.add('');

for I := 0 to printdbgrideh1.AfterGridText.Count-1 do printdbgrideh1.AfterGridText.Delete(0);
for I := 0 to 8 do printdbgrideh1.AfterGridText.Insert(i,'');

st:='       Бригадир ________________ ';
if mod_dann.DataModule1.ADOTable_recvisit_dobavl.Locate('name_rec','BRIGADIR',[]) then st:=st+mod_dann.DataModule1.ADOTable_recvisit_dobavl.FieldByName('znach').asstring+'                            Мастер(старший мастер) ________________ ';
if mod_dann.DataModule1.ADOTable_recvisit.Locate('dolshnost','Нач. уч-ка',[]) then st:=st+mod_dann.DataModule1.ADOTable_recvisit.FieldByName('familia').asstring;

printdbgrideh1.AfterGridText.insert(8,st);
printdbgrideh1.Preview;
dbgrideh1.Columns.Items[36].Visible:=true;
end;

procedure Tkalend.SpeedButton2Click(Sender: TObject);
begin
for I := 4 to 34 do
dbgrideh1.Columns.Items[i].Width:=dbgrideh1.Columns.Items[i].Width-1;
end;


procedure Tkalend.SpeedButton3Click(Sender: TObject);
begin
for I := 4 to 34 do
dbgrideh1.Columns.Items[i].Width:=dbgrideh1.Columns.Items[i].Width+1;
end;

end.
