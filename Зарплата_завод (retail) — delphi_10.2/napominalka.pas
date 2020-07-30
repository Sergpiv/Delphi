unit napominalka;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.DBCtrls,Data.DB;

type
  TFrame1 = class(TFrame)
    SpeedButton1: TSpeedButton;
    DBMemo1: TDBMemo;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses zarpl, mod_dann;



procedure TFrame1.SpeedButton1Click(Sender: TObject);
begin
if (mod_dann.DataModule1.ADOTable_napom.State=dsedit) or (mod_dann.DataModule1.ADOTable_napom.State=dsinsert) then begin
  mod_dann.DataModule1.adotable_napom.FieldByName('cod_dat').Value:=zarpl.Form1.combobox1.ItemIndex+1;
mod_dann.DataModule1.ADOTable_napom.Post;
end;
  myFrame.Free;
  myFrame := nil;
end;

end.
