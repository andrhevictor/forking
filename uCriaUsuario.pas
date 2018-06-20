unit uCriaUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls, StrUtils;

type
  TfAdicionaUsuario = class(TForm)
    panelTop: TPanel;
    panelMid: TPanel;
    edtNomeCompleto: TEdit;
    edtLogin: TEdit;
    edtConfirmaSenha: TEdit;
    edtSenha: TEdit;
    cmbNivelAcesso: TComboBox;
    lblNomeCompleto: TLabel;
    lblLogin: TLabel;
    lblSenha: TLabel;
    lblConfirmaSenha: TLabel;
    lblNivelAcesso: TLabel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    fdqUsuario: TFDQuery;
    procedure btnSalvarClick(Sender: TObject);
    Function senhaEqualsConfirmacao(senha, confirmaSenha : String) : Boolean;
    Function camposValidos() : Boolean;
    procedure insereUsuario(nomeCompleto, login, senha : String; nivelAcesso: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAdicionaUsuario: TfAdicionaUsuario;

implementation

{$R *.dfm}

uses dmDados, uMd5;

procedure TfAdicionaUsuario.btnSalvarClick(Sender: TObject);
var
  nomeCompleto: String;
  login: String;
  senha: String;
  confirmacaoSenha: String;
  nivelAcesso: Integer;
begin
  nomeCompleto     := edtNomeCompleto.Text;
  login            := edtLogin.Text;
  senha            := edtSenha.Text;
  confirmacaoSenha := edtConfirmaSenha.Text;
  nivelAcesso      := cmbNivelAcesso.Items[cmbNivelAcesso.ItemIndex].ToInteger;

  if senhaEqualsConfirmacao(senha, confirmacaoSenha) then begin
    fAdicionaUsuario.insereUsuario(nomeCompleto, login, senha, nivelAcesso);
    ShowMessage('Usuário criado com sucesso!');
  end
  else begin
    ShowMessage('A senha e a confirmação devem ser iguais.');
  end;

end;

function TfAdicionaUsuario.camposValidos: Boolean;
var
  I: Integer;
begin

  for I := 0 to ComponentCount - 1 do
  begin
    if Components[I].ClassType = TEdit then
    if TEdit(Components[I]).Text = '' then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

procedure TfAdicionaUsuario.insereUsuario(nomeCompleto, login, senha: String; nivelAcesso: Integer);
begin
  senha := uMd5.MD5String(senha);

  fdqUsuario.SQL.Clear();
  fdqUsuario.SQL.Add('INSERT INTO usuarios VALUES (DEFAULT, :nome, :login, :senha, :nivel_acesso)');
  fdqUsuario.ParamByName('nome').Value         := nomeCompleto;
  fdqUsuario.ParamByName('login').Value        := login;
  fdqUsuario.ParamByName('senha').Value        := senha;
  fdqUsuario.ParamByName('nivel_acesso').Value := nivelAcesso;
  fdqUsuario.ExecSQL();
end;

function TfAdicionaUsuario.senhaEqualsConfirmacao(senha, confirmaSenha: String): Boolean;
begin
  if senha <> '' then
  if confirmaSenha <> '' then begin
    Result := senha = confirmaSenha;
  end
  else begin
    Result := false;
  end;

end;

end.
