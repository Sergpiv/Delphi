unit zarpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids,
  Buttons,  frxClass,frxDBSet, Menus, inifiles, OleServer, ComObj, dateutils,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ImgList, system.UITypes, DBCtrlsEh,Vcl.WinXCalendars,
  System.ImageList, EhLibVCL, FireDAC.Phys.ODBCWrapper, korrectrasz, napominalka, FireDAC.Comp.Client,
  Vcl.Imaging.pngimage, Vcl.AppEvnts, Vcl.ComCtrls, shellapi, Data.SqlExpr, FileCtrl;

type
TMenuItemHint = class(THintWindow)
   private
     activeMenuItem : TMenuItem;
     showTimer : TTimer;
     hideTimer : TTimer;
     procedure HideTime(Sender : TObject) ;
     procedure ShowTime(Sender : TObject) ;
   public
     constructor Create(AOwner : TComponent) ; override;
     procedure DoActivateHint(menuItem : TMenuItem) ;
     destructor Destroy; override;
   end;
  TForm1 = class(TForm)
    DBEdit1: TDBEdit;
    DBNavigator1: TDBNavigator;
    MainMenu1: TMainMenu;
    h1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    labeltext1: TLabeledEdit;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    SaveDialog1: TSaveDialog;
    ADOQuery1: TADOQuery;
    N15: TMenuItem;
    ImageList1: TImageList;
    N16: TMenuItem;
    N17: TMenuItem;
    DBEditEh1: TDBEditEh;
    Label4: TLabel;
    N18: TMenuItem;
    OpenDialog2: TOpenDialog;
    ComboBox1: TComboBox;
    DBGrid2: TDBGridEh;
    N19: TMenuItem;
    N20: TMenuItem;
    Panel1: TPanel;
    Label6: TLabel;
    DBEditEh_chasi: TDBEditEh;
    Label5: TLabel;
    DBEditEh_norma: TDBEditEh;
    Label7: TLabel;
    DBEditEh_naladka: TDBEditEh;
    Label8: TLabel;
    N21: TMenuItem;
    DBLookupComboBox1: TDBLookupComboBox;
    N22: TMenuItem;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    StatusBar1: TStatusBar;
    ApplicationEvents1: TApplicationEvents;
    N23: TMenuItem;
    Bevel1: TBevel;
    N24: TMenuItem;
    N11: TMenuItem;
    DBLookupComboBox2: TDBLookupComboBox;
    Label9: TLabel;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    DBCheckBoxEh1: TDBCheckBoxEh;
    Bevel2: TBevel;
    Label10: TLabel;
    N28: TMenuItem;
    N29: TMenuItem;
    Label11: TLabel;
    Label12: TLabel;
    N30: TMenuItem;
    kalendar: TMenuItem;
    Label13: TLabel;
    DBComboBoxEh1: TDBComboBoxEh;
    N31: TMenuItem;
    SpeedButton1: TSpeedButton;
    N32: TMenuItem;
    N33: TMenuItem;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    N34: TMenuItem;
    OpenDialog3: TOpenDialog;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure ButtonClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure DBEdit2Click(Sender: TObject);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit3Click(Sender: TObject);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit1DblClick(Sender: TObject);
    procedure labeltext1Click(Sender: TObject);
    procedure labeltext1Change(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure labeltext1Exit(Sender: TObject);
    procedure DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure DBGrid1Columns2OpenDropDownForm(Grid: TCustomDBGridEh;
      Column: TColumnEh; Button: TEditButtonEh; var DropDownForm: TCustomForm;
      DynParams: TDynVarsEh);
    procedure ComboBox1Change(Sender: TObject);
    procedure DBGrid2Columns2OpenDropDownForm(Grid: TCustomDBGridEh;
      Column: TColumnEh; Button: TEditButtonEh; var DropDownForm: TCustomForm;
      DynParams: TDynVarsEh);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid2TitleClick(Column: TColumnEh);
    procedure N20Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEditEh_chasiClick(Sender: TObject);
    procedure DBEditEh_chasiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEditEh_naladkaClick(Sender: TObject);
    procedure DBEditEh_naladkaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEditEh_normaClick(Sender: TObject);
    procedure DBEditEh_normaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N21Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure DBLookupComboBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid2Columns1UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Image2Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEvents1Hint(Sender: TObject);
    procedure LinkLabel1LinkClick(Sender: TObject; const Link: string;
      LinkType: TSysLinkType);
    procedure N24Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure kalendarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure N34Click(Sender: TObject);
  private
    { Private declarations }
  miHint : TMenuItemHint;

     procedure WMMenuSelect(var Msg: TWMMenuSelect) ; message WM_MENUSELECT;
  public
    { Public declarations }

  end;
 const
 A:array[1..12] of string=
('������',
'�������',
'����',
'������',
'���',
'����',
'����',
'������',
'��������',
'�������',
'������',
'�������');
var     myframe:tframe1;
  Form1: TForm1; flag,regbool:boolean;cat: OLEVariant;okrugl:real; pas:string;
 Procedure query(param:boolean);
 procedure  vrema();
 Function Get_C_Tom_Number(disk:string):string;
 function nezavershenka(mesaz:integer):real;
 function brak_det(mesaz:integer):real;
 function vipusk_zarplata(dat:integer):real;
 function EncryptEX(const InString: string; StartKey, MultKey, AddKey: Integer):
  string;

implementation

uses mod_dann, Detal, vipusk, About, Registrazia, nezaver, rekvisiti, Copy, prof,
  naladka, brigada, pas_bd, ostat, print_rasz, brak, vedomost, shabl;

{$R *.dfm}

function nezavershenka(mesaz:integer):real;
begin
result:=0;
mod_dann.DataModule1.ADOStoredProc_nezaversh_det_itog.Close;
mod_dann.DataModule1.ADOStoredProc_nezaversh_det_itog.Parameters[0].Value:=mesaz;
mod_dann.DataModule1.ADOStoredProc_nezaversh_det_itog.Open;
mod_dann.DataModule1.ADODataSet_rep_uzel_nezav.Close;
mod_dann.DataModule1.ADODataSet_rep_uzel_nezav.Parameters[0].Value:=mesaz;
mod_dann.DataModule1.ADODataSet_rep_uzel_nezav.open;
while not mod_dann.DataModule1.ADODataSet_rep_uzel_nezav.Eof  do
begin
result:=result+round(mod_dann.DataModule1.ADODataSet_rep_uzel_nezav.FieldByName('rasz').AsFloat/okrugl)*okrugl*mod_dann.DataModule1.ADODataSet_rep_uzel_nezav.FieldByName('sum-kol').AsInteger;
mod_dann.DataModule1.ADODataSet_rep_uzel_nezav.Next;
end;

 result:=result+mod_dann.DataModule1.ADOStoredProc_nezaversh_det_itog.FieldByName('Summa').AsFloat;
   end;

   function brak_det(mesaz:integer):real;
begin
result:=0;
mod_dann.DataModule1.ADOStoredProc_brak_det_itog.Close;
mod_dann.DataModule1.ADOStoredProc_brak_det_itog.Parameters[0].Value:=mesaz;
mod_dann.DataModule1.ADOStoredProc_brak_det_itog.Open;
mod_dann.DataModule1.ADODataSet_rep_uzel_brak.Close;
mod_dann.DataModule1.ADODataSet_rep_uzel_brak.Parameters[0].Value:=mesaz;
mod_dann.DataModule1.ADODataSet_rep_uzel_brak.open;
while not mod_dann.DataModule1.ADODataSet_rep_uzel_brak.Eof  do
begin
result:=result+round(mod_dann.DataModule1.ADODataSet_rep_uzel_brak.FieldByName('rasz').AsFloat/okrugl)*okrugl*mod_dann.DataModule1.ADODataSet_rep_uzel_brak.FieldByName('kol').AsInteger;
mod_dann.DataModule1.ADODataSet_rep_uzel_brak.Next;
end;

 result:=result+mod_dann.DataModule1.ADOStoredProc_brak_det_itog.FieldByName('Summa').AsFloat;
   end;


procedure TForm1.ButtonClick(Sender: TObject);
   begin
if combobox1.ItemIndex<>-1 then begin
 if not assigned(nalad) then
 nalad:=tnalad.Create(self);
 nalad.Showmodal;end
 else showmessage('�� ������ �����?');

 form1.N4Click(sender);
end;
 procedure vrema();
 begin
  if mod_dann.DataModule1.ADODataSet_norma.FieldByName('phakt').Value<>null then begin  form1.label12.caption:=inttostr(round(form1.DBGrid2.Columns[4].Footer.sumvalue/mod_dann.DataModule1.ADODataSet_norma.FieldByName('phakt').Value*100))+' %';if ((mod_dann.DataModule1.ADOTable_recvisit_dobavl.Locate('name_rec', 'PROC_MAX_VIR',[])) and (mod_dann.DataModule1.ADOTable_recvisit_dobavl.FieldByName('znach').Value<>'')) then begin if round(form1.DBGrid2.Columns[4].Footer.sumvalue/mod_dann.DataModule1.ADODataSet_norma.FieldByName('phakt').Value*100)>mod_dann.DataModule1.ADOTable_recvisit_dobavl.FieldByName('znach').AsInteger then form1.label12.Font.Color:=clred else form1.label12.Font.Color:=clgreen;end;end else begin form1.label12.Caption:='';form1.label12.Font.Color:=clblack;end;
 end;
  function StrToAscii(S: string): string;
var
  I, X: Integer;
  RS: string;
  CurChar: string;
begin
  Result := '';
  if Length(S) = 0 then
    Exit;
  X := 1;
  for I := 1 to Length(S) do
  begin
    CurChar := '#' + Inttostr(Ord(S[I]));
    Insert(CurChar, RS, X);
    X := X + Length(CurChar);
  end;
  Result := RS;
end;

 function Encrypt(const InString: string; StartKey, MultKey, AddKey: Integer):
  string;
var
  I: integer;
begin
  Result := '';
  for I := 1 to Length(InString) do
  begin
    Result := Result + CHAR(Byte(InString[I]) xor (StartKey shr 8));
    StartKey := (Byte(Result[I]) + StartKey) * MultKey + AddKey;
  end;
  end;

  function EncryptEX(const InString: string; StartKey, MultKey, AddKey: Integer):
  string;
begin
  Result := StrTOAscii(Encrypt(InString, StartKey, MultKey, AddKey));
end;

Function Get_C_Tom_Number(disk:string):string;
 var
 SerialNum : dword;
 a, b : dword;
 Buffer : array [0..255] of char;
 begin
 if GetVolumeInformation(pchar(disk), Buffer, SizeOf(Buffer),
  @SerialNum, a, b, nil, 0)=true then  serialnum:=serialnum*strtoint(inttostr(SerialNum)[1]);
  while serialnum>2147483647	do serialnum:=serialnum div 2;
  result:=inttostr(serialnum);
  end;

function vipusk_zarplata(dat:integer):real;
begin result:=0;
mod_dann.DataModule1.ADOquery2.Active:=false;
 mod_dann.DataModule1.ADOquery2.Parameters[0].Value:=dat;
mod_dann.DataModule1.ADOquery2.Active:=true;
mod_dann.DataModule1.ADOquery8.Active:=false;
mod_dann.DataModule1.ADOquery8.SQL.Clear;
mod_dann.DataModule1.ADOquery8.SQL.Add('SELECT Sum([Plus]) AS vir');
mod_dann.DataModule1.ADOquery8.SQL.Add('FROM rabotniki LEFT JOIN Korrectiv ON rabotniki.Cod=Korrectiv.Cod_rabotnika');
mod_dann.DataModule1.ADOquery8.SQL.Add('WHERE ((Korrectiv.Cod_dat)=:p)');
mod_dann.DataModule1.ADOquery8.Parameters[0].Value:=dat;
mod_dann.DataModule1.ADOquery8.Active:=true;
if mod_dann.DataModule1.ADOQuery2.FieldValues['expr1000']<>null then result:=mod_dann.DataModule1.ADOQuery2.FieldValues['expr1000'];
if mod_dann.DataModule1.ADOQuery8.FieldValues['vir']<>null then result:=result+mod_dann.DataModule1.ADOQuery8.FieldValues['vir'];
mod_dann.DataModule1.ADOquery8.Active:=false;
mod_dann.DataModule1.ADOquery8.SQL.Clear;
mod_dann.DataModule1.ADOquery8.SQL.Add('SELECT Sum([Minus]) AS vir');
mod_dann.DataModule1.ADOquery8.SQL.Add('FROM rabotniki LEFT JOIN Korrectiv ON rabotniki.Cod=Korrectiv.Cod_rabotnika');
mod_dann.DataModule1.ADOquery8.SQL.Add('WHERE ((Korrectiv.Cod_dat)=:p)');
mod_dann.DataModule1.ADOquery8.Parameters[0].Value:=dat;
mod_dann.DataModule1.ADOquery8.Active:=true;
if mod_dann.DataModule1.ADOQuery8.FieldValues['vir']<>null then result:=result-mod_dann.DataModule1.ADOQuery8.FieldValues['vir'];
result:=round(result/okrugl)*okrugl
end;




procedure TForm1.DBGrid1Columns2OpenDropDownForm(Grid: TCustomDBGridEh;
  Column: TColumnEh; Button: TEditButtonEh; var DropDownForm: TCustomForm;
  DynParams: TDynVarsEh);
begin
  mod_dann.DataModule1.ADOTable_detal.Locate('cod',mod_dann.DataModule1.ADOTable_zarpl.FieldByName('cod_detali').Value,[]);
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=VK_RETURN then
mod_dann.DataModule1.ADODataset_zarpl.Refresh
end;

procedure TForm1.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
dbedit1.SetFocus;
mod_dann.DataModule1.ADODataSet_zarplAfterOpen(mod_dann.DataModule1.ADODataSet_zarpl);
dbgrid2.SumList.RecalcAll;
vrema;
end;


procedure TForm1.DBGridEh1TitleClick(Column: TColumnEh);
begin
 if column=dbgrid2.Columns.Items[3] then begin
 mod_dann.DataModule1.ADOTable_detal.MasterFields:='cod_detali';
if not assigned(Form2) then begin
 form2:=tform2.Create(self);end;
 form2.Show;end
end;


procedure TForm1.DBLookupComboBox1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 DBLookupComboBox1.KeyValue := DBLookupComboBox1.ListSource.DataSet.FieldByName(DBLookupComboBox1.KeyField).Value;
end;

Procedure query(param:boolean);
procedure del_Q(tabl:Tadotable;name_table:string);
begin
tabl.Active:=false;
mod_dann.DataModule1.ADOQuery3.Close;
mod_dann.DataModule1.ADOQuery3.SQL.Clear;
mod_dann.DataModule1.ADOQuery3.SQL.Add('delete from '+name_table);
mod_dann.DataModule1.ADOQuery3.SQL.Add('where (cod_dat='+inttostr(zarpl.Form1.ComboBox1.ItemIndex+1)+')');
if not(param) then mod_dann.DataModule1.ADOQuery3.SQL.Add('and (cod_rabotnika=:cod)');
mod_dann.DataModule1.ADOQuery3.ExecSQL;
tabl.Active:=true;
end;

begin
del_Q(mod_dann.DataModule1.ADOTable_zarpl,'zarplata');
del_Q(mod_dann.DataModule1.ADOTable_Korrectiv,'Korrectiv');
del_Q(mod_dann.DataModule1.ADOTable_zarpl,'Norma');
mod_dann.DataModule1.ADOQuery_max_date.Active:=false;
mod_dann.DataModule1.ADOQuery_max_date.Active:=true;
zarpl.Form1.ComboBox1Change(form1);
end;

procedure TForm1.N4Click(Sender: TObject);
var i,y,m,day:word;d:tdatetime; F:TIniFile;
 s_zarpl:integer; str:string; bm:Tbookmark;
begin
if mod_dann.DataModule1.ADOTable_chasi.FieldByName('chas').Value=null then
if not inputquery('����� ������������� �������','����������, �������'+#13+#10+'���������� �����������'+#13+#10+'����� � ������ ������?',str) then exit else
begin mod_dann.DataModule1.ADOTable_chasi.Edit; mod_dann.DataModule1.ADOTable_chasi.FieldByName('chas').AsInteger:=strtoint(str);
mod_dann.DataModule1.ADOTable_chasi.FieldByName('cod_dat').AsInteger:=combobox1.ItemIndex+1;
mod_dann.DataModule1.ADOTable_chasi.Post;end;
s_zarpl:=0;
mod_dann.DataModule1.ADODataSet_proz_podnal.Active:=false;
mod_dann.DataModule1.ADODataSet_proz_podnal.Active:=true;
mod_dann.DataModule1.ADOquery2.Active:=false;
 mod_dann.DataModule1.ADOquery2.Parameters[0].Value:=combobox1.ItemIndex+1;
mod_dann.DataModule1.ADOquery2.Active:=true;
mod_dann.DataModule1.ADOquery8.Active:=false;
mod_dann.DataModule1.ADOquery8.SQL.Clear;
mod_dann.DataModule1.ADOquery8.SQL.Add('SELECT Sum([Plus]) AS vir');
mod_dann.DataModule1.ADOquery8.SQL.Add('FROM rabotniki LEFT JOIN Korrectiv ON rabotniki.Cod=Korrectiv.Cod_rabotnika');
mod_dann.DataModule1.ADOquery8.SQL.Add('WHERE ((Korrectiv.Cod_dat)=:p)');
mod_dann.DataModule1.ADOquery8.Parameters[0].Value:=combobox1.ItemIndex+1;
mod_dann.DataModule1.ADOquery8.Active:=true;
mod_dann.DataModule1.ADOquery9.Active:=false;
mod_dann.DataModule1.ADOquery9.Parameters[0].Value:=combobox1.ItemIndex+1;
mod_dann.DataModule1.ADOquery9.Active:=true;
if mod_dann.DataModule1.ADOQuery2.FieldValues['expr1000']<>null then s_zarpl:=mod_dann.DataModule1.ADOQuery2.FieldValues['expr1000'];
if mod_dann.DataModule1.ADOQuery8.FieldValues['vir']<>null then s_zarpl:=s_zarpl+mod_dann.DataModule1.ADOQuery8.FieldValues['vir'];
mod_dann.DataModule1.ADOquery8.Active:=false;
mod_dann.DataModule1.ADOquery8.SQL.Clear;
mod_dann.DataModule1.ADOquery8.SQL.Add('SELECT Sum([Minus]) AS vir');
mod_dann.DataModule1.ADOquery8.SQL.Add('FROM rabotniki LEFT JOIN Korrectiv ON rabotniki.Cod=Korrectiv.Cod_rabotnika');
mod_dann.DataModule1.ADOquery8.SQL.Add('WHERE ((Korrectiv.Cod_dat)=:p)');
mod_dann.DataModule1.ADOquery8.Parameters[0].Value:=combobox1.ItemIndex+1;
mod_dann.DataModule1.ADOquery8.Active:=true;
if mod_dann.DataModule1.ADOQuery8.FieldValues['vir']<>null then s_zarpl:=s_zarpl-mod_dann.DataModule1.ADOQuery8.FieldValues['vir'];

 mod_dann.DataModule1.ADOStoredProc_zarplata.Close;
mod_dann.DataModule1.ADOStoredProc_zarplata.Parameters.ParamByName('[:cod_dat]').Value:=combobox1.ItemIndex+1;
 mod_dann.DataModule1.ADOStoredProc_zarplata.Open;
 mod_dann.DataModule1.ADOStoredProc_zarplata_rasvernut.Close;
mod_dann.DataModule1.ADOStoredProc_zarplata_rasvernut.Parameters.ParamByName('[:cod_dat]').Value:=combobox1.ItemIndex+1;
 mod_dann.DataModule1.ADOStoredProc_zarplata_rasvernut.Open;
 mod_dann.DataModule1.ADOQuery_dobavlenie.Parameters.ParamByName('p').Value:=combobox1.ItemIndex+1;
 bm:=mod_dann.DataModule1.ADOTable_rabotn.GetBookmark;
 mod_dann.DataModule1.ADOTable_rabotn.Filtered:=true;
 mod_dann.DataModule1.ADOTable_rabotn.First;
 while not mod_dann.DataModule1.ADOTable_rabotn.Eof do  begin
 try
 mod_dann.DataModule1.ADOQuery_dobavlenie.ExecSQL;
 except
 end;
 mod_dann.DataModule1.ADOTable_rabotn.Next;
 end;
  mod_dann.DataModule1.ADOTable_rabotn.Filtered:=false;
  mod_dann.DataModule1.ADOTable_rabotn.GotoBookmark(bm);
  mod_dann.DataModule1.ADOTable_rabotn.FreeBookmark(bm);

 mod_dann.DataModule1.ADOdataset_norma.Refresh;

 mod_dann.DataModule1.ADOStoredProc_brig_zpr.Close;
  mod_dann.DataModule1.ADOStoredProc_brig_zpr.Parameters.ParamByName('[:cod_dat]').Value:=combobox1.ItemIndex+1;
  mod_dann.DataModule1.ADOStoredProc_brig_zpr.open;

mod_dann.DataModule1.ADODataSet_rep_naladka.Close;
mod_dann.DataModule1.ADODataSet_rep_naladka.Parameters.ParamByName('cod_dat').Value:=combobox1.ItemIndex+1;
 mod_dann.DataModule1.ADODataSet_rep_naladka.open;

decodedate(date,y,m,day);d:=encodedate(y,m,1);
  if day<25 then d:=incmonth(d,-1);
  F:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'zarplata.ini');
  mod_dann.DataModule1.frxReport1.Variables['data'] :=''''+ combobox1.Text+' '+inttostr(yearof(d))+'�.'+'''';

   for i:=2 to 15 do
       case i of
       4:if (mod_dann.DataModule1.ADOTable_recvisit_dobavl.Locate('name_rec',mod_dann.DataModule1.frxReport1.Variables.Items[i].Name,[loCaseInsensitive])) and (mod_dann.DataModule1.ADOTable_recvisit_dobavl.FieldByName('znach').Value<>null)
     then begin mod_dann.DataModule1.frxReport1.Variables.Items[i].Value :=mod_dann.DataModule1.ADOTable_recvisit_dobavl.FieldByName('znach').AsFloat*s_zarpl/100;
     mod_dann.DataModule1.frxReport1.Variables.Items[17].Value:=mod_dann.DataModule1.ADOTable_recvisit_dobavl.FieldByName('znach').AsFloat;
     end
      else begin mod_dann.DataModule1.frxReport1.Variables.Items[i].Value :=0;mod_dann.DataModule1.frxReport1.Variables.Items[17].Value:=0;
      end;
       5:if (mod_dann.DataModule1.ADOTable_recvisit_dobavl.Locate('name_rec',mod_dann.DataModule1.frxReport1.Variables.Items[i].Name,[loCaseInsensitive])) and (mod_dann.DataModule1.ADOTable_recvisit_dobavl.FieldByName('znach').Value<>null)
     then mod_dann.DataModule1.frxReport1.Variables.Items[i].Value :=mod_dann.DataModule1.ADOTable_recvisit_dobavl.FieldByName('znach').AsInteger
      else mod_dann.DataModule1.frxReport1.Variables.Items[i].Value :=0
      ELSE        if mod_dann.DataModule1.ADOTable_recvisit_dobavl.Locate('name_rec',mod_dann.DataModule1.frxReport1.Variables.Items[i].Name,[loCaseInsensitive])
      then mod_dann.DataModule1.frxReport1.Variables.Items[i].Value :=''''+mod_dann.DataModule1.ADOTable_recvisit_dobavl.FieldByName('znach').AsString+''''
      else mod_dann.DataModule1.frxReport1.Variables.Items[i].Value :=''''+''+'''';
       end;
        mod_dann.DataModule1.frxReport1.Variables.Items[16].Value :=okrugl;
  if combobox1.ItemIndex=11 then mod_dann.DataModule1.frxReport1.Variables['data_new'] :=''''+ a[1]+' �����.'+'''' else
  mod_dann.DataModule1.frxReport1.Variables['data_new'] :=''''+ a[combobox1.ItemIndex+2]+' �����.'+'''';



  F.Free;
mod_dann.DataModule1.frxReport1.ShowReport();
end;

procedure TForm1.N5Click(Sender: TObject);
begin
mod_dann.DataModule1.ADOstoredproc_mes_balans.Close;
mod_dann.DataModule1.ADOstoredproc_mes_balans.Parameters.ParamByName('[p]').Value:=combobox1.ItemIndex+1;
mod_dann.DataModule1.ADOstoredproc_mes_balans.open;
mod_dann.DataModule1.frxReport2.ShowReport();
end;

procedure TForm1.N1Click(Sender: TObject);
begin
mod_dann.DataModule1.ADOTable_detal.MasterFields:='';
 if not assigned(Form2) then begin
 form2:=tform2.Create(self);end;
 form2.Show;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
query(false);
end;

procedure TForm1.N8Click(Sender: TObject);
begin
if messagedlg('�� ������� � �������� ���� ������� �� ��������?',mtWarning, mbOKCancel, 0)=mrok then
query(true);
end;



procedure TForm1.N9Click(Sender: TObject);
var str:string;sum_vip, sum_btz:real;
begin   sum_vip:=0; sum_btz:=0;
mod_dann.DataModule1.ADOquery9.Active:=false;
mod_dann.DataModule1.ADOquery9.Parameters[0].Value:=combobox1.ItemIndex+1;
mod_dann.DataModule1.ADOquery9.Active:=true;
str:='�������� �������:                    *** '+floattostr(round(vipusk_zarplata(zarpl.Form1.ComboBox1.ItemIndex+1)/okrugl)*okrugl)+' ���. ***'+#10+#13+'_______________________________________________________'+#10+#13+'������  ��  �������:                           ';
if mod_dann.DataModule1.ADOQuery9.FieldValues['vip']<>null then begin sum_vip:=sum_vip+round(mod_dann.DataModule1.ADOQuery9.FieldValues['vip']/okrugl)*okrugl;str:=str+floattostr(round(mod_dann.DataModule1.ADOQuery9.FieldValues['vip']/okrugl)*okrugl)+' ���.';end;
str:=str+#10+#13+'������������ �������� ������:   ';
if mod_dann.DataModule1.ADOTable_vip_korr.FieldByName('korrectiv').Value<>null then begin sum_vip:=sum_vip+round(mod_dann.DataModule1.ADOTable_vip_korr.FieldByName('korrectiv').Value/okrugl)*okrugl;str:=str+floattostr(round(mod_dann.DataModule1.ADOTable_vip_korr.FieldByName('korrectiv').Value/okrugl)*okrugl)+' ���.';end;
str:=str+#10+#13+'������������ �������� ������:      ';if round(nezavershenka(ComboBox1.ItemIndex+1)/okrugl)*okrugl<>0 then begin sum_vip:=sum_vip+round(nezavershenka(ComboBox1.ItemIndex+1)/okrugl)*okrugl;str:=str+floattostr(round(nezavershenka(ComboBox1.ItemIndex+1)/okrugl)*okrugl)+' ���.';end;
str:=str+#10+#13+'����:                                                          ';if brak_det(ComboBox1.ItemIndex+1)<>0 then begin sum_vip:=sum_vip+round(brak_det(ComboBox1.ItemIndex+1)/okrugl)*okrugl;str:=str+floattostr(round(brak_det(ComboBox1.ItemIndex+1)/okrugl)*okrugl)+' ���.';end;
str:=str+#10+#13+'_______________________________________________________'+#10+#13;
str:=str+#10+#13+'����� ������:                              *** '+floattostr(sum_vip)+' ���. ***';
str:=str+#10+#13+'������ ���+������������:    *** ';if mod_dann.DataModule1.ADOTable_vip_korr.FieldByName('BTZ').Value<>null then sum_btz:=sum_btz+round(mod_dann.DataModule1.ADOTable_vip_korr.FieldByName('BTZ').Value/okrugl)*okrugl;
if round(nezavershenka(ComboBox1.ItemIndex+1)/okrugl)*okrugl<>0 then sum_btz:=sum_btz+round(nezavershenka(ComboBox1.ItemIndex+1)/okrugl)*okrugl;
str:=str+floattostr(round(sum_btz/okrugl)*okrugl)+' ���. ***';
str:=str+#10+#13+'=================================='+#10+#13;
str:=str+'���������:                                       *** '+floattostr(round((sum_vip-vipusk_zarplata(zarpl.Form1.ComboBox1.ItemIndex+1))/okrugl)*okrugl)+' ���. ***';
str:=str+#10+#13+'��������� ���:                               *** '+floattostr(round((sum_btz-vipusk_zarplata(zarpl.Form1.ComboBox1.ItemIndex+1))/okrugl)*okrugl)+' ���. ***';
 messagedlg(str ,mtinformation,[mbOK],0);
end;


procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
mod_dann.DataModule1.ADOQuery_vibor.Parameters.ParamByName('dat').Value:=combobox1.ItemIndex+1;
mod_dann.DataModule1.ADOQuery_vibor.Parameters.ParamByName('p').Value:=mod_dann.DataModule1.ADOTable_rabotn.FieldByName('cod').Value;
mod_dann.DataModule1.ADOQuery_vibor.ExecSQL;
mod_dann.DataModule1.ADODataSet_zarpl.close;
mod_dann.DataModule1.ADODataSet_zarpl.open
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
SpeedButton2.Visible:=false;
SpeedButton3.Visible:=true;
dbgrid2.Enabled:=false
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
SpeedButton3.Visible:=false;
SpeedButton2.Visible:=true;
dbgrid2.Enabled:=true
end;

procedure TForm1.N10Click(Sender: TObject);
begin
form1.Close
end;

procedure TForm1.N20Click(Sender: TObject);
var i,s:integer;cod_det_temp,zach_temp:integer;
  begin
mod_dann.DataModule1.ADOQuery_god_vipusk.Close;
mod_dann.DataModule1.ADOQuery_god_vipusk.Open;
mod_dann.DataModule1.ADOQuery_del.SQL.Clear;
mod_dann.DataModule1.ADOQuery_del.SQL.Add('delete * from temp');
mod_dann.DataModule1.ADOQuery_del.ExecSQL;
mod_dann.DataModule1.ADOTable_temp.Open;
for i:=1 to mod_dann.DataModule1.ADOQuery_god_vipusk.RecordCount-1  do
  begin
s:=mod_dann.DataModule1.ADOQuery_god_vipusk.FieldByName('Sum-Colichestvo').AsInteger+mod_dann.DataModule1.ADOQuery_god_vipusk.FieldByName('kol').AsInteger;
cod_det_temp:=mod_dann.DataModule1.ADOQuery_god_vipusk.FieldByName('detali.cod').Value;
zach_temp:=mod_dann.DataModule1.ADOQuery_god_vipusk.FieldByName('Zachod').Value;
mod_dann.DataModule1.ADOQuery_god_vipusk.Next;
if (cod_det_temp=mod_dann.DataModule1.ADOQuery_god_vipusk.FieldByName('detali.cod').Value) and (zach_temp=mod_dann.DataModule1.ADOQuery_god_vipusk.FieldByName('Zachod').Value) then
s:=s-mod_dann.DataModule1.ADOQuery_god_vipusk.FieldByName('Sum-Colichestvo').AsInteger
else begin mod_dann.DataModule1.ADOQuery_god_vipusk.Prior;s:=s-mod_dann.DataModule1.ADOQuery_god_vipusk.FieldByName('Sum-Vipusk').AsInteger;
mod_dann.DataModule1.ADOQuery_god_vipusk.next;
end;
mod_dann.DataModule1.ADOQuery_god_vipusk.Prior;



mod_dann.DataModule1.ADOtable_temp.Append;
mod_dann.DataModule1.ADOtable_temp.FieldByName('nezaw').Value:=s;

mod_dann.DataModule1.ADOTable_temp.Post;
mod_dann.DataModule1.ADOQuery_god_vipusk.Next;
  end;
s:=mod_dann.DataModule1.ADOQuery_god_vipusk.FieldByName('Sum-Colichestvo').AsInteger+mod_dann.DataModule1.ADOQuery_god_vipusk.FieldByName('kol').AsInteger-mod_dann.DataModule1.ADOQuery_god_vipusk.FieldByName('Sum-Vipusk').AsInteger;;
mod_dann.DataModule1.ADOtable_temp.Append;
mod_dann.DataModule1.ADOtable_temp.FieldByName('nezaw').Value:=s;

mod_dann.DataModule1.ADOTable_temp.Post;
mod_dann.DataModule1.ADOQuery_god_vipusk.Close;
mod_dann.DataModule1.ADOQuery_god_vipusk.Open;


mod_dann.DataModule1.frxReport_god_vipusk.ShowReport();
   end;

procedure TForm1.N21Click(Sender: TObject);
begin
 if not assigned(professia) then begin
 professia:=tprofessia.Create(self);end;
 professia.Show;
end;

procedure TForm1.N22Click(Sender: TObject);
begin
if not assigned(korrect_rasz) then begin
 korrect_rasz:=tkorrect_rasz.Create(self);end;
korrect_rasz.Show;
end;


procedure TForm1.N23Click(Sender: TObject);
begin
if combobox1.ItemIndex<>-1 then begin
 if not assigned(nalad) then
 nalad:=tnalad.Create(self);
 nalad.Show;end
 else showmessage('�� ������ �����?')
end;

procedure TForm1.N24Click(Sender: TObject);
begin
if not assigned(brig) then
 brig:=tbrig.Create(self);
 brig.Show;
end;

procedure TForm1.N25Click(Sender: TObject);
begin
if messagedlg('�� ������� � �������� ������ �� �������?',mtWarning, mbOKCancel, 0)=mrok then
begin
  mod_dann.DataModule1.ADOQuery_del.SQL.Clear;
  mod_dann.DataModule1.ADOQuery_del.SQL.Add('UPDATE norma set korr=null WHERE norma.[Cod_dat]='+inttostr(combobox1.ItemIndex+1));
  mod_dann.DataModule1.ADOQuery_del.ExecSQL;
end;
end;

procedure TForm1.N26Click(Sender: TObject);
procedure del_sql(name_tab:string);
begin
 mod_dann.DataModule1.ADOQuery_del.SQL.Clear;
  mod_dann.DataModule1.ADOQuery_del.SQL.Add('DELETE FROM '+name_tab+' WHERE Cod_dat='+inttostr(combobox1.ItemIndex+1));
  mod_dann.DataModule1.ADOQuery_del.ExecSQL;
end;
begin
if messagedlg('�� ������� � �������� ���� ������ �� ������� �����?',mtWarning, mbOKCancel, 0)=mrok then
begin
del_sql('Chasi');
del_sql('Korrectiv');
del_sql('nezavershenka');
del_sql('norma');
del_sql('Vip_korr');
del_sql('Vipusk');
del_sql('zarplata');
mod_dann.DataModule1.ADOTable_chasi.Close;
mod_dann.DataModule1.ADOTable_chasi.open;
mod_dann.DataModule1.ADOTable_vip_korr.Close;
mod_dann.DataModule1.ADOTable_vip_korr.Open;
combobox1.ItemIndex:=combobox1.ItemIndex-1;
combobox1.OnChange(sender)

end;
end;

procedure TForm1.N27Click(Sender: TObject);
begin
 if not assigned(ostatki) then
 ostatki:=tostatki.Create(self);
 ostatki.Show;
end;

procedure TForm1.N28Click(Sender: TObject);
begin
if not assigned(pr_rasz) then
 pr_rasz:=tpr_rasz.Create(self);
 pr_rasz.Show;
end;

procedure TForm1.N29Click(Sender: TObject);
begin
mod_dann.DataModule1.ADODataSet_print_rasz.Close;
mod_dann.DataModule1.ADODataSet_print_rasz.Open;
mod_dann.DataModule1.frxReport_rasz_print.ShowReport();
end;

procedure TForm1.N2Click(Sender: TObject);
begin
 if combobox1.ItemIndex<>-1 then begin
 if not assigned(Form3) then
 form3:=tform3.Create(self);
 form3.Show;end
 else showmessage('�� ������ �����?')
end;

 procedure TForm1.N30Click(Sender: TObject);
begin
if combobox1.ItemIndex<>-1 then begin
 if not assigned(brak_form) then
 brak_form:=tbrak_form.Create(self);
 brak_form.Show;end
 else showmessage('�� ������ �����?')
end;

procedure TForm1.N31Click(Sender: TObject);
begin
if not assigned(kalend) then
kalend:=tkalend.Create(self);
mod_dann.DataModule1.ADOStoredProc_KTU.Close;
mod_dann.DataModule1.ADOStoredProc_KTU.Parameters.ParamByName('[:cod_dat]').Value:=combobox1.ItemIndex+1;
mod_dann.DataModule1.ADOStoredProc_KTU.open;
kalend.Show;
end;

procedure TForm1.N32Click(Sender: TObject);
begin
if not assigned(shablon) then
shablon:=tshablon.Create(self);
shablon.show;
end;

procedure TForm1.N33Click(Sender: TObject);
begin
myFrame := tFrame1.Create(self);
myFrame.Parent := self;
if not mod_dann.DataModule1.ADOTable_napom.Locate('cod_dat',zarpl.Form1.ComboBox1.ItemIndex+1,[]) then mod_dann.DataModule1.ADOTable_napom.Insert;
end;
////////////////////////////////////////////////////////////////////////////
procedure TForm1.N34Click(Sender: TObject);
 type

TPFile = ^TFile; // ��������� �� ���������� ���� TStudent

// �������� ���� �������� ������

TFile = record
name:string;
next: TPFile;// ��������� �� ��������� ������� ������
end;
 var s:string;
 myLookup: Variant;
 FDConnection:TFDconnection;
 SQLiteQuery:Tfdquery;
 adotable:TADOtable;
 chosenDirectory : string;
 FindFile: TSearchRec;
 head,curr:TPFile;
   begin
   FDConnection:=TFDconnection.Create(nil);
     SQLiteQuery:=TfdQuery.Create(nil);
     adotable:=TADOtable.Create(nil);
     adotable.Connection:=mod_dann.DataModule1.ADOConnection1;
 if mod_dann.DataModule1.ADOTable_recvisit_dobavl.Locate('name_rec','BASE_PATH',[]) then
  if DirectoryExists(mod_dann.DataModule1.ADOTable_recvisit_dobavl.FieldByName('znach').AsString) then
     begin
   if FindFirst(mod_dann.DataModule1.ADOTable_recvisit_dobavl.FieldByName('znach').AsString+'\*.db', faAnyFile, FindFile)=0
   then
      begin
   new(curr); // �������� ������ ��� �������� ������
   curr^.name:=FindFile.Name;
              curr^.next:=head;
              head:=curr;
              while FindNext(FindFile)=0 do begin  //���� ������ ����� �� �����, ���� �� ��������� ������ ������
       new(curr); // �������� ������ ��� �������� ������
   curr^.name:=FindFile.Name;
              curr^.next:=head;
              head:=curr;
                                 end;
    FindClose(FindFile);
curr := head; // ��������� �� ������ ������� ������

         while curr <> NIL do
         begin
FDConnection.DriverName:='SQLite';
FDConnection.LoginPrompt:=false;
     FDConnection.Params.Database:=mod_dann.DataModule1.ADOTable_recvisit_dobavl.FieldByName('znach').AsString+'\'+curr^.name;
     FDConnection.connected:=true;
     case ComboBox1.ItemIndex of
     0..8:s:='SELECT zarplata.Cod_rabotnika, zarplata.Cod_raszenki, zarplata.Cod_detali, Sum(zarplata.Colichestvo) AS [sum] FROM zarplata WHERE (strftime('+#39+'%Y'+#39+',data)=strftime('+#39+'%Y'+#39+',date()) AND (strftime('+#39+'%m'+#39+',data)='+#39+'0'+inttostr(ComboBox1.ItemIndex+1)+#39+')) GROUP BY zarplata.Cod_rabotnika, zarplata.Cod_raszenki, zarplata.Cod_detali';
     9..10:s:='SELECT zarplata.Cod_rabotnika, zarplata.Cod_raszenki, zarplata.Cod_detali, Sum(zarplata.Colichestvo) AS [sum] FROM zarplata WHERE (strftime('+#39+'%Y'+#39+',data)=strftime('+#39+'%Y'+#39+',date()) AND (strftime('+#39+'%m'+#39+',data)='+#39+inttostr(ComboBox1.ItemIndex+1)+#39+')) GROUP BY zarplata.Cod_rabotnika, zarplata.Cod_raszenki, zarplata.Cod_detali'
     else s:='SELECT zarplata.Cod_rabotnika, zarplata.Cod_raszenki, zarplata.Cod_detali, Sum(zarplata.Colichestvo) AS [sum] FROM zarplata WHERE ((strftime('+#39+'%Y'+#39+',data)=strftime('+#39+'%Y'+#39+',date()) OR (strftime('+#39+'%Y'+#39+',data)=strftime('+#39+'%Y'+#39+',date('+#39+'now'+#39+','+#39+'-1 months'+#39+'))))  AND (strftime('+#39+'%m'+#39+',data)='+#39+inttostr(ComboBox1.ItemIndex+1)+#39+')) GROUP BY zarplata.Cod_rabotnika, zarplata.Cod_raszenki, zarplata.Cod_detali';
     end;
     adotable.TableName:='zarplata';
      SQLiteQuery.Connection:=fdConnection;
     SQLiteQuery.SQL.Clear;
     SQLiteQuery.SQL.Add(s);
     SQLiteQuery.Close;
     SQLiteQuery.Open;
     SQLiteQuery.First;
     if sqlitequery.RecordCount>0 then  begin
     myLookup := mod_dann.DataModule1.ADOTable_rabotn.Lookup('cod',SQLiteQuery.FieldByName('Cod_rabotnika').asinteger, 'Familia');
     while not SQLiteQuery.Eof  do
        begin
    adotable.Close;
    adotable.Open;
      if not(adotable.State=dsinsert) then adotable.insert;
    adotable.FieldByName('Cod_rabotnika').asinteger:=SQLiteQuery.FieldByName('Cod_rabotnika').asinteger;
    adotable.FieldByName('Cod_raszenki').asinteger:=SQLiteQuery.FieldByName('Cod_raszenki').asinteger;
    adotable.FieldByName('Cod_detali').asinteger:=SQLiteQuery.FieldByName('Cod_detali').asinteger;
    adotable.FieldByName('Cod_dat').Value:=ComboBox1.ItemIndex+1;
    adotable.FieldByName('Colichestvo').asinteger:=SQLiteQuery.FieldByName('sum').asinteger;
    adotable.Post;
     SQLiteQuery.Next;
        end;
        messagedlg('���� '+myLookup+' ������� �����������' ,mtinformation,[mbOK],0);
        createdir(mod_dann.DataModule1.ADOTable_recvisit_dobavl.FieldByName('znach').AsString+'\temp');
          fdConnection.connected:=false;
    moveFile(Pchar(mod_dann.DataModule1.ADOTable_recvisit_dobavl.FieldByName('znach').AsString+'\'+curr^.name),Pchar(mod_dann.DataModule1.ADOTable_recvisit_dobavl.FieldByName('znach').AsString+'\temp\temp_'+inttostr(combobox1.ItemIndex+1)+'_'+curr^.name));
                                        end
                                        else showmessage('��� ������� � ���� '+curr^.name+' �� �������� ������ ��� �����������!!!');


     curr:=curr^.next;
         end;

      mod_dann.DataModule1.ADODataSet_zarpl.Close;
      mod_dann.DataModule1.ADODataSet_zarpl.open;


      adotable.Destroy;
     SQLiteQuery.Destroy;
     fdConnection.Destroy
      end
      else showmessage('���� ��� �������� �� �������!!!');
     end
      else begin showmessage('������� �� ���������� ���� �� ����������!!!'+#13+#10+'�������� ���� � ����������!!!');
      if not assigned(recvisit) then
recvisit:=trecvisit.Create(self);
recvisit.show;
      end
      else begin
      showmessage('���� � �������� �� ����� � ����������!!!');
            if not assigned(recvisit) then
recvisit:=trecvisit.Create(self);
recvisit.show;
      end;
     end;




procedure TForm1.FormActivate(Sender: TObject);
var i,r:integer;db_name:string;F:TIniFile;
begin
db_name:=''; flag:=true;
mod_dann.DataModule1.ADOTable_shablon.MasterSource:=mod_dann.DataModule1.datasource1;
F:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'zarplata.ini');
r:=0;
for i:=1 to length(Get_C_Tom_Number('c:/')) do
r:=r+strtoint(Get_C_Tom_Number('c:/')[i]);
if encryptex(Get_C_Tom_Number('c:/'), strtoint(Get_C_Tom_Number('c:/')),length(Get_C_Tom_Number('c:/')), r)<>F.ReadString('REG','key','') then begin
form1.Caption:='��������-unregistered version';regbool:=false;end else begin regbool:=true;form1.Caption:='��������';end;
mainmenu1.Items.Items[2].enabled:=regbool;
dbgrid2.Columns[4].Visible:=regbool;
mainmenu1.Items.Items[4].enabled:=regbool;
if F.ReadString('DIR','startupDir','')<>'' then begin i:=length(F.ReadString('DIR','startupDir',''));
while F.ReadString('DIR','startupDir','')[i]<>'\' do begin db_name:=F.ReadString('DIR','startupDir','')[i]+db_name;i:=i-1;end;
form1.Caption:=form1.Caption+' ('+db_name+')'; end;
if ((F.ReadString('DIR','startupDir','')<>'') and (form1.Tag=0)) then begin
mod_dann.DataModule1.ADOConnection1.Connected:=false;
mod_dann.DataModule1.ADOConnection1.Close;
if not fileexists(F.ReadString('DIR','startupDir','')) then begin showmessage('�� ������� ���� ������. ������� ���� � ���� ������.');exit;   end;
mod_dann.DataModule1.ADOConnection1.ConnectionString:='DSN=��������; User ID=������� ������;DBQ='+F.ReadString('DIR','startupDir','')+';DriverId=25;FIL=MS Access;MaxBufferSize=2048;PageTimeout=5;UID=admin;';
try
mod_dann.DataModule1.ADOConnection1.LoginPrompt:=false;
mod_dann.DataModule1.ADOConnection1.Connected:=true;
except
mod_dann.DataModule1.ADOConnection1.LoginPrompt:=true;
mod_dann.DataModule1.ADOConnection1.Connected:=true;
end;

for i:=1 to 12 do combobox1.Items.Add(a[i]);
mod_dann.DataModule1.ADOQuery_max_date.SQL.Clear;
mod_dann.DataModule1.ADOQuery_max_date.SQL.Add('SELECT Max(zarplata.Cod_dat) AS [Max-Cod_dat] FROM zarplata');
mod_dann.DataModule1.ADOQuery_max_date.Active:=true;
i:=mod_dann.DataModule1.ADOQuery_max_dateMaxCod_dat.Value-1;
mod_dann.DataModule1.ADOQuery_max_date.SQL.Clear;
mod_dann.DataModule1.ADOQuery_max_date.SQL.Add('SELECT Max(Korrectiv.Cod_dat) AS [Max-Cod_dat] FROM Korrectiv');
mod_dann.DataModule1.ADOQuery_max_date.Active:=true;
if i>=mod_dann.DataModule1.ADOQuery_max_dateMaxCod_dat.Value-1 then
combobox1.ItemIndex:=i else combobox1.ItemIndex:=mod_dann.DataModule1.ADOQuery_max_dateMaxCod_dat.Value-1;
combobox1.Tag:=combobox1.ItemIndex;
mod_dann.DataModule1.ADOQuery_print_del.ExecSQL;
mod_dann.DataModule1.ADOTable_rabotn.Active:=true;
mod_dann.DataModule1.ADOTable_detal.Active:=true;
mod_dann.DataModule1.ADOTable_zarpl.Active:=true;
mod_dann.DataModule1.ADOTable_rasz.Active:=true;
mod_dann.DataModule1.ADOTable_nezav.Active:=true;
mod_dann.DataModule1.ADOTable_brak.Active:=true;
mod_dann.DataModule1.ADOTable_vipusk.Active:=true;
mod_dann.DataModule1.ADOTable_Korrectiv.Active:=true;
mod_dann.DataModule1.ADOTable_chasi.Active:=true;
mod_dann.DataModule1.ADOTable_vip_korr.Active:=true;
mod_dann.DataModule1.ADOTable_professia.Active:=true;
mod_dann.DataModule1.ADOTable_recvisit.Active:=true;
mod_dann.DataModule1.ADOTable_recvisit_dobavl.Active:=true;
mod_dann.DataModule1.ADOTable_print_rasc.Active:=true;
mod_dann.DataModule1.ADOQuery2.Active:=true;
mod_dann.DataModule1.ADOQuery5.Active:=true;
mod_dann.DataModule1.ADOTable_brigada.Active:=true;
mod_dann.DataModule1.ADOTable_shablon.Active:=true;
mod_dann.DataModule1.ADOTable_napom.Active:=true;
if ((mod_dann.DataModule1.ADOTable_recvisit_dobavl.Locate('name_rec','OKRUGL',[])) and (mod_dann.DataModule1.ADOTable_recvisit_dobavl.FieldByName('znach').Value<>'0') and (mod_dann.DataModule1.ADOTable_recvisit_dobavl.FieldByName('znach').Value<>null) and (mod_dann.DataModule1.ADOTable_recvisit_dobavl.FieldByName('znach').Value<>'')) then
okrugl:=mod_dann.DataModule1.ADOTable_recvisit_dobavl.FieldByName('znach').asfloat
else okrugl:=1/100;
combobox1.OnChange(sender);
if assigned(nezav)=true then nezav.FormActivate(nezav);
form1.Tag:=1;
end;
vrema;
F.Free;
end;
procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if assigned(nezav)=true then
nezav.Close;
if assigned(recvisit) then
recvisit.Close;
if assigned(ostatki) then
ostatki.Close;
if assigned(brak_form) then
brak_form.Close;
if assigned(form2) then
form2.Close;
if assigned(shablon)=true then
shablon.Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
miHint := TMenuItemHint.Create(self) ;
end;


procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Image1.Visible:=true;
Image2.Visible:=false;
Image3.Visible:=false;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
left:=2;
top:=2;
height:=414
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
if combobox1.ItemIndex<>11 then  begin
Image1.Visible:=false;
Image2.Visible:=true;
Image3.Visible:=false;
end else begin
  Image1.Visible:=false;
Image2.Visible:=false;
Image3.Visible:=true;
end;

end;

procedure TForm1.Image2Click(Sender: TObject);
begin
image2.Visible:=false; image1.Visible:=true;
if (mod_dann.DataModule1.ADODataSet_korrectiv.FieldByName('minus').Value<>null) and (mod_dann.DataModule1.ADODataSet_korrectiv.FieldByName('minus').AsCurrency<>0) then
begin
  if mod_dann.DataModule1.ADOTable_Korrectiv.Locate('Cod_rabotnika;Cod_dat',vararrayof([mod_dann.DataModule1.ADODataSet_korrectiv.FieldByName('Cod_rabotnika').Value,mod_dann.DataModule1.ADODataSet_korrectiv.FieldByName('Cod_dat').asinteger+1]),[])
  then begin mod_dann.DataModule1.ADOTable_Korrectiv.Edit; mod_dann.DataModule1.ADOTable_Korrectiv.FieldByName('Plus').Value:=mod_dann.DataModule1.ADODataSet_korrectiv.FieldByName('Minus').Value;
  end
  else begin mod_dann.DataModule1.ADOTable_Korrectiv.Append;mod_dann.DataModule1.ADOTable_Korrectiv.FieldByName('Cod_rabotnika').Value:=mod_dann.DataModule1.ADODataSet_korrectiv.FieldByName('Cod_rabotnika').Value;
             mod_dann.DataModule1.ADOTable_Korrectiv.FieldByName('Cod_dat').Value:=mod_dann.DataModule1.ADODataSet_korrectiv.FieldByName('Cod_dat').asinteger+1;
             mod_dann.DataModule1.ADOTable_Korrectiv.FieldByName('Plus').Value:=mod_dann.DataModule1.ADODataSet_korrectiv.FieldByName('Minus').Value;
  end;
  mod_dann.DataModule1.ADOTable_Korrectiv.Post;showmessage('����������� ������� ���������!');
end else showmessage('��� ������ ��� �����������')
end;



procedure TForm1.kalendarClick(Sender: TObject);
var kalendar:Tform;dat:Tcalendarview;
begin
kalendar:=TForm.Create(self);
kalendar.Caption:='���������';
kalendar.Width:=400;
kalendar.Height:=400;
kalendar.BorderStyle:=bsSizeable;
kalendar.Position:=podesktopcenter;
dat:=Tcalendarview.Create(kalendar);
dat.Parent:=kalendar;
dat.Align:=alclient;
dat.FirstDayOfWeek:=tdaysofweek.dwMonday;

kalendar.Showmodal;
end;

procedure TForm1.N11Click(Sender: TObject);
var F:TIniFile;
begin
F:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'zarplata.ini');
if opendialog1.Execute then begin F.WriteString('DIR','startupDir',opendialog1.FileName);  form1.Tag:=0;combobox1.Clear;  form1.FormActivate(form1);end;
F.Free;
end;

procedure TForm1.DBEdit2Click(Sender: TObject);
begin
dbedit2.SelectAll
end;

procedure TForm1.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=VK_RETURN) and ((mod_dann.DataModule1.ADOdataset_korrectiv.State=dsedit) or (mod_dann.DataModule1.ADOdataset_korrectiv.State=dsinsert)) then begin
dbedit2.SelectAll;
mod_dann.DataModule1.ADOdataset_korrectiv.FieldByName('cod_dat').Value:=combobox1.ItemIndex+1;
mod_dann.DataModule1.ADOdataset_korrectiv.Refresh
end;
end;

procedure TForm1.DBEdit3Click(Sender: TObject);
begin
dbedit3.SelectAll;
end;

procedure TForm1.DBEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=VK_RETURN) and ((mod_dann.DataModule1.ADOdataset_korrectiv.State=dsedit) or (mod_dann.DataModule1.ADOdataset_korrectiv.State=dsinsert)) then begin
dbedit3.SelectAll;
mod_dann.DataModule1.ADOdataset_korrectiv.FieldByName('cod_dat').Value:=combobox1.ItemIndex+1;
mod_dann.DataModule1.ADOdataset_korrectiv.Refresh
end;
end;



