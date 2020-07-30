unit keygen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, clipbrd;

type
  TForm1 = class(TForm)
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
function Encrypt(const InString: string; StartKey, MultKey, AddKey: Integer):
  string;
implementation

{$R *.dfm}

{ **** UBPFD *********** by delphibase.endimus.com ****
>> �������������� ������ S � ����� � �����,
��� ������ ����� ������������ ������ ������ ������

������� ������ S ������� ����������� � � ����� �����, ������ �� �������
���������� ��� �������� �������, � ����� ������ ������ ������������� ������ "#".
�����, ��������, S = 'Hello';
����� Result = '#72#101#108#108#111';

�����������: system
�����:       VID, vidsnap@mail.ru, ICQ:132234868, ���������
Copyright:   VID
����:        25 ������ 2002 �.
***************************************************** }

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
{ **** UBPFD *********** by delphibase.endimus.com ****
>> �������������� ������ �����, ��������������� �������� "#" � ������

������� ����������� ����� �����, ��������������� �������� "#" �
��������������� ������. ������ ����� � ������ ����� ������ ������������ ��
���� ��� ������� �� ASCII �������.
��������, ���� AsciiString '#72#101#108#108#111', �� Result = 'Hello';

�����������: sysutils, system
�����:       VID, vidsnap@mail.ru, ICQ:132234868, ���������
Copyright:   VID
����:        26 ������ 2002 �.
***************************************************** }





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


procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
Clipboard.SetTextBuf(PChar(LabeledEdit2.Text));
showmessage('������ �����������!');
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
if clipboard.HasFormat(CF_Text)
then LabeledEdit1.Text:=clipboard.AsText else
messagedlg('� ������ ������ - �� �����!',mterror, [mbok],0);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var r,i:integer;
begin      r:=0;
for i:=1 to length(labelededit1.Text) do
r:=r+strtoint(labelededit1.Text[i]);
labelededit2.Text:=Encryptex(LabeledEdit1.Text, strtoint(LabeledEdit1.Text),length(LabeledEdit1.Text), r)
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
close
end;

end.
