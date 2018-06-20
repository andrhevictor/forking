object fVisualizaPedidos: TfVisualizaPedidos
  Left = 0
  Top = 0
  Caption = 'Pedidos'
  ClientHeight = 670
  ClientWidth = 1097
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object panelMid: TPanel
    Left = 0
    Top = 65
    Width = 1097
    Height = 605
    Align = alClient
    TabOrder = 0
    object lblItens: TLabel
      Left = 16
      Top = 145
      Width = 111
      Height = 19
      Caption = 'Itens do pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblInfo: TLabel
      Left = 782
      Top = 169
      Width = 88
      Height = 19
      Caption = 'Informa'#231#245'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblStatus: TLabel
      Left = 782
      Top = 202
      Width = 43
      Height = 19
      Caption = 'Status'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblCriadoEm: TLabel
      Left = 782
      Top = 227
      Width = 108
      Height = 19
      Caption = 'Data de cria'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblQtdItens: TLabel
      Left = 782
      Top = 252
      Width = 143
      Height = 19
      Caption = 'Quantidade de Itens'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblValorTotal: TLabel
      Left = 782
      Top = 277
      Width = 108
      Height = 19
      Caption = 'Valor Total: R$'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblInfoPagamento: TLabel
      Left = 782
      Top = 375
      Width = 195
      Height = 19
      Caption = 'Informa'#231#245'es do Pagamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblValorPago: TLabel
      Left = 782
      Top = 407
      Width = 107
      Height = 19
      Caption = 'Valor Pago: R$'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblMeioPagamento: TLabel
      Left = 782
      Top = 432
      Width = 169
      Height = 19
      Caption = 'M'#233'todo de pagamento: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblDataPagamento: TLabel
      Left = 782
      Top = 457
      Width = 150
      Height = 19
      Caption = 'Data do Pagamento: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblPedidoStatus: TLabel
      Left = 951
      Top = 202
      Width = 5
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblPedidoDataCriacao: TLabel
      Left = 951
      Top = 227
      Width = 5
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblPedidoQtdItens: TLabel
      Left = 951
      Top = 252
      Width = 5
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblPedidoValorTotal: TLabel
      Left = 951
      Top = 277
      Width = 5
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblPagamentoValor: TLabel
      Left = 975
      Top = 407
      Width = 5
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblPagamentoMetodo: TLabel
      Left = 975
      Top = 432
      Width = 5
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblPagamentoData: TLabel
      Left = 975
      Top = 457
      Width = 5
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblFiltro: TLabel
      Left = 16
      Top = 6
      Width = 41
      Height = 19
      Caption = 'Filtrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblFiltroNumeroFicha: TLabel
      Left = 16
      Top = 43
      Width = 97
      Height = 16
      Caption = 'Numero da Ficha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblFiltroStatus: TLabel
      Left = 160
      Top = 43
      Width = 36
      Height = 16
      Caption = 'Status'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblFiltroData: TLabel
      Left = 312
      Top = 43
      Width = 91
      Height = 16
      Caption = 'Data de Cria'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblEntre: TLabel
      Left = 312
      Top = 65
      Width = 30
      Height = 16
      Caption = 'Entre'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblE: TLabel
      Left = 455
      Top = 65
      Width = 7
      Height = 16
      Caption = 'e'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblOpcoes: TLabel
      Left = 782
      Top = 527
      Width = 52
      Height = 19
      Caption = 'Op'#231#245'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object dbgItensPedido: TDBGrid
      Left = 16
      Top = 170
      Width = 745
      Height = 417
      DataSource = dsItensPedido
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'id'
          Title.Caption = 'ID'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'numero_ficha'
          Title.Caption = 'N'#250'mero da Ficha'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'status'
          Title.Caption = 'Status'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'criado_em'
          Title.Caption = 'Data de cria'#231#227'o'
          Width = 200
          Visible = True
        end>
    end
    object btnBuscar: TButton
      Left = 592
      Top = 34
      Width = 89
      Height = 25
      Caption = 'Buscar'
      TabOrder = 1
      OnClick = btnBuscarClick
    end
    object btnLimpaFiltro: TButton
      Left = 592
      Top = 65
      Width = 89
      Height = 25
      Caption = 'Limpar Filtros'
      TabOrder = 2
      OnClick = btnLimpaFiltroClick
    end
    object edtNumeroFicha: TEdit
      Left = 16
      Top = 65
      Width = 121
      Height = 21
      TabOrder = 3
      TextHint = 'Ex.: 1'
    end
    object dtpickInicial: TDateTimePicker
      Left = 352
      Top = 65
      Width = 97
      Height = 21
      Date = 43269.790574305550000000
      Time = 43269.790574305550000000
      ParentShowHint = False
      ShowHint = False
      TabOrder = 4
    end
    object dtpickFinal: TDateTimePicker
      Left = 472
      Top = 65
      Width = 97
      Height = 21
      Date = 43269.790574305550000000
      Time = 43269.790574305550000000
      TabOrder = 5
    end
    object cmbFiltroStatus: TComboBox
      Left = 161
      Top = 65
      Width = 128
      Height = 22
      Style = csOwnerDrawFixed
      TabOrder = 6
      TextHint = 'Selecione um status'
      Items.Strings = (
        'EM ABERTO'
        'FECHADO'
        'CANCELADO')
    end
    object btnEditaPedido: TButton
      Left = 778
      Top = 562
      Width = 89
      Height = 25
      Caption = 'Editar'
      TabOrder = 7
      OnClick = btnEditaPedidoClick
    end
    object btnPagar: TButton
      Left = 873
      Top = 562
      Width = 89
      Height = 25
      Caption = 'Pagar'
      TabOrder = 8
    end
  end
  object panelTop: TPanel
    Left = 0
    Top = 0
    Width = 1097
    Height = 65
    Align = alTop
    TabOrder = 1
  end
  object fdqItensPedido: TFDQuery
    Active = True
    Connection = dmConnection.fdcDatabase
    SQL.Strings = (
      'SELECT * FROM pedidos'
      'ORDER BY id')
    Left = 928
    Top = 8
  end
  object dsItensPedido: TDataSource
    DataSet = fdqItensPedido
    OnDataChange = dsItensPedidoDataChange
    Left = 848
    Top = 8
  end
  object fdqPagamentoByPedido: TFDQuery
    Connection = dmConnection.fdcDatabase
    SQL.Strings = (
      'SELECT * FROM pedidos'
      'ORDER BY id')
    Left = 1024
    Top = 8
  end
  object fdqSomaItens: TFDQuery
    Connection = dmConnection.fdcDatabase
    Left = 776
    Top = 8
  end
  object fdqQuantidadeItens: TFDQuery
    Connection = dmConnection.fdcDatabase
    Left = 688
    Top = 8
  end
end
