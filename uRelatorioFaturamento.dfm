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
  end
  object panelMid: TPanel
    Left = 0
    Top = 43
    Width = 470
    Height = 279
    Align = alClient
    TabOrder = 1
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
          Width = 345
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'quantidade'
          Title.Alignment = taCenter
          Title.Caption = 'QTD'
          Width = 50
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'sum'
          Title.Alignment = taCenter
          Title.Caption = '$Total R'
          Width = 50
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
    Left = 216
    Top = 256
  end
  object fdqFaturamento: TFDQuery
    Active = True
    Connection = dmConnection.fdcDatabase
    SQL.Strings = (
      'SELECT'
      '  c.nome           AS CATEGORIA,'
      '  count(1)         AS QUANTIDADE,'
      '  sum(p.preco)'
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
    object fdqFaturamentosum: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'sum'
      Origin = 'sum'
      ReadOnly = True
      DisplayFormat = 'R$ 0.00'
      Precision = 64
      Size = 0
    end
  end
  object frxDBFaturamento: TfrxDBDataset
    UserName = 'Produtos'
    CloseDataSource = False
    DataSet = fdqFaturamento
    BCDToCurrency = False
    Left = 56
    Top = 254
  end
  object frxFaturamento: TfrxReport
    Version = '6.0.10'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43260.752307731500000000
    ReportOptions.LastChange = 43276.656197615740000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 136
    Top = 254
    Datasets = <
      item
        DataSet = frxDBFaturamento
        DataSetName = 'Produtos'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Style = fsDot
      Frame.Typ = []
      Frame.BottomLine.Width = 2.000000000000000000
      HGuides.Strings = (
        '-20')
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 45.354360000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baCenter
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de Faturamento')
          ParentFont = False
        end
        object Date: TfrxMemoView
          IndexTag = 1
          Left = 529.134200000000000000
          Top = 7.559060000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'mm/dd/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Gerado em [Date]')
          ParentFont = False
        end
      end
      object asasasasa: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 166.299320000000000000
        Width = 718.110700000000000000
        DataSet = frxDBFaturamento
        DataSetName = 'Produtos'
        RowCount = 0
        object Produtosid: TfrxMemoView
          IndexTag = 1
          Width = 514.016080000000000000
          Height = 18.897650000000000000
          DataField = 'categoria'
          DataSet = frxDBFaturamento
          DataSetName = 'Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Produtos."categoria"]')
          ParentFont = False
        end
        object Produtosnome: TfrxMemoView
          IndexTag = 1
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataField = 'sum'
          DataSet = frxDBFaturamento
          DataSetName = 'Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Produtos."sum"]')
          ParentFont = False
        end
        object Produtosnome_1: TfrxMemoView
          IndexTag = 1
          Left = 514.016080000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataField = 'quantidade'
          DataSet = frxDBFaturamento
          DataSetName = 'Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Produtos."quantidade"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 291.023810000000000000
        Width = 718.110700000000000000
        object Page: TfrxMemoView
          IndexTag = 1
          Left = 680.315400000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 124.724490000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          IndexTag = 1
          Width = 514.016080000000000000
          Height = 18.897650000000000000
          DataSet = frxDBFaturamento
          DataSetName = 'Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clBlack
          Memo.UTF8W = (
            'Categoria')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          IndexTag = 1
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataSet = frxDBFaturamento
          DataSetName = 'Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clBlack
          HAlign = haRight
          Memo.UTF8W = (
            'Total R$')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          IndexTag = 1
          Left = 514.016080000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataSet = frxDBFaturamento
          DataSetName = 'Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clBlack
          HAlign = haCenter
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 207.874150000000000000
        Width = 718.110700000000000000
        object Memo6: TfrxMemoView
          IndexTag = 1
          Left = 529.134200000000000000
          Top = 3.779530000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          DataSet = frxDBFaturamento
          DataSetName = 'Produtos'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Faturamento Total: [SUM(<Produtos."sum">,asasasasa)]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = -2.000000000000000000
          Top = 1.000000000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
    end
  end
end
