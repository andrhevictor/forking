object fCadastraProduto: TfCadastraProduto
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Cadastrar Produto'
  ClientHeight = 305
  ClientWidth = 391
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
    Width = 391
    Height = 57
    Align = alTop
    TabOrder = 0
    object btnCancelar: TButton
      Left = 22
      Top = 11
      Width = 89
      Height = 36
      Caption = 'Cancelar'
      TabOrder = 0
      OnClick = btnCancelarClick
    end
    object btnSalvar: TButton
      Left = 282
      Top = 11
      Width = 89
      Height = 36
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = btnSalvarClick
    end
  end
  object panelMid: TPanel
    Left = 0
    Top = 57
    Width = 391
    Height = 248
    Align = alClient
    TabOrder = 1
    ExplicitTop = 54
    ExplicitHeight = 378
    object lblId: TLabel
      Left = 22
      Top = 17
      Width = 11
      Height = 13
      Caption = 'ID'
      FocusControl = DBEdit1
    end
    object lblNome: TLabel
      Left = 22
      Top = 66
      Width = 27
      Height = 13
      Caption = 'Nome'
      FocusControl = DBEdit3
    end
    object lblPreco: TLabel
      Left = 303
      Top = 17
      Width = 27
      Height = 13
      Caption = 'Pre'#231'o'
      FocusControl = DBEdit4
    end
    object lblDescricao: TLabel
      Left = 22
      Top = 109
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
      FocusControl = DBEdit5
    end
    object lblCategoria: TLabel
      Left = 75
      Top = 18
      Width = 47
      Height = 12
      Caption = 'Categoria'
      FocusControl = DBEdit1
    end
    object dblcCategorias: TDBLookupComboBox
      Left = 75
      Top = 36
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
      Left = 22
      Top = 36
      Width = 27
      Height = 21
      DataField = 'id'
      DataSource = dsProdutos
      Enabled = False
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 22
      Top = 82
      Width = 349
      Height = 21
      DataField = 'nome'
      DataSource = dsProdutos
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 303
      Top = 36
      Width = 68
      Height = 21
      DataField = 'preco'
      DataSource = dsProdutos
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 22
      Top = 126
      Width = 349
      Height = 77
      DataField = 'descricao'
      DataSource = dsProdutos
      TabOrder = 4
    end
  end
  object dsProdutos: TDataSource
    DataSet = fdqProdutos
    Left = 168
    Top = 256
  end
  object fdqCategorias: TFDQuery
    Active = True
    Connection = dmConnection.fdcDatabase
    SQL.Strings = (
      'select * from categorias')
    Left = 104
    Top = 256
  end
  object dsCategorias: TDataSource
    DataSet = fdqCategorias
    Left = 24
    Top = 256
  end
  object fdqProdutos: TFDQuery
    Active = True
    Connection = dmConnection.fdcDatabase
    SQL.Strings = (
      'select * from produtos')
    Left = 232
    Top = 256
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
      DisplayFormat = 'R$ 0.00'
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
