object fRelatorioFaturamento: TfRelatorioFaturamento
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Faturamento'
  ClientHeight = 322
  ClientWidth = 470
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
    Width = 470
    Height = 43
    Align = alTop
    TabOrder = 0
    object lblTituloRelatorio: TLabel
      Left = 1
      Top = 1
      Width = 468
      Height = 41
      Align = alClient
      Alignment = taCenter
      Caption = 'Relat'#243'rio de Faturamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 228
      ExplicitHeight = 24
    end
    object lblAlerta: TLabel
      Left = 111
      Top = 30
      Width = 263
      Height = 13
      Caption = 'Adicionar coluna de valor total faturando por categoria'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object panelMid: TPanel
    Left = 0
    Top = 43
    Width = 470
    Height = 279
    Align = alClient
    TabOrder = 1
    ExplicitTop = -121
    ExplicitHeight = 352
    DesignSize = (
      470
      279)
    object gbImpressao: TGroupBox
      Left = 344
      Top = 6
      Width = 121
      Height = 75
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Impress'#227'o'
      TabOrder = 0
      object btnGerarRelatorio: TButton
        Left = 14
        Top = 23
        Width = 95
        Height = 32
        Caption = 'Gerar'
        TabOrder = 0
      end
    end
    object gbFiltro: TGroupBox
      Left = 4
      Top = 6
      Width = 157
      Height = 75
      Caption = 'Faturamento por'
      TabOrder = 1
      object rbCategoria: TRadioButton
        Left = 35
        Top = 32
        Width = 71
        Height = 17
        Caption = 'Categoria'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 87
      Width = 469
      Height = 266
      BiDiMode = bdRightToLeftReadingOnly
      BorderStyle = bsNone
      DataSource = dsFaturamento
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentBiDiMode = False
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'categoria'
          Title.Caption = 'Categoria'
          Width = 338
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'quantidade'
          Title.Alignment = taCenter
          Title.Caption = 'QTD'
          Width = 51
          Visible = True
        end>
    end
    object gbData: TGroupBox
      Left = 167
      Top = 6
      Width = 171
      Height = 75
      Caption = 'Data'
      TabOrder = 3
      object lblDataInicio: TLabel
        Left = 6
        Top = 25
        Width = 49
        Height = 13
        Caption = 'Data inicio'
      end
      object lblDataFim: TLabel
        Left = 88
        Top = 25
        Width = 40
        Height = 13
        Caption = 'Data fim'
      end
      object dtpFim: TDateTimePicker
        Left = 88
        Top = 40
        Width = 78
        Height = 21
        Date = 42909.856660659720000000
        Time = 42909.856660659720000000
        TabOrder = 0
      end
      object dtpInicio: TDateTimePicker
        Left = 6
        Top = 40
        Width = 78
        Height = 21
        Date = 42909.856660659720000000
        Time = 42909.856660659720000000
        TabOrder = 1
      end
    end
  end
  object dsFaturamento: TDataSource
    DataSet = fdqFaturamento
    Left = 304
    Top = 200
  end
  object fdqFaturamento: TFDQuery
    Active = True
    Connection = dmConnection.fdcDatabase
    SQL.Strings = (
      'SELECT'
      '  c.nome           AS CATEGORIA,'
      '  count(1)         AS QUANTIDADE'
      'FROM pedidos_itens'
      '  INNER JOIN produtos p on pedidos_itens.produto_id = p.id'
      '  INNER JOIN categorias c on p.categoria_id = c.id'
      '  INNER JOIN pedidos ON pedidos_itens.pedido_id = pedidos.id'
      'GROUP BY c.nome;')
    Left = 304
    Top = 256
    object fdqFaturamentocategoria: TWideStringField
      FieldName = 'categoria'
      Origin = 'categoria'
      Size = 40
    end
    object fdqFaturamentoquantidade: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'quantidade'
      Origin = 'quantidade'
      ReadOnly = True
      DisplayFormat = '0.0'
    end
  end
end
