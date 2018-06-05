object fNovoPedido: TfNovoPedido
  Left = 0
  Top = 0
  Caption = 'Novo Pedido'
  ClientHeight = 613
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
    Height = 556
    Align = alClient
    TabOrder = 0
    object lblValor: TLabel
      Left = 312
      Top = 480
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
    object lblValorTotal: TLabel
      Left = 442
      Top = 480
      Width = 6
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
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
      Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
          Width = 105
          Visible = True
        end>
    end
    object DBGrid1: TDBGrid
      Left = 16
      Top = 248
      Width = 513
      Height = 217
      DataSource = dsItensPedido
      Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 2
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
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          Title.Alignment = taCenter
          Title.Caption = 'Quantidade'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco'
          Title.Alignment = taCenter
          Title.Caption = 'Valor Unit.'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor_total'
          Title.Alignment = taCenter
          Title.Caption = 'Valor Tot.'
          Width = 70
          Visible = True
        end>
    end
    object btnSalvar: TButton
      Left = 768
      Top = 496
      Width = 91
      Height = 41
      Caption = 'Salvar'
      TabOrder = 3
      OnClick = btnSalvarClick
    end
    object btnCancelar: TButton
      Left = 656
      Top = 496
      Width = 91
      Height = 41
      Caption = 'Cancelar'
      TabOrder = 4
      OnClick = btnCancelarClick
    end
  end
  object panelTop: TPanel
    Left = 0
    Top = 0
    Width = 884
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
    Active = True
    Connection = dmConnection.fdcDatabase
    SQL.Strings = (
      'SELECT * FROM pedidos_itens AS itens'
      'INNER JOIN produtos ON produtos.id = itens.produto_id'
      'INNER JOIN categorias ON produtos.categoria_id = categorias.id')
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
    Left = 824
    Top = 8
  end
end
