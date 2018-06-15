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
  WindowState = wsMaximized
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
      OnClick = btnNovoPedidoClick
    end
    object btnPagamento: TButton
      Left = 176
      Top = 28
      Width = 137
      Height = 76
      Caption = 'Pagamento'
      TabOrder = 1
      OnClick = btnPagamentoClick
    end
  end
  object panelMid: TPanel
    Left = 0
    Top = 129
    Width = 1101
    Height = 555
    Align = alClient
    TabOrder = 1
  end
  object mmMenu: TMainMenu
    Left = 1056
    Top = 8
    object Arquivo1: TMenuItem
      Caption = 'Arquivo   '
      object Sair1: TMenuItem
        Caption = 'Sair'
        OnClick = Sair1Click
      end
      object N1: TMenuItem
        Caption = '...'
      end
    end
    object Produtos1: TMenuItem
      Caption = 'Produtos   '
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
    object Fichas1: TMenuItem
      Caption = 'Fichas   '
      object VisualizarTodas1: TMenuItem
        Caption = 'Visualizar Todas'
        OnClick = VisualizarTodas1Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios   '
      object Produtos2: TMenuItem
        Caption = 'Produtos'
        OnClick = Produtos2Click
      end
    end
    object Sobre1: TMenuItem
      Caption = 'Sobre   '
      object SobreoSistema1: TMenuItem
        Caption = 'Sobre o Sistema'
      end
      object Ajuda1: TMenuItem
        Caption = 'Ajuda'
      end
    end
  end
  object fdqInserePedido: TFDQuery
    Connection = dmConnection.fdcDatabase
    Left = 360
  end
end
