unit Detal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, Mask, Grids, DBGrids, Buttons, Db,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh,
  DBAxisGridsEh, DBGridEh, DBCtrlsEh, Vcl.ExtDlgs, EhLibVCL, Vcl.Menus,
  Vcl.ComCtrls, JPEG;

type
  TForm2 = class(TForm)
    DBEdit1: TDBEdit;
    DBNavigator1: TDBNavigator;
    SpeedButton1: TSpeedButton;
    CheckBox1: TCheckBox;
    labeltext1: TLabeledEdit;
    DBGridEh1: TDBGridEh;
    DBImage1: TDBImage;
    OpenPictureDialog1: TOpenPictureDialog;
    DBLookupComboBox1: TDBLookupComboBox;
    Bevel1: TBevel;
    Label2: TLabel;
    DBCheckBox1: TDBCheckBox;
    Image1: TImage;
    Image2: TImage;
    Panel1: TPanel;
    DBGridEh2: TDBGridEh;
    Label1: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure CheckBox1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure labeltext1Change(Sender: TObject);
    procedure labeltext1Exit(Sender: TObject);
    procedure labeltext1Click(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure DBCheckBox1Click(Sender: TObject);
    procedure DBCheckBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBImage1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure DBGridEh1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBImage1Click(Sender: TObject);
  private
    { Private declarations }
    id: Integer;
    procedure WMHotKey(var Msg: TWMHotKey); message WM_HOTKEY;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses mod_dann, zarpl, nezaver, brak;


{$R *.dfm}





procedure TForm2.CheckBox1Click(Sender: TObject);
var bm:Tbookmark;
begin
case checkbox1.State of
cbGrayed: begin
speedbutton1.Enabled:=true;
checkbox1.Hint:='Выборочная печать';checkbox1.ShowHint:=true;
dbgrideh1.Options:=dbgrideh1.Options-[dgAlwaysShowEditor, dgmultiselect];
dbgrideh1.Columns[0].Visible:=true;
           end; {cbGrayed}

cbUnchecked: begin
speedbutton1.Enabled:=false;
checkbox1.ShowHint:=false;
dbgrideh1.Columns[0].Visible:=false;
bm:=mod_dann.DataModule1.ADOTable_rasz.GetBookmark;
mod_dann.DataModule1.ADOTable_rasz.DisableControls;
mod_dann.DataModule1.ADOTable_rasz.MasterFields:='';
mod_dann.DataModule1.ADOTable_rasz.First;
while not mod_dann.DataModule1.ADOTable_rasz.Eof do begin
 if mod_dann.DataModule1.ADOTable_rasz.FieldValues['Print']=true then begin
 mod_dann.DataModule1.ADOTable_rasz.Edit;
mod_dann.DataModule1.ADOTable_rasz.FieldValues['Print']:=false; end;
 mod_dann.DataModule1.ADOTable_rasz.Next;
 end;
mod_dann.DataModule1.ADOTable_rasz.MasterFields:='Cod';
mod_dann.DataModule1.ADOTable_rasz.Close;
mod_dann.DataModule1.ADOTable_rasz.Open;
 if mod_dann.DataModule1.ADOTable_rasz.BookmarkValid(bm) then
 mod_dann.DataModule1.ADOTable_rasz.GotoBookmark(bm);
 mod_dann.DataModule1.ADOTable_rasz.EnableControls;
         end;{cbUnchecked}
cbChecked: begin
speedbutton1.Enabled:=true;
checkbox1.Hint:='Печать всех расценок';
dbgrideh1.Columns[0].Visible:=false;
           end;{cbChecked}
end;{case}
end;


procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
if mod_dann.DataModule1.ADOTable_rasz.State in [dsedit, dsinsert] then
mod_dann.DataModule1.ADOTable_rasz.Post;
mod_dann.DataModule1.ADOQuery_detalprint.SQL.Clear;
mod_dann.DataModule1.ADOQuery_detalprint.SQL.Add('SELECT detali.Detal, raszenki.Nomer_operazii, raszenki.Raszenka, raszenki.Poasnenie');
mod_dann.DataModule1.ADOQuery_detalprint.SQL.Add('FROM detali INNER JOIN raszenki ON detali.Cod = raszenki.Cod_detali');
if checkbox1.State=cbGrayed then mod_dann.DataModule1.ADOQuery_detalprint.SQL.Add('WHERE (((raszenki.Print)=True))');
mod_dann.DataModule1.ADOQuery_detalprint.SQL.Add('ORDER BY detali.Detal, raszenki.Nomer_operazii;');
mod_dann.DataModule1.ADOQuery_detalprint.Close;
mod_dann.DataModule1.ADOQuery_detalprint.Open;
mod_dann.DataModule1.frxReport_detalprint.ShowReport();
end;



procedure TForm2.WMHotKey(var Msg: TWMHotKey);
begin
if Msg.HotKey = id then begin  mod_dann.DataModule1.ADOdataset_zarpl.edit;
mod_dann.DataModule1.ADOdataset_zarpl.FieldByName('cod_detali').Value:=mod_dann.DataModule1.ADOTable_detal.FieldByName('cod').Value;
mod_dann.DataModule1.ADOdataset_zarpl.FieldByName('Cod_raszenki').Value:=null;
end;
end;

procedure TForm2.DBCheckBox1Click(Sender: TObject);
begin
 image1.Visible:=DBCheckBox1.Checked ;

 image2.Visible:=false;
end;



procedure TForm2.DBCheckBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if not DBCheckBox1.Checked  then begin
 if messagedlg('Удалить входимость деталей в узел?',mtWarning, [mbYes, mbNo], 0, mbNo)=mryes then begin
 mod_dann.DataModule1.ADOQuery_del.Close; mod_dann.DataModule1.ADOQuery_del.SQL.Clear;
 mod_dann.DataModule1.ADOQuery_del.SQL.Add('delete from uzel where cod_uzla='+mod_dann.DataModule1.ADOTable_detal.FieldByName('cod').AsString);
 mod_dann.DataModule1.ADOQuery_del.ExecSQL;mod_dann.DataModule1.ADOTable_uzel.Close; mod_dann.DataModule1.ADOTable_uzel.Open;
 showmessage('Записи удалены!') ;

 end; panel1.visible:=false
end;
end;



procedure TForm2.DBEdit1Change(Sender: TObject);
begin
 image1.Visible:=DBCheckBox1.Checked;image2.Visible:=false; panel1.Visible:=false;mod_dann.DataModule1.ADOTable_uzel.Active:=false;

end;

procedure TForm2.DBEdit1Exit(Sender: TObject);
begin
if (mod_dann.DataModule1.ADOTable_detal.State=dsinsert) or (mod_dann.DataModule1.ADOTable_detal.State=dsedit) then
mod_dann.DataModule1.ADOTable_detal.Post;

end;

procedure TForm2.DBGrid1TitleClick(Column: TColumn);
var bm:Tbookmark;
begin
if column.FieldName='Print' then begin
bm:=mod_dann.DataModule1.ADOTable_rasz.GetBookmark;
mod_dann.DataModule1.ADOTable_rasz.DisableControls;
mod_dann.DataModule1.ADOTable_rasz.First;
while not mod_dann.DataModule1.ADOTable_rasz.Eof do begin
mod_dann.DataModule1.ADOTable_rasz.Edit;
mod_dann.DataModule1.ADOTable_rasz.FieldValues['Print']:=true;
mod_dann.DataModule1.ADOTable_rasz.Next;
end;
 if mod_dann.DataModule1.ADOTable_rasz.BookmarkValid(bm) then
 mod_dann.DataModule1.ADOTable_rasz.GotoBookmark(bm);
 mod_dann.DataModule1.ADOTable_rasz.EnableControls;
end;
end;




procedure TForm2.DBGridEh1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if (mod_dann.DataModule1.ADODataSet_zarpl.State=dsedit) or (mod_dann.DataModule1.ADODataSet_zarpl.State=dsinsert)  then mod_dann.DataModule1.ADODataSet_zarpl.Post;
  if button=mbright then begin mod_dann.DataModule1.ADODataSet_zarpl.Edit;
    mod_dann.DataModule1.ADODataSet_zarpl.FieldByName('Cod_detali').Value:=mod_dann.DataModule1.ADOTable_rasz.FieldByName('Cod_detali').Value;
    mod_dann.DataModule1.ADODataSet_zarpl.FieldByName('Cod_raszenki').Value:=mod_dann.DataModule1.ADOTable_rasz.FieldByName('Cod').Value;
    mod_dann.DataModule1.ADODataSet_zarpl.Post;
    mod_dann.DataModule1.ADODataset_zarpl.Refresh;
    zarpl.Form1.DBGrid2.SetFocus;
keybd_event(VK_down, 0, 0, 0);
keybd_event(VK_down, 0, KEYEVENTF_KEYUP, 0);
zarpl.Form1.dbgrid2.SelectedIndex:=0;
  end;
end;

procedure TForm2.DBImage1Click(Sender: TObject);
begin
if dbimage1.Tag=0 then  begin
dbimage1.Proportional:=true;
dbimage1.Width:=dbimage1.Width*4;
dbimage1.Height:=dbimage1.Height*4;
dbimage1.Tag:=1;
end else   begin
dbimage1.Proportional:=false;
dbimage1.Width:=97;
dbimage1.Height:=81; dbimage1.Tag:=0;
end;
end;

procedure TForm2.DBImage1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if button=mbright then dbimage1.CopyToClipboard;

end;







procedure TForm2.FormHide(Sender: TObject);
begin
 UnRegisterHotKey(Handle, id);
 if assigned(nezaver.nezav) then nezav.Top:=2;
 if assigned(brak.brak_form) then brak_form.Top:=2;

end;

procedure TForm2.FormShow(Sender: TObject);
begin
RegisterHotKey(Handle, id, MOD_SHIFT, $56);
left:=zarpl.Form1.Width-11;
top:=2 ;
if assigned(nezaver.nezav) then nezaver.nezav.top:=Height-4;
if assigned(brak.brak_form) then brak.brak_form.top:=Height-4
end;

procedure TForm2.Image1Click(Sender: TObject);
begin
image1.Visible:=false;image2.Visible:=true;panel1.Visible:=true;mod_dann.DataModule1.adotable_uzel.Active:=true;
end;

procedure TForm2.Image2Click(Sender: TObject);
begin
image2.Visible:=false;image1.Visible:=true; panel1.Visible:=false;mod_dann.DataModule1.adotable_uzel.Active:=false;
end;

procedure TForm2.labeltext1Change(Sender: TObject);
begin
datamodule1.ADOTable_detal.Filtered:=false;
if trim(Labeltext1.Text)<>'' then begin
mod_dann.DataModule1.ADOTable_detal.MasterFields:='';
datamodule1.ADOTable_detal.Filter:='Detal LIKE '  +'%'+ Labeltext1.Text + '%';
datamodule1.ADOTable_detal.Filtered:=true;
end;
end;

procedure TForm2.labeltext1Exit(Sender: TObject);
begin
datamodule1.ADOTable_detal.Filtered:=false;
labeltext1.Text:='';
end;



procedure TForm2.N1Click(Sender: TObject);
begin
dbimage1.CopyToClipboard
end;

procedure TForm2.N2Click(Sender: TObject);
begin
dbimage1.PasteFromClipboard
end;

procedure TForm2.N3Click(Sender: TObject);
begin
dbimage1.CutToClipboard
end;

procedure TForm2.N4Click(Sender: TObject);
var
  fS: TFileStream;
begin
try
 if OpenPictureDialog1.Execute  then begin
  fs:=TFileStream.Create(OpenPictureDialog1.FileName, fmOpenRead);

    datamodule1.ADOTable_detal.Edit;
    TBlobField(datamodule1.ADOTable_detal.FieldByName('Photo')).LoadFromStream(fs);
    fs.Free;
    datamodule1.ADOTable_detal.Post; end;
  finally

  end;

end;

procedure TForm2.labeltext1Click(Sender: TObject);
begin
labeltext1.Text:='';
LoadKeyboardLayout('00000419',KLF_ACTIVATE);
end;

end.
