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
    procedure edtNumeroFichaChange(Sender: TObject);
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

procedure TfPagamento.edtNumeroFichaChange(Sender: TObject);
var
  ultimo_pedido: Integer;
begin
  if edtNumeroFicha.Text <> '' then begin
    fdqPedidoByFicha.SQL.Clear;
    fdqItensByPedido.SQL.Clear;
    fdqPedidoByFicha.SQL.Add('SELECT MAX(id) AS ultimo_pedido, *');
    fdqPedidoByFicha.SQL.Add('FROM pedidos');
    fdqPedidoByFicha.SQL.Add('WHERE numero_ficha = :ficha');
    fdqPedidoByFicha.SQL.Add('GROUP BY id');
    fdqPedidoByFicha.ParamByName('ficha').Value := StrToInt(edtNumeroFicha.Text);
    fdqPedidoByFicha.Open();

    ultimo_pedido := fdqPedidoByFicha.FieldByName('ultimo_pedido').AsInteger;
    fdqItensByPedido.SQL.Add('SELECT * from pedidos_itens AS itens');
    fdqItensByPedido.SQL.Add('INNER JOIN produtos ON produtos.id = itens.produto_id');
    fdqItensByPedido.SQL.Add('WHERE itens.pedido_id = :pedido');
    fdqItensByPedido.ParamByName('pedido').Value := ultimo_pedido;
    fdqItensByPedido.Open();

  end;
end;

end.
