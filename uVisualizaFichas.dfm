object fVisualizaFichas: TfVisualizaFichas
  Left = 0
  Top = 0
  Caption = 'Visualizar fichas'
  ClientHeight = 453
  ClientWidth = 640
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
    Width = 640
    Height = 67
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 1031
  end
  object panelMid: TPanel
    Left = 0
    Top = 67
    Width = 640
    Height = 386
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 721
    ExplicitHeight = 524
    object lblValorTotal: TLabel
      Left = 434
      Top = 355
      Width = 188
      Height = 19
      Alignment = taRightJustify
      Caption = 'Valor Total: R$'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblPedidoID: TLabel
      Left = 176
      Top = 6
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
      Left = 384
      Top = 6
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
      Left = 0
      Top = 0
      Width = 163
      Height = 385
      DataSource = dsFichas
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
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
      Left = 169
      Top = 31
      Width = 464
      Height = 314
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
          Alignment = taCenter
          Expanded = False
          FieldName = 'quantidade'
          Title.Alignment = taCenter
          Title.Caption = 'QTD'
          Width = 53
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'preco'
          Title.Alignment = taCenter
          Title.Caption = 'Valor Unit'#225'rio'
          Width = 72
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'valor_total'
          Title.Alignment = taCenter
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
    Left = 56
    Top = 16
  end
  object dsFichas: TDataSource
    DataSet = fdqFichas
    OnDataChange = dsFichasDataChange
    Left = 224
    Top = 16
  end
  object fdqPedidoByFicha: TFDQuery
    Connection = dmConnection.fdcDatabase
    Left = 408
    Top = 16
  end
  object dsPedidoByFicha: TDataSource
    DataSet = fdqPedidoByFicha
    Left = 168
    Top = 16
  end
  object fdqSomaValorPedido: TFDQuery
    Connection = dmConnection.fdcDatabase
    Left = 304
    Top = 16
  end
end
