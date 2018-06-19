unit uEditaPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfEditaPedido = class(TForm)
    panelMid: TPanel;
    panelTop: TPanel;
    lblNumeroPedido: TLabel;
    lblStatus: TLabel;
    dbgItensPedido: TDBGrid;
    lblItens: TLabel;
    btnSalvar: TButton;
    fdqItensPedido: TFDQuery;
    dsItensPedido: TDataSource;
  private
    idPedido: Integer;
  public
    constructor Create(AOwner: TComponent; pedidoId: String);
  end;

var
  fEditaPedido: TfEditaPedido;

implementation

{$R *.dfm}

Constructor TfEditaPedido.Create(AOwner: TComponent; pedidoId: String);
begin
  inherited Create(AOwner);
  idPedido := pedidoId.ToInteger();
  fdqItensPedido.SQL.Clear;
  fdqItensPedido.SQL.Add('SELECT * FROM pedidos_itens AS itens');
  fdqItensPedido.SQL.Add('INNER JOIN produtos ON produtos.id = itens.produto_id');
  fdqItensPedido.SQL.Add('WHERE pedido_id = :idPedido');
  fdqItensPedido.ParamByName('idPedido').Value := idPedido;
  fdqItensPedido.Open();
end;

end.
