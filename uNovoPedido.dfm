object fNovoPedido: TfNovoPedido
  Left = 0
  Top = 0
  Caption = 'Cadastro de Pedido'
  ClientHeight = 552
  ClientWidth = 672
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panelMid: TPanel
    Left = 0
    Top = 65
    Width = 672
    Height = 487
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -8
    ExplicitTop = 59
    DesignSize = (
      672
      487)
    object lblValor: TLabel
      Left = 534
      Top = 445
      Width = 124
      Height = 23
      Alignment = taRightJustify
      Caption = 'Valor Total: R$'
      Color = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object dbgProdutos: TDBGrid
      Left = 181
      Top = 6
      Width = 475
      Height = 201
      Anchors = [akLeft, akTop, akRight]
      BorderStyle = bsNone
      DataSource = dsProdutos
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = dbgProdutosDrawColumnCell
      OnDblClick = dbgProdutosDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'nome'
          Title.Caption = 'Produto'
          Width = 390
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco'
          Title.Alignment = taCenter
          Title.Caption = 'Pre'#231'o R$'
          Width = 69
          Visible = True
        end>
    end
    object dbgCategoria: TDBGrid
      Left = 10
      Top = 6
      Width = 165
      Height = 201
      Anchors = [akLeft, akTop, akRight]
      BorderStyle = bsNone
      DataSource = dsCategoria
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = dbgCategoriaCellClick
      OnDrawColumnCell = dbgCategoriaDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'nome'
          Title.Caption = 'Grupos'
          Width = 150
          Visible = True
        end>
    end
    object dbgItensPedido: TDBGrid
      Left = 13
      Top = 213
      Width = 645
      Height = 212
      Anchors = [akLeft, akTop, akRight]
      BorderStyle = bsNone
      Color = clBtnFace
      Ctl3D = True
      DataSource = dsItensPedido
      Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = dbgItensPedidoDrawColumnCell
      OnDblClick = dbgItensPedidoDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'nome'
          Title.Caption = 'Produto'
          Width = 426
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'quantidade'
          Title.Alignment = taCenter
          Title.Caption = 'QTD'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco'
          Title.Alignment = taCenter
          Title.Caption = 'Valor Unit. R$'
          Width = 77
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'valor_total'
          Title.Alignment = taCenter
          Title.Caption = 'Valor Total R$'
          Width = 79
          Visible = True
        end>
    end
  end
  object panelTop: TPanel
    Left = 0
    Top = 0
    Width = 672
    Height = 65
    Align = alTop
    TabOrder = 1
    object btnSalvar: TButton
      Left = 560
      Top = 12
      Width = 101
      Height = 41
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = btnSalvarClick
    end
    object btnCancelar: TButton
      Left = 165
      Top = 12
      Width = 101
      Height = 41
      Caption = 'Cancelar pedido'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
    object btnDeletaItem: TButton
      Left = 10
      Top = 12
      Width = 140
      Height = 41
      Caption = 'Deletar Item Selecionado'
      Enabled = False
      TabOrder = 2
      OnClick = btnDeletaItemClick
    end
  end
  object fdqProdutos: TFDQuery
    Active = True
    Connection = dmConnection.fdcDatabase
    SQL.Strings = (
      'select * from produtos')
    Left = 200
    Top = 384
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
  object dsProdutos: TDataSource
    DataSet = fdqProdutos
    Left = 264
    Top = 384
  end
  object fdqCategoria: TFDQuery
    Active = True
    Connection = dmConnection.fdcDatabase
    SQL.Strings = (
      'select * from categorias')
    Left = 200
    Top = 328
  end
  object dsCategoria: TDataSource
    DataSet = fdqCategoria
    Left = 264
    Top = 328
  end
  object fdqItensPedido: TFDQuery
    Connection = dmConnection.fdcDatabase
    Left = 48
    Top = 472
  end
  object dsItensPedido: TDataSource
    DataSet = fdqItensPedido
    Left = 128
    Top = 472
  end
  object fdqSomaItens: TFDQuery
    Active = True
    Connection = dmConnection.fdcDatabase
    SQL.Strings = (
      'SELECT * FROM pedidos_itens AS itens'
      'INNER JOIN produtos ON produtos.id = itens.produto_id'
      'INNER JOIN categorias ON produtos.categoria_id = categorias.id')
    Left = 48
    Top = 416
  end
  object fdqAtualizaPedido: TFDQuery
    Connection = dmConnection.fdcDatabase
    Left = 344
    Top = 328
  end
  object fdqFichaDisponivel: TFDQuery
    Connection = dmConnection.fdcDatabase
    Left = 48
    Top = 321
  end
  object fdqDeletePedido: TFDQuery
    Connection = dmConnection.fdcDatabase
    Left = 48
    Top = 368
  end
end
