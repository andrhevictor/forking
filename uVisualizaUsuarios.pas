unit uVisualizaUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ExtCtrls;

type
  TfVisualizaUsuarios = class(TForm)
    panelTop: TPanel;
    Panel1: TPanel;
    fdqAllUsers: TFDQuery;
    dsUsuarios: TDataSource;
    fdqAllUsersid: TIntegerField;
    fdqAllUsersnome_completo: TWideStringField;
    fdqAllUserslogin: TWideStringField;
    fdqAllUserssenha: TWideStringField;
    fdqAllUsersnivel_acesso: TIntegerField;
    fdqAllUsersbloqueado: TBooleanField;
    lblID: TLabel;
    DBEdit1: TDBEdit;
    lblNomeCompleto: TLabel;
    DBEdit2: TDBEdit;
    lblLogin: TLabel;
    DBEdit3: TDBEdit;
    lblSenha: TLabel;
    DBEdit4: TDBEdit;
    dbgBloqueado: TDBCheckBox;
    dbgUsuarios: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fVisualizaUsuarios: TfVisualizaUsuarios;

implementation

{$R *.dfm}

uses dmDados;

end.
