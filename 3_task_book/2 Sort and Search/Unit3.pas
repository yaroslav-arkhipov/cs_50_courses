unit Unit3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.ScrollBox, FMX.Memo, FMX.Controls.Presentation, FMX.Edit, FMX.Objects;

type
  BinTreeSort = class(TThread) //BinTreeSort - �������� �������� �������.
protected
  procedure Execute; override;
end;
type
  TData = Integer;  // ��� ����� - integer
  TPNode = ^TNode;  //��������� �� ����
  TNode = record    //��� ���� ������
    Data : TData;   //���� ���� ������
    PLeft, PRight : TPNode; //��������� �� ����� � ������ ����
  end;
type
  TForm3 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    SearchEdit: TEdit;
    Button3: TButton;
    Label6: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  type mass=array of integer;
var
  Form3: TForm3;
  Str:string;
  randNumLen: integer;
  originArr: array of integer;
  numArrBinTr: array of TData;
  BinTrAlg: real;
  BinTrCounter: LongInt;
  BinTrBool: boolean;

implementation

{$R *.fmx}

//***************������������ ������ �� ������*************
procedure TreeFree(var aPNode : TPNode);
begin
  if aPNode <> nil then
  begin
  {������������ ����� � ������ ������ ������}
    TreeFree(aPNode^.PLeft);
    TreeFree(aPNode^.PRight);
    Dispose(aPNode); //������������ ������
    aPNode := nil;   //��������� ���������
  end;
end;
//*************************BinaryTreeSort******************
//*********************************************************
//*********************************************************
procedure BinTreeSort.Execute;
var
i:integer;
PTree : TPNode;
function AddNodeAsc(var aPNode : TPNode; const aData : TData):integer;
begin
  if aPNode = nil then {������� ����.}
  begin
    New(aPNode);           {�������� ������ ��� ����.}
    aPNode^.Data := aData; {���������� � ���� �������� �����.}
    Result:=aPNode^.Data;
    aPNode^.PLeft := nil;  {��������� ��������� �� ������ �������.}
    aPNode^.PRight := nil; {��������� ��������� �� ������� �������.}
  end
  else if aData <= aPNode^.Data then {����� ����� ������� � ����� �����.}
    Result:=AddNodeAsc(aPNode^.PLeft, aData)
  else if aData > aPNode^.Data then  {����� ����� ������� � ������ �����.}
    Result:=AddNodeAsc(aPNode^.PRight, aData);
end;
function AddNodeDesc(var aPNode : TPNode; const aData : TData):integer;
begin
  if aPNode = nil then {������� ����.}
  begin
    New(aPNode);           {�������� ������ ��� ����.}
    aPNode^.Data := aData; {���������� � ���� �������� �����.}
    aPNode^.PLeft := nil;  {��������� ��������� �� ������ �������.}
    aPNode^.PRight := nil; {��������� ��������� �� ������� �������.}
  end
  else if aData >= aPNode^.Data then {����� ����� ������� � ����� �����.}
    Result:=AddNodeDesc(aPNode^.PLeft, aData)
  else if aData < aPNode^.Data then  {����� ����� ������� � ������ �����.}
    Result:=AddNodeDesc(aPNode^.PRight, aData);
end;
function Sort(const aPNode : TPNode; var aArr : array of TData; var aI : Integer):integer;
begin
  if aPNode <> nil then
  begin
    Sort(aPNode^.PLeft, aArr, aI);  {����������� ����� ��� ����� �����.}
    aArr[aI] := aPNode^.Data;       {������ �������� ����.}
    Inc(aI);                        {��������� ������ �������.}
    Sort(aPNode^.PRight, aArr, aI); {����������� ����� ��� ������ �����.}
  end;
end;
begin
SetLength(numArrBinTr, randNumLen);
{$R-}
  for i:=0 to randNumLen-1 do
  numArrBinTr[i] := originArr[i];
{$R+}
BinTrAlg:=GetTickCount;
 begin
      TThread.Queue(nil,
        procedure
        begin
          Form3.Memo2.Lines.Clear;
        end
      );
 end;
 PTree := nil;
  for i := Low(numArrBinTr) to High(numArrBinTr) do
   AddNodeAsc(PTree, numArrBinTr[i]);
    i := 0;
  Sort(PTree, numArrBinTr, i);
 BinTrAlg:=(GetTickCount - BinTrAlg);
   begin
      TThread.Queue(nil,
        procedure
        var j:integer;
        begin
        TreeFree(PTree);
        if BinTrAlg/1000<0.0001 then
          Form3.Label6.Text:='�������� ���������� � ������� �������� ������: ����� 0.0001 �������, ���������� ����������: '+IntToStr(BinTrCounter)
        else
          Form3.Label6.Text:='�������� ���������� � ������� �������� ������: '+ Format('%.4n ���.', [BinTrAlg/1000])+', ���������� ����������: '+IntToStr(BinTrCounter);
            for j:=0 to randNumLen-1 do
            Form3.Memo2.Lines.Add(IntToStr(numArrBinTr[j]));
        end
      );
 end;
 BinTrBool:=true;
