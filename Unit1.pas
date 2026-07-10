unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.ComCtrls, Vcl.PlatformDefaultStyleActnCtrls, System.Actions, Vcl.ActnList,
  Vcl.ActnMan, Vcl.Clipbrd, System.Math, Vcl.ToolWin, Vcl.CategoryButtons,
  Vcl.Buttons;

type
  TForm1 = class(TForm)
    lstData: TListBox;
    edInp: TEdit;
    lblSUM: TLabel;
    LblHEX: TLabel;
    LblBIN: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BtnCA: TButton;
    ActionManager1: TActionManager;
    calcPages: TPageControl;
    tabLST: TTabSheet;
    tabBIN: TTabSheet;
    edDec: TEdit;
    edHex: TEdit;
    edBin: TEdit;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    lblAVG: TLabel;
    Label3: TLabel;
    cbDig: TComboBox;
    Memo1: TMemo;
    btnC: TButton;
    clearAll: TAction;
    clearInp: TAction;
    btnSqrt: TButton;
    sqRoot: TAction;
    btnSq: TButton;
    square: TAction;
    btnLn: TButton;
    btnLog: TButton;
    logNat: TAction;
    logCom: TAction;
    btnExp: TButton;
    actExp: TAction;
    btnPercent: TButton;
    actPercent: TAction;
    cbPara: TComboBox;
    actPerPlus: TAction;
    actPerMinus: TAction;
    Panel2: TPanel;
    sbtnPerPlus: TSpeedButton;
    sbtnPerMinus: TSpeedButton;
    sbtnMul: TSpeedButton;
    sbtnDiv: TSpeedButton;
    sbtnPlus: TSpeedButton;
    btnPi: TButton;
    actPi: TAction;
    btnDel: TButton;
    actDel: TAction;
    Button1: TButton;
    actSin: TAction;
    Button2: TButton;
    actCos: TAction;
    Panel3: TPanel;
    sbtnBIN: TSpeedButton;
    sbtnHEX: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure edInpKeyPress(Sender: TObject; var Key: Char);
    procedure lstDataDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    function FmtNum(num: double): string;
    function HexNum(snum: string): string;
    function BinNum(snum: string): string;
    procedure dspLST();
    function calcSGM(): double;
    function calcAvg(): double;
    function getInp(): double;
    function getPara(): double;
    function calcParPlus(src, para: double):double;
    function calcParMinus(src, para: double): double;
    function xfrFloat(snum: string): double;
    procedure cbDigChange(Sender: TObject);
    procedure lstDataClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure clearInpExecute(Sender: TObject);
    procedure clearAllExecute(Sender: TObject);
    procedure sqRootExecute(Sender: TObject);
    procedure squareExecute(Sender: TObject);
    procedure logComExecute(Sender: TObject);
    procedure logNatExecute(Sender: TObject);
    procedure actExpExecute(Sender: TObject);
    procedure actPercentExecute(Sender: TObject);
    procedure lblSUMClick(Sender: TObject);
    procedure lblAVGClick(Sender: TObject);
    procedure cbParaChange(Sender: TObject);
    procedure actPiExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure actSinExecute(Sender: TObject);
    procedure actCosExecute(Sender: TObject);
  private
    { Private éŒ¾ }
  public
    { Public éŒ¾ }
  end;

var
  Form1: TForm1;
  mode: boolean;    // true: insert mode, false: edit mode

const
  bin: array[0..15] of string = ('0000','0001','0010','0011','0100','0101','0110','0111','1000','1001','1010','1011', '1100','1101','1110','1111');

implementation

{$R *.dfm}

function TForm1.calcAvg: Double;
var
  sum, avg: double;
  num: Integer;
begin
  sum := calcSGM;
  num := lstData.Items.Count;
  if num>0 then
    avg := sum / num
  else
    avg := 0;
  result := avg;
end;

function TForm1.calcSGM: double;
var
  I: Integer;
  sum: double;
