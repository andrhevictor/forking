object fNovoPedido: TfNovoPedido
  Left = 0
  Top = 0
  Caption = 'Novo Pedido'
  ClientHeight = 582
  ClientWidth = 884
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
    Width = 884
    Height = 525
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 769
    ExplicitHeight = 332
    object dbgProdutos: TDBGrid
      Left = 160
      Top = 24
      Width = 369
      Height = 201
      DataSource = dsProdutos
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = dbgProdutosDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'nome'
          Title.Caption = 'Nome'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco'
          Title.Caption = 'Pre'#231'o'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Caption = 'Descri'#231#227'o'
          Width = 150
          Visible = True
        end>
    end
    object dbgCategoria: TDBGrid
      Left = 16
      Top = 24
      Width = 129
      Height = 201
      DataSource = dsCategoria
      Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = dbgCategoriaCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'nome'
          Visible = True
        end>
    end
    object DBGrid1: TDBGrid
      Left = 16
      Top = 264
      Width = 513
      Height = 217
      DataSource = dsItensPedido
      TabOrder = 2
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
    Width = 884
    Height = 57
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 769
  end
  object fdqProdutos: TFDQuery
    Active = True
    Connection = dmConnection.fdcDatabase
    SQL.Strings = (
      'select * from produtos')
    Left = 696
    Top = 8
  end
  object dsProdutos: TDataSource
    DataSet = fdqProdutos
    Left = 632
    Top = 8
  end
  object fdqCategoria: TFDQuery
    Active = True
    Connection = dmConnection.fdcDatabase
    SQL.Strings = (
      'select * from categorias')
    Left = 560
    Top = 8
  end
  object dsCategoria: TDataSource
    DataSet = fdqCategoria
    Left = 496
    Top = 8
  end
  object fdqItensPedido: TFDQuery
    Connection = dmConnection.fdcDatabase
    Left = 424
    Top = 8
  end
  object dsItensPedido: TDataSource
    DataSet = fdqItensPedido
    Left = 344
    Top = 8
  end
end
