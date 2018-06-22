object fVisualizaUsuarios: TfVisualizaUsuarios
  Left = 0
  Top = 0
  Caption = 'Listar Usu'#225'rios'
  ClientHeight = 552
  ClientWidth = 894
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
    Width = 894
    Height = 57
    Align = alTop
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 57
    Width = 894
    Height = 495
    Align = alClient
    TabOrder = 1
    ExplicitTop = 8
    ExplicitWidth = 635
    ExplicitHeight = 41
    object lblID: TLabel
      Left = 464
      Top = 16
      Width = 11
      Height = 13
      Caption = 'ID'
      FocusControl = DBEdit1
    end
    object lblNomeCompleto: TLabel
      Left = 464
      Top = 72
      Width = 75
      Height = 13
      Caption = 'Nome Completo'
      FocusControl = DBEdit2
    end
    object lblLogin: TLabel
      Left = 464
      Top = 128
      Width = 25
      Height = 13
      Caption = 'Login'
      FocusControl = DBEdit3
    end
    object lblSenha: TLabel
      Left = 464
      Top = 184
      Width = 30
      Height = 13
      Caption = 'Senha'
      FocusControl = DBEdit4
    end
    object DBEdit1: TDBEdit
      Left = 464
      Top = 32
      Width = 134
      Height = 21
      DataField = 'id'
      DataSource = dsUsuarios
      Enabled = False
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 464
      Top = 88
      Width = 300
      Height = 21
      DataField = 'nome_completo'
      DataSource = dsUsuarios
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 464
      Top = 144
      Width = 300
      Height = 21
      DataField = 'login'
      DataSource = dsUsuarios
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 464
      Top = 200
      Width = 250
      Height = 21
      DataField = 'senha'
      DataSource = dsUsuarios
      PasswordChar = '*'
      TabOrder = 3
    end
    object dbgBloqueado: TDBCheckBox
      Left = 464
      Top = 248
      Width = 97
      Height = 17
      Caption = 'Bloqueado?'
      DataField = 'bloqueado'
      DataSource = dsUsuarios
      TabOrder = 4
    end
    object dbgUsuarios: TDBGrid
      Left = 9
      Top = 32
      Width = 433
      Height = 417
      DataSource = dsUsuarios
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'nome_completo'
          Title.Caption = 'Nome'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'login'
          Title.Caption = 'Login'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nivel_acesso'
          Title.Caption = 'N'#237'vel de Acesso'
          Width = 112
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'bloqueado'
          Title.Caption = 'Bloqueado?'
          Width = 62
          Visible = True
        end>
    end
  end
  object fdqAllUsers: TFDQuery
    Active = True
    Connection = dmConnection.fdcDatabase
    SQL.Strings = (
      'SELECT * FROM usuarios')
    Left = 792
    Top = 8
    object fdqAllUsersid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object fdqAllUsersnome_completo: TWideStringField
      FieldName = 'nome_completo'
      Origin = 'nome_completo'
      Size = 8190
    end
    object fdqAllUserslogin: TWideStringField
      FieldName = 'login'
      Origin = '"login"'
      Size = 8190
    end
    object fdqAllUserssenha: TWideStringField
      FieldName = 'senha'
      Origin = 'senha'
      Size = 8190
    end
    object fdqAllUsersnivel_acesso: TIntegerField
      FieldName = 'nivel_acesso'
      Origin = 'nivel_acesso'
    end
    object fdqAllUsersbloqueado: TBooleanField
      FieldName = 'bloqueado'
      Origin = 'bloqueado'
    end
  end
  object dsUsuarios: TDataSource
    DataSet = fdqAllUsers
    Left = 720
    Top = 8
  end
end
