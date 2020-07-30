unit mod_dann;

interface

uses
  SysUtils, Classes, DB, ADODB, dialogs, Variants, system.UITypes,
  frxChart, frxClass, frxDBSet, buttons,  frxPreview, Vcl.Graphics, frxExportXLS,
  frxDesgn, Data.DbxSqlite, Data.SqlExpr, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, SimpleDS, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;


type
  TDataModule1 = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOTable_rabotn: TADOTable;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADOTable_detal: TADOTable;
    DataSource3: TDataSource;
    ADOTable_zarpl: TADOTable;
    DataSource4: TDataSource;
    ADOTable_rasz: TADOTable;
    ADOTable_rabotnCod: TAutoIncField;
    ADOTable_rabotnFamilia: TWideStringField;
    ADOTable_raszCod: TAutoIncField;
    ADOTable_raszCod_detali: TIntegerField;
    ADOTable_raszNomer_operazii: TWideStringField;
    ADOTable_raszRaszenka: TFloatField;
    ADOTable_zarplCod: TAutoIncField;
    ADOTable_zarplCod_rabotnika: TIntegerField;
    ADOTable_zarplCod_raszenki: TIntegerField;
    ADOTable_zarplCod_detali: TIntegerField;
    ADOTable_zarplColichestvo: TIntegerField;
    ADOTable_zarpldetal: TStringField;
    ADOTable_zarploper: TStringField;
    ADOTable_zarplrasc: TFloatField;
    ADOTable_zarplSum: TFloatField;
    ADOTable_raszPoasnenie: TWideStringField;
    frxDBDataset1: TfrxDBDataset;
    ADOQuery2: TADOQuery;
    frxReport1: TfrxReport;
    ADOQuery3: TADOQuery;
    frxReport2: TfrxReport;
    frxDBDataset4: TfrxDBDataset;
    ADOTable_raszZachod: TWordField;
    ADOQuery5: TADOQuery;
    DataSource5: TDataSource;
    ADOTable_vipusk: TADOTable;
    DataSource6: TDataSource;
    ADOQuery5Detal: TWideStringField;
    ADOQuery5Zachod: TWordField;
    ADOQuery5Cod: TAutoIncField;
    ADOQuery5vipusk: TIntegerField;
    ADOQuery6: TADOQuery;
    frxDBDataset7: TfrxDBDataset;
    ADOTable_Korrectiv: TADOTable;
    DataSource7: TDataSource;
    ADOQuery8: TADOQuery;
    ADOQuery8vir: TFloatField;
    ADOQuery9: TADOQuery;
    ADOQuery10: TADOQuery;
    DataSource10: TDataSource;
    ADOQuery10SumRaszenka: TFloatField;
    ADOTable_vip_korr: TADOTable;
    DataSource8: TDataSource;
    ADOTable_raszPrint: TBooleanField;
    ADOQuery_detalprint: TADOQuery;
    frxDBDataset_detalprint: TfrxDBDataset;
    frxReport_detalprint: TfrxReport;
    ADOQuery_print_del: TADOQuery;
    ADOTable_nezav: TADOTable;
    DataSource9: TDataSource;
    ADOTable_nezavkol: TIntegerField;
    ADOTable_nezavCod: TAutoIncField;
    ADOTable_nezavCod_det: TIntegerField;
    ADOTable_nezavCod_oper: TIntegerField;
    ADOTable_nezavdetal: TStringField;
    ADOTable_nezavoper: TStringField;
    ADOQuery_del_nezav: TADOQuery;
    frxReport_nezav: TfrxReport;
    frxDBDataset_rep_nezav: TfrxDBDataset;
    DataSource11: TDataSource;
    ADOTable_recvisit: TADOTable;
    frxDBDataset_recvisit: TfrxDBDataset;
    ADOTable_rabotntab: TIntegerField;
    frxChartObject1: TfrxChartObject;
    ADOTable_zarplCod_dat: TIntegerField;
    ADODataSet_zarpl: TADODataSet;
    ADODataSet_zarplCod: TAutoIncField;
    ADODataSet_zarplCod_rabotnika: TIntegerField;
    ADODataSet_zarplCod_raszenki: TIntegerField;
    ADODataSet_zarplCod_detali: TIntegerField;
    ADODataSet_zarplCod_dat: TIntegerField;
    ADODataSet_zarplColichestvo: TIntegerField;
    DataSource12: TDataSource;
    ADODataSet_zarpldetal: TStringField;
    ADODataSet_zarploper: TStringField;
    ADODataSet_zarplrasz: TFloatField;
    ADODataSet_zarplSum: TFloatField;
    ADOQuery_max_date: TADOQuery;
    ADOQuery_max_dateMaxCod_dat: TIntegerField;
    ADODataSet_vipusk: TADODataSet;
    DataSource13: TDataSource;
    ADODataSet_vipuskVipusk: TIntegerField;
    ADODataSet_vipuskCod_detali: TIntegerField;
    ADODataSet_vipuskCod_dat: TIntegerField;
    ADODataSet_vipuskCod_zachod: TIntegerField;
    ADODataSet_korrectiv: TADODataSet;
    DataSource14: TDataSource;
    ADODataSet_korrectivCod_rabotnika: TIntegerField;
    ADODataSet_korrectivCod_dat: TIntegerField;
    ADOStoredProc_zarplata: TADOStoredProc;
    ADOStoredProc_zarplata_rasvernut: TADOStoredProc;
    ADOTable_nezavCod_dat: TIntegerField;
    ADOStoredProc_nezaversh: TADOStoredProc;
    ADOTable_vip_korrCod: TAutoIncField;
    ADOTable_vip_korrCod_dat: TIntegerField;
    ADOQuery2expr1000: TFloatField;
    ADOQuery_god_vipusk: TADOQuery;
    frxDBDataset_god_vipusk: TfrxDBDataset;
    frxReport_god_vipusk: TfrxReport;
    ADOQuery5cod_d: TIntegerField;
    ADOTable_chasi: TADOTable;
    DataSource15: TDataSource;
    DataSource16: TDataSource;
    ADODataSet_norma: TADODataSet;
    frxDBDataset_chasi: TfrxDBDataset;
    ADOTable_professia: TADOTable;
    DataSource17: TDataSource;
    ADOTable_rabotnCod_professia: TIntegerField;
    ADOTable_rabotnproz_nal: TFloatField;
    ADOTable_recvisit_dobavl: TADOTable;
    DataSource18: TDataSource;
    ADOQuery_perechet: TADOQuery;
    ADODataSet_korrectivPlus: TFloatField;
    ADODataSet_korrectivMinus: TFloatField;
    ADOTable_vip_korrkorrectiv: TFloatField;
    ADOTable_vip_korrBTZ: TFloatField;
    ADODataSet_rep_naladka: TADODataSet;
    frxDBDataset_rep_naladka: TfrxDBDataset;
    ADOQuery_dobavlenie: TADOQuery;
    ADODataSet_rep_naladkaFamilia: TWideStringField;
    ADODataSet_rep_naladkaTab: TIntegerField;
    ADODataSet_rep_naladkaproz_nal: TFloatField;
    ADODataSet_rep_naladkaphakt: TIntegerField;
    DataSource19: TDataSource;
    ADODataSet_rep_naladkakorr: TFloatField;
    ADODataSet_rep_naladkaCod_rabotnika: TIntegerField;
    ADODataSet_normaCod_rabotnika: TIntegerField;
    ADODataSet_normaCod_dat: TIntegerField;
    ADODataSet_normaphakt: TIntegerField;
    ADODataSet_rep_naladkaCod_dat: TIntegerField;
    ADOTable_recvisitcod: TAutoIncField;
    ADOTable_recvisitdolshnost: TWideStringField;
    ADOTable_recvisitfamilia: TWideStringField;
    ADOTable_recvisit_dobavlCod: TAutoIncField;
    ADOTable_recvisit_dobavlname_rec: TWideStringField;
    ADOTable_recvisit_dobavlrus: TWideStringField;
    ADOTable_recvisit_dobavlznach: TWideStringField;
    ADOTable_brigada: TADOTable;
    DataSource20: TDataSource;
    ADOTable_rabotncod_brig: TIntegerField;
    frxDBDataset_zpr_brig: TfrxDBDataset;
    DataSource21: TDataSource;
    ADODataSet_rep_naladkacod_brig: TIntegerField;
    ADOStoredProc_brig_zpr: TADOStoredProc;
    DataSource22: TDataSource;
    ADOStoredProc_ekonomia: TADOStoredProc;
    ADOStoredProc_zarplataFamilia: TWideStringField;
    ADOStoredProc_zarplataTab: TIntegerField;
    ADOStoredProc_zarplatasumma: TFloatField;
    ADOStoredProc_zarplataPlus: TFloatField;
    ADOStoredProc_zarplataMinus: TFloatField;
    ADOStoredProc_zarplataphakt: TIntegerField;
    ADOStoredProc_zarplataproz_nal: TFloatField;
    ADOStoredProc_zarplatakod_prof: TIntegerField;
    ADOStoredProc_zarplatakorr: TFloatField;
    ADOStoredProc_zarplataCod_dat: TIntegerField;
    ADOStoredProc_zarplatacod_brig: TIntegerField;
    ADOQuery_del: TADOQuery;
    ADOTable_chasiCod: TAutoIncField;
    ADOTable_chasiCod_dat: TIntegerField;
    ADOTable_chasichas: TIntegerField;
    ADOStoredProc_naladka: TADOStoredProc;
    ADOStoredProc_naladkaFamilia: TWideStringField;
    ADOStoredProc_naladkaTab: TIntegerField;
    ADOStoredProc_naladkaproz_nal: TFloatField;
    ADOStoredProc_naladkaphakt: TIntegerField;
    ADOStoredProc_naladkaCod_rabotnika: TIntegerField;
    ADOStoredProc_naladkaCod_dat: TIntegerField;
    ADOStoredProc_naladkacod_brig: TIntegerField;
    ADOStoredProc_ekonomiaekon: TFloatField;
    ADOStoredProc_ekonomiaSumphakt: TFloatField;
    ADOStoredProc_ekonomiaCod: TAutoIncField;
    ADOStoredProc_ekonomiaCod_dat: TIntegerField;
    ADOStoredProc_brig_zprName_brig: TWideStringField;
    ADOStoredProc_brig_zprItog_sum: TFloatField;
    ADOStoredProc_brig_zprCod: TAutoIncField;
    ADOStoredProc_zarplataItog_sum: TFloatField;
    ADOTable_ostatki: TADOTable;
    DataSource23: TDataSource;
    ADOQuery_god_vipuskDetal: TWideStringField;
    ADOQuery_god_vipuskNomer_operazii: TWideStringField;
    ADOQuery_god_vipuskPoasnenie: TWideStringField;
    ADOQuery_god_vipuskZachod: TIntegerField;
    ADOQuery_god_vipuskSumColichestvo: TFloatField;
    ADOQuery_god_vipuskSumVipusk: TFloatField;
    ADOQuery_god_vipuskkol: TIntegerField;
    DataSource24: TDataSource;
    ADOTable_temp: TADOTable;
    ADOQuery_god_vipuskdetaliCod: TAutoIncField;
    ADOQuery_god_vipuskraszenkiCod: TAutoIncField;
    ADOQuery_god_vipusknezaw: TIntegerField;
    ADOTable_detalCod: TAutoIncField;
    ADOTable_detalcod_brig: TIntegerField;
    ADOTable_detalDetal: TWideStringField;
    ADOTable_detaluzel: TBooleanField;
    ADOTable_detalphoto: TBlobField;
    ADOTable_uzel: TADOTable;
    DataSource25: TDataSource;
    ADOTable_uzelcod: TAutoIncField;
    ADOTable_uzelcod_uzla: TIntegerField;
    ADOTable_uzelcod_det: TIntegerField;
    ADOTable_uzelkolvo: TIntegerField;
    ADOTable_uzelname: TStringField;
    ADOQuery_det_zap: TADOQuery;
    DataSource26: TDataSource;
    ADODataSet_rep_uzel_nezav: TADODataSet;
    frxDataSet_rep_uzel_nezav: TfrxDBDataset;
    ADOStoredProc_nezavershDetal: TWideStringField;
    ADOStoredProc_nezavershSumRaszenka: TFloatField;
    ADOStoredProc_nezavershsumkol: TFloatField;
    ADOStoredProc_nezavershNomer_operazii: TWideStringField;
    ADOStoredProc_nezaversh_det_itog: TADOStoredProc;
    ADOStoredProc_nezaversh_det_itogSumma: TFloatField;
    ADODataSet_rep_uzel_nezavdet: TWideStringField;
    ADODataSet_rep_uzel_nezavrasz: TFloatField;
    ADOTable_rabotnpodnal: TBooleanField;
    ADODataSet_proz_podnal: TADODataSet;
    ADODataSet_proz_podnalpodnal: TBooleanField;
    ADODataSet_proz_podnalSumproz_nal: TFloatField;
    frxDBDataset_proz_podnal: TfrxDBDataset;
    ADODataSet_rep_naladkapodnal: TBooleanField;
    ADOStoredProc_naladkapodnal: TBooleanField;
    ADODataSet_ekon_podnal: TADODataSet;
    ADODataSet_ekon_podnalpodnal_ekon: TFloatField;
    ADOStoredProc_zarplatapodnal: TBooleanField;
    ADOTable_print_rasc: TADOTable;
    DataSource27: TDataSource;
    ADOQuery_null_print: TADOQuery;
    ADOQuery_insert_print_table: TADOQuery;
    ADOQuery_delete_print_table: TADOQuery;
    frxReport_rasz_print: TfrxReport;
    frxDBDataset_print_rasz: TfrxDBDataset;
    ADODataSet_print_rasz: TADODataSet;
    ADOTable_raszvrema: TFloatField;
    ADODataSet_zarplSum_vrema: TFloatField;
    ADODataSet_zarplVrema: TFloatField;
    ADOTable_brak: TADOTable;
    IntegerField1: TIntegerField;
    AutoIncField1: TAutoIncField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    IntegerField4: TIntegerField;
    DataSource28: TDataSource;
    ADOStoredProc_brak_det_itog: TADOStoredProc;
    FloatField1: TFloatField;
    ADODataSet_rep_uzel_brak: TADODataSet;
    WideStringField1: TWideStringField;
    FloatField2: TFloatField;
    IntegerField5: TIntegerField;
    ADOQuery_del_brak: TADOQuery;
    ADOTable_rabotnrazrad: TIntegerField;
    DataSource29: TDataSource;
    ADOTable_koephizient: TADOTable;
    ADOStoredProc_KTU: TADOStoredProc;
    ADOStoredProc_KTUFamilia: TWideStringField;
    ADOStoredProc_KTUTab: TIntegerField;
    ADOStoredProc_KTUName_prof: TWideStringField;
    ADOStoredProc_KTUrazrad: TIntegerField;
    ADOStoredProc_KTUWideStringField1: TWideStringField;
    ADOStoredProc_KTUWideStringField2: TWideStringField;
    ADOStoredProc_KTUWideStringField3: TWideStringField;
    ADOStoredProc_KTUWideStringField4: TWideStringField;
    ADOStoredProc_KTUWideStringField5: TWideStringField;
    ADOStoredProc_KTUWideStringField6: TWideStringField;
    ADOStoredProc_KTUWideStringField7: TWideStringField;
    ADOStoredProc_KTUWideStringField8: TWideStringField;
    ADOStoredProc_KTUWideStringField9: TWideStringField;
    ADOStoredProc_KTUWideStringField10: TWideStringField;
    ADOStoredProc_KTUWideStringField11: TWideStringField;
    ADOStoredProc_KTUWideStringField12: TWideStringField;
    ADOStoredProc_KTUWideStringField13: TWideStringField;
    ADOStoredProc_KTUWideStringField14: TWideStringField;
    ADOStoredProc_KTUWideStringField15: TWideStringField;
    ADOStoredProc_KTUWideStringField16: TWideStringField;
    ADOStoredProc_KTUWideStringField17: TWideStringField;
    ADOStoredProc_KTUWideStringField18: TWideStringField;
    ADOStoredProc_KTUWideStringField19: TWideStringField;
    ADOStoredProc_KTUWideStringField20: TWideStringField;
    ADOStoredProc_KTUWideStringField21: TWideStringField;
    ADOStoredProc_KTUWideStringField22: TWideStringField;
    ADOStoredProc_KTUWideStringField23: TWideStringField;
    ADOStoredProc_KTUWideStringField24: TWideStringField;
    ADOStoredProc_KTUWideStringField25: TWideStringField;
    ADOStoredProc_KTUWideStringField26: TWideStringField;
    ADOStoredProc_KTUWideStringField27: TWideStringField;
    ADOStoredProc_KTUWideStringField28: TWideStringField;
    ADOStoredProc_KTUWideStringField29: TWideStringField;
    ADOStoredProc_KTUWideStringField30: TWideStringField;
    ADOStoredProc_KTUWideStringField31: TWideStringField;
    ADOStoredProc_KTUKTU: TFloatField;
    ADOStoredProc_KTUCod_dat: TIntegerField;
    ADOStoredProc_KTUCod_rabotnika: TIntegerField;
    ADOQuery_vichodnoi: TADOQuery;
    ADOStoredProc_KTUsumma: TFloatField;
    ADOStoredProc_naladkakor: TFloatField;
    ADOTable_shablon: TADOTable;
    ADOTable_shablonCod: TAutoIncField;
    ADOTable_shablonCod_rabotn: TIntegerField;
    ADOTable_shablonCod_detali: TIntegerField;
    ADOTable_shablonCod_rascenki: TIntegerField;
    ADOTable_shablondetal: TStringField;
    ADOTable_shablonoper: TStringField;
    DataSource31: TDataSource;
    ADOQuery_vibor: TADOQuery;
    ADODataSet_rep_uzel_nezavSumkol: TFloatField;
    ADOStoredProc_mes_balans: TADOStoredProc;
    frxDesigner1: TfrxDesigner;
    ADOTable_napom: TADOTable;
    DataSource30: TDataSource;
    ADOQuery_rasz_Update_Print: TADOQuery;
    ADOQuery11: TADOQuery;
    procedure ADOTable_zarplCalcFields(DataSet: TDataSet);
    procedure ADOTable_detalAfterScroll(DataSet: TDataSet);
    procedure ADOTable_zarplCod_detaliChange(Sender: TField);
    procedure ADOTable_nezavCod_detChange(Sender: TField);
    procedure ADOTable_nezavAfterEdit(DataSet: TDataSet);
    procedure ADOTable_zarplBeforePost(DataSet: TDataSet);
    procedure ADODataSet_zarplBeforePost(DataSet: TDataSet);
    procedure ADODataSet_zarplAfterOpen(DataSet: TDataSet);
    procedure ADODataSet_zarplCalcFields(DataSet: TDataSet);
    procedure ADOTable_vip_korrAfterInsert(DataSet: TDataSet);
    procedure ADOTable_nezavBeforePost(DataSet: TDataSet);
    procedure frxReport1Preview(Sender: TObject);
    procedure FloatField3Change(Sender: TField);
    procedure ADODataSet_zarplAfterPost(DataSet: TDataSet);
    procedure ADODataSet_normaAfterPost(DataSet: TDataSet);
    procedure ADOTable_brakAfterDelete(DataSet: TDataSet);
    procedure ADOTable_brakBeforePost(DataSet: TDataSet);
    procedure ADOStoredProc_KTUCalcFields(DataSet: TDataSet);
    procedure ADOTable_recvisit_dobavlAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