procedure TForm1.DBEditEh_naladkaClick(Sender: TObject);
begin
DBEditEh_naladka.SelectAll
end;



procedure TForm1.DBEditEh_naladkaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=VK_RETURN) then  begin if mod_dann.DataModule1.ADOTable_rabotn.State in [dsedit,dsinsert] then  mod_dann.DataModule1.ADOTable_rabotn.Post;
DBEditEh_naladka.SelectAll;
end;
end;

procedure TForm1.DBEditEh_normaClick(Sender: TObject);
begin
DBEditEh_norma.SelectAll
end;

procedure TForm1.DBEditEh_normaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=VK_RETURN) then  begin if mod_dann.DataModule1.ADOdataset_norma.State in [dsedit,dsinsert] then begin mod_dann.DataModule1.ADOdataset_norma.FieldByName('cod_dat').Value:=combobox1.ItemIndex+1; mod_dann.DataModule1.ADOdataset_norma.Post; end;
DBEditEh_norma.SelectAll;
end;
end;

procedure TForm1.DBEditEh_chasiClick(Sender: TObject);
begin
 DBEditEh_chasi.SelectAll
end;

procedure TForm1.DBEditEh_chasiKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=VK_RETURN) then  begin if mod_dann.DataModule1.ADOTable_chasi.State in [dsedit,dsinsert] then begin mod_dann.DataModule1.ADOTable_chasi.FieldByName('cod_dat').Value:=combobox1.ItemIndex+1; mod_dann.DataModule1.ADOTable_chasi.Post; end;
DBEditEh_chasi.SelectAll;
end;
end;

