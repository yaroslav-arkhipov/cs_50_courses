unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,System.Types, System.IOUtils;

type
  TForm4 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
const
BLOCK = 512;
var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
var
card: file;
img:file;
title:string;
jpegNum:integer;
A: TArray<System.Byte>;
byteArray : array[1..512] of byte;
i,count:integer;
begin
jpegNum:=0;
title:=IntToStr(jpegNum)+'.jpg';
if FileExists('../../assets/card.raw')=false then
begin
  ShowMessage('Файл card.raw отсутсвует.');
  Exit;
end;
AssignFile(card,'../../assets/card.raw');
Reset(card);
while not eof(card) do
begin
  BlockRead(card,byteArray,1,count);
  while ((IntToHex(byteArray[1],1) = 'FF') and (IntToHex(byteArray[2],1) = 'D8') and (IntToHex(byteArray[3],1) = 'FF')
  and ((IntToHex(byteArray[4],1) = 'E0') or (IntToHex(byteArray[4],1) = 'E1'))) do
    begin
      title:=IntToStr(jpegNum)+'.jpg';
      AssignFile(img,title);
      Memo1.Lines.Add('Картинка создалась под номером '+title);
      Reset(img);
      BlockWrite(img, byteArray, 1);
      Memo1.Lines.Add('Пошла запись файла '+title);
    if  ( not (IntToHex(byteArray[1],1) = 'FF') and (IntToHex(byteArray[2],1) = 'D8') and (IntToHex(byteArray[3],1) = 'FF')
    and ((IntToHex(byteArray[4],1) = 'E0') or (IntToHex(byteArray[4],1) = 'E1'))) then
    begin
    Memo1.Lines.Add('Продолжаем запись файла '+title);
      BlockWrite(img, byteArray, 1);
    end
       else
         begin
          CloseFile(img);
          Memo1.Lines.Add('Увеличиваем значение '+IntToStr(jpegNum));
          Inc(jpegNum);
          Break;
         end;
    end;
end;
CloseFile(card);
end;

end.
