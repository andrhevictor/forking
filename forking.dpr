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
  uRelatorio in 'uRelatorio.pas' {fRelatorios};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.CreateForm(TfLogin, fLogin);
  Application.CreateForm(TdmConnection, dmConnection);
  Application.CreateForm(TfVisualizarProduto, fVisualizarProduto);
  Application.CreateForm(TfCadastraProduto, fCadastraProduto);
  Application.CreateForm(TfEditaProduto, fEditaProduto);
  Application.CreateForm(TfVisualizaFichas, fVisualizaFichas);
  Application.CreateForm(TfPagamento, fPagamento);
  Application.CreateForm(TfNovoPedido, fNovoPedido);
  Application.CreateForm(TfRelatorios, fRelatorios);
  Application.Run;
end.
