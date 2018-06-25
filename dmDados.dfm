object dmConnection: TdmConnection
  OldCreateOrder = False
  Height = 348
  Width = 502
  object fdcDatabase: TFDConnection
    Params.Strings = (
      'Database=restaurante'
      'User_Name=postgres'
      'Password=admin'
      'Server=localhost'
      'DriverID=PG'
      'Port=5433')
    LoginPrompt = False
    Left = 40
    Top = 40
  end
end
