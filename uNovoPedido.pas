unit uNovoPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfNovoPedido = class(TForm)
  private
    idPedido: Integer;
  public
    constructor Create(AOwner: TComponent; pedidoId: String);
  end;

var
  fNovoPedido: TfNovoPedido;

implementation

{$R *.dfm}

Constructor TfNovoPedido.Create(AOwner : TComponent; pedidoId : String);
begin
  inherited Create(AOwner);
  idPedido := pedidoId.ToInteger();
end;

end.
