object fVisualizarProduto: TfVisualizarProduto
  Left = 0
  Top = 0
  Caption = 'Visualizar Produtos'
  ClientHeight = 645
  ClientWidth = 1061
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
    Width = 1061
    Height = 89
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 1079
  end
  object panelMid: TPanel
    Left = 0
    Top = 89
    Width = 1061
    Height = 556
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 1079
    ExplicitHeight = 619
    object lblFiltro: TLabel
      Left = 16
      Top = 6
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
    object lblId: TLabel
      Left = 648
      Top = 78
      Width = 11
      Height = 13
      Caption = 'ID'
      FocusControl = DBEdit1
    end
    object lblNome: TLabel
      Left = 648
      Top = 176
      Width = 27
      Height = 13
      Caption = 'Nome'
      FocusControl = DBEdit2
    end
    object lblPreco: TLabel
      Left = 648
      Top = 273
      Width = 27
      Height = 13
      Caption = 'Pre'#231'o'
      FocusControl = DBEdit3
    end
    object lblDescricao: TLabel
      Left = 648
      Top = 221
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
      FocusControl = DBEdit4
    end
    object lblCategoria: TLabel
      Left = 648
      Top = 121
      Width = 47
      Height = 13
      Caption = 'Categoria'
      FocusControl = DBEdit2
    end
    object dbgProdutos: TDBGrid
      Left = 175
      Top = 94
      Width = 458
      Height = 315
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
      Left = 16
      Top = 94
      Width = 153
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
          Width = 90
          Visible = True
        end>
    end
    object edtFiltroNome: TEdit
      Left = 16
      Top = 35
      Width = 257
      Height = 21
      TabOrder = 2
      TextHint = 'Filtre pelo nome do produto'
      OnChange = edtFiltroNomeChange
    end
    object btnLimpaFiltros: TButton
      Left = 319
      Top = 33
      Width = 122
      Height = 25
      Caption = 'Limpar Filtro'
      TabOrder = 3
      OnClick = btnLimpaFiltrosClick
    end
    object DBEdit1: TDBEdit
      Left = 648
      Top = 94
      Width = 199
      Height = 21
      DataField = 'id'
      DataSource = dsProdutos
      Enabled = False
      TabOrder = 4
    end
    object DBEdit2: TDBEdit
      Left = 648
      Top = 192
      Width = 300
      Height = 21
      DataField = 'nome'
      DataSource = dsProdutos
      TabOrder = 5
    end
    object DBEdit3: TDBEdit
      Left = 648
      Top = 292
      Width = 95
      Height = 21
      DataField = 'preco'
      DataSource = dsProdutos
      TabOrder = 6
    end
    object DBEdit4: TDBEdit
      Left = 648
      Top = 240
      Width = 300
      Height = 21
      DataField = 'descricao'
      DataSource = dsProdutos
      TabOrder = 7
    end
    object btnSalvar: TButton
      Left = 888
      Top = 376
      Width = 91
      Height = 33
      Caption = 'Salvar'
      TabOrder = 8
      OnClick = btnSalvarClick
    end
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 648
    Top = 229
    Width = 145
    Height = 21
    DataField = 'categoria_id'
    DataSource = dsProdutos
    KeyField = 'id'
    ListField = 'nome'
    ListSource = dsCategorias
    TabOrder = 2
  end
  object fdqProdutos: TFDQuery
    Connection = dmConnection.fdcDatabase
    Left = 1008
    Top = 24
    object fdqProdutosid: TLargeintField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdqProdutoscategoria_id: TLargeintField
      FieldName = 'categoria_id'
      Origin = 'categoria_id'
    end
    object fdqProdutosnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object fdqProdutospreco: TBCDField
      FieldName = 'preco'
      Origin = 'preco'
      Precision = 6
      Size = 2
    end
    object fdqProdutosdescricao: TWideStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 8190
    end
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
