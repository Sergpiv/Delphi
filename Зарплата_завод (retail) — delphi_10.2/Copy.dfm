object form_copy: Tform_copy
  Left = 0
  Top = 0
  Caption = #1050#1086#1087#1080#1088#1086#1085#1080#1077
  ClientHeight = 500
  ClientWidth = 148
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 134
    Height = 13
    Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077' '#1090#1072#1073#1083#1080#1094' '#1073#1072#1079#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object RadioGroup_detal: TRadioGroup
    Left = 28
    Top = 30
    Width = 90
    Height = 50
    Caption = #1044#1077#1090#1072#1083#1080' '
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 1
    Items.Strings = (
      #1057#1090#1088#1091#1082#1090#1091#1088#1072
      #1044#1072#1085#1085#1099#1077)
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 0
  end
  object RadioGroup_rabotnik: TRadioGroup
    Left = 28
    Top = 142
    Width = 90
    Height = 50
    Caption = #1056#1072#1073#1086#1090#1085#1080#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 1
    Items.Strings = (
      #1057#1090#1088#1091#1082#1090#1091#1088#1072
      #1044#1072#1085#1085#1099#1077)
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
  end
  object RadioGroup_raszenka: TRadioGroup
    Left = 28
    Top = 198
    Width = 90
    Height = 50
    Caption = #1056#1072#1089#1094#1077#1085#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 1
    Items.Strings = (
      #1057#1090#1088#1091#1082#1090#1091#1088#1072
      #1044#1072#1085#1085#1099#1077)
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 28
    Top = 440
    Width = 90
    Height = 32
    Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object RadioGroup_recvisiti: TRadioGroup
    Left = 28
    Top = 254
    Width = 90
    Height = 50
    Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 1
    Items.Strings = (
      #1057#1090#1088#1091#1082#1090#1091#1088#1072
      #1044#1072#1085#1085#1099#1077)
    ParentBackground = False
    ParentFont = False
    TabOrder = 4
  end
  object RadioGroup_brigada: TRadioGroup
    Left = 28
    Top = 310
    Width = 90
    Height = 50
    Caption = #1041#1088#1080#1075#1072#1076#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 1
    Items.Strings = (
      #1057#1090#1088#1091#1082#1090#1091#1088#1072
      #1044#1072#1085#1085#1099#1077)
    ParentBackground = False
    ParentFont = False
    TabOrder = 5
  end
  object RadioGroup_uzel: TRadioGroup
    Left = 28
    Top = 86
    Width = 90
    Height = 50
    Caption = #1059#1079#1077#1083
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 1
    Items.Strings = (
      #1057#1090#1088#1091#1082#1090#1091#1088#1072
      #1044#1072#1085#1085#1099#1077)
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 6
  end
  object RadioGroup_shabloni: TRadioGroup
    Left = 28
    Top = 366
    Width = 90
    Height = 50
    Caption = #1064#1072#1073#1083#1086#1085#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 1
    Items.Strings = (
      #1057#1090#1088#1091#1082#1090#1091#1088#1072
      #1044#1072#1085#1085#1099#1077)
    ParentBackground = False
    ParentFont = False
    TabOrder = 7
  end
  object ADOTable_copy: TADOTable
    Connection = DataModule1.ADOConnection1
    Top = 120
  end
end
