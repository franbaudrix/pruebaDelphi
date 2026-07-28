object Form4: TForm4
  Left = 289
  Top = 124
  Width = 408
  Height = 450
  Caption = 'Form4'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ListBox1: TListBox
    Left = 120
    Top = 56
    Width = 193
    Height = 177
    ItemHeight = 13
    MultiSelect = True
    TabOrder = 0
  end
  object Button1: TButton
    Left = 184
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Iniciar'
    TabOrder = 1
    OnClick = Button1Click
  end
end
