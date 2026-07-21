object Form1: TForm1
  Left = 124
  Top = 116
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
    Left = 40
    Top = 112
    Width = 977
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
  object Button3: TButton
    Left = 64
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Monstruo 1'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 152
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Monstruo 2'
    TabOrder = 6
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 248
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Monstruo 3'
    TabOrder = 7
    OnClick = Button5Click
  end
end
