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
      Top = 24
      Width = 87
      Height = 13
      Caption = 'Numero do Pedido'
      FocusControl = edtNumeroPedido
    end
    object lblMeioPagament: TLabel
      Left = 264
      Top = 21
      Width = 94
      Height = 13
      Caption = 'Meio de Pagamento'
    end
    object lblValor: TLabel
      Left = 698
      Top = 376
      Width = 51
      Height = 13
      Caption = 'Valor Total'
      FocusControl = edtValorTotal
    end
    object lblListaProdutos: TLabel
      Left = 16
      Top = 77
      Width = 83
      Height = 13
      Caption = 'Lista de Produtos'
    end
    object edtNumeroPedido: TDBEdit
      Left = 16
      Top = 40
      Width = 199
      Height = 21
      DataField = 'pedido_id'
      DataSource = dsPagamento
      Enabled = False
      TabOrder = 0
    end
    object edtValorTotal: TDBEdit
      Left = 760
      Top = 376
      Width = 80
      Height = 21
      DataField = 'valor'
      DataSource = dsPagamento
      Enabled = False
      TabOrder = 1
    end
    object lcbMeioPagamento: TDBLookupComboBox
      Left = 264
      Top = 40
      Width = 145
      Height = 21
      DataField = 'meios_pagamento_id'
      DataSource = dsPagamento
      KeyField = 'id'
      ListField = 'tipo_pagamento'
      ListSource = dsMeioPagamento
      TabOrder = 2
    end
    object grdListaProdutos: TDBGrid
      Left = 16
      Top = 94
      Width = 849
      Height = 276
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
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
      Width = 80
      Height = 13
      Caption = 'Numero da Ficha'
    end
    object edtNumeroFicha: TEdit
      Left = 102
      Top = 47
      Width = 91
      Height = 21
      TabOrder = 0
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
    object fdqPagamentomeios_pagamento_id: TLargeintField
      FieldName = 'meios_pagamento_id'
      Origin = 'meios_pagamento_id'
    end
    object fdqPagamentovalor: TFMTBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Precision = 64
      Size = 0
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
end
