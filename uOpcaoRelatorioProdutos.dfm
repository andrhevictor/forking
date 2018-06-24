object fOpcaoRelatorioProduto: TfOpcaoRelatorioProduto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Filtros Relat'#243'rio de Produtos'
  ClientHeight = 474
  ClientWidth = 469
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
    Width = 469
    Height = 43
    Align = alTop
    TabOrder = 0
    object lblTituloRelatorio: TLabel
      Left = 1
      Top = 1
      Width = 467
      Height = 41
      Align = alClient
      Alignment = taCenter
      Caption = 'Relat'#243'rio de Produtos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 0
      ExplicitTop = 8
      ExplicitWidth = 469
      ExplicitHeight = 24
    end
  end
  object panelMid: TPanel
    Left = 0
    Top = 43
    Width = 469
    Height = 431
    Align = alClient
    TabOrder = 1
    DesignSize = (
      469
      431)
    object dbGrid1: TDBGrid
      Left = 0
      Top = 87
      Width = 469
      Height = 345
      Anchors = [akLeft, akTop, akRight, akBottom]
      BiDiMode = bdRightToLeftReadingOnly
      DataSource = dsTodoProdutos
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentBiDiMode = False
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
          FieldName = 'nome_1'
          Title.Caption = 'Categoria'
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Title.Caption = 'Produto'
          Width = 286
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'preco'
          Title.Alignment = taCenter
          Title.Caption = '$Pre'#231'o R'
          Width = 72
          Visible = True
        end>
    end
    object gbImpressao: TGroupBox
      Left = 311
      Top = 6
      Width = 153
      Height = 75
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Impress'#227'o'
      TabOrder = 1
      object btnGerarRelatorio: TButton
        Left = 15
        Top = 43
        Width = 129
        Height = 25
        Caption = 'Gerar'
        TabOrder = 0
        OnClick = btnGerarRelatorioClick
      end
      object cbxAgurpar: TCheckBox
        Left = 20
        Top = 20
        Width = 121
        Height = 17
        Caption = 'Agrupa por Categoria'
        TabOrder = 1
      end
    end
    object gbGridOrdenacao: TGroupBox
      Left = 3
      Top = 6
      Width = 291
      Height = 75
      Caption = 'Ordena por:'
      TabOrder = 2
      object rbOrdenaCategoria: TRadioButton
        Left = 15
        Top = 31
        Width = 64
        Height = 17
        Caption = 'Categoria'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rbOrdenaCategoriaClick
      end
      object rbOrdenaPreco: TRadioButton
        Left = 223
        Top = 31
        Width = 50
        Height = 17
        Caption = 'Pre'#231'o'
        TabOrder = 1
        OnClick = rbOrdenaPrecoClick
      end
      object rbProdutoMaisVendido: TRadioButton
        Left = 109
        Top = 31
        Width = 84
        Height = 17
        Caption = 'Mais Vendidos'
        TabOrder = 2
        OnClick = rbProdutoMaisVendidoClick
      end
    end
    object dbGrid2: TDBGrid
      AlignWithMargins = True
      Left = 0
      Top = 87
      Width = 469
      Height = 346
      Anchors = [akLeft, akTop, akRight, akBottom]
      BiDiMode = bdRightToLeftReadingOnly
      BorderStyle = bsNone
      DataSource = dsProdutosMaisVendidos
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentBiDiMode = False
      ReadOnly = True
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Visible = False
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'id'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Width = 46
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'produto'
          Title.Caption = 'Produto'
          Width = 276
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
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'preco'
          Title.Alignment = taCenter
          Title.Caption = '$Pre'#231'o R'
          Width = 74
          Visible = True
        end>
    end
  end
  object dsTodoProdutos: TDataSource
    DataSet = fdqTodosProdutos
    Left = 296
    Top = 328
  end
  object fdqTodosProdutos: TFDQuery
    Active = True
    Connection = dmConnection.fdcDatabase
    SQL.Strings = (
      'SELECT * FROM produtos'
      'INNER JOIN categorias'
      'ON produtos.categoria_id = categorias.id'
      'ORDER BY categoria_id')
    Left = 200
    Top = 320
    object fdqTodosProdutosid: TLargeintField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdqTodosProdutoscategoria_id: TLargeintField
      FieldName = 'categoria_id'
      Origin = 'categoria_id'
    end
    object fdqTodosProdutosnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object fdqTodosProdutospreco: TBCDField
      FieldName = 'preco'
      Origin = 'preco'
      DisplayFormat = '0.00'
      Precision = 6
      Size = 2
    end
    object fdqTodosProdutosdescricao: TWideStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 8190
    end
    object fdqTodosProdutosid_1: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'id_1'
      Origin = 'id'
    end
    object fdqTodosProdutosnome_1: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome_1'
      Origin = 'nome'
      Size = 40
    end
  end
  object frxDBProdutos: TfrxDBDataset
    UserName = 'Produtos'
    CloseDataSource = False
    DataSet = fdqTodosProdutos
    BCDToCurrency = False
    Left = 200
    Top = 272
  end
  object frxProdutos: TfrxReport
    Version = '6.0.10'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43260.752307731500000000
    ReportOptions.LastChange = 43274.829198692130000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 296
    Top = 272
    Datasets = <
      item
        DataSet = frxDBProdutos
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
            'Relat'#243'rio de Produtos')
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
        DataSet = frxDBProdutos
        DataSetName = 'Produtos'
        RowCount = 0
        object Produtosid: TfrxMemoView
          IndexTag = 1
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataField = 'id'
          DataSet = frxDBProdutos
          DataSetName = 'Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Produtos."id"]')
          ParentFont = False
        end
        object Produtosnome: TfrxMemoView
          IndexTag = 1
          Left = 192.756030000000000000
          Width = 430.866420000000000000
          Height = 18.897650000000000000
          DataField = 'nome'
          DataSet = frxDBProdutos
          DataSetName = 'Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Produtos."nome"]')
          ParentFont = False
        end
        object Produtospreco: TfrxMemoView
          IndexTag = 1
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataSet = frxDBProdutos
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
            '[Produtos."preco"]')
          ParentFont = False
        end
        object Produtosnome_1: TfrxMemoView
          IndexTag = 1
          Left = 64.252010000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DataField = 'nome_1'
          DataSet = frxDBProdutos
          DataSetName = 'Produtos'
          Frame.Typ = []
          Memo.UTF8W = (
            '[Produtos."nome_1"]')
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
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 207.874150000000000000
        Width = 718.110700000000000000
        object Memo7: TfrxMemoView
          Left = 619.842920000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
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
            'Total: [SUM(<Produtos."preco">,asasasasa)]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 1.000000000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
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
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataSet = frxDBProdutos
          DataSetName = 'Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clBlack
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          IndexTag = 1
          Left = 64.252010000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DataSet = frxDBProdutos
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
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataSet = frxDBProdutos
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
            'Pre'#231'o R$')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          IndexTag = 1
          Left = 192.756030000000000000
          Width = 430.866420000000000000
          Height = 18.897650000000000000
          DataSet = frxDBProdutos
          DataSetName = 'Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clBlack
          Memo.UTF8W = (
            'Produto')
          ParentFont = False
        end
      end
    end
  end
  object frxProdutosPorCategoria: TfrxReport
    Version = '6.0.10'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43260.752307731500000000
    ReportOptions.LastChange = 43274.828862280090000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 384
    Top = 280
    Datasets = <
      item
        DataSet = frxDBProdutos
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
        Height = 71.811070000000000000
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
            'Relat'#243'rio de Produtos')
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
        object Memo5: TfrxMemoView
          Left = 279.685220000000000000
          Top = 34.015770000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Agrupado por Categoria')
        end
      end
      object asasasasa: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 234.330860000000000000
        Width = 718.110700000000000000
        DataSet = frxDBProdutos
        DataSetName = 'Produtos'
        RowCount = 0
        object Produtosid: TfrxMemoView
          IndexTag = 1
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataField = 'id'
          DataSet = frxDBProdutos
          DataSetName = 'Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Produtos."id"]')
          ParentFont = False
        end
        object Produtosnome: TfrxMemoView
          IndexTag = 1
          Left = 64.252010000000000000
          Width = 559.370440000000000000
          Height = 18.897650000000000000
          DataField = 'nome'
          DataSet = frxDBProdutos
          DataSetName = 'Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Produtos."nome"]')
          ParentFont = False
        end
        object Produtospreco: TfrxMemoView
          IndexTag = 1
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataSet = frxDBProdutos
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
            '[Produtos."preco"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 404.409710000000000000
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
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 151.181200000000000000
        Width = 718.110700000000000000
        Child = frxProdutosPorCategoria.Child1
        Condition = 'Produtos."id_1"'
        object Produtosnome_1: TfrxMemoView
          IndexTag = 1
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataField = 'nome_1'
          DataSet = frxDBProdutos
          DataSetName = 'Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Produtos."nome_1"]')
          ParentFont = False
        end
      end
      object Child1: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 192.756030000000000000
        Width = 718.110700000000000000
        ToNRows = 0
        ToNRowsMode = rmCount
        object Memo2: TfrxMemoView
          IndexTag = 1
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataSet = frxDBProdutos
          DataSetName = 'Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clBlack
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          IndexTag = 1
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataSet = frxDBProdutos
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
            'Pre'#231'o RS')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          IndexTag = 1
          Left = 64.252010000000000000
          Width = 559.370440000000000000
          Height = 18.897650000000000000
          DataSet = frxDBProdutos
          DataSetName = 'Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clBlack
          Memo.UTF8W = (
            'Nome')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 275.905690000000000000
        Width = 718.110700000000000000
        object Memo6: TfrxMemoView
          Left = 551.811380000000000000
          Top = 3.779530000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
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
            'Total por grupo: [SUM(<Produtos."preco">,asasasasa)]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 2.000000000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 321.260050000000000000
        Width = 718.110700000000000000
        object Memo7: TfrxMemoView
          Left = 619.842920000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
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
            'Total: [SUM(<Produtos."preco">,asasasasa)]')
          ParentFont = False
        end
      end
    end
  end
  object fdqProdutosMaisVendidos: TFDQuery
    Active = True
    Connection = dmConnection.fdcDatabase
    SQL.Strings = (
      'SELECT p.id, p.nome AS PRODUTO, count(1) AS QUANTIDADE, p.preco'
      'FROM pedidos_itens'
      'INNER JOIN produtos p on pedidos_itens.produto_id = p.id'
      'INNER JOIN categorias c on p.categoria_id = c.id'
      'INNER JOIN pedidos ON pedidos_itens.pedido_id = pedidos.id'
      'INNER JOIN pagamentos p2 on pedidos.id = p2.pedido_id'
      'GROUP BY p.nome, p.preco, p.id'
      'ORDER BY QUANTIDADE DESC')
    Left = 200
    Top = 376
    object fdqProdutosMaisVendidosproduto: TWideStringField
      DisplayWidth = 68
      FieldName = 'produto'
      Size = 100
    end
    object fdqProdutosMaisVendidosquantidade: TLargeintField
      DisplayWidth = 15
      FieldName = 'quantidade'
      ReadOnly = True
    end
    object fdqProdutosMaisVendidospreco: TBCDField
      DisplayWidth = 7
      FieldName = 'preco'
      DisplayFormat = '0.00'
      Precision = 6
      Size = 2
    end
    object fdqProdutosMaisVendidosid: TLargeintField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
  end
  object dsProdutosMaisVendidos: TDataSource
    DataSet = fdqProdutosMaisVendidos
    Left = 296
    Top = 376
  end
  object frxMaisVendidos: TfrxReport
    Version = '6.0.10'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43260.752307731500000000
    ReportOptions.LastChange = 43274.828213263900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 384
    Top = 328
    Datasets = <
      item
        DataSet = frxDBMaisVendidos
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
        Height = 68.031540000000000000
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
            'Relat'#243'rio de Produtos')
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
        object Memo8: TfrxMemoView
          Top = 34.015770000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Produtos mais vendidos')
          ParentFont = False
        end
      end
      object asasasasa: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 188.976500000000000000
        Width = 718.110700000000000000
        DataSet = frxDBMaisVendidos
        DataSetName = 'Produtos'
        RowCount = 0
        object Produtosproduto: TfrxMemoView
          IndexTag = 1
          Top = -1.102350000000000000
          Width = 309.921460000000000000
          Height = 18.897650000000000000
          DataField = 'produto'
          DataSet = frxDBMaisVendidos
          DataSetName = 'Produtos'
          Frame.Typ = []
          Memo.UTF8W = (
            '[Produtos."produto"]')
        end
        object Produtospreco: TfrxMemoView
          IndexTag = 1
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataSet = frxDBMaisVendidos
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
            '[Produtos."preco"]')
          ParentFont = False
        end
        object Produtosquantidade: TfrxMemoView
          IndexTag = 1
          Left = 529.134200000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataSet = frxDBMaisVendidos
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
        Top = 313.700990000000000000
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
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 230.551330000000000000
        Width = 718.110700000000000000
        object Memo7: TfrxMemoView
          Left = 604.724800000000000000
          Top = 3.779530000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
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
            'Total: [SUM(<Produtos."preco">,asasasasa)]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 1.000000000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 147.401670000000000000
        Width = 718.110700000000000000
        object Memo4: TfrxMemoView
          IndexTag = 1
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataSet = frxDBProdutos
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
            'Pre'#231'o R$')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          IndexTag = 1
          Width = 529.134200000000000000
          Height = 18.897650000000000000
          DataSet = frxDBProdutos
          DataSetName = 'Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clBlack
          Memo.UTF8W = (
            'Produto')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          IndexTag = 1
          Left = 529.134200000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataSet = frxDBProdutos
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
            'QTD')
          ParentFont = False
        end
      end
    end
  end
  object frxDBMaisVendidos: TfrxDBDataset
    UserName = 'Produtos'
    CloseDataSource = False
    DataSet = fdqProdutosMaisVendidos
    BCDToCurrency = False
    Left = 384
    Top = 376
  end
end
