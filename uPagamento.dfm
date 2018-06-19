object fPagamento: TfPagamento
  Left = 0
  Top = 0
  Caption = 'Pagamento'
  ClientHeight = 524
  ClientWidth = 884
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object panelMid: TPanel
    Left = 0
    Top = 113
    Width = 884
    Height = 411
    Align = alClient
    TabOrder = 0
    object lblNumeroPedido: TLabel
      Left = 16
      Top = 16
      Width = 144
      Height = 19
      Caption = 'Numero do Pedido: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblMeioPagament: TLabel
      Left = 264
      Top = 21
      Width = 94
      Height = 13
      Caption = 'Meio de Pagamento'
    end
    object lblListaProdutos: TLabel
      Left = 16
      Top = 77
      Width = 83
      Height = 13
      Caption = 'Lista de Produtos'
    end
    object lblPedido: TLabel
      Left = 166
      Top = 18
      Width = 12
      Height = 19
      Caption = '--'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblValorTotal: TLabel
      Left = 650
      Top = 94
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
    object lblValor: TLabel
      Left = 764
      Top = 94
      Width = 32
      Height = 19
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object grdListaProdutos: TDBGrid
      Left = 16
      Top = 94
      Width = 593
      Height = 276
      DataSource = dsItensPedido
      Options = [dgTitles, dgColumnResize, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'nome'
          Title.Caption = 'Produto'
          Width = 170
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          Title.Caption = 'Quantidade'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco'
          Title.Caption = 'Pre'#231'o'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor_total'
          Title.Caption = 'Valor Total'
          Width = 70
          Visible = True
        end>
    end
    object btnPagar: TButton
      Left = 728
      Top = 320
      Width = 137
      Height = 49
      Caption = 'Pagar'
      TabOrder = 1
      OnClick = btnPagarClick
    end
    object rdbDinheiro: TRadioButton
      Left = 264
      Top = 40
      Width = 113
      Height = 17
      Caption = 'Dinheiro'
      Checked = True
      TabOrder = 2
      TabStop = True
    end
    object rdbCartao: TRadioButton
      Left = 264
      Top = 63
      Width = 113
      Height = 17
      Caption = 'Cart'#227'o'
      TabOrder = 3
    end
  end
  object panelTop: TPanel
    Left = 0
    Top = 0
    Width = 884
    Height = 113
    Align = alTop
    TabOrder = 1
    object lblFicha: TLabel
      Left = 16
      Top = 50
      Width = 120
      Height = 19
      Caption = 'Numero da Ficha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblErro: TLabel
      Left = 145
      Top = 80
      Width = 5
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtNumeroFicha: TEdit
      Left = 142
      Top = 47
      Width = 91
      Height = 21
      TabOrder = 0
      OnChange = edtNumeroFichaChange
    end
  end
  object fdqPagamento: TFDQuery
    Active = True
    Connection = dmConnection.fdcDatabase
    SQL.Strings = (
      'SELECT * FROM pagamentos')
    Left = 816
    Top = 64
    object fdqPagamentoid: TLargeintField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdqPagamentopedido_id: TLargeintField
      FieldName = 'pedido_id'
      Origin = 'pedido_id'
    end
    object fdqPagamentovalor: TBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Precision = 6
      Size = 2
    end
    object fdqPagamentomeios_pagamento_id: TLargeintField
      FieldName = 'meios_pagamento_id'
      Origin = 'meios_pagamento_id'
    end
  end
  object dsPagamento: TDataSource
    DataSet = fdqPagamento
    Left = 696
    Top = 64
  end
  object dsMeioPagamento: TDataSource
    DataSet = fdqMeioPagamento
    Left = 696
    Top = 8
  end
  object fdqMeioPagamento: TFDQuery
    Active = True
    Connection = dmConnection.fdcDatabase
    SQL.Strings = (
      'SELECT * FROM meios_pagamento')
    Left = 816
    Top = 8
  end
  object fdqPedidoByFicha: TFDQuery
    Connection = dmConnection.fdcDatabase
    Left = 504
    Top = 8
  end
  object dsItensPedido: TDataSource
    DataSet = fdqItensByPedido
    Left = 600
    Top = 64
  end
  object dsPedido: TDataSource
    DataSet = fdqPedidoByFicha
    Left = 504
    Top = 64
  end
  object fdqItensByPedido: TFDQuery
    Connection = dmConnection.fdcDatabase
    Left = 600
    Top = 8
  end
  object fdqSomaItens: TFDQuery
    Connection = dmConnection.fdcDatabase
    Left = 408
    Top = 8
  end
end
