object DMTestConM: TDMTestConM
  OldCreateOrder = False
  Left = 618
  Top = 384
  Height = 235
  Width = 601
  object TESTCONNECTION: TIBODatabase
    SQLDialect = 3
    Params.Strings = (
      'USER NAME=SYSDBA')
    Isolation = tiCommitted
    TimeoutProps.AttemptRetry = 6
    Left = 272
    Top = 16
    SavedPassword = '.JuMbLe.01.432B0639073E0E4B49'
  end
  object ExoConnection1: TExoConnection
    Port = 3050
    Host = 'Alpha1'
    AutoConnect = False
    OnConnected = ExoConnection1Connected
    Left = 120
    Top = 16
  end
  object ExoClient1: TExoClient
    Connection = ExoConnection1
    Left = 112
    Top = 72
  end
end
