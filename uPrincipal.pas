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
    procedure Cadastrar1Click(Sender: TObject);
    procedure VisualizarTodos1Click(Sender: TObject);
    procedure Editar1Click(Sender: TObject);
    procedure VisualizarTodas1Click(Sender: TObject);
    procedure btnPagamentoClick(Sender: TObject);
    procedure btnNovoPedidoClick(Sender: TObject);
    procedure Produtos2Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Pedidos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

{$R *.dfm}

uses dmDados, uVisualizaProduto, uCadastraProduto, uEditaProduto,
  uVisualizaFichas, uPagamento, uLogin, uNovoPedido, uRelatorio,
  uOpcaoRelatorioProdutos, uVisualizaPedido, uEditaPedido;

procedure TfPrincipal.btnNovoPedidoClick(Sender: TObject);
var
  pedidoId: String;
  usuarioId: Integer;
begin
  usuarioId := 1;                     // MUDAR AQUI ASDOAHSDUIAHSIDA
  fdqInserePedido.SQL.Clear;
  fdqInserePedido.SQL.Add('INSERT INTO pedidos VALUES (DEFAULT, NULL, :status, :idUsuario, date_trunc(''minute'', LOCALTIMESTAMP))');
  fdqInserePedido.ParamByName('status').Value := 'EM ABERTO';
  fdqInserePedido.ParamByName('idUsuario').Value := usuarioId;
  fdqInserePedido.SQL.Add('RETURNING id');
  fdqInserePedido.Open();


  pedidoId := fdqInserePedido.FieldByName('id').AsString;
//  ShowMessage(pedidoId);

  With TfNovoPedido.Create(self, pedidoId) do
    Begin
      ShowModal;
      Free;
    End;
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

end.