uses zarpl, Detal, nezaver, naladka, ostat, brak, shabl, rekvisiti;

{$R *.dfm}

procedure TDataModule1.ADOTable_zarplCalcFields(DataSet: TDataSet);
begin
ADOTable_zarpl.FieldByName('Sum').Value:=ADOTable_zarpl.FieldValues['rasz']*ADOTable_zarpl.FieldValues['Colichestvo'];
 
end;




procedure TDataModule1.ADOTable_nezavAfterEdit(DataSet: TDataSet);
 begin
nezav.FormActivate(nezav);
 end;


procedure TDataModule1.ADOTable_nezavBeforePost(DataSet: TDataSet);
begin
ADOTable_nezav.FieldByName('Cod_dat').Value:=zarpl.Form1.ComboBox1.ItemIndex+1;
end;

procedure TDataModule1.ADOTable_nezavCod_detChange(Sender: TField);
begin
ADOTable_nezav.Edit;
ADOTable_nezav.FieldByName('cod_oper').Value:=null;
end;








procedure TDataModule1.ADOTable_recvisit_dobavlAfterPost(DataSet: TDataSet);
begin  if ADOTable_recvisit_dobavl.Locate('name_rec','BASE_PATH',[]) then
rekvisiti.recvisit.Edit1.Text:=ADOTable_recvisit_dobavl.FieldByName('znach').AsString else
rekvisiti.recvisit.Edit1.Text:='';
end;

