object fOpcaoRelatorioProduto: TfOpcaoRelatorioProduto
  Left = 0
  Top = 0
  Caption = 'Filtros Relat'#243'rio de Produtos'
  ClientHeight = 414
  ClientWidth = 579
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
    Width = 579
    Height = 43
    Align = alTop
    TabOrder = 0
    DesignSize = (
      579
      43)
    object lblTituloRelatorio: TLabel
      Left = 184
      Top = 9
      Width = 192
      Height = 24
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Relat'#243'rio de Produtos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object panelMid: TPanel
    Left = 0
    Top = 43
    Width = 579
    Height = 371
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 0
      Top = 87
      Width = 579
      Height = 285
      DataSource = dsTodoProdutos
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
          FieldName = 'nome_1'
          Title.Caption = 'Categoria'
          Width = 104
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Title.Caption = 'Produto'
          Width = 393
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco'
          Title.Caption = 'Pre'#231'o'
          Visible = True
        end>
    end
    object gbImpressao: TGroupBox
      Left = 416
      Top = 1
      Width = 153
      Height = 80
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
        Top = 23
        Width = 64
        Height = 17
        Caption = 'Categoria'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rbOrdenaCategoriaClick
      end
      object rbOrdenaPreco: TRadioButton
        Left = 15
        Top = 46
        Width = 50
        Height = 17
        Caption = 'Pre'#231'o'
        TabOrder = 1
        OnClick = rbOrdenaPrecoClick
      end
      object rbProdutoMaisVendido: TRadioButton
        Left = 101
        Top = 23
        Width = 84
        Height = 17
        Caption = 'Mais Vendidos'
        TabOrder = 2
        OnClick = rbProdutoMaisVendidoClick
      end
    end
  end
  object dsTodoProdutos: TDataSource
    DataSet = fdqTodosProdutos
    Left = 344
    Top = 192
  end
  object fdqTodosProdutos: TFDQuery
    Active = True
    Connection = dmConnection.fdcDatabase
    SQL.Strings = (
      'SELECT * FROM produtos'
      'INNER JOIN categorias'
      'ON produtos.categoria_id = categorias.id'
      'ORDER BY categoria_id')
    Left = 264
    Top = 192
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
    Left = 264
    Top = 144
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
    ReportOptions.LastChange = 43273.545682384260000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 344
    Top = 144
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
            'Gera em [Date]')
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
    ReportOptions.LastChange = 43273.539569618060000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 440
    Top = 144
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
            'Gera em [Date]')
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
end
