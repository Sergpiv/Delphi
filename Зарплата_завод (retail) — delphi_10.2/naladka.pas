unit naladka;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, frxPreview, frxclass,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBGridEh, Data.Win.ADODB, Vcl.Imaging.pngimage;

type
  Tnalad = class(TForm)
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBGridEh1: TDBGridEh;
    ADOTable_norma: TADOTable;
    Image1: TImage;
    ADOTable_normaCod: TAutoIncField;
    ADOTable_normaCod_rabotnika: TIntegerField;
    ADOTable_normaCod_dat: TIntegerField;
    ADOTable_normaphakt: TIntegerField;
    ADOTable_normakorr: TFloatField;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SpeedButton1: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Image1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FOldDBWndProc : TWndMethod;
    procedure NewWndProc(var Msg : TMessage);
  public
    { Public declarations }
  end;

var
  nalad: Tnalad;s_nal:real; ch:integer;

implementation

{$R *.dfm}

uses mod_dann, zarpl;
  var buttonSelected:integer;
procedure Tnalad.BitBtn1Click(Sender: TObject);
begin   buttonSelected :=mryes;
if DBGridEh1.SumList.SumCollection[1].SumValue>strtofloat(label1.Caption) then  begin
buttonSelected := MessageDlg('Введённые значения больше выделенной суммы! Продолжить?',mtWarning, [mbno, mbyes], 0);
end;
end;



procedure Tnalad.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if buttonSelected=mrNo then  canclose:=false else canclose:=true
end;



procedure Tnalad.FormCreate(Sender: TObject);
begin
FOldDBWndProc := DBGrideh1.WindowProc;
  DBGrideh1.WindowProc := NewWndProc;
end;

procedure Tnalad.FormShow(Sender: TObject);
var s:real;
begin s:=0;ch:=0;
  mod_dann.DataModule1.ADOStoredProc_naladka.Close;
  mod_dann.DataModule1.ADOStoredProc_naladka.Parameters.ParamByName('[:cod_dat]').Value:=zarpl.Form1.combobox1.ItemIndex+1;
  mod_dann.DataModule1.ADOStoredProc_naladka.Open;
  mod_dann.DataModule1.ADOStoredProc_ekonomia.Close;
mod_dann.DataModule1.ADOStoredProc_ekonomia.Parameters.ParamByName('[:cod_dat]').Value:=zarpl.Form1.combobox1.ItemIndex+1;
mod_dann.DataModule1.ADOStoredProc_ekonomia.Open;
  while not mod_dann.DataModule1.ADOStoredProc_ekonomia.eof do begin
  s:=s+mod_dann.DataModule1.ADOStoredProc_ekonomia.FieldByName('ekon').AsFloat ;ch:=ch+mod_dann.DataModule1.ADOStoredProc_ekonomia.FieldByName('Sum-phakt').asinteger;
  mod_dann.DataModule1.ADOStoredProc_ekonomia.Next
  end; s_nal:=s;
  mod_dann.DataModule1.ADODataSet_ekon_podnal.Close;
  mod_dann.DataModule1.ADODataSet_ekon_podnal.Parameters.ParamByName('cod_dat').Value:=zarpl.Form1.combobox1.ItemIndex+1;
  mod_dann.DataModule1.ADODataSet_ekon_podnal.Open;
  while not mod_dann.DataModule1.ADODataSet_ekon_podnal.Eof do
  begin
    s:=s+mod_dann.DataModule1.ADODataSet_ekon_podnal.FieldByName('podnal_ekon').AsFloat*zarpl.vipusk_zarplata(zarpl.Form1.combobox1.ItemIndex+1);
    s:=round(s/okrugl)*okrugl;
    mod_dann.DataModule1.ADODataSet_ekon_podnal.Next
  end;



  label1.Caption:=floattostr(s);
adotable_norma.Close;
adotable_norma.Open;
mod_dann.DataModule1.ADOStoredProc_naladka.Close;
mod_dann.DataModule1.ADOStoredProc_naladka.Open;
 label5.Caption:=floattostr(round((StrToFloat(label1.Caption)-dBGridEh1.SumList.SumCollection[1].SumValue)/okrugl)*okrugl);
 if strtofloat(label5.Caption)<0 then label5.Font.Color:=clred else label5.Font.Color:=clblue;
 if StrToFloat(label5.Caption)=0 then  dbgrideh1.Columns[4].Footer.color:=cllime else
 if StrToFloat(label5.Caption)<0 then  dbgrideh1.Columns[4].Footer.color:=clred
 else dbgrideh1.Columns[4].Footer.color:=claqua;
end;

