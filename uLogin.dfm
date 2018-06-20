object fLogin: TfLogin
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Login'
  ClientHeight = 230
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object panelTop: TPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 41
    Align = alTop
    TabOrder = 0
    object lblMarca: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 497
      Height = 33
      Align = alClient
      Alignment = taCenter
      BiDiMode = bdLeftToRight
      Caption = 'FORKING'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -24
      Font.Name = '@Adobe Gothic Std B'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ExplicitWidth = 106
      ExplicitHeight = 32
    end
  end
  object panelMid: TPanel
    Left = 0
    Top = 41
    Width = 505
    Height = 189
    Align = alClient
    TabOrder = 1
    object lblUsuario: TLabel
      Left = 232
      Top = 37
      Width = 36
      Height = 13
      Caption = 'Usu'#225'rio'
    end
    object lblSenha: TLabel
      Left = 238
      Top = 88
      Width = 30
      Height = 13
      Caption = 'Senha'
    end
    object edtUsuario: TEdit
      Left = 194
      Top = 56
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object edtSenha: TEdit
      Left = 194
      Top = 101
      Width = 121
      Height = 21
      HelpType = htKeyword
      PasswordChar = '*'
      TabOrder = 1
      TextHint = 'Digite sua senha'
    end
    object btnEntrar: TButton
      Left = 216
      Top = 136
      Width = 75
      Height = 25
      Caption = 'Entrar'
      TabOrder = 2
      OnClick = btnEntrarClick
    end
  end
  object dsUsuario: TDataSource
    DataSet = fdqUsuario
    Left = 368
    Top = 8
  end
  object fdqUsuario: TFDQuery
    Connection = dmConnection.fdcDatabase
    Left = 448
    Top = 8
  end
end
