object Form1: TForm1
  Left = 94
  Top = 96
  Width = 1027
  Height = 406
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClick = FormCreate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 40
    Top = 112
    Width = 977
    Height = 33
    TabOrder = 0
    OnDrawCell = StringGrid1DrawCell
  end
  object Edit2: TEdit
    Left = 312
    Top = 288
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Button2: TButton
    Left = 448
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Curar'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 376
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Monstruo 1'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 464
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Monstruo 2'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 560
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Monstruo 3'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 344
    Top = 168
    Width = 97
    Height = 33
    Caption = 'Ataque 1'
    TabOrder = 6
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 456
    Top = 168
    Width = 97
    Height = 33
    Caption = 'Ataque 2'
    TabOrder = 7
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 568
    Top = 168
    Width = 97
    Height = 33
    Caption = 'Ataque 3'
    TabOrder = 8
    OnClick = Button8Click
  end
end
