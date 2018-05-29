unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, Vcl.StdCtrls;

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
    procedure Cadastrar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

{$R *.dfm}

uses dmDados, uVisualizaProduto;

procedure TfPrincipal.Cadastrar1Click(Sender: TObject);
begin
  fVisualizarProduto.Show;
end;

end.
