inherited UserListFrame: TUserListFrame
  Width = 664
  Height = 395
  object grUsers: TDBGrid
    Left = 0
    Top = 0
    Width = 664
    Height = 395
    Align = alClient
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'user_id'
        Title.Caption = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'user_name'
        Title.Caption = 'User Name'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'address'
        Title.Caption = 'Address'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'created_on'
        Title.Caption = 'Created On'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'is_active'
        Title.Caption = 'Active'
        Visible = True
      end>
  end
  object qryUsers: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 224
    Top = 144
  end
  object dsUsers: TDataSource
    Left = 272
    Top = 144
  end
end
