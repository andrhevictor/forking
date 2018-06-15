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
    lblFicha: TLabel;
    fdqPagamentoid: TLargeintField;
    fdqPagamentopedido_id: TLargeintField;
    fdqPagamentomeios_pagamento_id: TLargeintField;
    lblNumeroPedido: TLabel;
    edtNumeroPedido: TDBEdit;
    lblMeioPagament: TLabel;
    lblValor: TLabel;
    lcbMeioPagamento: TDBLookupComboBox;
    dsMeioPagamento: TDataSource;
    fdqMeioPagamento: TFDQuery;
    grdListaProdutos: TDBGrid;
    lblListaProdutos: TLabel;
    edtValorTotal: TDBEdit;
    fdqPagamentovalor: TBCDField;
    fdqPedidoByFicha: TFDQuery;
    dsItensPedido: TDataSource;
    dsPedido: TDataSource;
    fdqItensByPedido: TFDQuery;
    fdqSomaItens: TFDQuery;
    btnPagar: TButton;
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
begin
  fdqPagamento.Post;
  fdqPagamento.Close;
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
    fdqPedidoByFicha.SQL.Add('SELECT MAX(id) AS ultimo_pedido');
    fdqPedidoByFicha.SQL.Add('FROM pedidos');
    fdqPedidoByFicha.SQL.Add('WHERE numero_ficha = :ficha');
    fdqPedidoByFicha.ParamByName('ficha').Value := StrToInt(edtNumeroFicha.Text);
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

    edtNumeroPedido.Text := fdqItensByPedido.FieldByName('pedido_id').AsString;
    edtValorTotal.Text   := somaTotal.ToString;

  end;
end;

end.