procedure TForm1.ApplicationEvents1Hint(Sender: TObject);
begin
 StatusBar1.SimpleText := 'App.OnHint : ' + Application.Hint;
end;

procedure TForm1.WMMenuSelect(var Msg: TWMMenuSelect) ;
var
   menuItem : TMenuItem;
   hSubMenu : HMENU;
begin
   inherited; // �� TCustomForm (�����������, ��� Application.Hint ��������)

   menuItem := nil;
   if (Msg.MenuFlag <> $FFFF) or (Msg.IDItem <> 0) then
   begin
     if Msg.MenuFlag and MF_POPUP = MF_POPUP then
     begin
       hSubMenu := GetSubMenu(Msg.Menu, Msg.IDItem) ;
       menuItem := Self.Menu.FindItem(hSubMenu, fkHandle) ;
     end
     else
     begin
       menuItem := Self.Menu.FindItem(Msg.IDItem, fkCommand) ;
     end;
   end;

   miHint.DoActivateHint(menuItem) ;
end; {*WMMenuSelect*}

{ TMenuItemHint }
constructor TMenuItemHint.Create(AOwner: TComponent) ;
begin
   inherited;

   showTimer := TTimer.Create(self) ;
   showTimer.Interval := Application.HintPause;

   hideTimer := TTimer.Create(self) ;
   hideTimer.Interval := Application.HintHidePause;
