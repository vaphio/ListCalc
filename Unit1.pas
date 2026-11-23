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
    BtnCA: TButton;
    ActionManager1: TActionManager;
    calcPages: TPageControl;
    tabLST: TTabSheet;
    tabBIN: TTabSheet;
    Panel1: TPanel;
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
    lblCalc: TLabel;
    edPara: TEdit;
    cbCon: TComboBox;
    Splitter1: TSplitter;
    cbLCalc: TComboBox;
    lblCalRes: TLabel;
    sbtnCp: TSpeedButton;
    actCP: TAction;
    enBtn: TButton;
    Label1: TLabel;
    rbMode1: TRadioButton;
    rbMode2: TRadioButton;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure edInpKeyPress(Sender: TObject; var Key: Char);
    procedure lstDataDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    function FmtNum(num: double): string;
    function HexNum(snum: string): string;
    function NumToSBin(num: Integer): string;
    function sBinToNum(snum: string): Integer;
    function getCell(ARow: Integer): Integer;
    function getData(snum: string): Integer;
    function chkHex(knum: Integer): Char;
    function sHexToNum(snum: string): Integer;
    procedure dspLST();
    function calcMath(a, b: double; fnIdx: Integer):double;
    function calcSGM(): double;
    function calcAvg(): double;
    function calcMax(): double;
    function calcMin(): double;
    function calcMid(): double;
    function calcDev(): double;
    function calcSD(): double;
    function getInp(): double;
    function getPara(): double;
    function calcParPlus(src, para: double):double;
    function calcParMinus(src, para: double): double;
    function xfrFloat(snum: string): double;
    function chkCalc(Key: string): Integer;
    procedure setGrid(ARow: Integer; num: Integer);
    procedure cbDigChange(Sender: TObject);
    procedure lstDataClick(Sender: TObject);
    procedure clearInpExecute(Sender: TObject);
    procedure clearAllExecute(Sender: TObject);
    procedure sqRootExecute(Sender: TObject);
    procedure squareExecute(Sender: TObject);
    procedure logComExecute(Sender: TObject);
    procedure logNatExecute(Sender: TObject);
    procedure actExpExecute(Sender: TObject);
    procedure actPercentExecute(Sender: TObject);
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
    procedure setMemo(num: double; msg: string);
    procedure actSTAExecute(Sender: TObject);
    procedure actXCGExecute(Sender: TObject);
    procedure cbConChange(Sender: TObject);
    procedure lblCalResClick(Sender: TObject);
    procedure cbLCalcChange(Sender: TObject);
    procedure actCPExecute(Sender: TObject);
    procedure enBtnClick(Sender: TObject);
    procedure rbMode1Click(Sender: TObject);
    procedure rbMode2Click(Sender: TObject);
    procedure setMode(md: boolean);
    type
      TFloatArray = array of double;
      function getDataList(): TFloatArray;


  private
    { Private éŒ¾ }
  public
    { Public éŒ¾ }
  end;

var
  Form1: TForm1;
  mode: boolean;    // true: insert mode, false: edit mode
  bmode, crow: Integer;
  mem1, mem2: double;

const
  bin: array[0..15] of string = ('0000','0001','0010','0011','0100','0101','0110','0111','1000','1001','1010','1011', '1100','1101','1110','1111');
  colSize = 10;
  fn: array[0..6] of string = ('*','/','+','-','^','%+','%-');
  version='1.1';

implementation

{$R *.dfm}

function TForm1.getDataList: TForm1.TFloatArray;
var
  i,n: Integer;
  data: double;
begin
  n := lstData.Count;
  SetLength(result, n);
  for i := 0 to n-1 do
    if TryStrToFloat(lstData.Items[i], data) then
      result[i] := data
    else result[i] := 0;
end;

function TForm1.calcAvg: Double;
var
  dlst: TFloatArray;
begin
  if lstData.Count>0 then begin
    dlst := getDataList;
    result := Mean(dlst);
  end else result := 0;
end;

function TForm1.calcSGM: double;
var
  I: Integer;
  sum, data: double;
begin
  sum := 0.0;
  for I := 0 to lstData.Items.Count-1 do begin
    if TryStrToFloat(lstData.Items[I], data) then
      sum := sum + data;
  end;
  result := sum;
end;

function TForm1.calcMax: Double;
var
  dlst: TFloatArray;
begin
  if lstData.Count>0 then begin
    dlst := getDataList;
    result := MaxValue(dlst);
  end else result := 0;
end;

function TForm1.calcMin: Double;
var
  dlst: TFloatArray;
begin
  if lstData.Count>0 then begin
    dlst := getDataList;
    result := MinValue(dlst);
  end else result := 0;
