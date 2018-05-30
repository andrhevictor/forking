object fVisualizaFichas: TfVisualizaFichas
  Left = 0
  Top = 0
  Caption = 'Visualizar fichas'
  ClientHeight = 628
  ClientWidth = 1031
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
    Width = 1031
    Height = 73
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 999
  end
  object panelMid: TPanel
    Left = 0
    Top = 73
    Width = 1031
    Height = 555
    Align = alClient
    TabOrder = 1
    ExplicitTop = 8
    ExplicitWidth = 999
    ExplicitHeight = 41
    object DBGrid1: TDBGrid
      Left = 24
      Top = 24
      Width = 201
      Height = 473
      DataSource = dsFichas
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'numero_ficha'
          Title.Alignment = taCenter
          Title.Caption = 'Ficha'
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'disponivel'
          Title.Alignment = taCenter
          Title.Caption = 'Dispon'#237'vel'
          Width = 70
          Visible = True
        end>
    end
  end
  object fdqFichas: TFDQuery
    Active = True
    Connection = dmConnection.fdcDatabase
    SQL.Strings = (
      'SELECT * FROM fichas')
    Left = 904
    Top = 16
  end
  object dsFichas: TDataSource
    DataSet = fdqFichas
    Left = 848
    Top = 16
  end
end
