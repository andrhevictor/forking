unit uOpcaoRelatorioProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls,
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
    dsTodoProdutos: TDataSource;
    fdqTodosProdutos: TFDQuery;
    frxDBProdutos: TfrxDBDataset;
    frxProdutos: TfrxReport;
    frxProdutosPorCategoria: TfrxReport;
    cbxAgurpar: TCheckBox;
    gbImpressao: TGroupBox;
    gbGridOrdenacao: TGroupBox;
    rbProdutoMaisVendido: TRadioButton;
    fdqTodosProdutosid: TLargeintField;
    fdqTodosProdutoscategoria_id: TLargeintField;
    fdqTodosProdutosnome: TWideStringField;
    fdqTodosProdutospreco: TBCDField;
    fdqTodosProdutosdescricao: TWideStringField;
    fdqTodosProdutosid_1: TLargeintField;
    fdqTodosProdutosnome_1: TWideStringField;
    procedure btnGerarRelatorioClick(Sender: TObject);
    procedure rbOrdenaPrecoClick(Sender: TObject);
    procedure rbOrdenaCategoriaClick(Sender: TObject);
    procedure buscaProdutoOrdenadoCategoria();
    procedure buscaProdutoOrdenadoPreco();
    procedure buscaProdutoMaisVendido();
    procedure rbProdutoMaisVendidoClick(Sender: TObject);

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

// -------------------BOTÃO GERAR---------------------//
procedure TfOpcaoRelatorioProduto.btnGerarRelatorioClick(Sender: TObject);
var
  path: string;
begin
  path := ExtractFilePath(Application.ExeName);
  if cbxAgurpar.Checked then
  begin
    fOpcaoRelatorioProduto.buscaProdutoOrdenadoPreco();
    fOpcaoRelatorioProduto.frxProdutos.LoadFromFile
      (path + 'relatorios\relProdutosAgrupadoCategoria.fr3');
  end
  else
  begin
    if rbOrdenaCategoria.Checked then
    begin
      fOpcaoRelatorioProduto.buscaProdutoOrdenadoCategoria();
    end
    else
    begin
      if rbOrdenaPreco.Checked then
      begin
        fOpcaoRelatorioProduto.buscaProdutoOrdenadoPreco();
      end
      else
      begin
        fOpcaoRelatorioProduto.buscaProdutoMaisVendido();
      end
    end;
    fOpcaoRelatorioProduto.frxProdutos.LoadFromFile
      (path + 'relatorios\relProdutos.fr3');
  end;
  fOpcaoRelatorioProduto.frxProdutos.ShowReport();
end;

// -------------------CHECKBOX---------------------//
procedure TfOpcaoRelatorioProduto.rbOrdenaCategoriaClick(Sender: TObject);
begin
  fOpcaoRelatorioProduto.buscaProdutoOrdenadoCategoria();
end;

procedure TfOpcaoRelatorioProduto.rbOrdenaPrecoClick(Sender: TObject);
begin
  fOpcaoRelatorioProduto.buscaProdutoOrdenadoPreco();
end;

procedure TfOpcaoRelatorioProduto.rbProdutoMaisVendidoClick(Sender: TObject);
begin
  fOpcaoRelatorioProduto.buscaProdutoMaisVendido();
end;

// -------------------FUNÇÕES---------------------//
procedure TfOpcaoRelatorioProduto.buscaProdutoOrdenadoCategoria();
begin
  fdqTodosProdutos.SQL.Clear;
  fdqTodosProdutos.SQL.Add('SELECT * FROM produtos');
  fdqTodosProdutos.SQL.Add('INNER JOIN categorias');
  fdqTodosProdutos.SQL.Add('ON produtos.categoria_id = categorias.id');
  fdqTodosProdutos.SQL.Add('ORDER BY categoria_id');
  fdqTodosProdutos.Open();
end;

procedure TfOpcaoRelatorioProduto.buscaProdutoOrdenadoPreco();
begin
  fdqTodosProdutos.SQL.Clear;
  fdqTodosProdutos.SQL.Add('SELECT * FROM produtos');
  fdqTodosProdutos.SQL.Add('INNER JOIN categorias');
  fdqTodosProdutos.SQL.Add('ON produtos.categoria_id = categorias.id');
  fdqTodosProdutos.SQL.Add('ORDER BY preco');
  fdqTodosProdutos.Open();
end;

procedure TfOpcaoRelatorioProduto.buscaProdutoMaisVendido();
begin

  fdqTodosProdutos.SQL.Clear;
  fdqTodosProdutos.SQL.Add('SELECT p.nome AS PRODUTO, count(1) AS QUANTIDADE');
  fdqTodosProdutos.SQL.Add('FROM pedidos_itens');
  fdqTodosProdutos.SQL.Add
    ('INNER JOIN produtos p on pedidos_itens.produto_id = p.id');
  fdqTodosProdutos.SQL.Add('INNER JOIN categorias c on p.categoria_id = c.id');
  fdqTodosProdutos.SQL.Add
    ('INNER JOIN pedidos ON pedidos_itens.pedido_id = pedidos.id');
  fdqTodosProdutos.SQL.Add
    ('INNER JOIN pagamentos p2 on pedidos.id = p2.pedido_id');
  fdqTodosProdutos.SQL.Add('GROUP BY p.nome');
  fdqTodosProdutos.SQL.Add('ORDER BY QUANTIDADE DESC;');
  fdqTodosProdutos.Open();

end;

end.
