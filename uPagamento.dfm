object fPagamento: TfPagamento
  Left = 0
  Top = 0
  Caption = 'Pagamento'
  ClientHeight = 518
  ClientWidth = 876
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object panelMid: TPanel
    Left = 0
    Top = 117
    Width = 876
    Height = 401
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 80
    ExplicitTop = 88
    ExplicitWidth = 185
    ExplicitHeight = 41
  end
  object panelTop: TPanel
    Left = 0
    Top = 0
    Width = 876
    Height = 117
    Align = alTop
    TabOrder = 1
    ExplicitTop = -6
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=restaurante'
      'User_Name=postgres'
      'Password=admin'
      'Port=5433'
      'DriverID=pG')
    Connected = True
    Left = 672
    Top = 48
  end
  object DataSource1: TDataSource
    Left = 744
    Top = 48
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 808
    Top = 48
  end
end
