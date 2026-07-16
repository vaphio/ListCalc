unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.ComCtrls, Vcl.PlatformDefaultStyleActnCtrls, System.Actions, Vcl.ActnList,
  Vcl.ActnMan, Vcl.Clipbrd, System.Math, Vcl.ToolWin, Vcl.CategoryButtons,
  Vcl.Buttons, System.StrUtils;

type
  TForm1 = class(TForm)
    lstData: TListBox;
    edInp: TEdit;
    lblSUM: TLabel;
    BtnCA: TButton;
    ActionManager1: TActionManager;
    calcPages: TPageControl;
    tabLST: TTabSheet;
    tabBIN: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    lblAVG: TLabel;
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
    pnlBIN: TPanel;
    edBIN: TEdit;
    sgBIN: TStringGrid;
    rgBase: TRadioGroup;
    Memo2: TMemo;
    Button3: TButton;
    actAnd: TAction;
    actOR: TAction;
    actXOR: TAction;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    actNot: TAction;
    actRev: TAction;
    actShiftL: TAction;
    actShiftR: TAction;
    Button10: TButton;
    actSTA: TAction;
    Button11: TButton;
    actXCG: TAction;
    procedure FormCreate(Sender: TObject);
    procedure edInpKeyPress(Sender: TObject; var Key: Char);
    procedure lstDataDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    function FmtNum(num: double): string;
    function HexNum(snum: string): string;
    function NumToSBin(num: Integer): string;
    function sBinToNum(snum: string): Integer;
    function getCell(ARow: Integer): Integer;
    procedure setCell(ARow, data: Integer);
    function getData(snum: string): Integer;
    function chkHex(knum: Integer): Char;
    function sHexToNum(snum: string): Integer;
    procedure dspLST();
    function calcSGM(): double;
    function calcAvg(): double;
    function getInp(): double;
    function getPara(): double;
    function calcParPlus(src, para: double):double;
    function calcParMinus(src, para: double): double;
    function xfrFloat(snum: string): double;
    procedure setGrid(ARow: Integer; snum: string);
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
    procedure actPiExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure actSinExecute(Sender: TObject);
    procedure actCosExecute(Sender: TObject);
    procedure edBINKeyPress(Sender: TObject; var Key: Char);
    procedure calcPagesChange(Sender: TObject);
    procedure rgBaseClick(Sender: TObject);
    procedure sgBINDrawCell(Sender: TObject; ACol, ARow: LongInt; Rect: TRect;
      State: TGridDrawState);
    procedure actAndExecute(Sender: TObject);
    procedure actORExecute(Sender: TObject);
    procedure actXORExecute(Sender: TObject);
    procedure actNotExecute(Sender: TObject);
    procedure actRevExecute(Sender: TObject);
    procedure actShiftLExecute(Sender: TObject);
    procedure actShiftRExecute(Sender: TObject);
    procedure setMemo(num: Integer; msg: string);
    procedure actSTAExecute(Sender: TObject);
    procedure actXCGExecute(Sender: TObject);
  private
    { Private éŒ¾ }
  public
    { Public éŒ¾ }
  end;

var
  Form1: TForm1;
  mode: boolean;    // true: insert mode, false: edit mode
  bmode, crow: Integer;

const
  bin: array[0..15] of string = ('0000','0001','0010','0011','0100','0101','0110','0111','1000','1001','1010','1011', '1100','1101','1110','1111');
  colSize = 10;
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

procedure TForm1.calcPagesChange(Sender: TObject);
begin
  if calcPages.ActivePageIndex=0 then
    ActiveControl := edInp
  else
    ActiveControl := edBIN;
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

procedure TForm1.clearAllExecute(Sender: TObject);
begin
  lstData.Items.Clear;
  dspLST;
  ActiveControl := edInp;
  mode := true;
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

procedure TForm1.edBINKeyPress(Sender: TObject; var Key: Char);
var
  knum, bint: Integer;
  sbin, shex: string;
begin
  if calcPages.ActivePageIndex=0 then exit;

  knum := Ord(Key);
//  lblBIN.Caption := IntToStr(knum);
  case rgBase.ItemIndex of
    0: if knum>49 then Key := char(0);
    1: Key := chkHex(knum);
    2: Key := Key;
  end;

  if knum=13 then begin