begin
  sum := 0.0;
  for I := 0 to lstData.Items.Count-1 do begin
    sum := sum + StrToFloat(lstData.Items[I]);
  end;
  result := sum;
end;

function TForm1.calcParPlus(src: Double; para: Double): Double;
begin
  result := src * (1+para);
end;

function TForm1.calcParMinus(src: Double; para: Double): Double;
begin
  result := src * (1-para);
end;

function TForm1.getInp: Double;
begin
  result := xfrFloat(edInp.Text);
end;

function TForm1.xfrFloat(snum: string): Double;
var
  sbuf: string;
begin
  sbuf := StringReplace(snum, ',', '', [rfReplaceAll]);
  result := StrToFloat(sbuf);
end;

procedure TForm1.cbDigChange(Sender: TObject);
begin
  dspLST;
  ActiveControl := edInp;
end;

procedure TForm1.cbParaChange(Sender: TObject);
begin
  ActiveControl := edInp;
end;

procedure TForm1.clearAllExecute(Sender: TObject);
begin
  lstData.Items.Clear;
  dspLST;
  ActiveControl := edInp;
end;

procedure TForm1.clearInpExecute(Sender: TObject);
begin
  edInp.Clear;
  ActiveControl := edInp;
end;

procedure TForm1.dspLST;
var
  sum, avg: Double;
begin
  sum := calcSGM;
  avg := calcAvg;
  lblSUM.Caption := FmtNum(sum);
  lblAVG.Caption := FmtNum(avg);
end;

procedure TForm1.edInpKeyPress(Sender: TObject; var Key: Char);
var
  knum: Integer;
  cbuf, para, res: double;
  srst: string;
begin
  knum := Ord(Key);
//  Memo1.Lines.Add(IntToStr(knum));
  res := 0.0;
  if knum=13 then begin    //enter
    cbuf := getInp;
    para := getPara;
    if sbtnMul.Down then
      res := cbuf * para
    else if sbtnDiv.Down and (para<>0) then
      res := cbuf / para
    else if sbtnPlus.Down then
      res := cbuf + para
    else if sbtnPerPlus.Down then
      res := cbuf * (1 + para/100)
    else if sbtnPerMinus.Down then
      res := cbuf * (1 - para/100);
    srst := FloatToStr(res);
    edInp.Text := srst;
    if mode then begin
      lstData.Items.Insert(0,srst);
      lstData.ItemIndex := 0;
    end
    else
      lstData.Items[lstData.ItemIndex] := srst;
    dspLST;
    edInp.Clear;
    mode := true;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  calcPages.TabIndex := 0;
  // LIST CALC Page
  lstData.Items.Clear;
  edInp.Clear;
  cbPara.ItemIndex := 0;
  mode := true;
  dspLST;
  ActiveControl := edInp;
  sbtnMul.Down := True;
  Memo1.Lines.Clear;
  // Binary Calc page
end;

function TForm1.FmtNum(num: double): string;
var
  ndig: Integer;
begin
  ndig := StrToInt(cbDig.Text);
  result := Format('%24.*n',[ndig, num]);
end;

function TForm1.HexNum(snum: string): string;
begin
  result := Format('%6.6x', [StrToInt(snum)])+' H';
end;

procedure TForm1.Label1Click(Sender: TObject);
var
  s: string;
begin
  s := Trim(lblSUM.Caption);
  Clipboard.AsText := s;
  Memo1.Lines.Add('SUM data was copied.:'+s);
end;

procedure TForm1.Label2Click(Sender: TObject);
var
  s: string;
begin
  s := Trim(lblAVG.Caption);
  Clipboard.AsText := s;
  Memo1.Lines.Add('AVG data was copied.:'+s);
end;

procedure TForm1.actCosExecute(Sender: TObject);
var
  buf, res: double;
begin
  buf := StrToFloat(edInp.Text);
  res := Cos(buf*pi/180);
  edInp.Text := FloatToStr(res);
  ActiveControl := edInp;
end;

