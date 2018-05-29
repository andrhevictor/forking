unit uVisualizaProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfVisualizarProduto = class(TForm)
    panelTop: TPanel;
    Panel1: TPanel;
    dbgProdutos: TDBGrid;
    dbgCategorias: TDBGrid;
    fdqProdutos: TFDQuery;
    dsProdutos: TDataSource;
    fdqCategorias: TFDQuery;
    dsCategorias: TDataSource;
    lblFiltro: TLabel;
    edtFiltroNome: TEdit;
    btnLimpaFiltros: TButton;
    procedure FormCreate(Sender: TObject);
    procedure edtFiltroNomeChange(Sender: TObject);
    procedure dbgCategoriasCellClick(Column: TColumn);
    procedure btnLimpaFiltrosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fVisualizarProduto: TfVisualizarProduto;

implementation

{$R *.dfm}

uses dmDados;

procedure TfVisualizarProduto.btnLimpaFiltrosClick(Sender: TObject);
begin
   edtFiltroNome.Text := '';
   fdqProdutos.SQL.Clear;
   fdqProdutos.SQL.Add(' SELECT * FROM produtos' );
   fdqProdutos.Open();
end;

procedure TfVisualizarProduto.dbgCategoriasCellClick(Column: TColumn);
var
idCategoria: Integer;
begin
  idCategoria := dbgCategorias.DataSource.DataSet.FieldByName('id').AsInteger;
  fdqProdutos.SQL.Clear;
      fdqProdutos.SQL.Add(' SELECT * FROM produtos' );
      fdqProdutos.SQL.Add(' WHERE categoria_id = :idCategoria');
      fdqProdutos.ParamByName('idCategoria').Value := idCategoria;
      fdqProdutos.Open();
end;

procedure TfVisualizarProduto.edtFiltroNomeChange(Sender: TObject);
var
  filtro: String;
begin
  filtro := edtFiltroNome.Text;
   if filtro <> '' then begin
      fdqProdutos.SQL.Clear;
      fdqProdutos.SQL.Add(' SELECT * FROM produtos' );
      fdqProdutos.SQL.Add(' WHERE nome LIKE ' + QuotedStr('%'+ filtro + '%'));
      fdqProdutos.Open();
   end
   else begin
     fdqProdutos.SQL.Clear;
     fdqProdutos.SQL.Add(' SELECT * FROM produtos' );
     fdqProdutos.Open();
   end;
end;

procedure TfVisualizarProduto.FormCreate(Sender: TObject);
begin
  fdqProdutos.SQL.Add('SELECT * FROM produtos');
  fdqProdutos.Open();
end;

end.
