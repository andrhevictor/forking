program forking;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {fPrincipal},
  dmDados in 'dmDados.pas' {dmConnection: TDataModule},
  uCadastraProduto in 'uCadastraProduto.pas' {fCadastraProduto};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.CreateForm(TdmConnection, dmConnection);
  Application.CreateForm(TfCadastraProduto, fCadastraProduto);
  Application.Run;
end.
