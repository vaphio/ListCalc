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
    ActivePage = tabBIN
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
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
        OnClick = lblSUMClick
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
        OnClick = lblAVGClick
      end
      object lstData: TListBox
        Left = 0
        Top = 62
        Width = 248
        Height = 121
        Style = lbOwnerDrawFixed
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
      end
      object Panel1: TPanel
        Left = 0
        Top = 245
        Width = 248
        Height = 203
        Align = alBottom
        TabOrder = 2
        object BtnCA: TButton
          Left = 4
          Top = 4
          Width = 40
          Height = 25
          Action = clearAll
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object cbDig: TComboBox
          Left = 204
          Top = 66
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
          Top = 96
          Width = 246
          Height = 106
          Align = alBottom
          Lines.Strings = (
            'Memo1')
          TabOrder = 2
        end
        object btnC: TButton
          Left = 50
          Top = 4
          Width = 40
          Height = 25
          Action = clearInp
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
        end
        object btnSqrt: TButton
          Left = 142
          Top = 4
          Width = 40
          Height = 25
          Action = sqRoot
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
        end
        object btnSq: TButton
          Left = 188
          Top = 4
          Width = 40
          Height = 25
          Action = square
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
        end
        object btnLn: TButton
          Left = 50
          Top = 35
          Width = 40
          Height = 25
          Action = logNat
          TabOrder = 6
        end
        object btnLog: TButton
          Left = 96
          Top = 35
          Width = 40
          Height = 25
          Action = logCom
          TabOrder = 7
        end
        object btnExp: TButton
          Left = 142
          Top = 35
          Width = 40
          Height = 25
          Action = actExp
          TabOrder = 8
        end
        object btnPercent: TButton
          Left = 4
          Top = 35
          Width = 40
          Height = 25
          Action = actPercent
          TabOrder = 9
        end
        object btnPi: TButton
          Left = 188
          Top = 35
          Width = 40
          Height = 25
          Action = actPi
          TabOrder = 10
        end
        object btnDel: TButton
          Left = 96
          Top = 4
          Width = 40
          Height = 25
          Action = actDel
          TabOrder = 11
        end
        object Button1: TButton
          Left = 4
          Top = 66
          Width = 40
          Height = 25
          Action = actSin
          TabOrder = 12
        end
        object Button2: TButton
          Left = 50
          Top = 66
          Width = 40
          Height = 25
          Action = actCos
          TabOrder = 13
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 28
        Width = 248
        Height = 34
        Align = alTop
        TabOrder = 3
        object sbtnPerPlus: TSpeedButton
          Left = 100
          Top = 2
          Width = 30
          Height = 30
          AllowAllUp = True
          GroupIndex = 1
          Caption = '%+'
        end
        object sbtnPerMinus: TSpeedButton
          Left = 134
          Top = 2
          Width = 30
          Height = 30
          AllowAllUp = True
          GroupIndex = 1
          Caption = '%-'
        end
        object sbtnMul: TSpeedButton
          Left = 4
          Top = 2
          Width = 30
          Height = 30
          AllowAllUp = True
          GroupIndex = 1
          Caption = '*'
        end
        object sbtnDiv: TSpeedButton
          Left = 36
          Top = 2
          Width = 30
          Height = 30
          AllowAllUp = True
          GroupIndex = 1
          Caption = '/'
        end
        object sbtnPlus: TSpeedButton
          Left = 68
          Top = 2
          Width = 30
          Height = 30
          AllowAllUp = True
          GroupIndex = 1
          Caption = '+'
        end
        object cbPara: TComboBox
          Left = 174
          Top = 3
          Width = 70
          Height = 28
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Meiryo UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = 'cbPara'
          OnChange = cbParaChange
          Items.Strings = (
            '1'
            '5'
            '8'
            '10'
            '20'
            '30')
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
        Left = 0
        Top = 365
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
        Left = 0
        Top = 405
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
        Left = 0
        Top = 323
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
        Left = 45
        Top = 323
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
        Left = 45
        Top = 362
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
        Left = 45
        Top = 402
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
      object Panel3: TPanel
        Left = 0
        Top = 28
        Width = 248
        Height = 41
        Align = alTop
        TabOrder = 3
        ExplicitLeft = 24
        ExplicitTop = 136
        ExplicitWidth = 185
        object sbtnBIN: TSpeedButton
          Left = 8
          Top = 4
          Width = 30
          Height = 30
          AllowAllUp = True
          GroupIndex = 2
          Caption = 'BIN'
        end
        object sbtnHEX: TSpeedButton
          Left = 42
          Top = 4
          Width = 30
          Height = 30
          AllowAllUp = True
          GroupIndex = 2
          Caption = 'HEX'
        end
        object SpeedButton2: TSpeedButton
          Left = 76
          Top = 4
          Width = 30
          Height = 30
          AllowAllUp = True
          GroupIndex = 2
          Caption = 'DEC'
        end
      end
      object Edit1: TEdit
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
        TabOrder = 4
        Text = 'Edit1'
      end
    end
  end
  object ActionManager1: TActionManager
    Left = 48
    Top = 408
    StyleName = 'Platform Default'
    object clearAll: TAction
      Category = 'fx'
      Caption = 'CA'
      Hint = 'Clear All'
      ShortCut = 32814
      OnExecute = clearAllExecute
    end
    object clearInp: TAction
      Category = 'fx'
      Caption = 'C'
      Hint = 'Clear Input'
      ShortCut = 16430
      OnExecute = clearInpExecute
    end
    object sqRoot: TAction
      Category = 'fx'
      Caption = #8730
      Hint = 'Square root'
      OnExecute = sqRootExecute
    end
    object square: TAction
      Category = 'fx'
      Caption = '^2'
      Hint = 'square'
      OnExecute = squareExecute
    end
    object logNat: TAction
      Category = 'fx'
      Caption = 'ln'
      OnExecute = logNatExecute
    end
    object logCom: TAction
      Category = 'fx'
      Caption = 'log'
      OnExecute = logComExecute
    end
    object actExp: TAction
      Category = 'fx'
      Caption = 'e^'
      OnExecute = actExpExecute
    end
    object actPercent: TAction
      Category = 'fx'
      Caption = '%'
      OnExecute = actPercentExecute
    end
    object actPerPlus: TAction
      Category = 'paraCalc'
      Caption = '%+'
      Checked = True
    end
    object actPerMinus: TAction
      Category = 'paraCalc'
      Caption = '%-'
    end
    object actPi: TAction
      Category = 'fx'
      Caption = 'pi'
      OnExecute = actPiExecute
    end
    object actDel: TAction
      Category = 'fx'
      Caption = 'DEL'
      OnExecute = actDelExecute
    end
    object actSin: TAction
      Category = 'fx'
      Caption = 'SIN'
      OnExecute = actSinExecute
    end
    object actCos: TAction
      Category = 'fx'
      Caption = 'COS'
      OnExecute = actCosExecute
    end
  end
end
