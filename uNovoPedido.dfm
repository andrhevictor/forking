object fNovoPedido: TfNovoPedido
  Left = 0
  Top = 0
  Caption = 'Novo Pedido'
  ClientHeight = 389
  ClientWidth = 769
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
    Width = 769
    Height = 332
    Align = alClient
    TabOrder = 0
    ExplicitTop = 56
    ExplicitHeight = 333
    object dbgProdutos: TDBGrid
      Left = 192
      Top = 24
      Width = 320
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
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Visible = True
        end>
    end
    object dbgCategoria: TDBGrid
      Left = 32
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
  end
  object panelTop: TPanel
    Left = 0
    Top = 0
    Width = 769
    Height = 57
    Align = alTop
    TabOrder = 1
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
    Left = 616
    Top = 8
  end
  object fdqCategoria: TFDQuery
    Active = True
    Connection = dmConnection.fdcDatabase
    SQL.Strings = (
      'select * from categorias')
    Left = 552
    Top = 8
  end
  object dsCategoria: TDataSource
    DataSet = fdqCategoria
    Left = 488
    Top = 8
  end
end
