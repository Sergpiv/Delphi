unit brigada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh;

type
  TBrig = class(TForm)
    DBGrid1: TDBGridEh;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Brig: TBrig;

implementation

{$R *.dfm}

uses mod_dann;

end.
