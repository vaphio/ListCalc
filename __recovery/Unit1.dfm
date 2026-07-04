object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'List Calc'
  ClientHeight = 481
  ClientWidth = 256
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Meiryo UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object calcPages: TPageControl
    Left = 0
    Top = 0
    Width = 256
    Height = 481
    ActivePage = tabLST
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    ExplicitWidth = 244
    object tabLST: TTabSheet
      Caption = 'LST'
      DesignSize = (
        248
        448)
      object lblSUM: TLabel
        Left = 46
        Top = 185
        Width = 194
        Height = 24
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        AutoSize = False
        Caption = 'lblSUM'
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Meiryo UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object Label1: TLabel
        Left = 3
        Top = 185
        Width = 35
        Height = 20
        Caption = 'SUM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Meiryo UI'
        Font.Style = []
        ParentFont = False
        OnClick = Label1Click
      end
      object Label2: TLabel
        Left = 3
        Top = 215
        Width = 34
        Height = 20
        Caption = 'AVG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Meiryo UI'
        Font.Style = []
        ParentFont = False
        OnClick = Label2Click
      end
      object lblAVG: TLabel
        Left = 46
        Top = 215
        Width = 194
        Height = 24
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        AutoSize = False
        Caption = 'lblAVG'
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Meiryo UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object lstData: TListBox
        Left = 0
        Top = 58
        Width = 248
        Height = 121
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Meiryo UI'
        Font.Style = []
        ItemHeight = 20
        ParentFont = False
        TabOrder = 0
        OnClick = lstDataClick
        OnDrawItem = lstDataDrawItem
      end
      object edInp: TEdit
        Left = 0
        Top = 0
        Width = 248
        Height = 28
        Align = alTop
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Meiryo UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = 'edInp'
        OnKeyPress = edInpKeyPress
        ExplicitWidth = 236
      end
      object Panel1: TPanel
        Left = 0
        Top = 245
        Width = 248
        Height = 203
        Align = alBottom
        TabOrder = 2
        ExplicitWidth = 236
        object BtnCA: TButton
          Left = 11
          Top = 15
          Width = 40
          Height = 25
          Action = clearAll
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object cbDig: TComboBox
          Left = 195
          Top = 18
          Width = 40
          Height = 23
          ItemIndex = 2
          TabOrder = 1
          Text = '2'
          OnChange = cbDigChange
          Items.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4'
            '5'
            '6')
        end
        object Memo1: TMemo
          Left = 1
          Top = 84
          Width = 246
          Height = 118
          Align = alBottom
          Lines.Strings = (
            'Memo1')
          TabOrder = 2
        end
        object btnC: TButton
          Left = 57
          Top = 16
          Width = 40
          Height = 25
          Action = clearInp
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
        end
        object btnSqrt: TButton
          Left = 103
          Top = 16
          Width = 40
          Height = 25
          Action = sqRoot
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
        end
        object btnSq: TButton
          Left = 149
          Top = 16
          Width = 40
          Height = 25
          Action = square
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
        end
        object btnLn: TButton
          Left = 57
          Top = 47
          Width = 40
          Height = 25
          Action = logNat
          TabOrder = 6
        end
        object btnLog: TButton
          Left = 103
          Top = 47
          Width = 40
          Height = 25
          Action = logCom
          TabOrder = 7
        end
        object btnExp: TButton
          Left = 149
          Top = 47
          Width = 40
          Height = 25
          Action = actExp
          TabOrder = 8
        end
        object Button1: TButton
          Left = 11
          Top = 46
          Width = 40
          Height = 25
          Action = actPercent
          TabOrder = 9
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 28
        Width = 248
        Height = 30
        Align = alTop
        Caption = 'Panel2'
        TabOrder = 3
        object ComboBox1: TComboBox
          Left = 102
          Top = 1
          Width = 145
          Height = 28
          Align = alRight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Meiryo UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = 'ComboBox1'
          Items.Strings = (
            '1'
            '5'
            '95'
            '108'
            '110')
        end
      end
    end
    object tabBIN: TTabSheet
      Caption = 'BIN'
      ImageIndex = 1
      DesignSize = (
        248
        448)
      object LblHEX: TLabel
        Left = 40
        Top = 250
        Width = 190
        Height = 24
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        AutoSize = False
        Caption = 'LblHEX'
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Meiryo UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        ExplicitLeft = 28
      end
      object LblBIN: TLabel
        Left = 40
        Top = 288
        Width = 190
        Height = 20
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        AutoSize = False
        Caption = 'LblBIN'
        Color = clCream
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Meiryo UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        ExplicitLeft = 28
      end
      object Label4: TLabel
        Left = 3
        Top = 45
        Width = 33
        Height = 20
        Caption = 'HEX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Meiryo UI'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 3
        Top = 85
        Width = 29
        Height = 20
        Caption = 'BIN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Meiryo UI'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 3
        Top = 6
        Width = 33
        Height = 20
        Caption = 'DEC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Meiryo UI'
        Font.Style = []
        ParentFont = False
      end
      object edDec: TEdit
        Left = 48
        Top = 3
        Width = 185
        Height = 28
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Meiryo UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'edDec'
      end
      object edHex: TEdit
        Left = 48
        Top = 42
        Width = 185
        Height = 28
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Meiryo UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = 'edHex'
      end
      object edBin: TEdit
        Left = 48
        Top = 82
        Width = 185
        Height = 28
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Meiryo UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Text = 'edBin'
      end
    end
  end
  object ActionManager1: TActionManager
    Left = 48
    Top = 408
    StyleName = 'Platform Default'
    object clearAll: TAction
      Caption = 'CA'
      Hint = 'Clear All'
      ShortCut = 32814
      OnExecute = clearAllExecute
    end
    object clearInp: TAction
      Caption = 'C'
      Hint = 'Clear Input'
      ShortCut = 16430
      OnExecute = clearInpExecute
    end
    object sqRoot: TAction
      Caption = #8730
      Hint = 'Square root'
      OnExecute = sqRootExecute
    end
    object square: TAction
      Caption = '^2'
      Hint = 'square'
      OnExecute = squareExecute
    end
    object logNat: TAction
      Caption = 'ln'
      OnExecute = logNatExecute
    end
    object logCom: TAction
      Caption = 'log'
      OnExecute = logComExecute
    end
    object actExp: TAction
      Caption = 'e^'
      OnExecute = actExpExecute
    end
    object actPercent: TAction
      Caption = '%'
      OnExecute = actPercentExecute
    end
  end
end
