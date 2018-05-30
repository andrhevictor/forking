program forking;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {fPrincipal},
  dmDados in 'dmDados.pas' {dmConnection: TDataModule},
  uVisualizaProduto in 'uVisualizaProduto.pas' {fVisualizarProduto},
  uCadastraProduto in 'uCadastraProduto.pas' {fCadastraProduto},
  uEditaProduto in 'uEditaProduto.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.CreateForm(TdmConnection, dmConnection);
  Application.CreateForm(TfVisualizarProduto, fVisualizarProduto);
  Application.CreateForm(TfCadastraProduto, fCadastraProduto);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
