object Form1: TForm1
  Left = 1850
  Top = 87
  Width = 1088
  Height = 563
  Caption = 'Form1'
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
  object StringGrid1: TStringGrid
    Left = 232
    Top = 112
    Width = 521
    Height = 120
    TabOrder = 0
    OnDrawCell = StringGrid1DrawCell
  end
  object Edit1: TEdit
    Left = 136
    Top = 272
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 264
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Hacer dano'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Edit2: TEdit
    Left = 352
    Top = 272
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object Button2: TButton
    Left = 480
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Curar'
    TabOrder = 4
    OnClick = Button2Click
  end
end
