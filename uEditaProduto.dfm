object fEditaProduto: TfEditaProduto
  Left = 110
  Top = 0
  Caption = 'Editar produtos'
  ClientHeight = 485
  ClientWidth = 572
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
  object panelTop: TPanel
    Left = 0
    Top = 0
    Width = 572
    Height = 57
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 695
    object btnSalvar: TButton
      Left = 464
      Top = 6
      Width = 99
      Height = 43
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = btnSalvarClick
    end
  end
  object panelMid: TPanel
    Left = 0
    Top = 57
    Width = 572
    Height = 428
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 695
    ExplicitHeight = 515
    object lblCategoriaEdit: TLabel
      Left = 72
      Top = 11
      Width = 47
      Height = 13
      Caption = 'Categoria'
      FocusControl = DBEdit1
    end
    object lblNome: TLabel
      Left = 136
      Top = 12
      Width = 38
      Height = 13
      Caption = 'Produto'
      FocusControl = DBEdit2
    end
    object lblPreco: TLabel
      Left = 468
      Top = 13
      Width = 27
      Height = 13
      Caption = 'Pre'#231'o'
      FocusControl = DBEdit3
    end
    object lblDescricao: TLabel
      Left = 8
      Top = 55
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
      FocusControl = DBEdit4
    end
    object lblId: TLabel
      Left = 8
      Top = 13
      Width = 11
      Height = 13
      Caption = 'ID'
      Enabled = False
      FocusControl = DBEdit5
    end
    object dbgProdutos: TDBGrid
      Left = 151
      Top = 152
      Width = 421
      Height = 225
      DataSource = dsProdutos
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
          Title.Caption = 'Produto'
          Width = 156
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'preco'
          Title.Alignment = taCenter
          Title.Caption = 'Pre'#231'o R$'
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Caption = 'Descri'#231#227'o'
          Width = 183
          Visible = True
        end>
    end
    object dbgCategorias: TDBGrid
      Left = 0
      Top = 152
      Width = 137
      Height = 225
      DataSource = dsCategorias
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
          Title.Caption = 'Categoria'
          Width = 115
          Visible = True
        end>
    end
    object DBEdit1: TDBEdit
      Left = 72
      Top = 29
      Width = 47
      Height = 21
      DataField = 'categoria_id'
      DataSource = dsProdutos
      TabOrder = 2
    end
    object DBEdit2: TDBEdit
      Left = 136
      Top = 29
      Width = 313
      Height = 21
      DataField = 'nome'
      DataSource = dsProdutos
      TabOrder = 3
    end
    object DBEdit3: TDBEdit
      Left = 468
      Top = 29
      Width = 95
      Height = 21
      DataField = 'preco'
      DataSource = dsProdutos
      TabOrder = 4
    end
    object DBEdit4: TDBEdit
      Left = 8
      Top = 71
      Width = 555
      Height = 50
      DataField = 'descricao'
      DataSource = dsProdutos
      TabOrder = 5
    end
    object DBEdit5: TDBEdit
      Left = 8
      Top = 29
      Width = 46
      Height = 21
      DataField = 'id'
      DataSource = dsProdutos
      Enabled = False
      TabOrder = 6
    end
  end
  object dsCategorias: TDataSource
    DataSet = fdqCategorias
    Left = 304
    Top = 8
  end
  object fdqCategorias: TFDQuery
    Active = True
    Connection = dmConnection.fdcDatabase
    SQL.Strings = (
      'select * from categorias')
    Left = 384
    Top = 8
  end
  object dsProdutos: TDataSource
    DataSet = fdqProdutos
    Left = 184
    Top = 8
  end
  object fdqProdutos: TFDQuery
    Active = True
    Connection = dmConnection.fdcDatabase
    SQL.Strings = (
      'select * from produtos')
    Left = 248
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