procedure TDataModule1.ADOTable_vip_korrAfterInsert(DataSet: TDataSet);
begin
ADOTable_vip_korr.FieldByName('cod_dat').Value:=zarpl.Form1.ComboBox1.ItemIndex+1;
end;



procedure TDataModule1.ADOTable_zarplBeforePost(DataSet: TDataSet);
begin
if ADOTable_zarpl.State=dsinsert then
ADOTable_zarpl.FieldByName('cod_dat').Value:=zarpl.Form1.combobox1.ItemIndex+1;

end;

procedure TDataModule1.ADODataSet_normaAfterPost(DataSet: TDataSet);
begin
vrema;
end;

procedure TDataModule1.ADODataSet_zarplAfterOpen(DataSet: TDataSet);
begin
zarpl.Form1.DBGrid2.Columns[1].DropDownRows:=adotable_detal.RecordCount  ;
end;

procedure TDataModule1.ADODataSet_zarplAfterPost(DataSet: TDataSet);
begin
if ADODataSet_norma.FieldByName('phakt').Value<>null then begin zarpl.Form1.label12.caption:=inttostr(round(zarpl.Form1.DBGrid2.Columns[4].Footer.sumvalue/mod_dann.DataModule1.ADODataSet_norma.FieldByName('phakt').Value*100))+' %';if round(zarpl.Form1.DBGrid2.Columns[4].Footer.sumvalue/mod_dann.DataModule1.ADODataSet_norma.FieldByName('phakt').Value*100)>150 then zarpl.Form1.label12.Font.Color:=clred else zarpl.Form1.label12.Font.Color:=clgreen;end else zarpl.Form1.label12.Caption:='';
end;

