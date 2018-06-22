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
    dbgItensPedido: TDBGrid;
    fdqItensPedido: TFDQuery;
    dsItensPedido: TDataSource;
    lblValor: TLabel;
    fdqSomaItens: TFDQuery;
    btnSalvar: TButton;
    btnCancelar: TButton;
    fdqAtualizaPedido: TFDQuery;
    fdqFichaDisponivel: TFDQuery;
    fdqDeletePedido: TFDQuery;
    btnDeletaItem: TButton;
    procedure dbgProdutosDblClick(Sender: TObject);
    procedure dbgCategoriaCellClick(Column: TColumn);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnDeletaItemClick(Sender: TObject);
    procedure dbgItensPedidoDblClick(Sender: TObject);
    procedure recalculaValorPedido();
    procedure atualizaGridItens();
    procedure deletaItemPedido(idItem: Integer);
    procedure deletaTodosItemsByPedido(idPedido: Integer);
    procedure deletaPedido(idPedido: Integer);
    procedure atualizaFichaDisponivel(ficha: Integer);
    Function getFichaDisponivel(ficha: Integer) : Boolean;
  private
  public
//    constructor Create(AOwner: TComponent; pedidoId: String);
  end;

var
  fNovoPedido: TfNovoPedido;

implementation

{$R *.dfm}

uses dmDados, uPrincipal;

procedure TfNovoPedido.btnCancelarClick(Sender: TObject);
var
  idPedido: Integer;
begin
  idPedido := fPrincipal.GetPedidoId;

  if Application.MessageBox('Você deseja realmente cancelar o pedido?','Cancelar o pedido',mb_yesno + mb_iconquestion) = id_yes then
    Begin
      fNovoPedido.deletaTodosItemsByPedido(idPedido);
      fNovoPedido.deletaPedido(idPedido);
      fNovoPedido.Close;
    End;
end;

procedure TfNovoPedido.btnSalvarClick(Sender: TObject);
var
  fichaInput: String;
  ficha:      Integer;
  idPedido:   Integer;
begin
  idPedido := fPrincipal.GetPedidoId;

  if fdqItensPedido.RecordCount = 0 then begin
    ShowMessage('O pedido precisa ter ao menos um item para ser salvo!');
  end
  else begin
    if InputQuery('Ficha', 'Insira o número da ficha', fichaInput) then begin

    ficha := fichaInput.ToInteger();
      if (fNovoPedido.getFichaDisponivel(ficha)) then begin
        fdqAtualizaPedido.SQL.Clear;
        fdqFichaDisponivel.SQL.Add('SELECT * FROM fichas');
        fdqAtualizaPedido.SQL.Add('UPDATE pedidos SET numero_ficha = :ficha WHERE id = :pedido');
        fdqAtualizaPedido.ParamByName('ficha').Value := ficha;
        fdqAtualizaPedido.ParamByName('pedido').Value := idPedido;
        fdqAtualizaPedido.ExecSQL;

        fNovoPedido.atualizaFichaDisponivel(ficha);

        ShowMessage('Pedido salvo com sucesso! Número da ficha: ' + ficha);
        fNovoPedido.Close;
      end
      else begin
        ShowMessage('Essa ficha não está dísponivel!');
      end;
  end
  else begin
    ShowMessage('FAZ ALGO(OU NÃO)');
  end;
  end;

end;

procedure TfNovoPedido.btnDeletaItemClick(Sender: TObject);
var
  itemNome: String;
  textoMsg: String;
  quantidade: String;
  itemId:   Integer;
begin
  itemId     := dbgItensPedido.DataSource.DataSet.FieldByName('id').AsInteger;
  quantidade := dbgItensPedido.DataSource.DataSet.FieldByName('quantidade').AsString;
  itemNome   := dbgItensPedido.DataSource.DataSet.FieldByName('nome').AsString;
  textoMsg   := 'Deseja realmente deletar ' + quantidade + ' ' + itemNome + '(s) do pedido?';

if Application.MessageBox(PChar(textoMsg),'Excluir item',mb_yesno + mb_iconquestion) = id_yes then
    Begin
      fNovoPedido.deletaItemPedido(itemId);
      fNovoPedido.atualizaGridItens();
      fNovoPedido.recalculaValorPedido();
    End
    else begin
      ShowMessage('nao');
    end;
end;

procedure TfNovoPedido.dbgProdutosDblClick(Sender: TObject);
var
  idPedido: Integer;
  produto_id: Integer;
  preco_unitario: Currency;
  valor_total: Double;
  quantidade: String;
  soma: Double;
begin
  idPedido := fPrincipal.GetPedidoId;
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
  fNovoPedido.atualizaGridItens();

 fdqSomaItens.SQL.Clear;
 fdqSomaItens.SQL.Add('SELECT SUM(valor_total) AS soma FROM pedidos_itens WHERE pedido_id = :idPedido');
 fdqSomaItens.ParamByName('idPedido').Value := idPedido;
 fdqSomaItens.Open();
 soma := fdqSomaItens.FieldByName('soma').AsFloat;
 lblValor.Caption := 'Valor Total: R$ ' + soma.ToString;

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

procedure TfNovoPedido.dbgItensPedidoDblClick(Sender: TObject);
var
  idPedido:       Integer;
  item_id:        Integer;
  produto_id:     Integer;
  preco_unitario: Currency;
  valor_total:    Double;
  quantidade:     String;
  soma:           Double;
