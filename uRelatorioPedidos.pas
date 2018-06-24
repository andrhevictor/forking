unit uRelatorioPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass, frxDBSet;

type
  TfRelatorioPedidos = class(TForm)
    panelTop: TPanel;
    lblTituloRelatorio: TLabel;
    panelMid: TPanel;
    gbImpressao: TGroupBox;
    btnGerarRelatorio: TButton;
    cbxAgurpar: TCheckBox;
    gbStatus: TGroupBox;
    rbStatusAberto: TRadioButton;
    rbStatusCancelado: TRadioButton;
    rbStatusFechado: TRadioButton;
    DBGrid1: TDBGrid;
    dsPedidos: TDataSource;
    fdqPedidos: TFDQuery;
    frxDBPedidos: TfrxDBDataset;
    frxPedidos: TfrxReport;
    rbStatusTodos: TRadioButton;
    procedure rbStatusAbertoClick(Sender: TObject);
    procedure filtraStatusAberto();
    procedure filtraStatusFechado();
    procedure filtraStatusCancelado();
    procedure rbStatusFechadoClick(Sender: TObject);
    procedure rbStatusCanceladoClick(Sender: TObject);
    procedure rbStatusTodosClick(Sender: TObject);
    procedure filtraStatusTodos();

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelatorioPedidos: TfRelatorioPedidos;

implementation

{$R *.dfm}

uses dmDados;

procedure TfRelatorioPedidos.rbStatusAbertoClick(Sender: TObject);
begin
  fRelatorioPedidos.filtraStatusAberto();
end;

procedure TfRelatorioPedidos.rbStatusCanceladoClick(Sender: TObject);
begin
  fRelatorioPedidos.filtraStatusCancelado();
end;

procedure TfRelatorioPedidos.rbStatusFechadoClick(Sender: TObject);
begin
  fRelatorioPedidos.filtraStatusFechado();
end;

procedure TfRelatorioPedidos.rbStatusTodosClick(Sender: TObject);
begin
  fRelatorioPedidos.filtraStatusTodos();
end;

// ----------FUNÇÕES----------//
procedure TfRelatorioPedidos.filtraStatusTodos();
begin
  fdqPedidos.SQL.Clear;
  fdqPedidos.SQL.Add('SELECT * FROM pedidos');
  fdqPedidos.SQL.Add('ORDER BY criado_em DESC');
  fdqPedidos.Open();
end;

procedure TfRelatorioPedidos.filtraStatusAberto();
begin
  fdqPedidos.SQL.Clear;
  fdqPedidos.SQL.Add('SELECT * FROM pedidos');
  fdqPedidos.SQL.Add('WHERE status =' + QuotedStr('EM ABERTO'));
  fdqPedidos.SQL.Add('ORDER BY criado_em DESC');
  fdqPedidos.Open();
end;

procedure TfRelatorioPedidos.filtraStatusFechado();
begin
  fdqPedidos.SQL.Clear;
  fdqPedidos.SQL.Add('SELECT * FROM pedidos');
  fdqPedidos.SQL.Add('WHERE status =' + QuotedStr('FECHADO'));
  fdqPedidos.SQL.Add('ORDER BY criado_em DESC');
  fdqPedidos.Open();
end;

procedure TfRelatorioPedidos.filtraStatusCancelado();
begin
  fdqPedidos.SQL.Clear;
  fdqPedidos.SQL.Add('SELECT * FROM pedidos');
  fdqPedidos.SQL.Add('WHERE status =' + QuotedStr('CANCELADO'));
  fdqPedidos.SQL.Add('ORDER BY criado_em DESC');
  fdqPedidos.Open();
end;

end.
