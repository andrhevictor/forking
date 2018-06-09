unit uRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxDBSet;

type
  TfRelatorios = class(TForm)
    frxProdutos: TfrxReport;
    frxDBProdutos: TfrxDBDataset;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelatorios: TfRelatorios;

implementation

{$R *.dfm}

uses dmDados, uPrincipal, uCadastraProduto, uEditaProduto, uVisualizaProduto,
  uLogin, uNovoPedido, uPagamento, uVisualizaFichas;

end.