procedure TDataModule1.ADODataSet_zarplBeforePost(DataSet: TDataSet);
begin
if ADODataSet_zarpl.State=dsinsert then
ADODataSet_zarpl.FieldByName('cod_dat').Value:=zarpl.Form1.combobox1.ItemIndex+1;
end;

procedure TDataModule1.ADODataSet_zarplCalcFields(DataSet: TDataSet);
begin
ADODataset_zarpl.FieldByName('Sum').Value:=ADODataset_zarpl.FieldValues['rasz']*ADODataset_zarpl.FieldValues['Colichestvo'];
ADODataset_zarpl.FieldByName('Sum_vrema').Value:=ADODataset_zarpl.FieldValues['vrema']*ADODataset_zarpl.FieldValues['Colichestvo'];
end;







procedure TDataModule1.ADOStoredProc_KTUCalcFields(DataSet: TDataSet);
var i:integer;
numberString : string;
  float        : Extended;
  errorPos     : Integer;
begin
adostoredproc_ktu.FieldByName('summa').Value:=0;
for I := 5 to 35 do begin
 try
 adostoredproc_ktu.FieldByName('summa').Value:=adostoredproc_ktu.FieldByName('summa').Value+adostoredproc_ktu.FieldByName(inttostr(i-4)).asfloat;
 except

 end;
