unit uVisualizaFichas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls;

type
  TfVisualizaFichas = class(TForm)
    panelTop: TPanel;
    panelMid: TPanel;
    fdqFichas: TFDQuery;
    dsFichas: TDataSource;
    dbgFichas: TDBGrid;
    dbgPedido: TDBGrid;
    lblValorTotal: TLabel;
    lblPedidoID: TLabel;
    fdqPedidoByFicha: TFDQuery;
    dsPedidoByFicha: TDataSource;
    lblStatusPedido: TLabel;
    fdqSomaValorPedido: TFDQuery;
    procedure dbgFichasCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fVisualizaFichas: TfVisualizaFichas;

implementation

{$R *.dfm}

uses dmDados;

procedure TfVisualizaFichas.dbgFichasCellClick(Column: TColumn);
var
  valor_total: Double;
  pedido_id: Integer;
  ficha: Integer;
begin
  ficha := dbgFichas.DataSource.DataSet.FieldByName('id').AsInteger;

  fdqPedidoByFicha.SQL.Clear;
  fdqPedidoByFicha.SQL.Add('SELECT id FROM pedidos');
  fdqPedidoByFicha.SQL.Add('WHERE numero_ficha = :ficha');
  fdqPedidoByFicha.SQL.Add('ORDER BY id DESC');
  fdqPedidoByFicha.SQL.Add('LIMIT 1');
  fdqPedidoByFicha.ParamByName('ficha').Value := ficha;
  fdqPedidoByFicha.Open();
  pedido_id := fdqPedidoByFicha.FieldByName('id').AsInteger;

  fdqPedidoByFicha.SQL.Clear;
  fdqPedidoByFicha.SQL.Add('SELECT * FROM pedidos_itens');
  fdqPedidoByFicha.SQL.Add('INNER JOIN pedidos ON pedidos.id = pedidos_itens.pedido_id');
  fdqPedidoByFicha.SQL.Add('INNER JOIN produtos ON produtos.id = pedidos_itens.produto_id');
  fdqPedidoByFicha.SQL.Add('WHERE pedidos_itens.pedido_id = :pedido_id');
  fdqPedidoByFicha.ParamByName('pedido_id').Value := pedido_id;
  fdqPedidoByFicha.Open();

  fdqSomaValorPedido.SQL.Clear;
  fdqSomaValorPedido.SQL.Add('SELECT SUM(valor_total) AS soma FROM pedidos_itens WHERE pedido_id = :idPedido');
  fdqSomaValorPedido.ParamByName('idPedido').Value := pedido_id;
  fdqSomaValorPedido.Open();

  valor_total := fdqSomaValorPedido.FieldByName('soma').AsFloat;
  lblValorTotal.Caption   := 'Valor Total: R$ ' + valor_total.ToString;
  lblPedidoID.Caption     := 'Número do Pedido: ' + fdqPedidoByFicha.FieldByName('pedido_id').AsString;
  lblStatusPedido.Caption := 'Status do Pedido: ' + fdqPedidoByFicha.FieldByName('status').AsString;
end;

end.