end; (*Create*)

destructor TMenuItemHint.Destroy;
begin
   hideTimer.OnTimer := nil;
   showTimer.OnTimer := nil;
   self.ReleaseHandle;
   inherited;
end; (*Destroy*)

procedure TMenuItemHint.DoActivateHint(menuItem: TMenuItem) ;
begin
   // ����� ������� "������" ���� ���������
   hideTime(self) ;

   if (menuItem = nil) or (menuItem.Hint = '') then
   begin
     activeMenuItem := nil;
     Exit;
   end;

   activeMenuItem := menuItem;

   showTimer.OnTimer := ShowTime;
   hideTimer.OnTimer := HideTime;
end; (*DoActivateHint*)

procedure TMenuItemHint.ShowTime(Sender: TObject) ;
var
   r : TRect;
   wdth : integer;
   hght : integer;
begin
   if activeMenuItem <> nil then
   begin
     // ������� � �������
     wdth := Canvas.TextWidth(activeMenuItem.Hint) ;
     hght := Canvas.TextHeight(activeMenuItem.Hint) ;

     r.Left := Mouse.CursorPos.X + 16;
     r.Top := Mouse.CursorPos.Y + 16;
     r.Right := r.Left + wdth + 6;
     r.Bottom := r.Top + hght + 4;

     ActivateHint(r,activeMenuItem.Hint) ;
   end;

   showTimer.OnTimer := nil;
