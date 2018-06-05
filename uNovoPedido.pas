unit uNovoPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids;

type
  TfNovoPedido = class(TForm)
    panelMid: TPanel;
    panelTop: TPanel;
    dbgProdutos: TDBGrid;
    fdqProdutos: TFDQuery;
    dsProdutos: TDataSource;
    dbgCategoria: TDBGrid;
    fdqCategoria: TFDQuery;
    dsCategoria: TDataSource;
    DBGrid1: TDBGrid;
    fdqItensPedido: TFDQuery;
    dsItensPedido: TDataSource;
    lblValor: TLabel;
    lblValorTotal: TLabel;
    fdqSomaItens: TFDQuery;
    procedure dbgProdutosDblClick(Sender: TObject);
    procedure dbgCategoriaCellClick(Column: TColumn);
  private
    idPedido: Integer;
  public
    constructor Create(AOwner: TComponent; pedidoId: String);
  end;

var
  fNovoPedido: TfNovoPedido;

implementation

{$R *.dfm}

uses dmDados;

Constructor TfNovoPedido.Create(AOwner: TComponent; pedidoId: String);
begin
  inherited Create(AOwner);
  idPedido := pedidoId.ToInteger();
  fdqItensPedido.SQL.Clear;
end;

procedure TfNovoPedido.dbgProdutosDblClick(Sender: TObject);
var
  produto_id: Integer;
  preco_unitario: Currency;
  valor_total: Double;
  quantidade: String;
  soma: Double;
begin
  quantidade := '1';
  if InputQuery('Quantidade', 'Insira a quantidade', quantidade) then
  begin
    produto_id     := dbgProdutos.DataSource.DataSet.FieldByName('id').AsInteger;
    preco_unitario := dbgProdutos.DataSource.DataSet.FieldByName('preco').AsCurrency;
    valor_total    :=  preco_unitario * quantidade.ToDouble;

    fdqItensPedido.SQL.Clear;
    fdqItensPedido.SQL.Add('INSERT INTO pedidos_itens VALUES (DEFAULT, :idPedido, :idProduto, :quantidade, :valor_total)');
    fdqItensPedido.ParamByName('idPedido').Value := idPedido;
    fdqItensPedido.ParamByName('idProduto').Value := produto_id;
    fdqItensPedido.ParamByName('quantidade').Value := quantidade.ToDouble;
    fdqItensPedido.ParamByName('valor_total').Value := valor_total;
    fdqItensPedido.ExecSQL;

  end;
  fdqItensPedido.SQL.Clear;
  fdqItensPedido.SQL.Add('SELECT * FROM pedidos_itens AS itens');
  fdqItensPedido.SQL.Add('INNER JOIN produtos ON produtos.id = itens.produto_id');
  fdqItensPedido.SQL.Add('WHERE pedido_id = :idPedido');
  fdqItensPedido.ParamByName('idPedido').Value := idPedido;
  fdqItensPedido.Open();


 fdqSomaItens.SQL.Clear;
 fdqSomaItens.SQL.Add('SELECT SUM(valor_total) AS soma FROM pedidos_itens WHERE pedido_id = :idPedido');
 fdqSomaItens.ParamByName('idPedido').Value := idPedido;
 fdqSomaItens.Open();
 soma := fdqSomaItens.FieldByName('soma').AsFloat;
 lblValorTotal.Caption := soma.ToString;

end;

procedure TfNovoPedido.dbgCategoriaCellClick(Column: TColumn);
var
  categoria_id: Integer;
begin
  fdqProdutos.SQL.Clear;
  categoria_id := dbgCategoria.DataSource.DataSet.FieldByName('id').AsInteger;
  fdqProdutos.SQL.Add('SELECT * FROM produtos');
  fdqProdutos.SQL.Add('WHERE categoria_id = :id');
  fdqProdutos.ParamByName('id').Value := categoria_id;
  fdqProdutos.Open();
end;

end.
