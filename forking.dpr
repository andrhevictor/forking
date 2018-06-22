program forking;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {fPrincipal},
  dmDados in 'dmDados.pas' {dmConnection: TDataModule},
  uVisualizaProduto in 'uVisualizaProduto.pas' {fVisualizarProduto},
  uCadastraProduto in 'uCadastraProduto.pas' {fCadastraProduto},
  uEditaProduto in 'uEditaProduto.pas' {fEditaProduto},
  uVisualizaFichas in 'uVisualizaFichas.pas' {fVisualizaFichas},
  uPagamento in 'uPagamento.pas' {fPagamento},
  uLogin in 'uLogin.pas' {fLogin},
  uNovoPedido in 'uNovoPedido.pas' {fNovoPedido},
  uOpcaoRelatorioProdutos in 'uOpcaoRelatorioProdutos.pas' {fOpcaoRelatorioProduto},
  uEditaPedido in 'uEditaPedido.pas' {fEditaPedido},
  uVisualizaPedido in 'uVisualizaPedido.pas' {fVisualizaPedidos},
  uMd5 in 'uMd5.pas',
  uCriaUsuario in 'uCriaUsuario.pas' {fAdicionaUsuario},
  uVisualizaUsuarios in 'uVisualizaUsuarios.pas' {fVisualizaUsuarios};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfLogin, fLogin);
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.CreateForm(TdmConnection, dmConnection);
  Application.CreateForm(TfVisualizarProduto, fVisualizarProduto);
  Application.CreateForm(TfCadastraProduto, fCadastraProduto);
  Application.CreateForm(TfEditaProduto, fEditaProduto);
  Application.CreateForm(TfVisualizaFichas, fVisualizaFichas);
  Application.CreateForm(TfPagamento, fPagamento);
  Application.CreateForm(TfNovoPedido, fNovoPedido);
  Application.CreateForm(TfOpcaoRelatorioProduto, fOpcaoRelatorioProduto);
  Application.CreateForm(TfEditaPedido, fEditaPedido);
  Application.CreateForm(TfVisualizaPedidos, fVisualizaPedidos);
  Application.CreateForm(TfAdicionaUsuario, fAdicionaUsuario);
  Application.CreateForm(TfVisualizaUsuarios, fVisualizaUsuarios);
  Application.Run;
end.