end; {*ShowTime*}

procedure TMenuItemHint.HideTime(Sender: TObject) ;
begin
   // �������� (���������) ���� ���������
   self.ReleaseHandle;
   hideTimer.OnTimer := nil;
end; {*HideTime*}

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
if combobox1.ItemIndex=-1 then begin n3.Enabled:=false;dbgrid2.Enabled:=false;image2.enabled:=false;dbedit2.Enabled:=false;dbedit3.Enabled:=false;dbediteh_chasi.Enabled:=false;dbediteh_norma.Enabled:=false;end
else begin n3.Enabled:=regbool;image2.enabled:=true;dbgrid2.Enabled:=true;dbedit2.Enabled:=true;dbediteh_norma.Enabled:=true;dbedit3.Enabled:=true;dbediteh_chasi.Enabled:=true;end;
if combobox1.ItemIndex=11 then  image2.enabled:=false else image2.enabled:=true;
try
if (combobox1.ItemIndex=0) and (assigned(vipusk.form3))
then
vipusk.form3.Image2.enabled:=false else vipusk.form3.Image2.enabled:=true;
  except

end;
if combobox1.ItemIndex>=combobox1.Tag then
begin
combobox1.Tag:=combobox1.ItemIndex;
speedbutton3.Visible:=false;
speedbutton2.Visible:=true;
speedbutton3.OnClick(sender);
end else
begin
speedbutton3.Visible:=true;
speedbutton2.Visible:=false;
speedbutton2.OnClick(sender);
end;

mod_dann.DataModule1.ADODataSet_zarpl.Active:=false;
mod_dann.DataModule1.ADODataSet_zarpl.Parameters.ParamByName('p').Value:=combobox1.ItemIndex+1;
mod_dann.DataModule1.ADODataSet_zarpl.Active:=true;

mod_dann.DataModule1.ADODataSet_korrectiv.Active:=false;
mod_dann.DataModule1.ADODataSet_korrectiv.Parameters.ParamByName('p').Value:=combobox1.ItemIndex+1;
mod_dann.DataModule1.ADODataSet_korrectiv.Active:=true;

mod_dann.DataModule1.ADODataSet_norma.Active:=false;
mod_dann.DataModule1.ADODataSet_norma.Parameters.ParamByName('p').Value:=combobox1.ItemIndex+1;
mod_dann.DataModule1.ADODataSet_norma.Active:=true;

mod_dann.DataModule1.ADOTable_vip_korr.Filter:='cod_dat='+inttostr(combobox1.ItemIndex+1);
mod_dann.DataModule1.ADOTable_vip_korr.Filtered:=true;
vipusk.update_query ;
mod_dann.DataModule1.ADOTable_nezav.Filter:='cod_dat='+inttostr(combobox1.ItemIndex+1);
mod_dann.DataModule1.ADOTable_nezav.Filtered:=true;
mod_dann.DataModule1.ADOTable_brak.Filter:='cod_dat='+inttostr(combobox1.ItemIndex+1);
mod_dann.DataModule1.ADOTable_brak.Filtered:=true;
if assigned(brak.brak_form) then brak_form.OnActivate(sender);

if assigned(nezav) then begin
nezav.LabeledEdit1.Text:=floattostr(zarpl.nezavershenka(ComboBox1.ItemIndex+1));
nezav.labelededit2.Text:=floattostr(okrugl*round((mod_dann.DataModule1.ADOTable_vip_korr.FieldByName('BTZ').asfloat+zarpl.nezavershenka(zarpl.Form1.ComboBox1.ItemIndex+1)-zarpl.vipusk_zarplata(zarpl.Form1.ComboBox1.ItemIndex+1))/okrugl));
 end;
if assigned(vipusk.form3) and vipusk.form3.Visible then vipusk.form3.DBGridEh1DblClick(sender);
mod_dann.DataModule1.ADOTable_chasi.Filter:='cod_dat='+inttostr(combobox1.ItemIndex+1);
mod_dann.DataModule1.ADOTable_chasi.Filtered:=true;
if assigned(kalend) and kalend.Visible then begin
kalend.Hide;
n31click(self);
end;



end;

procedure TForm1.DBEdit1DblClick(Sender: TObject);
begin
mod_dann.DataModule1.ADOTable_rabotn.Locate('familia','�������',[loPartialKey]);
combobox1.OnChange(sender);
vrema;
end;

procedure TForm1.labeltext1Click(Sender: TObject);
begin
LoadKeyboardLayout('00000419',KLF_ACTIVATE);
labeltext1.Text:=''
end;

procedure TForm1.labeltext1Change(Sender: TObject);
begin
if labeltext1.Text<>'' then
begin
datamodule1.ADOTable_rabotn.Locate('Familia',labeltext1.Text,[locaseinsensitive, lopartialkey]);
dbgrid2.SumList.RecalcAll;vrema;
end;
end;

procedure TForm1.N12Click(Sender: TObject);
begin
 if not assigned(Form7) then
 form7:=tform7.Create(self);
 form7.ShowModal
end;

procedure TForm1.DBEdit1Exit(Sender: TObject);
begin
if (mod_dann.DataModule1.ADOTable_rabotn.State=dsedit) or (mod_dann.DataModule1.ADOTable_rabotn.State=dsinsert) then begin mod_dann.DataModule1.ADOTable_rabotn.Post;mod_dann.DataModule1.ADOTable_rabotn.Refresh;end;
end;


procedure TForm1.N14Click(Sender: TObject);
procedure zapros(name_rec,rus:string);
var ss:string;
begin
  ADOQuery1.SQL.Clear;