end;

function TForm1.calcMid: Double;
var
  m: Integer;
begin
  if lstData.Count>0 then begin
    m := lstData.Items.Count div 2;
    result := StrToFloat(lstData.Items[m]);
  end else result := 0;
end;

function TForm1.calcDev: Double;
var
  dlst: TFloatArray;
begin
  if lstData.Count>0 then begin
    dlst := getDataList;
    result := SumOfSquares(dlst);
  end else result := 0;
end;

function TForm1.calcSD: Double;
var
  dlst: TFloatArray;
begin
  if lstData.Count>0 then begin
    dlst := getDataList;
    result := StdDev(dlst);
  end else result := 0;
end;

function TForm1.calcMath(a: Double; b: Double; fnIdx: Integer): Double;
begin
  if fnIdx < 0 then
    result := 0
  else begin
    case fnIdx of
      0: result := a * b;
      1: if b<>0 then result := a / b else result := -9.999;
      2: result := a + b;
      3: result := a - b;
      4: result := Power(a,b);
      5: result := a * (1 + b/100);
      6: result := a * (1 - b/100);
    else
      result := 0;
    end;
  end;
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
  data: double;
begin
  sbuf := StringReplace(snum, ',', '', [rfReplaceAll]);
  if TryStrToFloat(sbuf, data) then
    result := data
  else
    result := 0;
end;

procedure TForm1.cbConChange(Sender: TObject);
var
  spara: string;
  para: double;
begin
  spara := cbCon.Text;
  if TryStrToFloat(spara, para) then
    setMemo(para, ' *')
  else begin
    if spara = 'PI' then para := Pi
    else if spara = 'e' then para := exp(1)
    else para := StrToFloat(spara);
  end;
  edPara.Text := FloatToStr(para);
end;

procedure TForm1.cbDigChange(Sender: TObject);
begin
  dspLST;
  ActiveControl := edInp;
end;

procedure TForm1.cbLCalcChange(Sender: TObject);
begin
  dspLst;
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
  calRes: Double;
begin
  calRes := 0;
  case cbLCalc.ItemIndex of
    0: calRes := calcSGM;   //sum
    1: calRes := calcAVG;   //average
    2: calRes := lstData.Count; //count
    3: calRes := calcMax;         //max
    4: calRes := calcMin;         //min
    5: calRes := calcMid;         //mid
    6: calRes := calcDev;         //var
    7: calRes := calcSD;         //sd
  end;
  lblCalRes.Caption := FmtNum(calRes);
end;

procedure TForm1.edBINKeyPress(Sender: TObject; var Key: Char);
var
  knum, bint: Integer;
begin
  if calcPages.ActivePageIndex=0 then exit;

  knum := Ord(Key);
  case rgBase.ItemIndex of
    0: if knum>49 then Key := char(0);
    1: Key := chkHex(knum);
    2: Key := Key;
  end;

  if knum=13 then begin
    if sgBIN.Cells[9,1] <> '' then begin
      bint := getCell(1);
      setGrid(2, bint);
    end;
    bint := getData(edBIN.Text);
    setGrid(1, bint);
    setMemo(bint, 'set '+IntToStr(crow));
    edBIN.Clear;
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
  cidx: Integer;
  cbuf, para, res: double;
  srst, p, msg, sfnc: string;
begin
  cidx := chkCalc(Key);
  if cidx > -1 then
    lblCalc.Caption := Key;
  if Key=Char(13) then begin    //enter
    cbuf := getInp;
    sfnc := lblCalc.Caption;
    cidx := chkCalc(sfnc);
    if sfnc <> '' then begin
      res := calcMath(mem1, cbuf, cidx);
      msg := FmtNum(mem1) + sfnc + FmtNum(cbuf) + ' =' + FmtNum(res);
    end else begin
      res := cbuf;
      msg := FmtNum(cbuf) + ' =' + FmtNum(res);
    end;
    edInp.Text := FloatToStr(res);
    Memo1.Lines.Insert(0, msg);
    mem1 := 0;
    lblCalc.Caption := '';

    para := getPara;
    p := cbPara.Text;
    cbuf := getInp;
    cidx := chkCalc(p);
    res := calcMath(cbuf, para, cidx);
    srst := FloatToStr(res);
    edInp.Text := srst;
    if mode then begin
      lstData.Items.Insert(0,srst);
      lstData.ItemIndex := 0;
    end
    else
      lstData.Items[lstData.ItemIndex] := srst;
    dspLST;
    edInp.SelectAll;
    mode := true;
  end
  else if cidx > -1 then begin
    mem1 := getInp;
    edInp.Text := '';
    Key := Char(0);
  end;
end;

