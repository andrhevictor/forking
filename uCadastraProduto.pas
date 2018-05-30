unit uCadastraProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.DBCtrls, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls,
  Vcl.Mask;

type
  TfCadastraProduto = class(TForm)
    panelTop: TPanel;
    panelMid: TPanel;
    dsProdutos: TDataSource;
    fdqCategorias: TFDQuery;
    dsCategorias: TDataSource;
    fdqProdutos: TFDQuery;
    dblcCategorias: TDBLookupComboBox;
    fdqProdutosid: TLargeintField;
    fdqProdutoscategoria_id: TLargeintField;
    fdqProdutosnome: TWideStringField;
    fdqProdutospreco: TBCDField;
    fdqProdutosdescricao: TWideStringField;
    lblId: TLabel;
    DBEdit1: TDBEdit;
    lblNome: TLabel;
    DBEdit3: TDBEdit;
    lblPreco: TLabel;
    DBEdit4: TDBEdit;
    lblDescricao: TLabel;
    DBEdit5: TDBEdit;
    lblCategoria: TLabel;
    Panel1: TPanel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadastraProduto: TfCadastraProduto;

implementation

{$R *.dfm}

procedure TfCadastraProduto.btnCancelarClick(Sender: TObject);
begin
  fCadastraProduto.Close;
end;

procedure TfCadastraProduto.btnSalvarClick(Sender: TObject);
begin
  fdqProdutos.Post;
  fdqProdutos.Insert;
  fdqProdutos.ClearFields;
  //fCadastraProduto.Close;
end;

procedure TfCadastraProduto.FormCreate(Sender: TObject);
begin
  fdqProdutos.Insert;
  fdqProdutos.ClearFields;
end;

procedure TfCadastraProduto.FormShow(Sender: TObject);
begin
  fdqProdutos.Insert;
  fdqProdutos.ClearFields;

end;

end.
