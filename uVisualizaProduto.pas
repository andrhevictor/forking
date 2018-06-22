unit uVisualizaProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfVisualizarProduto = class(TForm)
    panelTop: TPanel;
    panelMid: TPanel;
    dbgProdutos: TDBGrid;
    dbgCategorias: TDBGrid;
    fdqProdutos: TFDQuery;
    dsProdutos: TDataSource;
    fdqCategorias: TFDQuery;
    dsCategorias: TDataSource;
    lblFiltro: TLabel;
    edtFiltroNome: TEdit;
    btnLimpaFiltros: TButton;
    fdqProdutosid: TLargeintField;
    fdqProdutoscategoria_id: TLargeintField;
    fdqProdutosnome: TWideStringField;
    fdqProdutospreco: TBCDField;
    fdqProdutosdescricao: TWideStringField;
    lblId: TLabel;
    DBEdit1: TDBEdit;
    lblNome: TLabel;
    DBEdit2: TDBEdit;
    lblPreco: TLabel;
    DBEdit3: TDBEdit;
    lblDescricao: TLabel;
    DBEdit4: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    lblCategoria: TLabel;
    btnSalvar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure edtFiltroNomeChange(Sender: TObject);
    procedure dbgCategoriasCellClick(Column: TColumn);
    procedure btnLimpaFiltrosClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
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

procedure TfVisualizarProduto.btnSalvarClick(Sender: TObject);
begin
  fdqProdutos.Post;
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
  filtro := UpperCase(filtro);
   if filtro <> '' then begin
      fdqProdutos.SQL.Clear;
      fdqProdutos.SQL.Add(' SELECT * FROM produtos' );
      fdqProdutos.SQL.Add(' WHERE UPPER(nome) LIKE :filtro');
      fdqProdutos.ParamByName('filtro').Value := '%'+ filtro + '%';
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
