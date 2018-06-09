object fRelatorios: TfRelatorios
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rios'
  ClientHeight = 231
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object frxProdutos: TfrxReport
    Version = '6.0.10'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43260.752307731500000000
    ReportOptions.LastChange = 43260.794333148200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 24
    Top = 16
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
      Frame.Typ = []
      HGuides.Strings = (
        '-20')
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
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
          Left = 616.063390000000000000
          Top = 7.559060000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
      end
      object asasasasa: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 154.960730000000000000
        Width = 718.110700000000000000
        DataSet = frxDBProdutos
        DataSetName = 'Produtos'
        RowCount = 0
        object Produtosid: TfrxMemoView
          IndexTag = 1
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 56.692950000000000000
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
          Top = 3.779530000000000000
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
          Top = 3.779530000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = 'preco'
          DataSet = frxDBProdutos
          DataSetName = 'Produtos'
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
      object Header1: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 109.606370000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          IndexTag = 1
          Top = 3.779530000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataSet = frxDBProdutos
          DataSetName = 'Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clGray
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          IndexTag = 1
          Left = 64.252010000000000000
          Top = 3.779530000000000000
          Width = 559.370440000000000000
          Height = 18.897650000000000000
          DataSet = frxDBProdutos
          DataSetName = 'Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clGray
          Memo.UTF8W = (
            'Nome')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          IndexTag = 1
          Left = 623.622450000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataSet = frxDBProdutos
          DataSetName = 'Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clGray
          HAlign = haRight
          Memo.UTF8W = (
            'Pre'#231'o')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 241.889920000000000000
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
    end
  end
  object frxDBProdutos: TfrxDBDataset
    UserName = 'Produtos'
    CloseDataSource = False
    DataSet = fVisualizarProduto.fdqProdutos
    BCDToCurrency = False
    Left = 96
    Top = 16
  end
end