procedure TForm1.enBtnClick(Sender: TObject);
begin
  ActiveControl := edInp;
  edInp.SelectAll;
end;

function TForm1.chkCalc(Key: string): Integer;
begin
  result := IndexStr(Key, fn);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  I,c: Integer;
begin
  Form1.Caption := 'List Calc (ver.' + version + ')';
  self.Left := Monitor.Width - self.Width - 20;
  self.Top := Monitor.Height - self.Height - 60;
  calcPages.TabIndex := 0;
  // LIST CALC Page
  lstData.Items.Clear;
  edInp.Clear;
  edPara.Text := '1';
  cbCon.ItemIndex := 0;
  cbPara.ItemIndex := 0;
  cbLCalc.ItemIndex := 0;
  lblCalc.Caption := '';
  lblCalRes.Caption := '';
  mode := true;
  dspLST;
  ActiveControl := edInp;
  Memo1.Lines.Clear;
  // Binary Calc page
  calcPages.TabIndex := 1;
  edBIN.Clear;
  rgBase.ItemIndex := 0;
  bmode := 0;
  crow := 0;
  sgBin.ColWidths[0] := 35;
  sgBin.Cells[0, 0] := 'HEX';
  sgBin.ColWidths[9] := 40;
  sgBin.Cells[9, 0] := 'DEC';
  for I := 1 to colSize -2 do begin
    sgBIN.ColWidths[I] := 20;
    c := I;
    sgBIN.Cells[c, 0] := IntToStr(8-I);
  end;
  calcPages.TabIndex := 0;
  ActiveControl := edInp;
end;

function TForm1.FmtNum(num: double): string;
var
  ndig: Integer;
begin
  ndig := StrToInt(cbDig.Text);
  result := Trim(Format('%24.*n',[ndig, num]));
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

procedure TForm1.setMemo(num: double; msg: string);
var
  sbin, shex, snum: string;
  inum: Integer;
begin
  case calcPages.ActivePageIndex of
  0: begin
    snum := FmtNum(num);
    Memo1.Lines.Insert(0, snum + ' ' + msg);
    end;
  1: begin
    inum := trunc(num);
    sbin := NumToSBIN(inum);
    shex := IntToHex(inum, 2);
    Memo1.Lines.Insert(0, shex+':'+sbin+'--'+msg);
    end;
  end;
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

procedure TForm1.setGrid(ARow: Integer; num: Integer);
var
  i: Integer;
  sbin, snum: string;
begin
  snum := IntToStr(num);
  sbin := NumToSBIN(num);
  for i:=1 to 8 do begin
    sgBIN.Cells[i,ARow] := sbin[i];
  end;
  sgBIN.Cells[0, ARow] := snum;
  sgBIN.Cells[9, ARow] := snum;
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

procedure TForm1.actAndExecute(Sender: TObject);
var
  a,b,res: Integer;
  sfnc: string;
begin
  sfnc := 'AND';
  a := getCell(1);
  b := getCell(2);
  res := a and b;
  setGrid(3, res);
  setMemo(res, sfnc);
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

procedure TForm1.actCPExecute(Sender: TObject);
begin
  Clipboard.AsText := lbLCalRes.Caption;
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
  setGrid(3,res);
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
  setGrid(3, res);
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
  setGrid(3, res);
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
  setGrid(3,res);
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
  setGrid(3, res);
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
  setGrid(1, num);
  setMemo(num, 'STR');
end;

procedure TForm1.actXCGExecute(Sender: TObject);
var
  a,b: Integer;
begin
  a := getCell(1);
  b := getCell(2);
  setGrid(1,b);
  setGrid(2,a);
  setMemo(b, 'XCG');
end;

procedure TForm1.actXORExecute(Sender: TObject);
var
  a,b, res: Integer;
begin
  a := getCell(1);
  b := getCell(2);
  res := a xor b;
  setGrid(3, res);
  setMemo(res, 'XOR');
end;

function TForm1.getPara: Double;
begin
  result := StrToFloat(edPara.Text);
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

procedure TForm1.rbMode1Click(Sender: TObject);
begin
  mode := True;
  ActiveControl := edInp;
end;

procedure TForm1.rbMode2Click(Sender: TObject);
begin
  mode := False;
  ActiveControl := edInp;
end;

procedure TForm1.setMode(md: Boolean);
begin
  if md then rbMode1.Checked := true
  else rbMode2.Checked := true;
end;

procedure TForm1.rgBaseClick(Sender: TObject);
begin
  ActiveControl := edBIN;
end;

procedure TForm1.lblCalResClick(Sender: TObject);
begin
  edInp.Text := FloatToStr(xfrFloat(lblCalRes.Caption));
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
  setMode(mode);
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
