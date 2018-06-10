unit uOpcaoRelatorioProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfOpcaoRelatorioProduto = class(TForm)
    panelTop: TPanel;
    panelMid: TPanel;
    lblTituloRelatorio: TLabel;
    btnGerarRelatorio: TButton;
    dtmInicial: TDateTimePicker;
    dtmFinal: TDateTimePicker;
    lblAte: TLabel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    procedure btnGerarRelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fOpcaoRelatorioProduto: TfOpcaoRelatorioProduto;

implementation

{$R *.dfm}

uses dmDados, uRelatorio, uCadastraProduto, uEditaProduto, uLogin, uNovoPedido,
  uPagamento, uPrincipal, uVisualizaFichas, uVisualizaProduto;

procedure TfOpcaoRelatorioProduto.btnGerarRelatorioClick(Sender: TObject);
var path: string;
begin
  path := ExtractFilePath(Application.ExeName);
  fRelatorios.frxProdutos.LoadFromFile(path+'relProdutos.fr3');
  fRelatorios.frxProdutos.ShowReport();
end;

end.