end;
adostoredproc_ktu.FieldByName('summa').Value:=-adostoredproc_ktu.FieldByName('summa').Value+adostoredproc_ktu.FieldByName('KTU').Value;

end;

procedure TDataModule1.ADOTable_brakAfterDelete(DataSet: TDataSet);
begin
brak_form.FormActivate(brak_form);
end;

procedure TDataModule1.ADOTable_brakBeforePost(DataSet: TDataSet);
begin
ADOTable_brak.FieldByName('Cod_dat').Value:=zarpl.Form1.ComboBox1.ItemIndex+1;
end;

procedure TDataModule1.ADOTable_detalAfterScroll(DataSet: TDataSet);
begin
adoquery10.Close;
adoquery10.Open;
end;

procedure TDataModule1.ADOTable_zarplCod_detaliChange(Sender: TField);
begin
ADOTable_zarpl.Edit;
ADOTable_zarpl.FieldByName('cod_raszenki').Value:=null;
end;




procedure TDataModule1.FloatField3Change(Sender: TField);
var bm:tbookmark;
begin
bm:=mod_dann.DataModule1.ADOStoredProc_naladka.GetBookmark;
 mod_dann.DataModule1.ADOStoredProc_naladka.DisableControls;
nalad.adotable_norma.Edit;
nalad.adotable_norma.FieldByName('korr').Value:=sender.Value;
nalad.adotable_norma.Post;
ADOStoredProc_naladka.Close;
ADOStoredProc_naladka.Open;
mod_dann.DataModule1.ADOStoredProc_naladka.GotoBookmark(bm);
 mod_dann.DataModule1.ADOStoredProc_naladka.EnableControls;
 mod_dann.DataModule1.ADOStoredProc_naladka.FreeBookmark(bm);
 nalad.Label5.Caption:=floattostr(round((StrToFloat(nalad.label1.Caption)-nalad.dBGridEh1.SumList.SumCollection[1].SumValue)/okrugl)*okrugl);
 if strtofloat(nalad.Label5.Caption)<0 then nalad.Label5.Font.Color:=clred else nalad.Label5.Font.Color:=clblue;
 if StrToFloat(nalad.label5.Caption)=0 then  nalad.dbgrideh1.Columns[4].Footer.color:=cllime else
 if StrToFloat(nalad.label5.Caption)<0 then  nalad.dbgrideh1.Columns[4].Footer.color:=clred
 else nalad.dbgrideh1.Columns[4].Footer.color:=claqua;
end;


procedure TDataModule1.frxReport1Preview(Sender: TObject);
var Button: TSpeedButton;
begin // Добавление новой кнопки
Button := TSpeedButton.Create(TfrxPreviewForm(frxReport1.PreviewForm).ToolBar);
Button.Parent:=TfrxPreviewForm(frxReport1.PreviewForm).ToolBar;
Button.Caption:='Ввести корректив';
Button.Width:=97;
Button.Left:=650; // Обработчик новой кнопки
Button.OnClick:=zarpl.Form1.ButtonClick;
end;




end.
