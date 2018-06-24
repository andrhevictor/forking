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
    procedure dtpInicioChange(Sender: TObject);
    procedure dtpFimChange(Sender: TObject);
    // procedure dtpInicioChange(Sender: TObject);

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

// SETA DATA ATUAL
procedure TfRelatorioPedidos.FormCreate(Sender: TObject);
begin
  dtpFim.DateTime := now;
  dtpInicio.DateTime := now;
end;

// AJUSTA SCROLBAR
procedure TfRelatorioPedidos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (TStringGrid(DBGrid1).RowCount - 1) < 14 then
  begin
    // Se tiver menos de 10 linhas
    ShowScrollBar(DBGrid1.Handle, SB_VERT, False); // Remove barra Vertical
  end;
end;

// CHANGE DATA
procedure TfRelatorioPedidos.dtpFimChange(Sender: TObject);
begin
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
        if rbStatusTodos.Checked then
        begin
          fRelatorioPedidos.filtraStatusTodos();
        end
        else
        begin
          ShowMessage('Erro interno');
        end;
      end;
    end;
  end;
end;

procedure TfRelatorioPedidos.dtpInicioChange(Sender: TObject);
begin
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
        if rbStatusTodos.Checked then
        begin
          fRelatorioPedidos.filtraStatusTodos();
        end
        else
        begin
          ShowMessage('Erro interno');
        end;
      end;
    end;
  end;
end;

// BOTOES DE STATUS
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
var
  dataInicial: String;
  dataFinal: String;
begin
  dataInicial := FormatDateTime('yyyy-mm-dd', dtpInicio.Date);
  dataFinal := FormatDateTime('yyyy-mm-dd', dtpFim.Date);
  fdqPedidos.SQL.Clear;
  fdqPedidos.SQL.Add('SELECT * FROM pedidos');
  fdqPedidos.SQL.Add('WHERE criado_em::date BETWEEN DATE(:datainicial)');
  fdqPedidos.SQL.Add('AND DATE(:dataFinal)');
  fdqPedidos.SQL.Add('ORDER BY criado_em DESC');
  fdqPedidos.ParamByName('dataInicial').Value := dataInicial;
  fdqPedidos.ParamByName('dataFinal').Value := dataFinal;
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
        if rbStatusTodos.Checked then
        begin
          fRelatorioPedidos.filtraStatusTodos();
        end
        else
        begin
          ShowMessage('Erro interno');
        end;
      end;
    end;
  end;
  fRelatorioPedidos.frxPedidos.LoadFromFile(path + 'relatorios\relPedidos.fr3');
  fRelatorioPedidos.frxPedidos.ShowReport();
end;

procedure TfRelatorioPedidos.filtraStatusAberto();
var
  dataInicial: String;
  dataFinal: String;
begin
  dataInicial := FormatDateTime('yyyy-mm-dd', dtpInicio.Date);
  dataFinal := FormatDateTime('yyyy-mm-dd', dtpFim.Date);
  fdqPedidos.SQL.Clear;
  fdqPedidos.SQL.Add('SELECT * FROM pedidos');
  fdqPedidos.SQL.Add('WHERE criado_em::date BETWEEN DATE(:datainicial)');
  fdqPedidos.SQL.Add('AND DATE(:dataFinal) AND status =' +
    QuotedStr('EM ABERTO'));
  fdqPedidos.SQL.Add('ORDER BY criado_em DESC');
  fdqPedidos.ParamByName('dataInicial').Value := dataInicial;
  fdqPedidos.ParamByName('dataFinal').Value := dataFinal;
  fdqPedidos.Open();
end;

procedure TfRelatorioPedidos.filtraStatusFechado();
var
  dataInicial: String;
  dataFinal: String;
begin
  dataInicial := FormatDateTime('yyyy-mm-dd', dtpInicio.Date);
  dataFinal := FormatDateTime('yyyy-mm-dd', dtpFim.Date);
  fdqPedidos.SQL.Clear;
  fdqPedidos.SQL.Add('SELECT * FROM pedidos');
  fdqPedidos.SQL.Add('WHERE criado_em::date BETWEEN DATE(:datainicial)');
  fdqPedidos.SQL.Add('AND DATE(:dataFinal) AND status =' +
    QuotedStr('FECHADO'));
  fdqPedidos.SQL.Add('ORDER BY criado_em DESC');
  fdqPedidos.ParamByName('dataInicial').Value := dataInicial;
  fdqPedidos.ParamByName('dataFinal').Value := dataFinal;
  fdqPedidos.Open();
end;

procedure TfRelatorioPedidos.filtraStatusCancelado();
var
  dataInicial: String;
  dataFinal: String;
begin
  dataInicial := FormatDateTime('yyyy-mm-dd', dtpInicio.Date);
  dataFinal := FormatDateTime('yyyy-mm-dd', dtpFim.Date);
  fdqPedidos.SQL.Clear;
  fdqPedidos.SQL.Add('SELECT * FROM pedidos');
  fdqPedidos.SQL.Add('WHERE criado_em::date BETWEEN DATE(:datainicial)');
  fdqPedidos.SQL.Add('AND DATE(:dataFinal) AND status =' +
    QuotedStr('CANCELADO'));
  fdqPedidos.SQL.Add('ORDER BY criado_em DESC');
  fdqPedidos.ParamByName('dataInicial').Value := dataInicial;
  fdqPedidos.ParamByName('dataFinal').Value := dataFinal;
  fdqPedidos.Open();
end;

end.
