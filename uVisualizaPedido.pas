unit uVisualizaPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, DateUtils;

type
  TfVisualizaPedidos = class(TForm)
    panelMid: TPanel;
    panelTop: TPanel;
    dbgItensPedido: TDBGrid;
    lblItens: TLabel;
    fdqItensPedido: TFDQuery;
    dsItensPedido: TDataSource;
    lblInfo: TLabel;
    lblStatus: TLabel;
    lblCriadoEm: TLabel;
    lblQtdItens: TLabel;
    lblValorTotal: TLabel;
    lblInfoPagamento: TLabel;
    lblValorPago: TLabel;
    lblMeioPagamento: TLabel;
    lblDataPagamento: TLabel;
    lblPedidoStatus: TLabel;
    lblPedidoDataCriacao: TLabel;
    lblPedidoQtdItens: TLabel;
    lblPedidoValorTotal: TLabel;
    lblPagamentoValor: TLabel;
    lblPagamentoMetodo: TLabel;
    lblPagamentoData: TLabel;
    fdqPagamentoByPedido: TFDQuery;
    lblFiltro: TLabel;
    btnBuscar: TButton;
    btnLimpaFiltro: TButton;
    edtNumeroFicha: TEdit;
    lblFiltroNumeroFicha: TLabel;
    lblFiltroStatus: TLabel;
    lblFiltroData: TLabel;
    dtpickInicial: TDateTimePicker;
    dtpickFinal: TDateTimePicker;
    lblEntre: TLabel;
    lblE: TLabel;
    cmbFiltroStatus: TComboBox;
    lblOpcoes: TLabel;
    btnEditaPedido: TButton;
    btnPagar: TButton;
    fdqSomaItens: TFDQuery;
    fdqQuantidadeItens: TFDQuery;
    procedure btnEditaPedidoClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnLimpaFiltroClick(Sender: TObject);
    procedure dsItensPedidoDataChange(Sender: TObject; Field: TField);
  private
    Function ConverteData(Data:TDate) : String;
  public
    { Public declarations }
  end;

var
  fVisualizaPedidos: TfVisualizaPedidos;

implementation

{$R *.dfm}

uses dmDados, uEditaPedido;

Function TfVisualizaPedidos.ConverteData(Data:TDate) : String;
begin
 Result := IntToStr(YearOf(Data)) + '-' + IntToStr(MonthOf(Data)) + '-' + IntToStr(DayOf(data));
end;


procedure TfVisualizaPedidos.btnBuscarClick(Sender: TObject);
var
  dataInicial: String;
  dataFinal: String;
  numeroFicha: Integer;
  status: String;
begin
  dataInicial := ConverteData(dtpickInicial.Date);
  dataFinal   := ConverteData(dtpickFinal.Date);
  ShowMessage(dataInicial);
  ShowMessage(dataFinal);


  if edtNumeroFicha.Text <> '' then begin
    numeroFicha := StrToInt(edtNumeroFicha.Text);
  end;

  if (cmbFiltroStatus.ItemIndex >= 0) then begin
    status := cmbFiltroStatus.Items[cmbFiltroStatus.ItemIndex];
  end;

  fdqItensPedido.SQL.Clear;
  fdqItensPedido.SQL.Add('SELECT * FROM pedidos');
  fdqItensPedido.SQL.Add('WHERE criado_em BETWEEN TO_TIMESTAMP(:datainicial, ''YYYY-MM-DD HH24:MI:SS'') AND TO_TIMESTAMP(:dataFinal, ''YYYY-MM-DD HH24:MI:SS'')');
  fdqItensPedido.ParamByName('dataInicial').Value := dataInicial;
  fdqItensPedido.ParamByName('dataFinal').Value   := dataFinal;
  fdqItensPedido.SQL.Add('ORDER BY id');
  fdqItensPedido.Open();

end;

procedure TfVisualizaPedidos.btnEditaPedidoClick(Sender: TObject);
var
pedidoId: Integer;
begin
  pedidoId := dbgItensPedido.DataSource.DataSet.FieldByName('id').AsInteger;
//  TfEditaPedido.Create(self, pedidoId.ToString);
end;

procedure TfVisualizaPedidos.btnLimpaFiltroClick(Sender: TObject);
begin
  fdqItensPedido.SQL.Clear;
  fdqItensPedido.SQL.Add('SELECT * FROM pedidos');
  fdqItensPedido.SQL.Add('ORDER BY id');
  fdqItensPedido.Open();
end;

procedure TfVisualizaPedidos.dsItensPedidoDataChange(Sender: TObject;
  Field: TField);
var
  pedidoId: Integer;
  quantidade: Integer;
  soma: Double;
begin
  pedidoId := dbgItensPedido.DataSource.DataSet.FieldByName('id').AsInteger;

  fdqPagamentoByPedido.SQL.Clear;
  fdqPagamentoByPedido.SQL.Add('SELECT * FROM pagamentos');
  fdqPagamentoByPedido.SQL.Add('INNER JOIN meios_pagamento ON pagamentos.meios_pagamento_id = meios_pagamento.id');
  fdqPagamentoByPedido.SQL.Add('INNER JOIN pedidos ON pagamentos.pedido_id = pedidos.id');
  fdqPagamentoByPedido.SQL.Add('WHERE pedidos.id = :pedido');
  fdqPagamentoByPedido.ParamByName('pedido').Value := pedidoId;
  fdqPagamentoByPedido.Open();

  fdqSomaItens.SQL.Clear;
  fdqSomaItens.SQL.Add('SELECT SUM(valor_total) AS soma FROM pedidos_itens WHERE pedido_id = :idPedido');
  fdqSomaItens.ParamByName('idPedido').Value := pedidoId;
  fdqSomaItens.Open();
  soma       := fdqSomaItens.FieldByName('soma').AsFloat;

  fdqQuantidadeItens.SQL.Clear;
  fdqQuantidadeItens.SQL.Add('SELECT * FROM pedidos_itens WHERE pedido_id = :idPedido');
  fdqQuantidadeItens.ParamByName('idPedido').Value := pedidoId;
  fdqQuantidadeItens.Open();
  quantidade :=  fdqQuantidadeItens.RecordCount;

  lblPedidoStatus.Caption      := dbgItensPedido.DataSource.DataSet.FieldByName('status').AsString;
  lblPedidoDataCriacao.Caption := dbgItensPedido.DataSource.DataSet.FieldByName('criado_em').AsString;
  lblPedidoValorTotal.Caption  := soma.ToString;
  lblPedidoQtdItens.Caption    := quantidade.ToString;

  lblPagamentoValor.Caption := fdqPagamentoByPedido.FieldByName('valor').AsString;
  lblPagamentoMetodo.Caption := fdqPagamentoByPedido.FieldByName('tipo_pagamento').AsString;
  lblPagamentoData.Caption := fdqPagamentoByPedido.FieldByName('pago_em').AsString;

end;

end.