//    sgBIN.RowCount := sgBIN.RowCount + 1;
    bint := getData(edBIN.Text);
//    Memo2.Lines.Add(IntToStr(crow));
    sbin := NumToSBIN(bint);
    shex := IntToHex(bint, 2);
    setGrid(crow+1, sbin);
    sgBIN.Cells[0,crow+1] := IntToStr(bint);
    setMemo(bint, 'set '+IntToStr(crow));
//    lstBIN.Items.Insert(0, shex+':'+sbin);
    edBIN.Clear;
    crow := (crow + 1) mod 2;
  end;
end;

function TForm1.chkHex(knum: Integer): Char;
begin
  if knum < 58 then result := Chr(knum)
  else if (knum > 64) and (knum < 71) then result := Chr(knum)
  else if (knum > 96) and (knum < 103) then result := Chr(knum - 32)
  else result := char(0);
end;

function TForm1.sHexToNum(snum: string): Integer;
var
  i, buf, num, res: Integer;
begin
  res := 0;
  for i := 1 to Length(snum) do begin
    buf := Ord(snum[i]);
    if buf < 58 then num := buf - 48
    else num := buf - 55;
    res := (res + num)*16;
  end;
  result := res div 16;
end;

procedure TForm1.edInpKeyPress(Sender: TObject; var Key: Char);
var
  knum: Integer;
  cbuf, para, res: double;
  srst: string;
begin
  if calcPages.ActivePageIndex=1 then exit;

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
var
  I,c: Integer;
begin
  self.Left := Monitor.Width - self.Width - 20;
  self.Top := Monitor.Height - self.Height - 60;
  calcPages.TabIndex := 0;
  // LIST CALC Page
  lstData.Items.Clear;
  edInp.Clear;
  mode := true;
  dspLST;
  ActiveControl := edInp;
  sbtnMul.Down := True;
  Memo1.Lines.Clear;
  // Binary Calc page
  calcPages.TabIndex := 1;
  edBIN.Clear;
  rgBase.ItemIndex := 0;
  bmode := 0;
  crow := 0;
  sgBin.ColWidths[0] := 40;
  sgBin.Cells[0, 0] := 'HEX';
  sgBin.ColWidths[8] := 40;
  sgBin.Cells[8, 0] := 'CMD';
  for I := 1 to colSize -2 do begin
    sgBIN.ColWidths[I] := 20;
    c := I;
    sgBIN.Cells[c, 0] := IntToStr(8-I);
  end;
  Memo2.Lines.Clear;
  calcPages.TabIndex := 0;
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

function TForm1.sBinToNum(snum: string): Integer;
var
  i, bint: Integer;
begin
  bint := 0;
  for i := 1 to Length(snum) do
  begin
    bint := (bint + StrToInt(snum[i])) * 2;
  end;
  result := bint div 2;
end;

function TForm1.getCell(ARow: Integer): Integer;
begin
  result := StrToInt(sgBIN.Cells[0, ARow]);
end;

procedure TForm1.setCell(ARow: Integer; data: Integer);
var
  sbin: string;
begin
  sgBIN.Cells[0, ARow] := IntToStr(data);
  sbin := NumToSBIN(data);
  setGrid(ARow, sbin);
end;

procedure TForm1.setMemo(num: Integer; msg: string);
var
  sbin, shex: string;
begin
  sbin := NumToSBIN(num);
  shex := IntToHex(num, 2);
  Memo2.Lines.Insert(0, shex+':'+sbin+'--'+msg);
end;

function TForm1.getData(snum: string): Integer;
begin
  result := 0;
  case rgBase.ItemIndex of
    0: result := sBinToNum(snum);
    1: result := sHexToNum(snum);
    2: result := StrToInt(snum);
  end;
end;

procedure TForm1.setGrid(ARow: Integer; snum: string);
var
  i: Integer;
begin
  for i:=1 to Length(snum) do begin
    sgBIN.Cells[i,ARow] := snum[i];
  end;
end;

procedure TForm1.sgBINDrawCell(Sender: TObject; ACol, ARow: LongInt;
  Rect: TRect; State: TGridDrawState);
var
  txt: string;
