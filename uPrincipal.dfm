object fPrincipal: TfPrincipal
  Left = 0
  Top = 0
  Caption = 'Tela Principal'
  ClientHeight = 684
  ClientWidth = 1101
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmMenu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object panelTop: TPanel
    Left = 0
    Top = 0
    Width = 1101
    Height = 129
    Align = alTop
    TabOrder = 0
    object btnNovoPedido: TButton
      Left = 16
      Top = 28
      Width = 137
      Height = 76
      Caption = 'Novo Pedido'
      TabOrder = 0
    end
  end
  object panelMid: TPanel
    Left = 0
    Top = 129
    Width = 1101
    Height = 555
    Align = alClient
    TabOrder = 1
    ExplicitTop = 8
    ExplicitWidth = 849
    ExplicitHeight = 105
  end
  object mmMenu: TMainMenu
    Left = 1056
    Top = 8
    object Produtos1: TMenuItem
      Caption = 'Produtos'
      object Cadastrar1: TMenuItem
        Caption = 'Cadastrar'
        OnClick = Cadastrar1Click
      end
      object Editar1: TMenuItem
        Caption = 'Editar'
        OnClick = Editar1Click
      end
      object VisualizarTodos1: TMenuItem
        Caption = 'Visualizar Todos'
        OnClick = VisualizarTodos1Click
      end
    end
  end
end
