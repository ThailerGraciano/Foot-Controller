object Configuracoes: TConfiguracoes
  Left = 0
  Top = 0
  Anchors = [akLeft, akTop, akRight, akBottom]
  Caption = 'Configura'#231#245'es'
  ClientHeight = 681
  ClientWidth = 1264
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1264
    Height = 681
    Align = alClient
    Color = clGray
    ParentBackground = False
    TabOrder = 0
    object CheckListBox1: TCheckListBox
      Left = 24
      Top = 24
      Width = 225
      Height = 121
      OnClickCheck = CheckListBox1ClickCheck
      ItemHeight = 13
      TabOrder = 0
    end
    object memLog: TMemo
      Left = 304
      Top = 24
      Width = 209
      Height = 121
      Lines.Strings = (
        '')
      TabOrder = 1
    end
  end
end
