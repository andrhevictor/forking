object fAdicionaUsuario: TfAdicionaUsuario
  Left = 0
  Top = 0
  Caption = 'Criar Usu'#225'rio'
  ClientHeight = 256
  ClientWidth = 405
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
    Width = 405
    Height = 57
    Align = alTop
    TabOrder = 0
    ExplicitTop = -6
    object btnCancelar: TButton
      Left = 10
      Top = 7
      Width = 119
      Height = 42
      Caption = 'Cancelar'
      TabOrder = 0
    end
    object btnSalvar: TButton
      Left = 280
      Top = 7
      Width = 116
      Height = 42
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = btnSalvarClick
    end
  end
  object panelMid: TPanel
    Left = 0
    Top = 57
    Width = 405
    Height = 199
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 606
    ExplicitHeight = 409
    object lblNomeCompleto: TLabel
      Left = 11
      Top = 16
      Width = 91
      Height = 16
      Caption = 'Nome Completo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblLogin: TLabel
      Left = 11
      Top = 68
      Width = 30
      Height = 16
      Caption = 'Login'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblSenha: TLabel
      Left = 195
      Top = 68
      Width = 36
      Height = 16
      Caption = 'Senha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblConfirmaSenha: TLabel
      Left = 196
      Top = 125
      Width = 97
      Height = 16
      Caption = 'Confirmar Senha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblNivelAcesso: TLabel
      Left = 11
      Top = 125
      Width = 89
      Height = 16
      Caption = 'N'#237'vel de Acesso'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtLogin: TEdit
      Left = 11
      Top = 90
      Width = 161
      Height = 21
      TabOrder = 1
    end
    object edtConfirmaSenha: TEdit
      Left = 196
      Top = 147
      Width = 200
      Height = 21
      TabOrder = 2
    end
    object edtSenha: TEdit
      Left = 195
      Top = 90
      Width = 201
      Height = 21
      TabOrder = 3
    end
    object cmbNivelAcesso: TComboBox
      Left = 11
      Top = 147
      Width = 161
      Height = 22
      Style = csOwnerDrawFixed
      Sorted = True
      TabOrder = 4
      Items.Strings = (
        '1'
        '2'
        '3')
    end
    object edtNomeCompleto: TEdit
      Left = 11
      Top = 38
      Width = 385
      Height = 21
      TabOrder = 0
    end
  end
  object fdqUsuario: TFDQuery
    Connection = dmConnection.fdcDatabase
    Left = 536
    Top = 8
  end
end
