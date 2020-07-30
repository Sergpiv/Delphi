unit korrectrasz;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,system.UITypes,
  Vcl.Buttons, mod_dann;

type
  Tkorrect_rasz = class(TForm)
    RadioGroup1: TRadioGroup;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  korrect_rasz: Tkorrect_rasz;

implementation

{$R *.dfm}

procedure Tkorrect_rasz.Edit1Click(Sender: TObject);
begin
(sender as Tedit).SelectAll
end;

procedure Tkorrect_rasz.FormActivate(Sender: TObject);
begin
edit1.Text:='';
end;





procedure Tkorrect_rasz.FormShow(Sender: TObject);
begin
activecontrol:=radiogroup1;radiogroup1.ItemIndex:=-1;
end;

procedure Tkorrect_rasz.SpeedButton1Click(Sender: TObject);
var st:string;okr_rasc:real; rasrad:integer;
begin  st:='';rasrad:=0;
if edit1.Text='' then exit;
try
strtofloat(edit1.Text)
except
showmessage('Введите числовое значение!');edit1.SelectAll; exit
end;
if ((mod_dann.DataModule1.ADOTable_recvisit_dobavl.Locate('name_rec','OKR_RASC',[])) and (mod_dann.DataModule1.ADOTable_recvisit_dobavl.FieldByName('znach').Value<>'0') and (mod_dann.DataModule1.ADOTable_recvisit_dobavl.FieldByName('znach').Value<>null) and (mod_dann.DataModule1.ADOTable_recvisit_dobavl.FieldByName('znach').Value<>'')) then
okr_rasc:=mod_dann.DataModule1.ADOTable_recvisit_dobavl.FieldByName('znach').asfloat
else okr_rasc:=1/100;
if okr_rasc<1 then while okr_rasc<1 do begin rasrad:=rasrad+1;okr_rasc:=okr_rasc*10;end;

  st:='Вы уверены ';  mod_dann.DataModule1.ADOQuery_perechet.SQL.Clear;
  case radiogroup1.ItemIndex of
  -1:exit;
  0:begin st:=st+'в увеличении расценок на '+edit1.Text+' %?';
  if okr_rasc<=1 then mod_dann.DataModule1.ADOQuery_perechet.SQL.Add('UPDATE raszenki SET raszenka=round('''+floattostr(1+strtofloat(edit1.Text)/100)+'''*raszenka, '+inttostr(rasrad)+')')
  else mod_dann.DataModule1.ADOQuery_perechet.SQL.Add('UPDATE raszenki SET raszenka='+floattostr(okr_rasc)+'*round('''+floattostr(1+strtofloat(edit1.Text)/100)+'''*raszenka/'+floattostr(okr_rasc)+', '+inttostr(rasrad)+')');
  end;
  1:begin st:=st+'в уменьшении расценок на '+edit1.Text+' %?';
  if okr_rasc<=1 then mod_dann.DataModule1.ADOQuery_perechet.SQL.Add('UPDATE raszenki SET raszenka=round('''+floattostr(1-strtofloat(edit1.Text)/100)+'''*raszenka, '+inttostr(rasrad)+')')
  else mod_dann.DataModule1.ADOQuery_perechet.SQL.Add('UPDATE raszenki SET raszenka='+floattostr(okr_rasc)+'*round('''+floattostr(1-strtofloat(edit1.Text)/100)+'''*raszenka/'+floattostr(okr_rasc)+', '+inttostr(rasrad)+')');
  showmessage('UPDATE raszenki SET raszenka=round('''+floattostr(1-strtofloat(edit1.Text)/100)+'''*raszenka, 2)');
  end;

  2:begin st:=st+'в увеличении расценок в '+edit1.Text+' раз?';
  if okr_rasc<=1 then mod_dann.DataModule1.ADOQuery_perechet.SQL.Add('UPDATE raszenki SET raszenka=round('''+edit1.Text+'''*raszenka, '+inttostr(rasrad)+')')
  else mod_dann.DataModule1.ADOQuery_perechet.SQL.Add('UPDATE raszenki SET raszenka='+floattostr(okr_rasc)+'*round('''+edit1.Text+'''*raszenka/'+floattostr(okr_rasc)+', '+inttostr(rasrad)+')'); end;
  3:begin st:=st+'в уменьшении расценок в '+edit1.Text+' раз?';
  if okr_rasc<=1 then mod_dann.DataModule1.ADOQuery_perechet.SQL.Add('UPDATE raszenki SET raszenka=round(1/'''+edit1.Text+'''*raszenka, '+inttostr(rasrad)+')')
  else mod_dann.DataModule1.ADOQuery_perechet.SQL.Add('UPDATE raszenki SET raszenka='+floattostr(okr_rasc)+'*round(1/'''+edit1.Text+'''*raszenka/'+floattostr(okr_rasc)+', '+inttostr(rasrad)+')'); end;
  end;
if messagedlg(st,mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
  begin
    mod_dann.DataModule1.ADOQuery_perechet.ExecSQL;
    mod_dann.DataModule1.ADOTable_rasz.Close;
    mod_dann.DataModule1.ADOTable_rasz.Open;
    mod_dann.DataModule1.ADODataSet_zarpl.Close;
    mod_dann.DataModule1.ADODataSet_zarpl.Open;
    showmessage('Расценки изменены!');korrect_rasz.Hide
  end else edit1.SelectAll

end;

end.