ADOQuery1.SQL.Add('insert into recvisiti_dobavl (name_rec,rus) in '''+savedialog1.FileName+'''  values ('''+name_rec+''','''+rus+''')');
ADOQuery1.ExecSQL;
end;
var F:TIniFile;s:string;d:tdatetime;y,m,day:word;i:integer;
begin
decodedate(date,y,m,day);d:=encodedate(y,m,1);
  if day<25 then d:=incmonth(d,-1);
  savedialog1.FileName:='������_'+inttostr(yearof(d));
if  savedialog1.Execute then
if not FileExists(savedialog1.FileName) then
 begin
 cat := CreateOleObject('ADOX.Catalog');
 cat.Create('Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + savedialog1.FileName + ';');
 cat := NULL; AdoQuery1.SQL.Clear;
adoquery1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + savedialog1.FileName + ';';
adoQuery1.SQL.Add('Create Table detali(Cod counter PRIMARY KEY , cod_brig int, Detal varchar(30) , uzel logical, photo OLEOBJECT )');
AdoQuery1.ExecSQL;
AdoQuery1.SQL.Clear;
adoQuery1.SQL.Add('Create Table rabotniki(Cod counter PRIMARY KEY , Cod_professia int, cod_brig int, Familia varchar(20), tab int, proz_nal float, podnal logical, razrad int)');
AdoQuery1.ExecSQL;
AdoQuery1.SQL.Clear;
adoQuery1.SQL.Add('ALTER TABLE rabotniki ADD CONSTRAINT Familia UNIQUE (Familia)') ;
AdoQuery1.ExecSQL;
AdoQuery1.SQL.Clear;
adoQuery1.SQL.Add('Create Table Korrectiv(Cod counter PRIMARY KEY , Plus float, Minus float, Cod_rabotnika int, Cod_dat int)');
AdoQuery1.ExecSQL;
AdoQuery1.SQL.Clear;
adoQuery1.SQL.Add('Create Table raszenki(Cod counter PRIMARY KEY , Cod_detali int, Nomer_operazii varchar(50), Raszenka float, vrema float, Poasnenie varchar(30), Zachod int, Print logical )');
AdoQuery1.ExecSQL;
AdoQuery1.SQL.Clear;
adoQuery1.SQL.Add('Create Table Vip_korr(Cod counter PRIMARY KEY , korrectiv float, BTZ float, Cod_dat int )');
AdoQuery1.ExecSQL;
AdoQuery1.SQL.Clear;
adoQuery1.SQL.Add('Create Table Vipusk(Cod counter PRIMARY KEY , Cod_detali int, Cod_dat int, Cod_zachod int, Vipusk int )');
AdoQuery1.ExecSQL;
AdoQuery1.SQL.Clear;
adoQuery1.SQL.Add('ALTER TABLE Vipusk ADD CONSTRAINT uniq UNIQUE (Cod_detali, Cod_zachod, Cod_dat)') ;
AdoQuery1.ExecSQL;
AdoQuery1.SQL.Clear;
adoQuery1.SQL.Add('Create Table zarplata(Cod counter PRIMARY KEY , Cod_rabotnika int, Cod_raszenki int, Cod_detali int, Cod_dat int, Colichestvo int )');
AdoQuery1.ExecSQL;
AdoQuery1.SQL.Clear;
adoQuery1.SQL.Add('Create Table nezavershenka(Cod counter PRIMARY KEY , Cod_det int, Cod_oper int, Cod_dat int, kol int )');
AdoQuery1.ExecSQL;
AdoQuery1.SQL.Clear;
adoQuery1.SQL.Add('Create Table brak(Cod counter PRIMARY KEY , Cod_det int, Cod_oper int, Cod_dat int, kol int )');
AdoQuery1.ExecSQL;
AdoQuery1.SQL.Clear;
adoQuery1.SQL.Add('Create Table recvisiti(Cod counter PRIMARY KEY , dolshnost varchar(30), familia varchar(30) )');
AdoQuery1.ExecSQL;
AdoQuery1.SQL.Clear;
adoQuery1.SQL.Add('Create Table recvisiti_dobavl(Cod counter PRIMARY KEY , name_rec varchar(30), rus varchar(30), znach varchar(100) )');
AdoQuery1.ExecSQL;
AdoQuery1.SQL.Clear;
adoQuery1.SQL.Add('Create Table brigada(Cod counter PRIMARY KEY , Name_brig varchar(15))');
AdoQuery1.ExecSQL;
AdoQuery1.SQL.Clear;
adoQuery1.SQL.Add('Create Table ostatki(Cod counter PRIMARY KEY , Cod_det int, Cod_oper int, kol int )');
AdoQuery1.ExecSQL;
AdoQuery1.SQL.Clear;
adoQuery1.SQL.Add('ALTER TABLE ostatki ADD CONSTRAINT ind UNIQUE (Cod_det, Cod_oper)') ;
AdoQuery1.ExecSQL;
AdoQuery1.SQL.Clear;
adoQuery1.SQL.Add('Create Table uzel(Cod counter PRIMARY KEY, Cod_uzla int, Cod_det int, kol_vo int )');
AdoQuery1.ExecSQL;
AdoQuery1.SQL.Clear;
adoQuery1.SQL.Add('Create Table temp(Cod_det int, Cod_oper int, nezaw int )');
AdoQuery1.ExecSQL;
AdoQuery1.SQL.Clear;
adoQuery1.SQL.Add('Create Table print_raszenka(Cod counter PRIMARY KEY, cod_rab int, Cod_det int, cod_rasz int )');
AdoQuery1.ExecSQL;
AdoQuery1.SQL.Clear;
adoQuery1.SQL.Add('Create Table shablon(Cod counter PRIMARY KEY, cod_rabotn int, Cod_detali int, cod_rascenki int )');
AdoQuery1.ExecSQL;
AdoQuery1.SQL.Clear;
AdoQuery1.SQL.Add('Create Table memory(Cod counter PRIMARY KEY, cod_dat int, poasnenie varchar(255))');
AdoQuery1.ExecSQL;
AdoQuery1.SQL.Clear;
s:='Create Table koephizient(Cod counter PRIMARY KEY, cod_rabotn int, Cod_dat int';
for i:=1 to 31 do s:=s+', '+inttostr(i)+' varchar(10)';s:=s+');';
adoQuery1.SQL.Add(s);
AdoQuery1.ExecSQL;
AdoQuery1.SQL.Clear;
adoQuery1.SQL.Add('ALTER TABLE koephizient ADD CONSTRAINT uniq UNIQUE (Cod_rabotn, Cod_dat)') ;
AdoQuery1.ExecSQL;
AdoQuery1.SQL.Clear;
adoQuery1.SQL.Add('ALTER TABLE print_raszenka ADD CONSTRAINT uniq UNIQUE (Cod_rab, Cod_det, cod_rasz)') ;
AdoQuery1.ExecSQL;
zapros('ZECH','���');
zapros('UCHASTOK','�������');
zapros('BRIGADA','�������');
zapros('UCH','����������� �������');
zapros('RESH','�������');
zapros('RABOCH','������� � �������');
zapros('SOVET','� ������ �������');
zapros('PRIS','��������������');
zapros('DOKL','����������');
zapros('VIST','���������');
zapros('BRIGADIR','��������');
zapros('NALADKA','������� �� �������');
zapros('NORMA','����� ��������� �� 8 �.');
zapros('OKRUGL','��������� �������� ��');
zapros('OKR_RASC','��������� �������� ��');
zapros('PROC_MAX_VIR','������� ������������ ���������');
AdoQuery1.SQL.Clear;
adoQuery1.SQL.Add('Create Table chasi(Cod counter PRIMARY KEY , Cod_dat int, chas int )');
AdoQuery1.ExecSQL;
AdoQuery1.SQL.Clear;
adoQuery1.SQL.Add('Create Table norma(Cod counter PRIMARY KEY , Cod_rabotnika int, Cod_dat int, phakt int, korr float )');
AdoQuery1.ExecSQL;
AdoQuery1.SQL.Clear;
adoQuery1.SQL.Add('ALTER TABLE norma ADD CONSTRAINT uniq UNIQUE (Cod_rabotnika, Cod_dat)') ;
AdoQuery1.ExecSQL;
AdoQuery1.SQL.Clear;
adoQuery1.SQL.Add('Create Table professia(Cod counter PRIMARY KEY , Name_prof varchar(30), kod_prof int )');
AdoQuery1.ExecSQL;

F:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'zarplata.ini');
F.WriteString('DIR','startupDir',savedialog1.FileName);
form1.Tag:=0;
form1.FormActivate(form1);
F.Free;

if n14.Tag=1 then begin pas:='';
mod_dann.DataModule1.ADOQuery11.ParamCheck:=false;
mod_dann.DataModule1.ADOQuery11.SQL.Clear;
mod_dann.DataModule1.ADOQuery11.SQL.Add('select * From detali in '''' [MS Access;DATABASE='+opendialog2.FileName+';]');

    try
mod_dann.DataModule1.ADOQuery11.ExecSQL;
    except
if not assigned(passw_bd) then
 passw_bd:=tpassw_bd.Create(self);
 passw_bd.ShowModal;
 if pas='' then exit;
    end;

  if form_copy.RadioGroup_detal.ItemIndex=1 then begin mod_dann.DataModule1.ADOQuery11.SQL.Clear;
  if pas<>'' then mod_dann.DataModule1.ADOQuery11.SQL.Add('insert into detali in '''+savedialog1.FileName+''' select * From detali in '''' [MS Access;DATABASE='+opendialog2.FileName+';PWD='+pas+']')
  else mod_dann.DataModule1.ADOQuery11.SQL.Add('insert into detali in '''+savedialog1.FileName+''' select * From detali in '''' [MS Access;DATABASE='+opendialog2.FileName+';]');
mod_dann.DataModule1.ADOQuery11.ExecSQL;
mod_dann.DataModule1.ADOTable_detal.Close; mod_dann.DataModule1.ADOTable_detal.open;
  end;
  if form_copy.RadioGroup_uzel.ItemIndex=1 then begin mod_dann.DataModule1.ADOQuery11.SQL.Clear;
  if pas<>'' then mod_dann.DataModule1.ADOQuery11.SQL.Add('insert into uzel in '''+savedialog1.FileName+''' select * From uzel in '''' [MS Access;DATABASE='+opendialog2.FileName+';PWD='+pas+']')
  else mod_dann.DataModule1.ADOQuery11.SQL.Add('insert into uzel in '''+savedialog1.FileName+''' select * From uzel in '''' [MS Access;DATABASE='+opendialog2.FileName+';]');
mod_dann.DataModule1.ADOQuery11.ExecSQL;
mod_dann.DataModule1.ADOTable_uzel.Close; mod_dann.DataModule1.ADOTable_uzel.open;
  end;
  if form_copy.RadioGroup_rabotnik.ItemIndex=1 then begin mod_dann.DataModule1.ADOQuery11.SQL.Clear;
if pas<>'' then mod_dann.DataModule1.ADOQuery11.SQL.Add('insert into rabotniki in '''+savedialog1.FileName+''' select * From rabotniki in '''' [MS Access;DATABASE='+opendialog2.FileName+';PWD='+pas+']')
  else mod_dann.DataModule1.ADOQuery11.SQL.Add('insert into rabotniki in '''+savedialog1.FileName+''' select * From rabotniki in '''' [MS Access;DATABASE='+opendialog2.FileName+';]');
mod_dann.DataModule1.ADOQuery11.ExecSQL; mod_dann.DataModule1.ADOTable_rabotn.Close; mod_dann.DataModule1.ADOTable_rabotn.open;
mod_dann.DataModule1.ADOQuery11.SQL.Clear;
if pas<>'' then mod_dann.DataModule1.ADOQuery11.SQL.Add('insert into professia in '''+savedialog1.FileName+''' select * From professia in '''' [MS Access;DATABASE='+opendialog2.FileName+';PWD='+pas+']')
  else mod_dann.DataModule1.ADOQuery11.SQL.Add('insert into professia in '''+savedialog1.FileName+''' select * From professia in '''' [MS Access;DATABASE='+opendialog2.FileName+';]');
mod_dann.DataModule1.ADOQuery11.ExecSQL; mod_dann.DataModule1.ADOTable_professia.Close; mod_dann.DataModule1.ADOTable_professia.open;
  end;
  if form_copy.RadioGroup_raszenka.ItemIndex=1 then begin mod_dann.DataModule1.ADOQuery11.SQL.Clear;
if pas<>'' then mod_dann.DataModule1.ADOQuery11.SQL.Add('insert into raszenki in '''+savedialog1.FileName+''' select * From raszenki in '''' [MS Access;DATABASE='+opendialog2.FileName+';PWD='+pas+']')
  else mod_dann.DataModule1.ADOQuery11.SQL.Add('insert into raszenki in '''+savedialog1.FileName+''' select * From raszenki in '''' [MS Access;DATABASE='+opendialog2.FileName+';]');
mod_dann.DataModule1.ADOQuery11.ExecSQL; mod_dann.DataModule1.ADOTable_rasz.Close; mod_dann.DataModule1.ADOTable_rasz.open;
 end;
  if form_copy.RadioGroup_brigada.ItemIndex=1 then begin mod_dann.DataModule1.ADOQuery11.SQL.Clear;
if pas<>'' then mod_dann.DataModule1.ADOQuery11.SQL.Add('insert into brigada in '''+savedialog1.FileName+''' select * From brigada in '''' [MS Access;DATABASE='+opendialog2.FileName+';PWD='+pas+']')
  else mod_dann.DataModule1.ADOQuery11.SQL.Add('insert into brigada in '''+savedialog1.FileName+''' select * From brigada in '''' [MS Access;DATABASE='+opendialog2.FileName+';]');
mod_dann.DataModule1.ADOQuery11.ExecSQL; mod_dann.DataModule1.ADOTable_brigada.Close; mod_dann.DataModule1.ADOTable_brigada.open;
 end;
   if form_copy.RadioGroup_shabloni.ItemIndex=1 then begin mod_dann.DataModule1.ADOQuery11.SQL.Clear;
if pas<>'' then mod_dann.DataModule1.ADOQuery11.SQL.Add('insert into shablon in '''+savedialog1.FileName+''' select * From shablon in '''' [MS Access;DATABASE='+opendialog2.FileName+';PWD='+pas+']')
  else mod_dann.DataModule1.ADOQuery11.SQL.Add('insert into shablon in '''+savedialog1.FileName+''' select * From shablon in '''' [MS Access;DATABASE='+opendialog2.FileName+';]');
mod_dann.DataModule1.ADOQuery11.ExecSQL; mod_dann.DataModule1.ADOTable_shablon.Close; mod_dann.DataModule1.ADOTable_shablon.open;
 end;
  if form_copy.RadioGroup_recvisiti.ItemIndex=1 then begin mod_dann.DataModule1.ADOQuery11.SQL.Clear;
if pas<>'' then mod_dann.DataModule1.ADOQuery11.SQL.Add('insert into recvisiti in '''+savedialog1.FileName+''' select * From recvisiti in '''' [MS Access;DATABASE='+opendialog2.FileName+';PWD='+pas+']')
  else mod_dann.DataModule1.ADOQuery11.SQL.Add('insert into recvisiti in '''+savedialog1.FileName+''' select * From recvisiti in '''' [MS Access;DATABASE='+opendialog2.FileName+';]');
