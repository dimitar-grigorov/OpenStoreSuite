object DM: TDM
  OldCreateOrder = False
  Left = 1076
  Top = 564
  Height = 245
  Width = 336
  object MainConnection: TIBDatabase
    DatabaseName = '192.168.2.80:oss4.fdb'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    AfterConnect = MainConnectionAfterConnect
    AfterDisconnect = MainConnectionAfterDisconnect
    BeforeConnect = MainConnectionBeforeConnect
    Left = 72
    Top = 64
  end
  object MainTransaction: TIBTransaction
    Active = False
    DefaultDatabase = MainConnection
    AutoStopAction = saNone
    Left = 72
    Top = 112
  end
end
