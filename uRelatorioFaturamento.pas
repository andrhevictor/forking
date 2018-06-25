unit uRelatorioFaturamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, frxClass, frxDBSet;

type
  TfRelatorioFaturamento = class(TForm)
    panelTop: TPanel;
    lblTituloRelatorio: TLabel;
    panelMid: TPanel;
    gbImpressao: TGroupBox;
    btnGerarRelatorio: TButton;
    gbFiltro: TGroupBox;
    rbCategoria: TRadioButton;
    DBGrid1: TDBGrid;
    gbData: TGroupBox;
    lblDataInicio: TLabel;
    lblDataFim: TLabel;
    dtpFim: TDateTimePicker;
    dtpInicio: TDateTimePicker;
    dsFaturamento: TDataSource;
    fdqFaturamento: TFDQuery;
    fdqFaturamentocategoria: TWideStringField;
    fdqFaturamentoquantidade: TLargeintField;
    fdqFaturamentosum: TFMTBCDField;
    frxDBFaturamento: TfrxDBDataset;
    frxFaturamento: TfrxReport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelatorioFaturamento: TfRelatorioFaturamento;

implementation

{$R *.dfm}

uses dmDados;

end.