mod_dann.DataModule1.ADOQuery11.ExecSQL; mod_dann.DataModule1.ADOTable_recvisit.Close; mod_dann.DataModule1.ADOTable_recvisit.open;
mod_dann.DataModule1.ADOQuery11.SQL.Clear;


mod_dann.DataModule1.ADOQuery11.SQL.Add('delete from recvisiti_dobavl in '''+savedialog1.FileName+'''');mod_dann.DataModule1.ADOQuery11.ExecSQL;mod_dann.DataModule1.ADOQuery11.SQL.Clear;
if pas<>'' then mod_dann.DataModule1.ADOQuery11.SQL.Add('insert into recvisiti_dobavl in '''+savedialog1.FileName+''' select * From recvisiti_dobavl in '''' [MS Access;DATABASE='+opendialog2.FileName+';PWD='+pas+']')
  else mod_dann.DataModule1.ADOQuery11.SQL.Add('insert into recvisiti_dobavl in '''+savedialog1.FileName+''' select * From recvisiti_dobavl in '''' [MS Access;DATABASE='+opendialog2.FileName+';]');
mod_dann.DataModule1.ADOQuery11.ExecSQL; mod_dann.DataModule1.ADOTable_recvisit_dobavl.Close; mod_dann.DataModule1.ADOTable_recvisit_dobavl.open;
  end;

                end;
