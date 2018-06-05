unit uNovoPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
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

Constructor TfNovoPedido.Create(AOwner : TComponent; pedidoId : String);
begin
  inherited Create(AOwner);
  idPedido := pedidoId.ToInteger();
end;

procedure TfNovoPedido.dbgProdutosDblClick(Sender: TObject);
var
quantidade: String;
begin
  quantidade := '1';
  if InputQuery('Quantidade', 'Insira a quantidade', quantidade)  then begin
     fdqItensPedido.SQL.Clear;
     fdqItensPedido.SQL.Add('INSERT INTO pedidos_itens VALUES ()');
  end;
  fdqItensPedido.SQL.Clear;
  fdqItensPedido.SQL.Add('SELECT * FROM pedidos_itens');
  fdqItensPedido.Open();

end;

procedure TfNovoPedido.dbgCategoriaCellClick(Column: TColumn);
var
categoria_id : Integer;
begin
  fdqProdutos.SQL.Clear;
  categoria_id := dbgCategoria.DataSource.DataSet.FieldByName('id').AsInteger;
  fdqProdutos.SQL.Add('SELECT * FROM produtos');
  fdqProdutos.SQL.Add('WHERE categoria_id = :id');
  fdqProdutos.ParamByName('id').Value := categoria_id;
  fdqProdutos.Open();
end;

end.
