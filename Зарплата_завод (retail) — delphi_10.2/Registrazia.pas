unit Registrazia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, clipbrd, inifiles;

type
  TRegistrazion = class(TForm)
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Registrazion: TRegistrazion;
implementation

uses zarpl;

{$R *.dfm}

procedure TRegistrazion.FormShow(Sender: TObject);
begin
labelededit1.Text:=zarpl.Get_C_Tom_Number('c:/');
end;

procedure TRegistrazion.SpeedButton2Click(Sender: TObject);
begin
if clipboard.HasFormat(CF_Text)
then LabeledEdit2.Text:=clipboard.astext else
messagedlg('В буфере обмена - не текст!',mterror, [mbok],0);
end;

procedure TRegistrazion.SpeedButton1Click(Sender: TObject);
begin
Clipboard.SetTextBuf(PChar(LabeledEdit1.Text));
showmessage('Данные скопированы!');
end;

procedure TRegistrazion.BitBtn1Click(Sender: TObject);
var r,i:integer;F:TIniFile;
begin      r:=0;
for i:=1 to length(Get_C_Tom_Number('c:/')) do
r:=r+strtoint(Get_C_Tom_Number('c:/')[i]);
if zarpl.encryptex(LabeledEdit1.Text, strtoint(Get_C_Tom_Number('c:/')),length(Get_C_Tom_Number('c:/')), r)=LabeledEdit2.Text then begin
MessageDlg('Спасибо за регистрацию!!!', mtInformation, [mbOk], 0);
F:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'zarplata.ini');
F.writestring('REG','key',LabeledEdit2.Text);
F.free;zarpl.regbool:=true;
registrazion.Close;form1.OnActivate(form1);
end else MessageDlg('Введён неверный код. Повторите ввод', mtError, [mbOk], 0);
end;


procedure TRegistrazion.BitBtn2Click(Sender: TObject);
begin
close
end;


end.
