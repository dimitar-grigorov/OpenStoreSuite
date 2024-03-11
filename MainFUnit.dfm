object MainF: TMainF
  Left = 454
  Top = 141
  Width = 1398
  Height = 924
  Caption = 'MainF'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 757
    Width = 1390
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object SB1: TStatusBar
    Left = 0
    Top = 849
    Width = 1390
    Height = 19
    Panels = <>
  end
  object pnlLog: TPanel
    Left = 0
    Top = 760
    Width = 1390
    Height = 89
    Align = alBottom
    TabOrder = 1
  end
  object pnlActions: TPanel
    Left = 0
    Top = 0
    Width = 1390
    Height = 57
    Align = alTop
    TabOrder = 2
  end
  object tcMain: TTabControl
    Left = 0
    Top = 57
    Width = 1390
    Height = 700
    Align = alClient
    TabOrder = 3
  end
  object MainMenu1: TMainMenu
    Left = 16
    Top = 80
    object miFile: TMenuItem
      Caption = 'File'
    end
    object Actions1: TMenuItem
      Caption = 'Actions'
    end
  end
  object ActionList1: TActionList
    Left = 688
    Top = 448
    object actRefreshFromDb: TAction
      Caption = 'Refresh'
      ShortCut = 116
      OnExecute = actRefreshFromDbExecute
    end
  end
end
