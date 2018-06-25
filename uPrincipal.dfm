object fPrincipal: TfPrincipal
  Left = 0
  Top = 0
  Caption = 'Tela Principal'
  ClientHeight = 506
  ClientWidth = 858
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmMenu
  OldCreateOrder = False
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panelTop: TPanel
    Left = 0
    Top = 0
    Width = 858
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
    object btnEditarPedido: TButton
      Left = 328
      Top = 28
      Width = 137
      Height = 76
      Caption = 'Editar Pedido'
      TabOrder = 2
      OnClick = btnEditarPedidoClick
    end
  end
  object panelMid: TPanel
    Left = 0
    Top = 129
    Width = 858
    Height = 377
    Align = alClient
    TabOrder = 1
  end
  object mmMenu: TMainMenu
    Left = 512
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
      object Pedidos2: TMenuItem
        Caption = 'Pedidos'
        OnClick = Pedidos2Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios   '
      object Faturamento1: TMenuItem
        Caption = 'Faturamento'
      end
      object Pagamento1: TMenuItem
        Caption = 'Pagamento'
      end
      object Pedidos1: TMenuItem
        Caption = 'Pedidos'
        OnClick = Pedidos1Click
      end
      object Produtos2: TMenuItem
        Caption = 'Produtos'
        OnClick = Produtos2Click
      end
    end
    object Usurios1: TMenuItem
      Caption = 'Usu'#225'rios'
      object AdicionarUsuario1: TMenuItem
        Caption = 'Adicionar Usuario'
        OnClick = AdicionarUsuario1Click
      end
      object VisualizarUsurios1: TMenuItem
        Caption = 'Visualizar Usu'#225'rios'
        OnClick = VisualizarUsurios1Click
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
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
  object fdqInserePedido: TFDQuery
    Connection = dmConnection.fdcDatabase
    Left = 592
  end
  object fdqLastPedidoFicha: TFDQuery
    Connection = dmConnection.fdcDatabase
    Left = 680
  end
end
