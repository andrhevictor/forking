unit uRelatorioPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass, frxDBSet, Vcl.ComCtrls;

type
  TfRelatorioPedidos = class(TForm)
    panelTop: TPanel;
    lblTituloRelatorio: TLabel;
    panelMid: TPanel;
    gbImpressao: TGroupBox;
    btnGerarRelatorio: TButton;
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
    gbData: TGroupBox;
    dtpFim: TDateTimePicker;
    dtpInicio: TDateTimePicker;
    lblDataInicio: TLabel;
    lblDataFim: TLabel;
    procedure rbStatusAbertoClick(Sender: TObject);
    procedure filtraStatusAberto();
    procedure filtraStatusFechado();
    procedure filtraStatusCancelado();
    procedure rbStatusFechadoClick(Sender: TObject);
    procedure rbStatusCanceladoClick(Sender: TObject);
    procedure rbStatusTodosClick(Sender: TObject);
    procedure filtraStatusTodos();
    procedure btnGerarRelatorioClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure filtroData();
//    procedure dtpInicioChange(Sender: TObject);

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

procedure TfRelatorioPedidos.FormCreate(Sender: TObject);
begin
  dtpFim.DateTime := now;
  dtpInicio.DateTime := now;
end;

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
procedure TfRelatorioPedidos.filtroData();
var
  dataInicial: String;
  dataFinal: String;
begin
  dataInicial := FormatDateTime('yyyy-mm-dd', dtpInicio.Date);
  dataFinal := FormatDateTime('yyyy-mm-dd', dtpFim.Date);

  fdqPedidos.SQL.Clear;
  fdqPedidos.SQL.Add('SELECT * FROM pedidos');
  fdqPedidos.SQL.Add
    ('WHERE criado_em::date BETWEEN DATE(:datainicial) AND DATE(:dataFinal)');
  fdqPedidos.ParamByName('dataInicial').Value := dataInicial;
  fdqPedidos.ParamByName('dataFinal').Value := dataFinal;

end;

procedure TfRelatorioPedidos.filtraStatusTodos();
begin
  fdqPedidos.SQL.Clear;
  fdqPedidos.SQL.Add('SELECT * FROM pedidos');
  fdqPedidos.SQL.Add('ORDER BY criado_em DESC');
  fdqPedidos.Open();
end;

procedure TfRelatorioPedidos.btnGerarRelatorioClick(Sender: TObject);
var
  path: string;
begin
  path := ExtractFilePath(Application.ExeName);
  if rbStatusAberto.Checked then
  begin
    fRelatorioPedidos.filtraStatusAberto();
  end
  else
  begin
    if rbStatusFechado.Checked then
    begin
      fRelatorioPedidos.filtraStatusFechado();
    end
    else
    begin
      if rbStatusCancelado.Checked then
      begin
        fRelatorioPedidos.filtraStatusCancelado();
      end
      else
      begin
        fRelatorioPedidos.filtraStatusTodos();
      end;
    end;
  end;
  fRelatorioPedidos.frxPedidos.LoadFromFile(path + 'relatorios\relPedidos.fr3');
  fRelatorioPedidos.frxPedidos.ShowReport();
end;

procedure TfRelatorioPedidos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (TStringGrid(DBGrid1).RowCount - 1) < 14 then
  begin
    // Se tiver menos de 10 linhas
    ShowScrollBar(DBGrid1.Handle, SB_VERT, False); // Remove barra Vertical
  end;
end;

//procedure TfRelatorioPedidos.dtpInicioChange(Sender: TObject);
//var
//
//begin
//
//  fdqPedidos.SQL.Clear;
//  fdqPedidos.SQL.Add('SELECT * FROM pedidos');
//  fdqPedidos.SQL.Add
//    ('WHERE criado_em::date BETWEEN DATE(:datainicial) AND DATE(:dataFinal)');
//  fdqPedidos.ParamByName('dataInicial').Value := dataInicial;
//  fdqPedidos.ParamByName('dataFinal').Value := dataFinal;
//end;

procedure TfRelatorioPedidos.filtraStatusAberto();
var
  dataInicial: String;
  dataFinal: String;
begin
  dataInicial := FormatDateTime('yyyy-mm-dd', dtpInicio.Date);
  dataFinal := FormatDateTime('yyyy-mm-dd', dtpFim.Date);
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