Terminate;
end;

procedure Search(sortingArray: array of integer; SrchInt: Integer);
var tmpInt, k, m:integer;
function binarySort(sortingArray: array of integer; SrchInt: Integer; start, stop:integer): Integer;
var mid: integer;
begin
  if start>stop then
  begin
    Result:=-1;
    Exit;
  end
  else if mid>randNumLen-1 then
  begin
    Result:=-1;
    Exit;
  end
  else
    mid:=(start+stop) div 2;
  if SrchInt=sortingArray[mid] then
  begin
    Result:=mid;
    Exit;
  end
  else if SrchInt<sortingArray[mid] then
    Result:=binarySort(sortingArray, SrchInt, start, mid-1)
  else if SrchInt>sortingArray[mid] then
    Result:=binarySort(sortingArray, SrchInt, mid+1, stop)
end;

begin
tmpInt:=0;
k:=binarySort(sortingArray, SrchInt, 0, randNumLen);
if (k=-1) then
ShowMessage('���������� �� �������')
else
begin
while pos(IntToStr(SrchInt),IntToStr(sortingArray[k]))>0 do
begin
  if k=0 then
  begin
    m:=0;
    Break;
  end
  else
    dec(k);
end;
if k=0 then
k:=k
else
k:=k+1;
while pos(IntToStr(SrchInt),IntToStr(sortingArray[k]))>0 do
  begin
    Inc(tmpInt);
    Inc(k);
  end;
  case tmpInt of
    1,21,31,41,51,61,71,81,91,101,121,131,141,151,161,171,181,191,201,221,231,241,251: ShowMessage('������� '+IntToStr(tmpInt)+' ����������');
    2,22,32,42,52,62,72,82,92,102,122,132,142,152,162,172,182,192,202,222,232,242,252: ShowMessage('������� '+IntToStr(tmpInt)+' ����������');
    3,23,33,43,53,63,73,83,93,103,123,133,143,153,163,173,183,193,203,223,2332,243,253: ShowMessage('������� '+IntToStr(tmpInt)+' ����������');
    4,24,34,44,54,64,74,84,94,104,124,134,144,154,164,174,184,194,204,224,234,244,254: ShowMessage('������� '+IntToStr(tmpInt)+' ����������');
    else ShowMessage('������� '+IntToStr(tmpInt)+' ����������');
  end;
  end;
end;

//*************************Generate Random Array***********
//*********************************************************
//*********************************************************
procedure TForm3.Button1Click(Sender: TObject);
var
  i, randNumRange, randNum:integer;
begin
  Memo1.Lines.Clear;
  BinTrBool:=false;
  fillchar(numArrBinTr,sizeof(numArrBinTr),0);
  Str:='';
//Try transform string to int - range numbers
 if tryStrToInt(Edit1.Text, randNumRange) then
    randNumRange:=randNumRange
 else
   begin
     ShowMessage('������� ����� ����� - ������� ��������� �����');
     Exit;
   end;
 //Try transform string to int - length numbers
 if tryStrToInt(Edit2.Text, randNumLen) then
    randNumLen:=randNumLen
 else
   begin
     ShowMessage('������� ����� ����� - ����������� ��������� �����');
     Exit;
   end;
   SetLength(originArr, randNumLen);
 //Fill in Memo
 for i:=0 to randNumLen-1 do
   begin
      randNum:=Random(randNumRange);
      Memo1.Lines.Add(IntToStr(randNum));
      originArr[i]:=randNum;
   end;
end;
//*************************Start Sorting Array*************
//*********************************************************
//*********************************************************
procedure TForm3.Button2Click(Sender: TObject);
begin
  Label6.Text:='�������� ���������� � ������� �������� ������';
    begin
      BinTrCounter:=0;
      Label6.Text:=Label6.Text+': ����������....';
      BinTreeSort.Create(False);
    end;
end;
//*************************Start Search********************
//*********************************************************
//*********************************************************
procedure TForm3.Button3Click(Sender: TObject);
var searchingInt: integer;
begin
if tryStrToInt(SearchEdit.Text, searchingInt) then
    searchingInt:=searchingInt
else
   begin
     ShowMessage('������� ����� ����� - ������� �����');
     Exit;
   end;
   Search(numArrBinTr,searchingInt);
end;

end.
