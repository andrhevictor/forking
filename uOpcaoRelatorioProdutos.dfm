object fOpcaoRelatorioProduto: TfOpcaoRelatorioProduto
  Left = 0
  Top = 0
  Caption = 'Filtros Relat'#243'rio de Produtos'
  ClientHeight = 279
  ClientWidth = 566
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
    Width = 566
    Height = 43
    Align = alTop
    TabOrder = 0
    DesignSize = (
      566
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
    object btnGerarRelatorio: TButton
      Left = 480
      Top = 3
      Width = 75
      Height = 35
      Caption = 'Gerar'
      TabOrder = 0
      OnClick = btnGerarRelatorioClick
    end
  end
  object panelMid: TPanel
    Left = 0
    Top = 43
    Width = 566
    Height = 236
    Align = alClient
    TabOrder = 1
    ExplicitTop = 44
    object lblAte: TLabel
      Left = 106
      Top = 29
      Width = 18
      Height = 16
      Caption = 'at'#233
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 48
      Top = -1
      Width = 490
      Height = 24
      Caption = 'Bot'#227'o gerar esta fixo, os filtros est'#227'o em constru'#231#227'o :P'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object dtmInicial: TDateTimePicker
      Left = 16
      Top = 24
      Width = 81
      Height = 21
      Date = 43261.723393333330000000
      Time = 43261.723393333330000000
      TabOrder = 0
    end
    object dtmFinal: TDateTimePicker
      Left = 133
      Top = 24
      Width = 81
      Height = 21
      Date = 43261.723393333330000000
      Time = 43261.723393333330000000
      TabOrder = 1
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 68
      Width = 566
      Height = 165
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
end