procedure TForm1.actDelExecute(Sender: TObject);
begin
  if lstData.Items.Count > 0 then begin
    lstData.DeleteSelected;
    lstData.ItemIndex := 0;
  end;
  ActiveControl := edInp;
end;

procedure TForm1.actExpExecute(Sender: TObject);
var
  buf, res: double;
begin
  buf := StrToFloat(edInp.Text);
  res := Exp(buf);
  edInp.Text := FloatToStr(res);
  ActiveControl := edInp;
end;

procedure TForm1.actPercentExecute(Sender: TObject);
var
  buf, res: double;
begin
  buf := StrToFloat(edInp.Text);
  res := buf/100;
  edInp.Text := FloatToStr(res);
  ActiveControl := edInp;
end;

procedure TForm1.actPiExecute(Sender: TObject);
begin
  edInp.Text := FloatToStr(pi);
end;

procedure TForm1.actSinExecute(Sender: TObject);
var
  buf, res: double;
begin
  buf := StrToFloat(edInp.Text);
  res := Sin(buf*pi/180);
  edInp.Text := FloatToStr(res);
  ActiveControl := edInp;
end;

function TForm1.getPara: Double;
begin
  result := xfrFloat(cbPara.Text);
end;

function TForm1.BinNum(snum: string): string;
var
  buf,res: string;
  n: Integer;
begin
  n := StrToInt(snum);
  res := 'B';
  while n>15 do
    begin
      buf := bin[n mod 16];
      res := buf + ' ' + res;
      n := n div 16;
    end;
  res := bin[n] + ' ' + res;
  result := res;
end;

procedure TForm1.lblAVGClick(Sender: TObject);
begin
  edInp.Text := StringReplace(lblAVG.Caption, ',', '', [rfReplaceAll]);
end;

procedure TForm1.lblSUMClick(Sender: TObject);
begin
  edInp.Text := Trim(lblSUM.Caption);
end;

procedure TForm1.logComExecute(Sender: TObject);
var
  buf, res: double;
begin
  buf := StrToFloat(edInp.Text);
  res := Log10(buf);
  edInp.Text := FloatToStr(res);
  ActiveControl := edInp;
end;

procedure TForm1.logNatExecute(Sender: TObject);
var
  buf, res: double;
begin
  buf := StrToFloat(edInp.Text);
  res := Ln(buf);
  edInp.Text := FloatToStr(res);
  ActiveControl := edInp;
end;

procedure TForm1.lstDataClick(Sender: TObject);
var
  I: Integer;
begin
  I := lstData.ItemIndex;
  edInp.Text := lstData.Items[I];
  mode := false;
  ActiveControl := edInp;
end;

procedure TForm1.lstDataDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  txt: string;
  pX: Integer;
begin
  txt := FmtNum(xfrFloat(lstData.Items[Index]));
  pX := lstData.Width-10;
  SetTextAlign(lstData.Canvas.Handle, TA_RIGHT);
  if lstData.ItemIndex=Index then
    lstData.Canvas.Brush.Color := clCream
  else
    lstData.Canvas.Brush.Color := clWhite;
  lstData.Canvas.FillRect(Rect);
  lstData.Canvas.Font.Color := clBlack;
  lstData.Canvas.TextOut(pX,Rect.Top,txt);
  SetTextAlign(lstData.Canvas.Handle, TA_LEFT);
//  Memo1.Lines.Insert(0, IntToStr(Rect.Left));
end;

procedure TForm1.sqRootExecute(Sender: TObject);
var
  buf, res: double;
begin
  buf := StrToFloat(edInp.Text);
  res := Sqrt(buf);
  edInp.Text := FloatToStr(res);
  ActiveControl := edInp;
end;

procedure TForm1.squareExecute(Sender: TObject);
var
  buf, res: double;
begin
  buf := StrToFloat(edInp.Text);
  res := Sqr(buf);
  edInp.Text := FloatToStr(res);
  ActiveControl := edInp;
end;

end.
