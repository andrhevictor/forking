object fRelatorioPedidos: TfRelatorioPedidos
  Left = 0
  Top = 0
  Caption = 'Relatorios de Pedidos'
  ClientHeight = 392
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
      Caption = 'Relat'#243'rio de Pedidos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 10
    end
  end
  object panelMid: TPanel
    Left = 0
    Top = 43
    Width = 469
    Height = 349
    Align = alClient
    TabOrder = 1
    DesignSize = (
      469
      349)
    object gbImpressao: TGroupBox
      Left = 312
      Top = 6
      Width = 153
      Height = 75
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Impress'#227'o'
      TabOrder = 0
      object btnGerarRelatorio: TButton
        Left = 15
        Top = 43
        Width = 129
        Height = 25
        Caption = 'Gerar'
        TabOrder = 0
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
    object gbStatus: TGroupBox
      Left = 4
      Top = 6
      Width = 291
      Height = 75
      Caption = 'Status'
      TabOrder = 1
      object rbStatusAberto: TRadioButton
        Left = 76
        Top = 28
        Width = 58
        Height = 17
        Caption = 'Aberto'
        TabOrder = 0
        OnClick = rbStatusAbertoClick
      end
      object rbStatusCancelado: TRadioButton
        Left = 206
        Top = 28
        Width = 74
        Height = 17
        Caption = 'Cancelado'
        TabOrder = 1
        OnClick = rbStatusCanceladoClick
      end
      object rbStatusFechado: TRadioButton
        Left = 140
        Top = 28
        Width = 60
        Height = 17
        Caption = 'Fechado'
        TabOrder = 2
        OnClick = rbStatusFechadoClick
      end
      object rbStatusTodos: TRadioButton
        Left = 12
        Top = 28
        Width = 58
        Height = 17
        Caption = 'Todos'
        Checked = True
        TabOrder = 3
        TabStop = True
        OnClick = rbStatusTodosClick
      end
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 87
      Width = 469
      Height = 266
      BiDiMode = bdRightToLeftReadingOnly
      BorderStyle = bsNone
      DataSource = dsPedidos
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
          Alignment = taCenter
          Expanded = False
          FieldName = 'id'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd. Pedido'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'numero_ficha'
          Title.Alignment = taCenter
          Title.Caption = 'Ficha'
          Width = 56
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'status'
          Title.Alignment = taCenter
          Title.Caption = 'Status'
          Width = 119
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'criado_em'
          Title.Alignment = taCenter
          Title.Caption = 'Cadastrado em'
          Width = 204
          Visible = True
        end>
    end
  end
  object dsPedidos: TDataSource
    DataSet = fdqPedidos
    Left = 136
    Top = 352
  end
  object fdqPedidos: TFDQuery
    Active = True
    Connection = dmConnection.fdcDatabase
    SQL.Strings = (
      'SELECT * FROM pedidos '
      'ORDER BY criado_em DESC')
    Left = 208
    Top = 352
  end
  object frxDBPedidos: TfrxDBDataset
    UserName = 'Produtos'
    CloseDataSource = False
    DataSet = fdqPedidos
    BCDToCurrency = False
    Left = 288
    Top = 352
  end
  object frxPedidos: TfrxReport
    Version = '6.0.10'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43260.752307731500000000
    ReportOptions.LastChange = 43274.827388831020000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 368
    Top = 352
    Datasets = <
      item
        DataSet = frxDBPedidos
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
            'Relat'#243'rio de Pedidos')
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
        DataSet = frxDBPedidos
        DataSetName = 'Produtos'
        RowCount = 0
        object Produtosid: TfrxMemoView
          IndexTag = 1
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'id'
          DataSet = frxDBPedidos
          DataSetName = 'Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Produtos."id"]')
          ParentFont = False
        end
        object Produtosnome: TfrxMemoView
          IndexTag = 1
          Left = 185.196970000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataField = 'status'
          DataSet = frxDBPedidos
          DataSetName = 'Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Produtos."status"]')
          ParentFont = False
        end
        object Produtospreco: TfrxMemoView
          IndexTag = 1
          Left = 298.582870000000000000
          Width = 419.527830000000000000
          Height = 18.897650000000000000
          DataSet = frxDBPedidos
          DataSetName = 'Produtos'
          DisplayFormat.FormatStr = 'hh:mm am/pm - dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Produtos."criado_em"]')
          ParentFont = False
        end
        object Produtosnome_1: TfrxMemoView
          IndexTag = 1
          Left = 94.488250000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataField = 'numero_ficha'
          DataSet = frxDBPedidos
          DataSetName = 'Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Produtos."numero_ficha"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 245.669450000000000000
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
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataSet = frxDBPedidos
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
            'C'#243'd. Pedido')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          IndexTag = 1
          Left = 94.488250000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataSet = frxDBPedidos
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
            'Ficha')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          IndexTag = 1
          Left = 298.582870000000000000
          Width = 419.527830000000000000
          Height = 18.897650000000000000
          DataSet = frxDBPedidos
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
            'Criado em')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          IndexTag = 1
          Left = 185.196970000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataSet = frxDBPedidos
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
            'Status')
          ParentFont = False
        end
      end
    end
  end
end
