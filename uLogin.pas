unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfLogin = class(TForm)
    panelTop: TPanel;
    panelMid: TPanel;
    lblMarca: TLabel;
    dsUsuario: TDataSource;
    fdqUsuario: TFDQuery;
    lblUsuario: TLabel;
    lblSenha: TLabel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    btnEntrar: TButton;
    procedure btnEntrarClick(Sender: TObject);
    function GetUsuarioId: Integer;
    function GetNivelAcesso: Integer;
  private
    usuario_id:   Integer;
    nivel_acesso: Integer;
  public
    { Public declarations }
  end;

var
  fLogin: TfLogin;

implementation

{$R *.dfm}

uses dmDados, uPrincipal, uMd5;

function TfLogin.GetNivelAcesso: Integer;
begin
  Result := fLogin.usuario_id;
end;

function TfLogin.GetUsuarioId: Integer;
begin
  Result := fLogin.usuario_id;
end;

procedure TfLogin.btnEntrarClick(Sender: TObject);
  var
    n: Integer;
    senha: String;
    usuario: String;
begin
    senha   := uMd5.MD5String(edtSenha.Text);
    usuario := edtUsuario.Text;

    fdqUsuario.SQL.Text := 'SELECT * FROM usuarios WHERE login = :usuario AND senha = :senha';
    fdqUsuario.Params.ParamByName('usuario').Value := usuario;
    fdqUsuario.Params.ParamByName('senha').Value   := senha;

    fdqUsuario.Open;

    n := fdqUsuario.RecordCount;

    if(n > 0) then begin
      usuario_id   := fdqUsuario.FieldByName('id').AsInteger;
      nivel_acesso := fdqUsuario.FieldByName('nivel_acesso').AsInteger;

      fPrincipal.Show();
    end
    else begin
      ShowMessage('Usuario ou senha invalido!');
    end


end;

end.
