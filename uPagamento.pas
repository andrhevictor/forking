unit uPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfPagamento = class(TForm)
    panelMid: TPanel;
    panelTop: TPanel;
    fdqPagamento: TFDQuery;
    dsPagamento: TDataSource;
    edtNumeroFicha: TEdit;
    fdqPagamentoid: TLargeintField;
    fdqPagamentopedido_id: TLargeintField;
    fdqPagamentomeios_pagamento_id: TLargeintField;
    lblNumeroPedido: TLabel;
    lblMeioPagament: TLabel;
    dsMeioPagamento: TDataSource;
    fdqMeioPagamento: TFDQuery;
    grdListaProdutos: TDBGrid;
    lblListaProdutos: TLabel;
    fdqPagamentovalor: TBCDField;
    fdqPedidoByFicha: TFDQuery;
    dsItensPedido: TDataSource;
    dsPedido: TDataSource;
    fdqItensByPedido: TFDQuery;
    fdqSomaItens: TFDQuery;
    btnPagar: TButton;
    rdbDinheiro: TRadioButton;
    rdbCartao: TRadioButton;
    lblPedido: TLabel;
    lblValorTotal: TLabel;
    lblValor: TLabel;
    lblFicha: TLabel;
    procedure edtNumeroFichaChange(Sender: TObject);
    procedure btnPagarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPagamento: TfPagamento;

implementation

{$R *.dfm}

uses dmDados, uCadastraProduto, uEditaProduto, uPrincipal, uVisualizaFichas,
  uVisualizaProduto;


procedure TfPagamento.btnPagarClick(Sender: TObject);
var
  id_meio_pagamento: Integer;
  pedido: String;
begin
  if rdbDinheiro.Checked or rdbCartao.Checked then begin
    if rdbDinheiro.Checked then begin
      id_meio_pagamento := 1;
    end
    else begin
      id_meio_pagamento := 2;
    end;
    fdqPagamento.SQL.Clear;
    fdqPagamento.SQL.Add('INSERT INTO pagamentos');
    fdqPagamento.SQL.Add('VALUES (DEFAULT, :pedido, :meio_pagamento, :valor)');
    fdqPagamento.ParamByName('pedido').Value         := fdqItensByPedido.FieldByName('pedido_id').AsInteger;
    fdqPagamento.ParamByName('meio_pagamento').Value := id_meio_pagamento;
    fdqPagamento.ParamByName('valor').Value          := fdqSomaItens.FieldByName('soma').AsFloat;
    fdqPagamento.ExecSQL;

    fdqPedidoByFicha.SQL.Clear;
    fdqPedidoByFicha.SQL.Add('UPDATE pedidos SET status = :status');
    fdqPedidoByFicha.SQL.Add('WHERE id = :pedido');
    fdqPedidoByFicha.ParamByName('status').Value := 'FECHADO';
    fdqPedidoByFicha.ParamByName('pedido').Value := fdqItensByPedido.FieldByName('pedido_id').AsInteger;
    fdqPedidoByFicha.ExecSQL;
    fdqPedidoByFicha.SQL.Clear;

    pedido := fdqItensByPedido.FieldByName('pedido_id').AsString;
    ShowMessage('Pedido ' + pedido + ' pago com sucesso!');
    edtNumeroFicha.Text := '';
  end
  else begin
    ShowMessage('Selecione um método de pagamento!');
  end;

end;

procedure TfPagamento.edtNumeroFichaChange(Sender: TObject);
var
  item: TField;
  somaTotal: Double;
  ultimo_pedido: Integer;
  //status: string;
begin
  if edtNumeroFicha.Text <> '' then begin
    fdqPedidoByFicha.SQL.Clear;
    fdqItensByPedido.SQL.Clear;
    fdqPedidoByFicha.SQL.Add('SELECT MAX(id) AS ultimo_pedido FROM pedidos');
    fdqPedidoByFicha.SQL.Add('WHERE numero_ficha = :ficha');
    fdqPedidoByFicha.SQL.Add('AND status = :status');
    fdqPedidoByFicha.ParamByName('ficha').Value := StrToInt(edtNumeroFicha.Text);
    fdqPedidoByFicha.ParamByName('status').Value := 'EM ABERTO';
    fdqPedidoByFicha.Open();
    ultimo_pedido := fdqPedidoByFicha.FieldByName('ultimo_pedido').AsInteger;
    //status := fdqPedidoByFicha.FieldByName('status').AsString;

    //ShowMessage(ultimo_pedido.ToString);
    //ShowMessage(status);
    //if True then

    fdqItensByPedido.SQL.Add('SELECT * from pedidos_itens AS itens');
    fdqItensByPedido.SQL.Add('INNER JOIN produtos ON produtos.id = itens.produto_id');
    fdqItensByPedido.SQL.Add('WHERE itens.pedido_id = :pedido');
    fdqItensByPedido.ParamByName('pedido').Value := ultimo_pedido;
    fdqItensByPedido.Open();

    fdqSomaItens.SQL.Clear;
    fdqSomaItens.SQL.Add('SELECT SUM(valor_total) AS soma FROM pedidos_itens WHERE pedido_id = :idPedido');
    fdqSomaItens.ParamByName('idPedido').Value := ultimo_pedido;
    fdqSomaItens.Open();
    somaTotal := fdqSomaItens.FieldByName('soma').AsFloat;

    lblPedido.Caption := fdqItensByPedido.FieldByName('pedido_id').AsString;
    lblValor.Caption  := somaTotal.ToString;

    if fdqItensByPedido.RecordCount = 0 then begin
      ShowMessage('Não há pedido para essa ficha');
      edtNumeroFicha.Text := '';
    end;
  end
  else begin
    fdqPedidoByFicha.SQL.Clear;
    fdqItensByPedido.SQL.Clear;
    lblPedido.Caption := '--';
    lblValor.Caption := '0.00';
  end;
end;

end.