begin
  idPedido := fPrincipal.GetPedidoId;
  item_id  := dbgItensPedido.DataSource.DataSet.FieldByName('id').AsInteger;

  ShowMessage(item_id.ToString);

  quantidade := dbgItensPedido.DataSource.DataSet.FieldByName('quantidade').AsString;
  if InputQuery('Quantidade', 'Insira a quantidade', quantidade) then begin
    produto_id  := dbgItensPedido.DataSource.DataSet.FieldByName('produto_id').AsInteger;
    fdqAtualizaPedido.SQL.Clear;
    fdqAtualizaPedido.SQL.Add('SELECT * FROM produtos WHERE id = :produto');
    fdqAtualizaPedido.ParamByName('produto').Value := produto_id;
    fdqAtualizaPedido.Open();

    preco_unitario := fdqAtualizaPedido.FieldByName('preco').AsCurrency;
    valor_total := preco_unitario * quantidade.ToDouble;

    fdqAtualizaPedido.SQL.Clear;
    fdqAtualizaPedido.SQL.Add('UPDATE pedidos_itens SET valor_total = :valorTotal, quantidade = :quantidade');
    fdqAtualizaPedido.SQL.Add('WHERE pedido_id = :pedido');
    fdqAtualizaPedido.SQL.Add('AND id = :item_id');
    fdqAtualizaPedido.ParamByName('valorTotal').Value := valor_total;
    fdqAtualizaPedido.ParamByName('quantidade').Value := quantidade.ToDouble;
    fdqAtualizaPedido.ParamByName('pedido').Value     := idPedido;
    fdqAtualizaPedido.ParamByName('item_id').Value    := item_id;
    fdqAtualizaPedido.ExecSQL;
    fdqAtualizaPedido.SQL.Clear;

    fNovoPedido.atualizaGridItens();
    fNovoPedido.recalculaValorPedido();
  end;
end;

procedure TfNovoPedido.atualizaFichaDisponivel(ficha: Integer);
begin
  fdqFichaDisponivel.SQL.Clear;
  fdqFichaDisponivel.SQL.Add('UPDATE fichas SET disponivel = false WHERE id = :ficha');
  fdqFichaDisponivel.ParamByName('ficha').Value := ficha;
  fdqFichaDisponivel.ExecSQL;
end;

procedure TfNovoPedido.atualizaGridItens();
var
  idPedido: Integer;
begin
  idPedido := fPrincipal.GetPedidoId;

  fdqItensPedido.SQL.Clear;
  fdqItensPedido.SQL.Add('SELECT * FROM pedidos_itens AS itens');
  fdqItensPedido.SQL.Add('INNER JOIN produtos ON produtos.id = itens.produto_id');
  fdqItensPedido.SQL.Add('WHERE pedido_id = :idPedido');
  fdqItensPedido.SQL.Add('ORDER BY itens.id');
  fdqItensPedido.ParamByName('idPedido').Value := idPedido;
  fdqItensPedido.Open();
end;

procedure TfNovoPedido.deletaItemPedido(idItem: Integer);
begin
  fdqAtualizaPedido.SQL.Clear;
  fdqAtualizaPedido.SQL.Add('DELETE FROM pedidos_itens WHERE id = :item');
  fdqAtualizaPedido.ParamByName('item').Value := idItem;
  fdqAtualizaPedido.ExecSQL();
end;

procedure TfNovoPedido.deletaPedido(idPedido: Integer);
begin
  fdqDeletePedido.SQL.Clear;
  fdqDeletePedido.SQL.Add('DELETE FROM pedidos');
  fdqDeletePedido.SQL.Add('WHERE id = :pedido');
  fdqDeletePedido.ParamByName('pedido').Value := idPedido;
  fdqDeletePedido.ExecSQL;
  fdqDeletePedido.Close;
end;

procedure TfNovoPedido.deletaTodosItemsByPedido(idPedido: Integer);
begin
  fdqDeletePedido.SQL.Clear;
  fdqDeletePedido.SQL.Add('DELETE FROM pedidos_itens');
  fdqDeletePedido.SQL.Add('WHERE pedido_id = :pedido');
  fdqDeletePedido.ParamByName('pedido').Value := idPedido;
  fdqDeletePedido.ExecSQL;
end;

Function TfNovoPedido.getFichaDisponivel(ficha: Integer) : Boolean;
begin
  fdqFichaDisponivel.SQL.Clear;
  fdqFichaDisponivel.SQL.Add('SELECT * FROM fichas');
  fdqFichaDisponivel.SQL.Add('WHERE numero_ficha = :ficha');
  fdqFichaDisponivel.SQL.Add('AND disponivel = true');
  fdqFichaDisponivel.ParamByName('ficha').Value := ficha;
  fdqFichaDisponivel.Open();

  Result := fdqFichaDisponivel.RecordCount > 0;
end;

procedure TfNovoPedido.recalculaValorPedido();
var
  idPedido: Integer;
  soma:     Double;
begin
  idPedido := fPrincipal.GetPedidoId;

  fdqSomaItens.SQL.Clear;
  fdqSomaItens.SQL.Add('SELECT SUM(valor_total) AS soma FROM pedidos_itens WHERE pedido_id = :idPedido');
  fdqSomaItens.ParamByName('idPedido').Value := idPedido;
  fdqSomaItens.Open();
  soma := fdqSomaItens.FieldByName('soma').AsFloat;
  lblValor.Caption := 'Valor Total: R$ ' + soma.ToString;
end;

end.
