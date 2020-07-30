unit pas_bd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TPassw_BD = class(TForm)
    BitBtn1: TBitBtn;
    LabeledEdit1: TLabeledEdit;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Passw_BD: TPassw_BD;

implementation

{$R *.dfm}

uses zarpl;

procedure TPassw_BD.BitBtn1Click(Sender: TObject);
begin
if LabeledEdit1.Text<>'' then
zarpl.pas:=LabeledEdit1.Text;
passw_bd.Tag:=1;
end;

procedure TPassw_BD.BitBtn2Click(Sender: TObject);
begin
passw_bd.Tag:=0;
close
end;

procedure TPassw_BD.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if (LabeledEdit1.Text='') and (passw_bd.Tag=1)  then canclose:=false
end;

procedure TPassw_BD.FormShow(Sender: TObject);
begin
LabeledEdit1.Text:='';
LabeledEdit1.SetFocus;
end;

end.
