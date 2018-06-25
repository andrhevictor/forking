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
    dbGrid1: TDBGrid;
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
    dbGrid2: TDBGrid;
    fdqProdutosMaisVendidos: TFDQuery;
    dsProdutosMaisVendidos: TDataSource;
    fdqProdutosMaisVendidosproduto: TWideStringField;
    fdqProdutosMaisVendidosquantidade: TLargeintField;
    fdqProdutosMaisVendidospreco: TBCDField;
    frxMaisVendidos: TfrxReport;
    frxDBMaisVendidos: TfrxDBDataset;
    fdqProdutosMaisVendidosid: TLargeintField;
    procedure btnGerarRelatorioClick(Sender: TObject);
    procedure rbOrdenaPrecoClick(Sender: TObject);
    procedure rbOrdenaCategoriaClick(Sender: TObject);
    procedure buscaProdutoOrdenadoCategoria();
    procedure buscaProdutoOrdenadoPreco();
    procedure buscaProdutoMaisVendido();
    procedure rbProdutoMaisVendidoClick(Sender: TObject);
    procedure ativaGrid1();
    Procedure ativaGrid2();
    procedure dbGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fOpcaoRelatorioProduto: TfOpcaoRelatorioProduto;

implementation

{$R *.dfm}

uses dmDados, uCadastraProduto, uEditaProduto, uLogin, uNovoPedido,
  uPagamento, uPrincipal, uVisualizaFichas, uVisualizaProduto;

// -------------------BOTÃO GERAR---------------------//
procedure TfOpcaoRelatorioProduto.btnGerarRelatorioClick(Sender: TObject);
var
  path: string;
begin
  path := ExtractFilePath(Application.ExeName);
  if cbxAgurpar.Checked and rbProdutoMaisVendido.Checked then
  begin
    fOpcaoRelatorioProduto.frxMaisVendidos.LoadFromFile
      (path + 'relatorios\relProdutosMaisVendidos.fr3');
  end
  else
  begin
    if cbxAgurpar.Checked then
    begin
      fOpcaoRelatorioProduto.buscaProdutoOrdenadoCategoria();
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
  fOpcaoRelatorioProduto.frxMaisVendidos.ShowReport();
end;

// -------------------CHECKBOX---------------------//
procedure TfOpcaoRelatorioProduto.rbOrdenaCategoriaClick(Sender: TObject);
begin
  fOpcaoRelatorioProduto.ativaGrid1();
  fOpcaoRelatorioProduto.buscaProdutoOrdenadoCategoria();
end;

procedure TfOpcaoRelatorioProduto.rbOrdenaPrecoClick(Sender: TObject);
begin
  fOpcaoRelatorioProduto.ativaGrid1();
  fOpcaoRelatorioProduto.buscaProdutoOrdenadoPreco();
end;

procedure TfOpcaoRelatorioProduto.rbProdutoMaisVendidoClick(Sender: TObject);
begin
  fOpcaoRelatorioProduto.ativaGrid2();
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

procedure TfOpcaoRelatorioProduto.dbGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//  if (TStringGrid(dbGrid1).RowCount - 1) < 20 then
//  begin
//    // Se tiver menos de 10 linhas
//    ShowScrollBar(dbGrid1.Handle, SB_VERT, False); // Remove barra Vertical
//  end;
end;

procedure TfOpcaoRelatorioProduto.dbGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//  if (TStringGrid(dbGrid1).RowCount - 1) < 20 then
//  begin
//    // Se tiver menos de 10 linhas
//    ShowScrollBar(dbGrid1.Handle, SB_VERT, False); // Remove barra Vertical
//  end;
end;

procedure TfOpcaoRelatorioProduto.buscaProdutoMaisVendido();
begin

  fdqTodosProdutos.SQL.Clear;
  fdqTodosProdutos.SQL.Add
    ('SELECT p.descricao, p.categoria_id, p.id, p.nome AS PRODUTO, count(1) AS QUANTIDADE, p.preco, c.nome');
  fdqTodosProdutos.SQL.Add('FROM pedidos_itens');
  fdqTodosProdutos.SQL.Add
    ('INNER JOIN produtos p on pedidos_itens.produto_id = p.id');
  fdqTodosProdutos.SQL.Add('INNER JOIN categorias c on p.categoria_id = c.id');
  fdqTodosProdutos.SQL.Add
    ('INNER JOIN pedidos ON pedidos_itens.pedido_id = pedidos.id');
  fdqTodosProdutos.SQL.Add
    ('INNER JOIN pagamentos p2 on pedidos.id = p2.pedido_id');
  fdqTodosProdutos.SQL.Add
    ('GROUP BY p.nome, p.preco, c.nome, p.id, p.categoria_id, p.descricao');
  fdqTodosProdutos.SQL.Add('ORDER BY QUANTIDADE DESC;');
  fdqTodosProdutos.Open();

end;

procedure TfOpcaoRelatorioProduto.ativaGrid1();
begin
  dbGrid1.visible := true;
  dbGrid2.visible := False;
end;

procedure TfOpcaoRelatorioProduto.ativaGrid2();
begin
  dbGrid2.visible := true;
  dbGrid1.visible := False;
end;

end.
