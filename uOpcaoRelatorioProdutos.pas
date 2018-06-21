unit uOpcaoRelatorioProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass, frxDBSet;

type
  TfOpcaoRelatorioProduto = class(TForm)
    panelTop: TPanel;
    panelMid: TPanel;
    lblTituloRelatorio: TLabel;
    btnGerarRelatorio: TButton;
    DBGrid1: TDBGrid;
    rbOrdenaCategoria: TRadioButton;
    rbOrdenaPreco: TRadioButton;
    lblAgrupar: TLabel;
    dsTodoProdutos: TDataSource;
    fdqTodosProdutos: TFDQuery;
    frxDBProdutos: TfrxDBDataset;
    frxProdutos: TfrxReport;
    frxProdutosPorCategoria: TfrxReport;
    cbxAgurpar: TCheckBox;
    procedure btnGerarRelatorioClick(Sender: TObject);
    procedure rbOrdenaPrecoClick(Sender: TObject);
    procedure rbOrdenaCategoriaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fOpcaoRelatorioProduto: TfOpcaoRelatorioProduto;

implementation

{$R *.dfm}

uses dmDados, uRelatorio, uCadastraProduto, uEditaProduto, uLogin, uNovoPedido,
  uPagamento, uPrincipal, uVisualizaFichas, uVisualizaProduto;

//BOTAO GERAR
procedure TfOpcaoRelatorioProduto.btnGerarRelatorioClick(Sender: TObject);
var path: string;
begin
  path := ExtractFilePath(Application.ExeName);
  if rbOrdenaPreco.Checked then begin
     fdqTodosProdutos.SQL.Clear;
      fdqTodosProdutos.SQL.Add('SELECT * FROM produtos');
      fdqTodosProdutos.SQL.Add('INNER JOIN categorias');
      fdqTodosProdutos.SQL.Add('ON produtos.categoria_id = categorias.id');
      fdqTodosProdutos.SQL.Add('ORDER BY preco');
      fdqTodosProdutos.Open();

      fOpcaoRelatorioProduto.frxProdutos.LoadFromFile(path+'relatorios\relProdutos.fr3');
  end
  else begin
      fdqTodosProdutos.SQL.Clear;
      fdqTodosProdutos.SQL.Add('SELECT * FROM produtos');
      fdqTodosProdutos.SQL.Add('INNER JOIN categorias');
      fdqTodosProdutos.SQL.Add('ON produtos.categoria_id = categorias.id');
      fdqTodosProdutos.SQL.Add('ORDER BY categoria_id');
      fdqTodosProdutos.Open();

      fOpcaoRelatorioProduto.frxProdutos.LoadFromFile(path+'relatorios\relProdutosOrdenadoCategoria.fr3');
    end;
  fOpcaoRelatorioProduto.frxProdutos.ShowReport();
end;

//CHECKBOX
procedure TfOpcaoRelatorioProduto.rbOrdenaCategoriaClick(Sender: TObject);
begin
      fdqTodosProdutos.SQL.Clear;
      fdqTodosProdutos.SQL.Add('SELECT * FROM produtos');
      fdqTodosProdutos.SQL.Add('INNER JOIN categorias');
      fdqTodosProdutos.SQL.Add('ON produtos.categoria_id = categorias.id');
      fdqTodosProdutos.SQL.Add('ORDER BY categoria_id');
      fdqTodosProdutos.Open();
end;

procedure TfOpcaoRelatorioProduto.rbOrdenaPrecoClick(Sender: TObject);
begin
      fdqTodosProdutos.SQL.Clear;
      fdqTodosProdutos.SQL.Add('SELECT * FROM produtos');
      fdqTodosProdutos.SQL.Add('INNER JOIN categorias');
      fdqTodosProdutos.SQL.Add('ON produtos.categoria_id = categorias.id');
      fdqTodosProdutos.SQL.Add('ORDER BY preco');
      fdqTodosProdutos.Open();
end;

end.
