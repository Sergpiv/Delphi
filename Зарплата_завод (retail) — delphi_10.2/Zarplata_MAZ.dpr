program Zarplata_MAZ;

uses
  Forms,
  zarpl in 'zarpl.pas' {Form1},
  mod_dann in 'mod_dann.pas' {DataModule1: TDataModule},
  Detal in 'Detal.pas' {Form2},
  vipusk in 'vipusk.pas' {form3},
  About in 'About.pas' {Form7},
  Registrazia in 'Registrazia.pas' {Registrazion},
  nezaver in 'nezaver.pas' {nezav},
  rekvisiti in 'rekvisiti.pas' {recvisit},
  Copy in 'Copy.pas' {form_copy},
  prof in 'prof.pas' {Professia},
  korrectrasz in 'korrectrasz.pas' {korrect_rasz},
  naladka in 'naladka.pas' {nalad},
  brigada in 'brigada.pas' {Brig},
  pas_bd in 'pas_bd.pas' {Passw_BD},
  ostat in 'ostat.pas' {ostatki},
  print_rasz in 'print_rasz.pas' {pr_rasz},
  brak in 'brak.pas' {brak_form},
  vedomost in 'vedomost.pas' {kalend},
  shabl in 'shabl.pas' {Shablon},
  napominalka in 'napominalka.pas' {Frame1: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Зарплата';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
