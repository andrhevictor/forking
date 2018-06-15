object fVisualizaFichas: TfVisualizaFichas
  Left = 0
  Top = 0
  Caption = 'Visualizar fichas'
  ClientHeight = 591
  ClientWidth = 1031
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object panelTop: TPanel
    Left = 0
    Top = 0
    Width = 1031
    Height = 73
    Align = alTop
    TabOrder = 0
  end
  object panelMid: TPanel
    Left = 0
    Top = 73
    Width = 1031
    Height = 518
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 65
    object lblValorTotal: TLabel
      Left = 752
      Top = 431
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
    object lblPedidoID: TLabel
      Left = 264
      Top = 63
      Width = 144
      Height = 19
      Caption = 'N'#250'mero do Pedido: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblStatusPedido: TLabel
      Left = 264
      Top = 95
      Width = 130
      Height = 19
      Caption = 'Status do Pedido: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object dbgFichas: TDBGrid
      Left = 24
      Top = 24
      Width = 201
      Height = 449
      DataSource = dsFichas
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = dbgFichasCellClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'numero_ficha'
          Title.Alignment = taCenter
          Title.Caption = 'Ficha'
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'disponivel'
          Title.Alignment = taCenter
          Title.Caption = 'Dispon'#237'vel'
          Width = 70
          Visible = True
        end>
    end
    object dbgPedido: TDBGrid
      Left = 264
      Top = 120
      Width = 705
      Height = 305
      DataSource = dsPedidoByFicha
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
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
          Width = 250
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
          Title.Caption = 'Valor Unit'#225'rio'
          Width = 70
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
  end
  object fdqFichas: TFDQuery
    Active = True
    Connection = dmConnection.fdcDatabase
    SQL.Strings = (
      'SELECT * FROM fichas'
      'ORDER BY numero_ficha')
    Left = 664
    Top = 16
  end
  object dsFichas: TDataSource
    DataSet = fdqFichas
    Left = 848
    Top = 16
  end
  object fdqPedidoByFicha: TFDQuery
    Connection = dmConnection.fdcDatabase
    Left = 584
    Top = 16
  end
  object dsPedidoByFicha: TDataSource
    DataSet = fdqPedidoByFicha
    Left = 784
    Top = 16
  end
  object fdqSomaValorPedido: TFDQuery
    Connection = dmConnection.fdcDatabase
    Left = 480
    Top = 16
  end
end
