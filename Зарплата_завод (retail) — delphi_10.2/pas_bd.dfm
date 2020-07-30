object Passw_BD: TPassw_BD
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Passw_BD'
  ClientHeight = 117
  ClientWidth = 197
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 8
    Top = 64
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object LabeledEdit1: TLabeledEdit
    Left = 40
    Top = 24
    Width = 121
    Height = 21
    Alignment = taCenter
    EditLabel.Width = 162
    EditLabel.Height = 13
    EditLabel.Caption = #1074#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100' '#1082#1086#1087#1080#1088#1091#1077#1084#1086#1081' '#1041#1044
    PasswordChar = '*'
    TabOrder = 1
  end
  object BitBtn2: TBitBtn
    Left = 112
    Top = 64
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
    OnClick = BitBtn2Click
  end
end
