unit Unit3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox,
  FMX.Memo, FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation;

type
  TForm3 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Memo1: TMemo;
    Label3: TLabel;
    Button2: TButton;
    Panel1: TPanel;
    Label4: TLabel;
    Edit3: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  Str:string;

implementation

{$R *.fmx}

procedure TForm3.Button1Click(Sender: TObject);
var
    i, randNumRange, randNumLen:integer;
    MainString:string;
begin
Str:='';
//Try transform string to int - range numbers
 if tryStrToInt(Edit1.Text, randNumRange) then
    randNumRange:=randNumRange
 else
 begin
   ShowMessage('¬ведите целое число - границу случайных чисел');
   Exit;
 end;
 //Try transform string to int - length numbers
 if tryStrToInt(Edit2.Text, randNumLen) then
    randNumLen:=randNumLen
 else
 begin
   ShowMessage('¬ведите целое число - необходимое коичество чисел');
   Exit;
 end;
 //Fill in Memo
 for i:=1 to randNumLen do
 begin  
 MainString:=IntToStr(Random(randNumRange));
    Memo1.Lines.Add(MainString);
    Str:=Str+' '+MainString;
    MainString:='';
 end;
end;

procedure TForm3.Button2Click(Sender: TObject);
var SrchNum, Number, i, j:integer;
  Num:string;
begin
Number:=0;
  //Try transform string to int - searching of number
 if tryStrToInt(Edit3.Text, SrchNum) then
    SrchNum:=SrchNum
 else
 begin
   ShowMessage('¬ведите целое искомое число');
   Exit;
 end;  
 Num:=IntToStr(SrchNum);
    for j:=0 to Str.Length do
      begin
      if Pos(Num,Str)>0 then
      begin
        inc(Number);
        i:=Pos(Num,Str);
      end
      else
      begin
    
      end;
    Delete(Str,i,Num.Length);  
    end;
 if Number>0 then
    ShowMessage('„исло найдено : '+IntToStr(Number)+' раз(а)')
 else
    ShowMessage('„исло не найдено!');
end;

end.