procedure Tnalad.Image1Click(Sender: TObject);
var bm:tbookmark;
  AMsgDialog: TForm;
  ACheckBox: TCheckBox;
begin
  AMsgDialog := CreateMessageDialog(
        'Распределить автоматически?', mtConfirmation, [mbYes, mbNo]) ;
  ACheckBox := TCheckBox.Create(AMsgDialog) ;
  with AMsgDialog do
  try
   Caption := 'Экономия за наладку' ;
   Height := 150;

   with ACheckBox do
   begin
    Parent := AMsgDialog;
    Caption := 'С учётом бригад';
    Top := 95;
    Left := 8;
    Width:= 200;
    Checked:=true;
   end;

   if (ShowModal = ID_YES) then
   begin
    mod_dann.DataModule1.ADOStoredProc_naladka.Last;
    mod_dann.DataModule1.ADOStoredProc_naladka.First;
    if ACheckBox.Checked then
    begin
     bm:=mod_dann.DataModule1.ADOStoredProc_naladka.GetBookmark;
mod_dann.DataModule1.ADOStoredProc_naladka.First;
while not mod_dann.DataModule1.ADOStoredProc_naladka.Eof do
begin
adotable_norma.Edit;
       if mod_dann.DataModule1.ADOStoredProc_ekonomia.Locate('cod',mod_dann.DataModule1.ADOStoredProc_naladka.FieldByName('cod_brig').Value,[]) then
        begin
       if (mod_dann.DataModule1.ADOStoredProc_ekonomia.FieldByName('Sum-phakt').value<>null) and (adotable_norma.FieldByName('phakt').AsFloat<>0) then
         begin if (mod_dann.DataModule1.ADOStoredProc_naladka.FieldByName('podnal').Value=false) then
adotable_norma.FieldByName('korr').Value:=round(mod_dann.DataModule1.ADOStoredProc_ekonomia.FieldByName('ekon').AsFloat*adotable_norma.FieldByName('phakt').AsFloat/mod_dann.DataModule1.ADOStoredProc_ekonomia.FieldByName('Sum-phakt').AsInteger/okrugl)*okrugl
       else adotable_norma.FieldByName('korr').Value:=round((1-adotable_norma.FieldByName('phakt').AsFloat/mod_dann.DataModule1.ADOTable_chasi.FieldByName('chas').Value)*vipusk_zarplata(zarpl.Form1.ComboBox1.ItemIndex+1)*mod_dann.DataModule1.ADOStoredProc_naladka.FieldByName('proz_nal').Value/100/okrugl)*okrugl;
         end
       else adotable_norma.FieldByName('korr').Value:=null;
        end
       else adotable_norma.FieldByName('korr').Value:=null;
adotable_norma.Post;
mod_dann.DataModule1.ADOStoredProc_naladka.Next ;
end;
mod_dann.DataModule1.ADOStoredProc_naladka.close;
mod_dann.DataModule1.ADOStoredProc_naladka.Open;
mod_dann.DataModule1.ADOStoredProc_naladka.GotoBookmark(bm);
mod_dann.DataModule1.ADOStoredProc_naladka.FreeBookmark(bm);
dbgrideh1.SumList.Active:=false;
dbgrideh1.SumList.Active:=true;
Label5.Caption:=floattostr(round((StrToFloat(label1.Caption)-dBGridEh1.SumList.SumCollection[1].SumValue)/okrugl)*okrugl);
 if strtofloat(Label5.Caption)<0 then Label5.Font.Color:=clred else Label5.Font.Color:=clblue;
  if StrToFloat(label5.Caption)=0 then  dbgrideh1.Columns[4].Footer.color:=cllime else
 if StrToFloat(label5.Caption)<0 then  dbgrideh1.Columns[4].Footer.color:=clred
 else dbgrideh1.Columns[4].Footer.color:=claqua;
    end

    else
          begin
          bm:=mod_dann.DataModule1.ADOStoredProc_naladka.GetBookmark;
mod_dann.DataModule1.ADOStoredProc_naladka.First;
while not mod_dann.DataModule1.ADOStoredProc_naladka.Eof do
begin
adotable_norma.Edit;
          if dBGridEh1.SumList.SumCollection[0].SumValue<=0 then adotable_norma.FieldByName('korr').Value:=round(strtofloat(label1.Caption)/mod_dann.DataModule1.ADOStoredProc_naladka.RecordCount/okrugl)*okrugl
         else if adotable_norma.FieldByName('phakt').AsFloat<>0 then
    begin  if (mod_dann.DataModule1.ADOStoredProc_naladka.FieldByName('podnal').Value=false) then
