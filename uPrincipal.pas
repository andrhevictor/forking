unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfPrincipal = class(TForm)
    panelTop: TPanel;
    panelMid: TPanel;
    btnNovoPedido: TButton;
    mmMenu: TMainMenu;
    Produtos1: TMenuItem;
    Cadastrar1: TMenuItem;
    Editar1: TMenuItem;
    VisualizarTodos1: TMenuItem;
    Fichas1: TMenuItem;
    VisualizarTodas1: TMenuItem;
    btnPagamento: TButton;
    fdqInserePedido: TFDQuery;
    Relatrios1: TMenuItem;
    Arquivo1: TMenuItem;
    Sobre1: TMenuItem;
    Sair1: TMenuItem;
    N1: TMenuItem;
    SobreoSistema1: TMenuItem;
    Ajuda1: TMenuItem;
    Produtos2: TMenuItem;
    Pedidos1: TMenuItem;
    Usurios1: TMenuItem;
    AdicionarUsuario1: TMenuItem;
    VisualizarUsurios1: TMenuItem;
    btnEditarPedido: TButton;
    fdqLastPedidoFicha: TFDQuery;
    procedure SetPedidoId(idPedido: Integer);
    procedure Cadastrar1Click(Sender: TObject);
    procedure VisualizarTodos1Click(Sender: TObject);
    procedure Editar1Click(Sender: TObject);
    procedure VisualizarTodas1Click(Sender: TObject);
    procedure btnPagamentoClick(Sender: TObject);
    procedure btnNovoPedidoClick(Sender: TObject);
    procedure Produtos2Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Pedidos1Click(Sender: TObject);
    procedure AdicionarUsuario1Click(Sender: TObject);
    procedure VisualizarUsurios1Click(Sender: TObject);
    procedure btnEditarPedidoClick(Sender: TObject);
    Function  getLastPedidoAbertoByFicha(ficha: Integer) : Integer;
    procedure FormShow(Sender: TObject);
  private
    id_pedido: Integer;
  public
    Function GetPedidoId: Integer;
  end;

var
  fPrincipal: TfPrincipal;

implementation

{$R *.dfm}

uses dmDados, uVisualizaProduto, uCadastraProduto, uEditaProduto,
  uVisualizaFichas, uPagamento, uLogin, uNovoPedido, uRelatorio,
  uOpcaoRelatorioProdutos, uVisualizaPedido, uEditaPedido, uCriaUsuario,
  uVisualizaUsuarios;

function TfPrincipal.GetPedidoId: Integer;
begin
  Result := fPrincipal.id_pedido;
end;

procedure TfPrincipal.SetPedidoId(idPedido: Integer);
begin
  id_pedido := idPedido;
end;

procedure TfPrincipal.AdicionarUsuario1Click(Sender: TObject);
begin
  fAdicionaUsuario.Show();
end;

procedure TfPrincipal.btnEditarPedidoClick(Sender: TObject);
var
  fichaInput: String;
  ficha:      Integer;
  pedidoId:   Integer;
begin
   if InputQuery('Número da ficha: ', 'Insira o número da ficha', fichaInput) then begin
      ficha    := fichaInput.ToInteger();
      pedidoId := fPrincipal.getLastPedidoAbertoByFicha(ficha);
      if pedidoId <> 0 then begin
        fPrincipal.SetPedidoId(pedidoId);
        fNovoPedido.Show();
      end
      else begin
        ShowMessage('Não há pedidos em aberto para a ficha número ' + fichaInput);
      end;
   end;
end;

procedure TfPrincipal.btnNovoPedidoClick(Sender: TObject);
var
  usuarioId: Integer;
begin
  usuarioId := fLogin.GetUsuarioId;
  fdqInserePedido.SQL.Clear;
  fdqInserePedido.SQL.Add('INSERT INTO pedidos VALUES (DEFAULT, NULL, :status, :idUsuario, date_trunc(''minute'', LOCALTIMESTAMP))');
  fdqInserePedido.ParamByName('status').Value := 'EM ABERTO';
  fdqInserePedido.ParamByName('idUsuario').Value := usuarioId;
  fdqInserePedido.SQL.Add('RETURNING id');
  fdqInserePedido.Open();

  id_pedido := fdqInserePedido.FieldByName('id').AsInteger;

  fNovoPedido.Show();
end;

procedure TfPrincipal.btnPagamentoClick(Sender: TObject);
begin
  fPagamento.Show;
end;

procedure TfPrincipal.Cadastrar1Click(Sender: TObject);
begin
  fCadastraProduto.Show;
end;

procedure TfPrincipal.Editar1Click(Sender: TObject);
begin
  fEditaProduto.Show;
end;

procedure TfPrincipal.FormShow(Sender: TObject);
var
  nivel_acesso: Integer;
begin
  nivel_acesso := fLogin.GetNivelAcesso();

  if nivel_acesso = 1 then begin
      mmMenu.Items[4].Enabled := False;
  end;

end;

function TfPrincipal.getLastPedidoAbertoByFicha(ficha: Integer): Integer;
begin
  fdqLastPedidoFicha.SQL.Clear;
  fdqLastPedidoFicha.SQL.Add('SELECT MAX(id) AS ultimo_pedido FROM pedidos');
  fdqLastPedidoFicha.SQL.Add('WHERE numero_ficha = :ficha');
  fdqLastPedidoFicha.SQL.Add('AND status = :status');
  fdqLastPedidoFicha.ParamByName('ficha').Value := ficha;
  fdqLastPedidoFicha.ParamByName('status').Value := 'EM ABERTO';
  fdqLastPedidoFicha.Open();

  Result := fdqLastPedidoFicha.FieldByName('ultimo_pedido').AsInteger;
end;

procedure TfPrincipal.Pedidos1Click(Sender: TObject);
begin
  fVisualizaPedidos.Show;
end;

procedure TfPrincipal.Produtos2Click(Sender: TObject);
begin
  fOpcaoRelatorioProduto.Show;
end;

procedure TfPrincipal.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfPrincipal.VisualizarTodas1Click(Sender: TObject);
begin
  fVisualizaFichas.Show;
end;

procedure TfPrincipal.VisualizarTodos1Click(Sender: TObject);
begin
  fVisualizarProduto.Show;
end;

procedure TfPrincipal.VisualizarUsurios1Click(Sender: TObject);
begin
 fVisualizaUsuarios.Show;
end;

end.
