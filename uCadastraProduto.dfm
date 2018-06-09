object fCadastraProduto: TfCadastraProduto
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Cadastrar Produto'
  ClientHeight = 536
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panelTop: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 89
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 883
    object btnCancelar: TButton
      Left = 150
      Top = 21
      Width = 89
      Height = 49
      Caption = 'Cancelar'
      TabOrder = 0
      OnClick = btnCancelarClick
    end
    object btnSalvar: TButton
      Left = 40
      Top = 21
      Width = 89
      Height = 49
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = btnSalvarClick
    end
  end
  object panelMid: TPanel
    Left = 0
    Top = 89
    Width = 688
    Height = 447
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 883
    ExplicitHeight = 359
    object lblId: TLabel
      Left = 40
      Top = 37
      Width = 11
      Height = 13
      Caption = 'ID'
      FocusControl = DBEdit1
    end
    object lblNome: TLabel
      Left = 40
      Top = 128
      Width = 27
      Height = 13
      Caption = 'Nome'
      FocusControl = DBEdit3
    end
    object lblPreco: TLabel
      Left = 40
      Top = 168
      Width = 27
      Height = 13
      Caption = 'Pre'#231'o'
      FocusControl = DBEdit4
    end
    object lblDescricao: TLabel
      Left = 40
      Top = 208
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
      FocusControl = DBEdit5
    end
    object lblCategoria: TLabel
      Left = 40
      Top = 77
      Width = 47
      Height = 13
      Caption = 'Categoria'
      FocusControl = DBEdit1
    end
    object dblcCategorias: TDBLookupComboBox
      Left = 40
      Top = 96
      Width = 199
      Height = 21
      DataField = 'categoria_id'
      DataSource = dsProdutos
      KeyField = 'id'
      ListField = 'nome'
      ListSource = dsCategorias
      TabOrder = 0
    end
    object DBEdit1: TDBEdit
      Left = 40
      Top = 56
      Width = 199
      Height = 21
      DataField = 'id'
      DataSource = dsProdutos
      Enabled = False
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 40
      Top = 144
      Width = 300
      Height = 21
      DataField = 'nome'
      DataSource = dsProdutos
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 40
      Top = 184
      Width = 95
      Height = 21
      DataField = 'preco'
      DataSource = dsProdutos
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 40
      Top = 224
      Width = 300
      Height = 21
      DataField = 'descricao'
      DataSource = dsProdutos
      TabOrder = 4
    end
  end
  object dsProdutos: TDataSource
    DataSet = fdqProdutos
    Left = 544
    Top = 32
  end
  object fdqCategorias: TFDQuery
    Active = True
    Connection = dmConnection.fdcDatabase
    SQL.Strings = (
      'select * from categorias')
    Left = 472
    Top = 32
  end
  object dsCategorias: TDataSource
    DataSet = fdqCategorias
    Left = 392
    Top = 32
  end
  object fdqProdutos: TFDQuery
    Active = True
    Connection = dmConnection.fdcDatabase
    SQL.Strings = (
      'select * from produtos')
    Left = 608
    Top = 32
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