adotable_norma.FieldByName('korr').Value:=round(s_nal*adotable_norma.FieldByName('phakt').AsFloat/ch/okrugl)*okrugl
           else adotable_norma.FieldByName('korr').Value:=round((1-adotable_norma.FieldByName('phakt').AsFloat/mod_dann.DataModule1.ADOTable_chasi.FieldByName('chas').Value)*vipusk_zarplata(zarpl.Form1.ComboBox1.ItemIndex+1)*mod_dann.DataModule1.ADOStoredProc_naladka.FieldByName('proz_nal').Value/100/okrugl)*okrugl;
    end else adotable_norma.FieldByName('phakt').value:=null;
adotable_norma.Post;
mod_dann.DataModule1.ADOStoredProc_naladka.Next ;
end;
mod_dann.DataModule1.ADOStoredProc_naladka.close;
mod_dann.DataModule1.ADOStoredProc_naladka.Open;
mod_dann.DataModule1.ADOStoredProc_naladka.GotoBookmark(bm);
mod_dann.DataModule1.ADOStoredProc_naladka.FreeBookmark(bm);
dbgrideh1.SumList.Active:=false;
dbgrideh1.SumList.Active:=true;
Label5.Caption:=floattostr(round((StrToFloat(label1.Caption)-dBGridEh1.SumList.SumCollection[1].SumValue)/okrugl)*okrugl);
 if strtofloat(Label5.Caption)<0 then Label5.Font.Color:=clred else Label5.Font.Color:=clblue;
 if StrToFloat(label5.Caption)=0 then  dbgrideh1.Columns[4].Footer.color:=cllime else
 if StrToFloat(label5.Caption)<0 then  dbgrideh1.Columns[4].Footer.color:=clred
 else dbgrideh1.Columns[4].Footer.color:=claqua;
          end;
   end;
  finally
   Free;
  end;
end;

procedure Tnalad.NewWndProc(var Msg: TMessage);
begin
 FOldDBWndProc(Msg);
 if (Msg.Msg = WM_RBUTTONDOWN) and (dbgrideh1.SelectedIndex=4) then
    begin
    nalad.adotable_norma.Edit;
nalad.adotable_norma.FieldByName('korr').Value:=round((nalad.adotable_norma.FieldByName('korr').Value+InputBox('КОРРЕКТИВ', 'Пожалуйста, введите корректив', '0'))/okrugl)*okrugl;
nalad.adotable_norma.Post;
mod_dann.DataModule1.ADOStoredProc_naladka.Close;
mod_dann.DataModule1.ADOStoredProc_naladka.Open;
nalad.Label5.Caption:=floattostr(round((StrToFloat(nalad.label1.Caption)-nalad.dBGridEh1.SumList.SumCollection[1].SumValue)/okrugl)*okrugl);
 if strtofloat(nalad.Label5.Caption)<0 then nalad.Label5.Font.Color:=clred else nalad.Label5.Font.Color:=clblue;
 if StrToFloat(nalad.label5.Caption)=0 then  nalad.dbgrideh1.Columns[4].Footer.color:=cllime else
 if StrToFloat(nalad.label5.Caption)<0 then  nalad.dbgrideh1.Columns[4].Footer.color:=clred
 else nalad.dbgrideh1.Columns[4].Footer.color:=claqua;

    end;

end;

procedure Tnalad.SpeedButton1Click(Sender: TObject);
begin
adotable_norma.Close;
adotable_norma.MasterFields:='cod_dat';
adotable_norma.IndexFieldNames:='cod_dat';
adotable_norma.Open;
while not adotable_norma.Eof do
begin

adotable_norma.Edit;
adotable_norma.FieldByName('korr').Value:=null;
adotable_norma.Post;
 adotable_norma.Next;
end;
adotable_norma.Close;
adotable_norma.MasterFields:='Cod_rabotnika;Cod_dat';
adotable_norma.IndexFieldNames:='Cod_rabotnika;Cod_dat';
adotable_norma.Open;
mod_dann.DataModule1.ADOStoredProc_naladka.Close;
mod_dann.DataModule1.ADOStoredProc_naladka.Open;
dbgrideh1.SumList.Active:=false;
DBGridEh1.SumList.Active:=true;
label5.Caption:=floattostr(StrToFloat(label1.Caption)-dBGridEh1.SumList.SumCollection[1].SumValue);
 if strtofloat(label5.Caption)<0 then label5.Font.Color:=clred else label5.Font.Color:=clblue;
 if StrToFloat(label5.Caption)=0 then  dbgrideh1.Columns[4].Footer.color:=cllime else
 if StrToFloat(label5.Caption)<0 then  dbgrideh1.Columns[4].Footer.color:=clred
 else dbgrideh1.Columns[4].Footer.color:=claqua;
end;

end.
