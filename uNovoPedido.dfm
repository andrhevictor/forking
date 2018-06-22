object fNovoPedido: TfNovoPedido
  Left = 0
  Top = 0
  Caption = 'Cadastro de Pedido'
  ClientHeight = 564
  ClientWidth = 875
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
    Width = 875
    Height = 507
    Align = alClient
    TabOrder = 0
    DesignSize = (
      875
      507)
    object lblValor: TLabel
      Left = 13
      Top = 451
      Width = 124
      Height = 23
      Caption = 'Valor Total: R$'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object dbgProdutos: TDBGrid
      Left = 249
      Top = 6
      Width = 616
      Height = 201
      Anchors = [akTop, akRight]
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
          Width = 353
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco'
          Title.Caption = 'Pre'#231'o'
          Width = 233
          Visible = True
        end>
    end
    object dbgCategoria: TDBGrid
      Left = 10
      Top = 6
      Width = 233
      Height = 201
      Anchors = [akLeft, akTop, akRight]
      DataSource = dsCategoria
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
          Title.Caption = 'Grupos'
          Width = 212
          Visible = True
        end>
    end
    object dbgItensPedido: TDBGrid
      Left = 13
      Top = 213
      Width = 855
      Height = 226
      Anchors = [akLeft, akTop, akRight]
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
      OnDblClick = dbgItensPedidoDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'nome'
          Title.Caption = 'Nome'
          Width = 575
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          Title.Alignment = taCenter
          Title.Caption = 'Quantidade'
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco'
          Title.Alignment = taCenter
          Title.Caption = 'Valor Unit.'
          Width = 96
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor_total'
          Title.Alignment = taCenter
          Title.Caption = 'Valor Tot.'
          Width = 85
          Visible = True
        end>
    end
    object btnSalvar: TButton
      Left = 774
      Top = 445
      Width = 91
      Height = 41
      Caption = 'Salvar'
      TabOrder = 3
      OnClick = btnSalvarClick
    end
    object btnCancelar: TButton
      Left = 677
      Top = 445
      Width = 91
      Height = 41
      Caption = 'Cancelar'
      TabOrder = 4
      OnClick = btnCancelarClick
    end
    object btnDeletaItem: TButton
      Left = 357
      Top = 445
      Width = 140
      Height = 44
      Caption = 'Deletar Item Selecionado'
      TabOrder = 5
      OnClick = btnDeletaItemClick
    end
  end
  object panelTop: TPanel
    Left = 0
    Top = 0
    Width = 875
    Height = 57
    Align = alTop
    TabOrder = 1
  end
  object fdqProdutos: TFDQuery
    Active = True
    Connection = dmConnection.fdcDatabase
    SQL.Strings = (
      'select * from produtos')
    Left = 752
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
  object fdqSomaItens: TFDQuery
    Active = True
    Connection = dmConnection.fdcDatabase
    SQL.Strings = (
      'SELECT * FROM pedidos_itens AS itens'
      'INNER JOIN produtos ON produtos.id = itens.produto_id'
      'INNER JOIN categorias ON produtos.categoria_id = categorias.id')
    Left = 264
    Top = 8
  end
  object fdqAtualizaPedido: TFDQuery
    Connection = dmConnection.fdcDatabase
    Left = 832
    Top = 8
  end
  object fdqFichaDisponivel: TFDQuery
    Connection = dmConnection.fdcDatabase
    Left = 72
    Top = 9
  end
  object fdqDeletePedido: TFDQuery
    Connection = dmConnection.fdcDatabase
    Left = 176
    Top = 8
  end
end
