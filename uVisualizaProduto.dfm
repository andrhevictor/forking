object fVisualizarProduto: TfVisualizarProduto
  Left = 0
  Top = 0
  Caption = 'Visualizar Produtos'
  ClientHeight = 708
  ClientWidth = 1079
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object panelTop: TPanel
    Left = 0
    Top = 0
    Width = 1079
    Height = 89
    Align = alTop
    TabOrder = 0
  end
  object panelMid: TPanel
    Left = 0
    Top = 89
    Width = 1079
    Height = 619
    Align = alClient
    TabOrder = 1
    object lblFiltro: TLabel
      Left = 256
      Top = 14
      Width = 48
      Height = 23
      Caption = 'Filtrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object dbgProdutos: TDBGrid
      Left = 288
      Top = 110
      Width = 817
      Height = 491
      DataSource = dsProdutos
      Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'nome'
          Title.Alignment = taCenter
          Title.Caption = 'Nome'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco'
          Title.Alignment = taCenter
          Title.Caption = 'Pre'#231'o'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Width = 350
          Visible = True
        end>
    end
    object dbgCategorias: TDBGrid
      Left = 24
      Top = 110
      Width = 209
      Height = 315
      DataSource = dsCategorias
      Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = dbgCategoriasCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          Width = 150
          Visible = True
        end>
    end
    object edtFiltroNome: TEdit
      Left = 256
      Top = 43
      Width = 257
      Height = 21
      TabOrder = 2
      TextHint = 'Filtre pelo nome do produto'
      OnChange = edtFiltroNomeChange
    end
    object btnLimpaFiltros: TButton
      Left = 535
      Top = 41
      Width = 122
      Height = 25
      Caption = 'Limpar Filtro'
      TabOrder = 3
      OnClick = btnLimpaFiltrosClick
    end
  end
  object fdqProdutos: TFDQuery
    Active = True
    Connection = dmConnection.fdcDatabase
    SQL.Strings = (
      'SELECT * FROM produtos')
    Left = 1008
    Top = 24
  end
  object dsProdutos: TDataSource
    DataSet = fdqProdutos
    Left = 944
    Top = 24
  end
  object fdqCategorias: TFDQuery
    Active = True
    Connection = dmConnection.fdcDatabase
    SQL.Strings = (
      'select * from categorias')
    Left = 872
    Top = 24
  end
  object dsCategorias: TDataSource
    DataSet = fdqCategorias
    Left = 792
    Top = 24
  end
end
