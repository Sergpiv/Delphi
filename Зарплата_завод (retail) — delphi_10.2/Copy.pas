unit Copy;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Data.DB, Data.Win.ADODB;

type
  Tform_copy = class(TForm)
    RadioGroup_detal: TRadioGroup;
    Label1: TLabel;
    RadioGroup_rabotnik: TRadioGroup;
    RadioGroup_raszenka: TRadioGroup;
    BitBtn1: TBitBtn;
    ADOTable_copy: TADOTable;
    RadioGroup_recvisiti: TRadioGroup;
    RadioGroup_brigada: TRadioGroup;
    RadioGroup_uzel: TRadioGroup;
    RadioGroup_shabloni: TRadioGroup;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_copy: Tform_copy;

implementation

{$R *.dfm}

uses mod_dann, zarpl;

procedure Tform_copy.BitBtn1Click(Sender: TObject);
begin
 zarpl.form1.N14.Click;
 form_copy.Hide;
end;

end.