s:='CREATE VIEW ekonomia AS SELECT Sum(([znach]*[itog_sum]*[proz_nal]/10000)*([chas]-IIf([phakt] Is Not Null,[phakt],0))/[chas]) AS ekon, Sum(norma.phakt) AS [Sum-phakt], Itogi_dla_zpr.Cod, Chasi.Cod_dat';
s:=s+' FROM recvisiti_dobavl, Chasi INNER JOIN (Itogi_dla_zpr INNER JOIN (norma INNER JOIN rabotniki ON norma.Cod_rabotnika = rabotniki.Cod) ON Itogi_dla_zpr.Cod = rabotniki.cod_brig) ON Chasi.Cod_dat = norma.Cod_dat';
s:=s+' WHERE (((rabotniki.proz_nal) Is Not Null And (rabotniki.proz_nal)<>0) AND ((recvisiti_dobavl.name_rec)='''+'NALADKA'+''') AND ((Itogi_dla_zpr.Itog_sum) Is Not Null) AND ((rabotniki.podnal)=False))';
s:=s+' GROUP BY Itogi_dla_zpr.Cod, Chasi.Cod_dat HAVING (((Chasi.Cod_dat)=[:cod_dat]));';
mod_dann.DataModule1.ADOConnection1.Execute(s);

s:='CREATE VIEW nezaversh AS SELECT raszenki.Cod_detali, raszenki.Zachod, raszenki.Nomer_operazii, raszenki_1.Raszenka, Sum([nezavershenka]![kol]) AS [sum-kol], [Sum-kol]*[raszenki_1]![Raszenka] AS ���������1';
s:=s+' FROM (raszenki AS raszenki_1 INNER JOIN nezavershenka ON raszenki_1.Cod_detali = nezavershenka.Cod_det) INNER JOIN raszenki ON (raszenki_1.Zachod = raszenki.Zachod) AND (nezavershenka.Cod_oper = raszenki.Cod)';
s:=s+' WHERE (((raszenki_1.Nomer_operazii)<=[raszenki]![Nomer_operazii]) AND ((nezavershenka.Cod_dat)=[p])) GROUP BY raszenki.Cod_detali, raszenki.Zachod, raszenki.Nomer_operazii, raszenki_1.Raszenka;';
mod_dann.DataModule1.ADOConnection1.Execute(s);

s:='CREATE VIEW bra AS SELECT raszenki.Cod_detali, raszenki.Zachod, raszenki.Nomer_operazii, raszenki_1.Raszenka, Sum([brak]![kol]) AS [sum-kol], [Sum-kol]*[raszenki_1]![Raszenka] AS ���������1';
s:=s+' FROM (raszenki AS raszenki_1 INNER JOIN brak ON raszenki_1.Cod_detali = brak.Cod_det) INNER JOIN raszenki ON (raszenki_1.Zachod = raszenki.Zachod) AND (brak.Cod_oper = raszenki.Cod)';
s:=s+' WHERE (((raszenki_1.Nomer_operazii)<=[raszenki]![Nomer_operazii]) AND ((brak.Cod_dat)=[p])) GROUP BY raszenki.Cod_detali, raszenki.Zachod, raszenki.Nomer_operazii, raszenki_1.Raszenka;';
mod_dann.DataModule1.ADOConnection1.Execute(s);

s:='CREATE VIEW zp AS SELECT rabotniki.Cod AS rabotniki_Cod, Sum([Colichestvo]*[raszenka]) AS summa, zarplata.Cod_dat FROM raszenki INNER JOIN (rabotniki INNER JOIN zarplata ON rabotniki.Cod = zarplata.Cod_rabotnika) ON raszenki.Cod = zarplata.Cod_raszenki';
s:=s+' GROUP BY rabotniki.Cod, zarplata.Cod_dat HAVING (((zarplata.Cod_dat)=[:cod_dat]));';
mod_dann.DataModule1.ADOConnection1.Execute(s);

s:='CREATE VIEW kor AS SELECT Korrectiv.Plus, Korrectiv.Minus, Korrectiv.Cod_dat, rabotniki.Cod FROM rabotniki INNER JOIN Korrectiv ON rabotniki.Cod = Korrectiv.Cod_rabotnika';
s:=s+' GROUP BY Korrectiv.Plus, Korrectiv.Minus, Korrectiv.Cod_dat, rabotniki.Cod HAVING (((Korrectiv.Cod_dat)=[:cod_dat]));';
mod_dann.DataModule1.ADOConnection1.Execute(s);

s:='CREATE VIEW itogi AS SELECT rabotniki.Familia, rabotniki.Tab, zp.summa, kor.Plus, kor.Minus, norma_zpr.phakt, rabotniki.proz_nal, professia.kod_prof, norma_zpr.korr, norma_zpr.Cod_dat, rabotniki.cod_brig, Itogi_dla_zpr.Itog_sum, rabotniki.podnal';
s:=s+' FROM ((professia RIGHT JOIN ((kor RIGHT JOIN rabotniki ON kor.Cod = rabotniki.Cod) LEFT JOIN zp ON rabotniki.Cod = zp.rabotniki_Cod) ON professia.Cod = rabotniki.Cod_professia) LEFT JOIN norma_zpr ON rabotniki.Cod = norma_zpr.Cod_rabotnika)';
s:=s+' INNER JOIN Itogi_dla_zpr ON rabotniki.cod_brig = Itogi_dla_zpr.Cod';
s:=s+' WHERE (((zp.summa) Is Not Null)) OR (((kor.Plus) Is Not Null)) OR (((kor.Minus) Is Not Null)) OR (((norma_zpr.phakt) Is Not Null)) OR (((norma_zpr.korr) Is Not Null)) ORDER BY rabotniki.Familia;';
mod_dann.DataModule1.ADOConnection1.Execute(s);

s:='CREATE VIEW itogi_zpr AS SELECT zarplata.Cod_dat, Sum([Colichestvo]*[Raszenka]) AS sum_brig, detali.cod_brig, brigada.Name_brig';
s:=s+' FROM brigada INNER JOIN (raszenki INNER JOIN (detali INNER JOIN zarplata ON detali.[Cod] = zarplata.[Cod_detali]) ON raszenki.[Cod] = zarplata.[Cod_raszenki]) ON brigada.Cod = detali.cod_brig';
s:=s+' GROUP BY zarplata.Cod_dat, detali.cod_brig, brigada.Name_brig HAVING (((zarplata.Cod_dat)=[:cod_dat]));';
mod_dann.DataModule1.ADOConnection1.Execute(s);

s:='CREATE VIEW zarplata_rasvernut AS SELECT rabotniki.Familia, detali.Detal, raszenki.Nomer_operazii, raszenki.Raszenka, raszenki.Poasnenie, Sum(zarplata.Colichestvo) AS [Sum-Colichestvo], zarplata.Cod_dat, kor.Plus, kor.Minus';
s:=s+' FROM raszenki INNER JOIN ((rabotniki LEFT JOIN kor ON rabotniki.Cod = kor.Cod) INNER JOIN (detali INNER JOIN zarplata ON detali.Cod = zarplata.Cod_detali) ON rabotniki.Cod = zarplata.Cod_rabotnika) ON raszenki.Cod = zarplata.Cod_raszenki';
s:=s+' GROUP BY rabotniki.Familia, detali.Detal, raszenki.Nomer_operazii, raszenki.Raszenka, raszenki.Poasnenie, zarplata.Cod_dat, kor.Plus, kor.Minus HAVING (((zarplata.Cod_dat)=[:cod_dat]));';
mod_dann.DataModule1.ADOConnection1.Execute(s);

s:='CREATE VIEW god_kol AS SELECT DISTINCTROW detali.Cod, detali.Detal, raszenki.Nomer_operazii, Sum(zarplata.Colichestvo) AS [Sum-Colichestvo], raszenki.Poasnenie, raszenki.Zachod, raszenki.Cod ';
s:=s+'FROM (detali INNER JOIN raszenki ON detali.Cod = raszenki.Cod_detali) LEFT JOIN zarplata ON raszenki.Cod = zarplata.Cod_raszenki ';
s:=s+'GROUP BY detali.Cod, detali.Detal, raszenki.Nomer_operazii, raszenki.Poasnenie, raszenki.Zachod, raszenki.Cod;';
mod_dann.DataModule1.ADOConnection1.Execute(s);

s:='CREATE VIEW god_vip_temp AS SELECT detali.Cod, raszenki.Zachod, Vipusk.Vipusk, Max(raszenki.Nomer_operazii) AS [Max-Nomer_operazii] ';
s:=s+'FROM (detali INNER JOIN raszenki ON detali.Cod = raszenki.Cod_detali) INNER JOIN Vipusk ON (raszenki.Zachod = Vipusk.Cod_zachod) AND (raszenki.Cod_detali = Vipusk.Cod_detali) ';
s:=s+'GROUP BY detali.Cod, raszenki.Zachod, Vipusk.Vipusk;';
mod_dann.DataModule1.ADOConnection1.Execute(s);

s:='CREATE VIEW god_vip AS SELECT god_vip_temp.Cod, god_vip_temp.Zachod, Sum(god_vip_temp.Vipusk) AS [Sum-Vipusk], god_vip_temp.[Max-Nomer_operazii] ';
s:=s+'FROM god_vip_temp GROUP BY god_vip_temp.Cod, god_vip_temp.Zachod, god_vip_temp.[Max-Nomer_operazii];';
mod_dann.DataModule1.ADOConnection1.Execute(s);

s:='CREATE VIEW norma_zpr AS SELECT norma.Cod, norma.Cod_rabotnika, norma.Cod_dat, norma.phakt, norma.korr FROM norma WHERE (((norma.Cod_dat)=[:cod_dat]));';
mod_dann.DataModule1.ADOConnection1.Execute(s);

s:='CREATE VIEW Itogi_dla_zpr AS SELECT brigada.Name_brig, IIf(([sum_brig] Is Not Null) And ([itog] Is Not Null),[sum_brig]+[itog],IIf([sum_brig] Is Not Null,[sum_brig],[itog])) AS Itog_sum, brigada.Cod';
s:=s+' FROM (brigada LEFT JOIN korrectiv_zpr ON brigada.Cod = korrectiv_zpr.cod_brig) LEFT JOIN itogi_zpr ON brigada.Cod = itogi_zpr.cod_brig';
s:=s+' GROUP BY brigada.Name_brig, IIf(([sum_brig] Is Not Null) And ([itog] Is Not Null),[sum_brig]+[itog],IIf([sum_brig] Is Not Null,[sum_brig],[itog])), brigada.Cod;';
mod_dann.DataModule1.ADOConnection1.Execute(s);

s:='CREATE VIEW korrectiv_zpr AS SELECT Sum(IIf([plus] Is Null,-[minus],IIf([minus] Is Null,[Plus],[Plus]-[minus]))) AS itog, rabotniki.cod_brig FROM Korrectiv INNER JOIN rabotniki ON Korrectiv.Cod_rabotnika = rabotniki.Cod';
s:=s+' WHERE (((Korrectiv.Cod_dat)=[:cod_dat])) GROUP BY rabotniki.cod_brig;';
mod_dann.DataModule1.ADOConnection1.Execute(s);

s:='CREATE VIEW naladka AS SELECT rabotniki.Familia, rabotniki.Tab, rabotniki.proz_nal, norma.phakt, IIf([korr] Is Null,0,[korr]) AS kor, norma.Cod_rabotnika, norma.Cod_dat, rabotniki.cod_brig, rabotniki.podnal, rabotniki.razrad, rabotniki.Cod_professia';
s:=s+' FROM Itogi_dla_zpr INNER JOIN (norma INNER JOIN rabotniki ON norma.Cod_rabotnika = rabotniki.Cod) ON Itogi_dla_zpr.Cod = rabotniki.cod_brig';
s:=s+' GROUP BY rabotniki.Familia, rabotniki.Tab, rabotniki.proz_nal, norma.phakt, IIf([korr] Is Null,0,[korr]), norma.Cod_rabotnika, norma.Cod_dat, rabotniki.cod_brig, rabotniki.podnal, rabotniki.razrad, rabotniki.Cod_professia, Itogi_dla_zpr.Itog_sum';
s:=s+' HAVING (((rabotniki.proz_nal) Is Not Null And (rabotniki.proz_nal)<>0) AND ((norma.Cod_dat)=[:cod_dat]) AND ((Itogi_dla_zpr.Itog_sum) Is Not Null));';
mod_dann.DataModule1.ADOConnection1.Execute(s);

s:='CREATE VIEW max-zach AS SELECT Max(raszenki.Zachod) AS [Max-Zachod], detali.Cod FROM detali INNER JOIN raszenki ON detali.Cod = raszenki.Cod_detali GROUP BY detali.Cod;';
mod_dann.DataModule1.ADOConnection1.Execute(s);

s:='CREATE VIEW nezaversh_det AS SELECT detali.Detal, Sum(nezaversh.Raszenka) AS [Sum-Raszenka], nezaversh.[sum-kol], nezaversh.Nomer_operazii FROM detali INNER JOIN nezaversh ON detali.Cod = nezaversh.Cod_detali';
s:=s+' GROUP BY detali.Detal, nezaversh.[sum-kol], nezaversh.Nomer_operazii ORDER BY detali.Detal;';
mod_dann.DataModule1.ADOConnection1.Execute(s);

s:='CREATE VIEW nezaversh_det_itog AS SELECT Sum(Round([Sum-Raszenka]/[znach])*[znach]*[sum-kol]) AS Summa FROM nezaversh_det, recvisiti_dobavl WHERE (((recvisiti_dobavl.name_rec)=''OKRUGL''));';
mod_dann.DataModule1.ADOConnection1.Execute(s);

s:='CREATE VIEW brak_det AS SELECT detali.Detal, Sum(bra.Raszenka) AS [Sum-Raszenka], bra.[sum-kol], bra.Nomer_operazii FROM detali INNER JOIN bra ON detali.Cod = bra.Cod_detali';
s:=s+' GROUP BY detali.Detal, bra.[sum-kol], bra.Nomer_operazii ORDER BY detali.Detal;';
mod_dann.DataModule1.ADOConnection1.Execute(s);

s:='CREATE VIEW brak_det_itog AS SELECT Sum(Round([Sum-Raszenka]/[znach])*[znach]*[sum-kol]) AS Summa FROM brak_det, recvisiti_dobavl WHERE (((recvisiti_dobavl.name_rec)=''OKRUGL''));';
mod_dann.DataModule1.ADOConnection1.Execute(s);

s:='CREATE VIEW zarplata_summa AS SELECT Sum(Itogi_dla_zpr.Itog_sum) AS [Sum-Itog_sum] FROM Itogi_dla_zpr;';
mod_dann.DataModule1.ADOConnection1.Execute(s);

s:='CREATE VIEW ktu_first AS SELECT naladka.Familia, naladka.Tab, naladka.razrad, professia.Name_prof,';
s:=s+' Round((IIf([podnal]=True,[Sum-Itog_sum]*[proz_nal]/100,[Itog_sum]*[proz_nal]*[znach]/10000)*[phakt]/[chas]+[kor])/([Sum-Itog_sum]*([sum-proz_nal]+[znach])/100/[koeph]),2) AS KTU, naladka.Cod_dat, naladka.Cod_rabotnika';
s:=s+' FROM recvisiti_dobavl, zarplata_summa, koeph_last, proz_podnal, professia INNER JOIN (chasi INNER JOIN (Itogi_dla_zpr INNER JOIN naladka ON Itogi_dla_zpr.Cod = naladka.cod_brig) ON chasi.Cod_dat = naladka.Cod_dat) ON professia.Cod = naladka.Cod_professia';
s:=s+' WHERE (((recvisiti_dobavl.name_rec)='''+'NALADKA'+'''));';
mod_dann.DataModule1.ADOConnection1.Execute(s);

s:=' CREATE VIEW ktu_last AS SELECT ktu_first.Familia, ktu_first.Tab, ktu_first.Name_prof, ktu_first.razrad, koephizient.[1], koephizient.[2], koephizient.[3], koephizient.[4], koephizient.[5], koephizient.[6],';
S:=s+' koephizient.[7], koephizient.[8], koephizient.[9], koephizient.[10], koephizient.[11], koephizient.[12], koephizient.[13], koephizient.[14], koephizient.[15], koephizient.[16], koephizient.[17], koephizient.[18],';
S:=s+' koephizient.[19], koephizient.[20], koephizient.[21], koephizient.[22], koephizient.[23], koephizient.[24], koephizient.[25], koephizient.[26], koephizient.[27], koephizient.[28], koephizient.[29], koephizient.[30],';
s:=s+' koephizient.[31], ktu_first.KTU, ktu_first.Cod_dat, ktu_first.Cod_rabotnika';
s:=s+' FROM ktu_first LEFT JOIN koephizient ON (ktu_first.Cod_rabotnika = koephizient.cod_rabotn) AND (ktu_first.Cod_dat = koephizient.cod_dat);';
mod_dann.DataModule1.ADOConnection1.Execute(s);

s:='CREATE VIEW koeph_first AS SELECT Sum([chas]/8) AS koeph_f, chasi.Cod_dat, Count(rabotniki.Cod) AS [Count-Cod] FROM chasi, rabotniki';
s:=s+' WHERE (((rabotniki.proz_nal) Is Not Null) AND ((rabotniki.podnal)=False)) GROUP BY chasi.Cod_dat HAVING (((chasi.Cod_dat)=[:cod_dat]));';
mod_dann.DataModule1.ADOConnection1.Execute(s);

s:='CREATE VIEW koeph_last AS SELECT [koeph_f]+Round(([koeph_f]/[count-cod])/([znach]/[count-cod]/[proz_nal])) AS koeph';
s:=s+' FROM rabotniki, recvisiti_dobavl, koeph_first WHERE (((rabotniki.podnal)=True) AND ((recvisiti_dobavl.name_rec)='''+'NALADKA'+'''));';
mod_dann.DataModule1.ADOConnection1.Execute(s);

s:='CREATE VIEW proz_podnal AS SELECT Sum(rabotniki.proz_nal) AS [Sum-proz_nal] FROM rabotniki WHERE (((rabotniki.podnal)=Yes));';
mod_dann.DataModule1.ADOConnection1.Execute(s);

s:='CREATE VIEW mes_balans AS SELECT DISTINCTROW detali.Detal, raszenki.Nomer_operazii, raszenki.Poasnenie, mes_vip.Vipusk, mes_kol.[Sum-Colichestvo], mes_kol.Familia';
s:=s+' FROM ((raszenki INNER JOIN detali ON raszenki.Cod_detali = detali.Cod) LEFT JOIN mes_vip ON (raszenki.Nomer_operazii = mes_vip.Nomer_operazii) AND (raszenki.Cod_detali = mes_vip.Cod_detali))';
s:=s+' LEFT JOIN mes_kol ON (raszenki.Nomer_operazii = mes_kol.Nomer_operazii) AND (raszenki.Cod_detali = mes_kol.Cod_detali)';
S:=s+' GROUP BY detali.Detal, raszenki.Nomer_operazii, raszenki.Poasnenie, mes_vip.Vipusk, mes_kol.[Sum-Colichestvo], mes_kol.Familia';
s:=s+' HAVING (((mes_kol.[Sum-Colichestvo]) Is Not Null)) OR (((mes_vip.Vipusk) Is Not Null)) ORDER BY detali.Detal;';
mod_dann.DataModule1.ADOConnection1.Execute(s);

s:='CREATE VIEW mes_kol AS SELECT zarplata.Cod_dat, rabotniki.Familia, Sum(zarplata.Colichestvo) AS [Sum-Colichestvo], zarplata.Cod_detali, raszenki.Nomer_operazii';
s:=s+' FROM (rabotniki INNER JOIN zarplata ON rabotniki.Cod = zarplata.Cod_rabotnika) INNER JOIN raszenki ON zarplata.Cod_raszenki = raszenki.Cod';
s:=s+' GROUP BY zarplata.Cod_dat, rabotniki.Familia, zarplata.Cod_detali, raszenki.Nomer_operazii HAVING (((zarplata.Cod_dat)=[p]));';
mod_dann.DataModule1.ADOConnection1.Execute(s);

s:='CREATE VIEW mes_vip AS SELECT raszenki.Nomer_operazii, Vipusk.Vipusk, Vipusk.Cod_dat, raszenki.Cod_detali FROM raszenki INNER JOIN Vipusk ON (raszenki.Cod_detali = Vipusk.Cod_detali) AND (raszenki.Zachod = Vipusk.Cod_zachod)';
s:=s+' GROUP BY raszenki.Nomer_operazii, Vipusk.Vipusk, Vipusk.Cod_dat, raszenki.Cod_detali HAVING (((Vipusk.Cod_dat)=[p]));';
mod_dann.DataModule1.ADOConnection1.Execute(s);

 ShowMessage('���� �������');

 end
 else
 ShowMessage('���� � ����� ������ ��� ����������!!!'+#13+'��������� ���� ��� ������ ������.');  n14.Tag:=0;
 end;

procedure TForm1.N15Click(Sender: TObject);
begin
 if combobox1.ItemIndex<>-1 then begin
 if not assigned(nezav) then
 nezav:=tnezav.Create(self);
 nezav.Show;end
 else showmessage('�� ������ �����?')
end;

procedure TForm1.N16Click(Sender: TObject);
begin
 if ((MonthOf(date)=1) and (combobox1.ItemIndex=11)) then mod_dann.DataModule1.frxReport_nezav.Variables['dat']:=encodedate(yearof(date),1,1)
 else mod_dann.DataModule1.frxReport_nezav.Variables['dat'] := incmonth(encodedate(yearof(date),combobox1.ItemIndex+1,1),1) ;



mod_dann.DataModule1.ADOStoredProc_nezaversh.Parameters.ParamByName('[p]').Value:=combobox1.ItemIndex+1;
mod_dann.DataModule1.ADODataSet_rep_uzel_nezav.Parameters.ParamByName('p').Value:=combobox1.ItemIndex+1;
mod_dann.DataModule1.ADOStoredProc_nezaversh.Close;
    mod_dann.DataModule1.ADOStoredProc_nezaversh.Open;
mod_dann.DataModule1.ADODataSet_rep_uzel_nezav.Close;
mod_dann.DataModule1.ADODataSet_rep_uzel_nezav.Open;
mod_dann.DataModule1.frxReport_nezav.Variables['okrugl']:=okrugl;
mod_dann.DataModule1.frxReport_nezav.ShowReport();
end;

procedure TForm1.N17Click(Sender: TObject);
begin
 if not assigned(recvisit) then begin
 recvisit:=trecvisit.Create(self);end;
 recvisit.Show;
end;

procedure TForm1.N18Click(Sender: TObject);
begin
if opendialog2.Execute  then begin n14.Tag:=1;
if not assigned(form_copy) then
 form_copy:=tform_copy.Create(self);
 form_copy.Show;
end;
end;

procedure TForm1.labeltext1Exit(Sender: TObject);
begin
labeltext1.Text:=''
end;


procedure TForm1.LinkLabel1LinkClick(Sender: TObject; const Link: string;
  LinkType: TSysLinkType);
begin
ShellExecute(0, nil, PChar(Link), nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin   mod_dann.DataModule1.adotable_detal.Locate('detal',mod_dann.DataModule1.adotable_zarpl.FieldValues['detal'],[locaseinsensitive]);
end;






procedure TForm1.DBGrid2Columns1UpdateData(Sender: TObject; var Text: string;
  var Value: Variant; var UseText, Handled: Boolean);
begin
mod_dann.DataModule1.ADOdataset_zarpl.FieldByName('Cod_raszenki').Value:=null;
end;

procedure TForm1.DBGrid2Columns2OpenDropDownForm(Grid: TCustomDBGridEh;
  Column: TColumnEh; Button: TEditButtonEh; var DropDownForm: TCustomForm;
  DynParams: TDynVarsEh);
begin
 mod_dann.DataModule1.ADOTable_detal.Locate('cod',mod_dann.DataModule1.ADODataSet_zarpl.FieldByName('cod_detali').Value,[]);
end;

procedure TForm1.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin
if (key=VK_RETURN) and (flag) then begin   flag:=false;
mod_dann.DataModule1.ADODataset_zarpl.Refresh;
 if (dbgrid2.SelectedIndex=0) or (dbgrid2.SelectedIndex=2) then begin
keybd_event(VK_down, 0, 0, 0);
keybd_event(VK_down, 0, KEYEVENTF_KEYUP, 0);
dbgrid2.SelectedIndex:=0; end;
end else if key=VK_down then  begin dbgrid2.SelectedIndex:=0;
flag:=true;
end else  flag:=true;
end;

procedure TForm1.DBGrid2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
mod_dann.DataModule1.ADOTable_detal.Locate('cod',mod_dann.DataModule1.ADODataSet_zarpl.FieldByName('cod_detali').Value,[]);
end;

procedure TForm1.DBGrid2TitleClick(Column: TColumnEh);
begin
 if column=dbgrid2.Columns.Items[3] then begin
 mod_dann.DataModule1.ADOTable_detal.MasterFields:='cod_detali';
if not assigned(Form2) then begin
 form2:=tform2.Create(self);end;
 form2.Show;end
end;

end.
