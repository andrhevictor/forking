unit uPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfPagamento = class(TForm)
    panelMid: TPanel;
    panelTop: TPanel;
    fdqPagamento: TFDQuery;
    dsPagamento: TDataSource;
    edtNumeroFicha: TEdit;
    lblFicha: TLabel;
    fdqPagamentoid: TLargeintField;
    fdqPagamentopedido_id: TLargeintField;
    fdqPagamentomeios_pagamento_id: TLargeintField;
    lblNumeroPedido: TLabel;
    edtNumeroPedido: TDBEdit;
    lblMeioPagament: TLabel;
    lblValor: TLabel;
    lcbMeioPagamento: TDBLookupComboBox;
    dsMeioPagamento: TDataSource;
    fdqMeioPagamento: TFDQuery;
    grdListaProdutos: TDBGrid;
    lblListaProdutos: TLabel;
    fdqPagamentovalor: TBCDField;
    edtValorTotal: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPagamento: TfPagamento;

implementation

{$R *.dfm}

uses dmDados, uCadastraProduto, uEditaProduto, uPrincipal, uVisualizaFichas,
  uVisualizaProduto;

end.
