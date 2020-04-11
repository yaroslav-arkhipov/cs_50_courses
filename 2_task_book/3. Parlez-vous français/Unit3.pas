unit Unit3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.StdCtrls, FMX.Controls.Presentation;

type
  TForm3 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  cAUp, cALow: array[0..26] of Char;
  cRup, cRLow: array[0..32] of Char;

implementation

{$R *.fmx}

function KeyTransform (c:char) : integer;
var j, m:integer;
begin
  j:=Ord(c);
      if (j>64) and (j<91) then             //uppercase english
        for m:=0 to 26 do
        begin
          if c=cAUp[m] then
            Break;
     end else if (j>96) and (j<123) then                    //small english
      for m:=0 to 26 do
        begin
          if c=cALow[m] then
            Break;
     end else if (j>1039) and (j<1072) then                   //uppercase russian
        for m:=0 to 32 do
        begin
          if c=cRUp[m] then
            Break;
     end else if (j>1071) and (j<1104) then                   //small russian
        for m:=0 to 32 do
        begin
          if c=cRLow[m] then
            Break;
         end
         else
         m:=404;
    result:=m;
end;

function StringEncode(c:char; key:integer) : char;
var j, m, l:integer;
begin
  j:=Ord(c);
      if (j>64) and (j<91) then             //uppercase english
        for m:=0 to 26 do
        begin
          if c=cAUp[m] then
            begin
              l:=(m+key) mod 26;
              result:=cAUp[l];
              Break;
            end;
     end else if (j>96) and (j<123) then                    //small english
      for m:=0 to 26 do
        begin
          if c=cALow[m] then
           begin
              l:=(m+key) mod 26;
              result:=cALow[l];
              Break;
            end;
     end else if (j>1039) and (j<1072) then                   //uppercase russian
        for m:=0 to 32 do
        begin
          if c=cRUp[m] then
            begin
              l:=(m+key) mod 32;
              result:=cRUp[l];
              Break;
            end;
     end else if (j>1071) and (j<1104) then                   //small russian
        for m:=0 to 32 do
        begin
          if c=cRLow[m] then
            begin
              l:=(m+key) mod 32;
              result:=cRLow[l];
              Break;
            end;
         end
         else
         result:=c;
end;

procedure TForm3.Button1Click(Sender: TObject);
var s, skey, s1:string;
i, j, m:integer;
c: char;
k: array[1..255] of integer;
begin
  s:=Edit1.Text;
  skey:=Edit2.Text;
for i:=1 to skey.Length do
  begin
    c:=(skey[i]);
    m:=KeyTransform(c);
     if m=404 then
       begin
        ShowMessage('Only letters can be used in the key!');
        Exit;
       end
     else
        k[i]:=m;     //final key
  end;
  i:=0;
for j:=1 to s.Length do
  begin
    c:=s[j];
    inc(i);
    if skey.Length<i then
      i:=1;
    s1:=s1+StringEncode(c,k[i]);
  end;
  Label3.Text:=s1;
end;

procedure TForm3.FormCreate(Sender: TObject);
var n:integer;
c:char;
begin
//**********************Create arrays of chars block*****************************
n:=0;
for c:='A' to 'Z' do
begin
  cAUp[n]:=c;
  n:=n+1;
end;
n:=0;
for c:='a' to 'z' do
begin
  cALow[n]:=c;
  n:=n+1;
end;
n:=0;
for c:='�' to '�' do
begin
  cRUp[n]:=c;
  n:=n+1;
end;
n:=0;
for c:='�' to '�' do
begin
  cRLow[n]:=c;
  n:=n+1;
end;
//************************End block***************************
end;

end.
