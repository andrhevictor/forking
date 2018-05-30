unit uEditaProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfEditaProduto = class(TForm)
    panelTop: TPanel;
    panelMid: TPanel;
    dsCategorias: TDataSource;
    fdqCategorias: TFDQuery;
    dsProdutos: TDataSource;
    fdqProdutos: TFDQuery;
    fdqProdutosid: TLargeintField;
    fdqProdutoscategoria_id: TLargeintField;
    fdqProdutosnome: TWideStringField;
    fdqProdutospreco: TBCDField;
    fdqProdutosdescricao: TWideStringField;
    dbgProdutos: TDBGrid;
    dbgCategorias: TDBGrid;
    lblCategoria: TLabel;
    lblCategoriaEdit: TLabel;
    DBEdit1: TDBEdit;
    lblNome: TLabel;
    DBEdit2: TDBEdit;
    lblPreco: TLabel;
    DBEdit3: TDBEdit;
    lblDescricao: TLabel;
    DBEdit4: TDBEdit;
    lblId: TLabel;
    DBEdit5: TDBEdit;
    btnSalvar: TButton;
    procedure dbgCategoriasCellClick(Column: TColumn);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEditaProduto: TfEditaProduto;

implementation

{$R *.dfm}

procedure TfEditaProduto.btnSalvarClick(Sender: TObject);
begin
  fdqProdutos.Edit;
  fdqProdutos.Post;
end;

procedure TfEditaProduto.dbgCategoriasCellClick(Column: TColumn);
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

end.
