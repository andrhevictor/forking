object fEditaProduto: TfEditaProduto
  Left = 0
  Top = 0
  Caption = 'Editar produtos'
  ClientHeight = 572
  ClientWidth = 1008
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
    Width = 1008
    Height = 57
    Align = alTop
    TabOrder = 0
  end
  object panelMid: TPanel
    Left = 0
    Top = 57
    Width = 1008
    Height = 515
    Align = alClient
    TabOrder = 1
    ExplicitTop = 63
    object lblCategoria: TLabel
      Left = 360
      Top = 6
      Width = 67
      Height = 19
      Caption = 'Categoria'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblCategoriaEdit: TLabel
      Left = 24
      Top = 56
      Width = 47
      Height = 13
      Caption = 'Categoria'
      FocusControl = DBEdit1
    end
    object lblNome: TLabel
      Left = 24
      Top = 96
      Width = 27
      Height = 13
      Caption = 'Nome'
      FocusControl = DBEdit2
    end
    object lblPreco: TLabel
      Left = 24
      Top = 136
      Width = 27
      Height = 13
      Caption = 'Pre'#231'o'
      FocusControl = DBEdit3
    end
    object lblDescricao: TLabel
      Left = 24
      Top = 176
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
      FocusControl = DBEdit4
    end
    object lblId: TLabel
      Left = 24
      Top = 13
      Width = 11
      Height = 13
      Caption = 'ID'
      Enabled = False
      FocusControl = DBEdit5
    end
    object dbgProdutos: TDBGrid
      Left = 575
      Top = 25
      Width = 426
      Height = 473
      DataSource = dsProdutos
      Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
          Title.Caption = 'Nome'
          Width = 170
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco'
          Title.Caption = 'Pre'#231'o'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Caption = 'Descri'#231#227'o'
          Width = 200
          Visible = True
        end>
    end
    object dbgCategorias: TDBGrid
      Left = 360
      Top = 31
      Width = 193
      Height = 225
      DataSource = dsCategorias
      Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
          Title.Caption = 'Nome'
          Visible = True
        end>
    end
    object DBEdit1: TDBEdit
      Left = 24
      Top = 72
      Width = 199
      Height = 21
      DataField = 'categoria_id'
      DataSource = dsProdutos
      TabOrder = 2
    end
    object DBEdit2: TDBEdit
      Left = 24
      Top = 112
      Width = 250
      Height = 21
      DataField = 'nome'
      DataSource = dsProdutos
      TabOrder = 3
    end
    object DBEdit3: TDBEdit
      Left = 24
      Top = 152
      Width = 95
      Height = 21
      DataField = 'preco'
      DataSource = dsProdutos
      TabOrder = 4
    end
    object DBEdit4: TDBEdit
      Left = 24
      Top = 192
      Width = 250
      Height = 21
      DataField = 'descricao'
      DataSource = dsProdutos
      TabOrder = 5
    end
    object DBEdit5: TDBEdit
      Left = 24
      Top = 29
      Width = 199
      Height = 21
      DataField = 'id'
      DataSource = dsProdutos
      Enabled = False
      TabOrder = 6
    end
    object btnSalvar: TButton
      Left = 175
      Top = 234
      Width = 99
      Height = 49
      Caption = 'Salvar'
      TabOrder = 7
      OnClick = btnSalvarClick
    end
  end
  object dsCategorias: TDataSource
    DataSet = fdqCategorias
    Left = 728
    Top = 8
  end
  object fdqCategorias: TFDQuery
    Active = True
    Connection = dmConnection.fdcDatabase
    SQL.Strings = (
      'select * from categorias')
    Left = 808
    Top = 8
  end
  object dsProdutos: TDataSource
    DataSet = fdqProdutos
    Left = 880
    Top = 8
  end
  object fdqProdutos: TFDQuery
    Active = True
    Connection = dmConnection.fdcDatabase
    SQL.Strings = (
      'select * from produtos')
    Left = 944
    Top = 8
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
end
