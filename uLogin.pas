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
  private
    usuario_id : Integer;
  public
    { Public declarations }
  end;

var
  fLogin: TfLogin;

implementation

{$R *.dfm}

uses dmDados, uPrincipal;

  function TfLogin.GetUsuarioId: Integer;
  begin
    Result := fLogin.usuario_id;
  end;

procedure TfLogin.btnEntrarClick(Sender: TObject);
  var
    n: Integer;
begin

    fdqUsuario.SQL.Text := 'SELECT * FROM usuarios WHERE login = :u AND senha = :s';
    fdqUsuario.Params.ParamByName('u').Value := edtUsuario.Text;
    fdqUsuario.Params.ParamByName('s').Value := edtSenha.Text;

    fdqUsuario.Open;

    n := fdqUsuario.RecordCount;

    if(n > 0) then begin
      usuario_id := fdqUsuario.FieldByName('id').AsInteger;
      fLogin.Hide;
      fPrincipal.Show;
    end
    else begin
    ShowMessage('Usuario ou senha invalido!');
    end


end;

end.
