unit About;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, OleCtnrs, ShellAPI;

type
  TForm7 = class(TForm)
    OleContainer1: TOleContainer;
    StaticText2: TStaticText;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    procedure Label1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;
  function FileVersion(AFileName: string): string;
implementation

uses Registrazia, zarpl;

{$R *.dfm}

function FileVersion(AFileName: string): string;
var
  szName: array[0..255] of Char;
  P: Pointer;
  Value: Pointer;
  Len: UINT;
  GetTranslationString: string;
  FFileName: PChar;
  FValid: boolean;
  FSize: DWORD;
  FHandle: DWORD;
  FBuffer: PChar;
begin
  try
    FFileName := StrPCopy(StrAlloc(Length(AFileName) + 1), AFileName);
    FValid := False;
    FSize := GetFileVersionInfoSize(FFileName, FHandle);
    if FSize > 0 then
    try
      GetMem(FBuffer, FSize);
      FValid := GetFileVersionInfo(FFileName, FHandle, FSize, FBuffer);
    except
      FValid := False;
      raise;
    end;
    Result := '';
    if FValid then
      VerQueryValue(FBuffer, '\VarFileInfo\Translation', p, Len)
    else
      p := nil;
    if P <> nil then
      GetTranslationString := IntToHex(MakeLong(HiWord(Longint(P^)),
        LoWord(Longint(P^))), 8);
    if FValid then
    begin
      StrPCopy(szName, '\StringFileInfo\' + GetTranslationString +
        '\FileVersion');
      if VerQueryValue(FBuffer, szName, Value, Len) then
        Result := StrPas(PChar(Value));
    end;
  finally
    try
      if FBuffer <> nil then
        FreeMem(FBuffer, FSize);
    except
    end;
    try
      StrDispose(FFileName);
    except
    end;
  end;
end;


procedure TForm7.Label1Click(Sender: TObject);
begin
ShellExecute(Handle, nil, 'mailto:Serg_piv@tut.by', nil, nil, SW_SHOW);
end;

procedure TForm7.BitBtn2Click(Sender: TObject);
begin
if not assigned(Registrazion) then begin
 Registrazion:=tRegistrazion.Create(self);end;
 Registrazion.Show;
end;

procedure TForm7.FormShow(Sender: TObject);
begin          if zarpl.regbool then bitbtn2.Visible:=not(zarpl.regbool);
if zarpl.regbool then begin
label2.font.Color:=clgreen;label2.Caption:='Registered version v.'+FileVersion(Paramstr(0));end
else begin label2.font.Color:=clred;label2.Caption:='Ungistered version v.'+FileVersion(Paramstr(0));end;
end;

end.
