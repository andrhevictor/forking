object fAdicionaUsuario: TfAdicionaUsuario
  Left = 0
  Top = 0
  Caption = 'Criar Usu'#225'rio'
  ClientHeight = 466
  ClientWidth = 606
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
    Width = 606
    Height = 57
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 761
  end
  object panelMid: TPanel
    Left = 0
    Top = 57
    Width = 606
    Height = 409
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 72
    ExplicitTop = 63
    ExplicitWidth = 785
    ExplicitHeight = 407
    object lblNomeCompleto: TLabel
      Left = 40
      Top = 42
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
      Left = 40
      Top = 98
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
      Left = 40
      Top = 154
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
      Left = 40
      Top = 207
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
      Left = 40
      Top = 266
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
      Left = 40
      Top = 120
      Width = 200
      Height = 21
      TabOrder = 1
    end
    object edtConfirmaSenha: TEdit
      Left = 40
      Top = 229
      Width = 200
      Height = 21
      TabOrder = 2
    end
    object edtSenha: TEdit
      Left = 40
      Top = 176
      Width = 200
      Height = 21
      TabOrder = 3
    end
    object cmbNivelAcesso: TComboBox
      Left = 40
      Top = 288
      Width = 145
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
      Left = 40
      Top = 64
      Width = 353
      Height = 21
      TabOrder = 0
    end
    object btnSalvar: TButton
      Left = 440
      Top = 344
      Width = 89
      Height = 33
      Caption = 'Salvar'
      TabOrder = 5
      OnClick = btnSalvarClick
    end
    object btnCancelar: TButton
      Left = 336
      Top = 344
      Width = 89
      Height = 33
      Caption = 'Cancelar'
      TabOrder = 6
    end
  end
  object fdqUsuario: TFDQuery
    Connection = dmConnection.fdcDatabase
    Left = 536
    Top = 8
  end
end
