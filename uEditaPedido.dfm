object fEditaPedido: TfEditaPedido
  Left = 0
  Top = 0
  Caption = 'Editar Pedido'
  ClientHeight = 610
  ClientWidth = 890
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
    Top = 57
    Width = 890
    Height = 553
    Align = alClient
    TabOrder = 0
    ExplicitTop = 63
    ExplicitWidth = 858
    object lblNumeroPedido: TLabel
      Left = 16
      Top = 38
      Width = 144
      Height = 19
      Caption = 'Numero do Pedido: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblStatus: TLabel
      Left = 16
      Top = 63
      Width = 144
      Height = 19
      Caption = 'Status:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblItens: TLabel
      Left = 16
      Top = 103
      Width = 111
      Height = 19
      Caption = 'Itens do pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object dbgItensPedido: TDBGrid
      Left = 16
      Top = 128
      Width = 737
      Height = 385
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object btnSalvar: TButton
      Left = 783
      Top = 480
      Width = 90
      Height = 33
      Caption = 'Salvar'
      TabOrder = 1
    end
  end
  object panelTop: TPanel
    Left = 0
    Top = 0
    Width = 890
    Height = 57
    Align = alTop
    TabOrder = 1
    ExplicitLeft = 1
    ExplicitTop = 1
    ExplicitWidth = 856
  end
  object fdqItensPedido: TFDQuery
    Left = 776
    Top = 8
  end
  object dsItensPedido: TDataSource
    Left = 696
    Top = 8
  end
end