begin
  txt := sgBIN.Cells[ACol, ARow];
  if (ARow > 0) and (ACol = 0) and (txt <> '')then
    txt := IntToHex(StrToInt(txt),2);

  if State = [gdFixed] then sgBIN.Canvas.Brush.Color := clCream
  else if txt='1' then sgBIN.Canvas.Brush.Color := clYellow
  else sgBIN.Canvas.Brush.Color := clWhite;
  sgBIN.Canvas.FillRect(Rect);
  sgBIN.Canvas.Font.Color := clBlack;
  DrawText(sgBIN.Canvas.Handle, PChar(txt), Length(txt), Rect, DT_CENTER);
//  sgBIN.Canvas.TextOut(Rect.Left, Rect.Top, txt);
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

procedure TForm1.actAndExecute(Sender: TObject);
var
  a,b,res: Integer;
begin
  a := getCell(1);
  b := getCell(2);
  res := a and b;
  setCell(3, res);
  setMemo(res, 'AND');
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

procedure TForm1.actNotExecute(Sender: TObject);
var
  a, buf, res, i: Integer;
  sbin, sres: string;
begin
  a := getCell(1);
  sbin := NumToSBIN(a);
  sres := '';
  for i := 1 to Length(sbin) do begin
    buf := StrToInt(sbin[i]);
    if buf = 0 then sres := sres + '1'
    else sres := sres + '0';
  end;
  res := sBINtoNum(sres);
  setCell(3,res);
  setMemo(res, 'NOT');
end;

procedure TForm1.actORExecute(Sender: TObject);
var
  a,b, res: Integer;
  cmd: string;
begin
  a := getCell(1);
  b := getCell(2);
  cmd := 'OR';
  res := a or b;
  setCell(3, res);
  setMemo(res, cmd);
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

procedure TForm1.actRevExecute(Sender: TObject);
var
  a, i, res: Integer;
  sres, sbin: string;
begin
  a := getCell(1);
  sbin := NumToSBIN(a);
  sres := '';
  for i := 1 to Length(sbin) do
    sres := sbin[i] + sres;
  res := sBINtoNum(sres);
  setCell(3, res);
  setMemo(res, 'REV');
end;

procedure TForm1.actShiftLExecute(Sender: TObject);
var
  a, res: Integer;
  sres, sbin: string;
begin
  a := getCell(1);
  sbin := NumToSBIN(a);
  sres := RightStr(sbin,7)+'0';
  res := sBINtoNum(sres);
  setCell(3,res);
  setMemo(res, 'SHL');
end;

procedure TForm1.actShiftRExecute(Sender: TObject);
var
  a, res: Integer;
  sres, sbin: string;
begin
  a := getCell(1);
  sbin := NumToSBIN(a);
  sres := '0'+LeftStr(sbin,7);
  res := sBINtoNum(sres);
  setCell(3, res);
  setMemo(res, 'SHR');
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

procedure TForm1.actSTAExecute(Sender: TObject);
var
  num: Integer;
begin
  num := getCell(3);
  setCell(1, num);
  setMemo(num, 'STR');
end;

procedure TForm1.actXCGExecute(Sender: TObject);
var
  a,b: Integer;
begin
  a := getCell(1);
  b := getCell(2);
  setCell(1,b);
  setCell(2,a);
  setMemo(b, 'XCG');
end;

procedure TForm1.actXORExecute(Sender: TObject);
var
  a,b, res: Integer;
begin
  a := getCell(1);
  b := getCell(2);
  res := a xor b;
  setCell(3, res);
  setMemo(res, 'XOR');
end;

function TForm1.getPara: Double;
var
  spara: string;
begin
  spara := cbPara.Text;
  if spara = 'PI' then result := Pi
  else if spara = 'e' then result := exp(1)
  else result := xfrFloat(cbPara.Text);
end;

function TForm1.NumToSBin(num: Integer): string;
var
  res: string;
begin
  res := bin[num mod 16];
  num := num div 16;
  res := bin[num] + res;
  result := res;
end;

procedure TForm1.rgBaseClick(Sender: TObject);
begin
  ActiveControl := edBIN;
end;

procedure TForm1.lblAVGClick(Sender: TObject);
begin
  edInp.Text := StringReplace(lblAVG.Caption, ',', '', [rfReplaceAll]);
end;

procedure TForm1.lblSUMClick(Sender: TObject);
begin
  edInp.Text := FloatToStr(xfrFloat(lblSUM.Caption));
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
