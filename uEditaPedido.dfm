object fEditaPedido: TfEditaPedido
  Left = 0
  Top = 0
  Caption = 'Editar Pedido'
  ClientHeight = 426
  ClientWidth = 512
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
    Width = 512
    Height = 369
    Align = alClient
    TabOrder = 0
    ExplicitTop = 63
    ExplicitHeight = 366
    object lblItens: TLabel
      Left = 14
      Top = 15
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
      Left = 0
      Top = 40
      Width = 512
      Height = 329
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object panelTop: TPanel
    Left = 0
    Top = 0
    Width = 512
    Height = 57
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 890
    object lblNumeroPedido: TLabel
      Left = 14
      Top = 20
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
      Left = 223
      Top = 19
      Width = 49
      Height = 19
      Caption = 'Status:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnSalvar: TButton
      Left = 407
      Top = 7
      Width = 90
      Height = 42
      Caption = 'Salvar'
      TabOrder = 0
    end
  end
  object fdqItensPedido: TFDQuery
    Left = 264
    Top = 64
  end
  object dsItensPedido: TDataSource
    Left = 192
    Top = 64
  end
end
