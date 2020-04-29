unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm4 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  Bitmap: TBitmap;
  TmpLng:integer;

implementation

{$R *.dfm}

procedure ChangeLanguage;
begin
  if TmpLng=1 then
  begin
   Form4.Button1.Caption:='��������� ��������';
   Form4.Button2.Caption:='�������� �����������';
   Form4.Button3.Caption:='��������� ��������';
   TmpLng:=0;
  end
  else
  begin
   Form4.Button1.Caption:='Load picture';
   Form4.Button2.Caption:='Show offender';
   Form4.Button3.Caption:='Save picture';
   TmpLng:=1;
  end;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
Bitmap:=TBitmap.Create;
Bitmap.LoadFromFile('../../assets/clue.bmp');
Image1.Picture.Bitmap:=Bitmap;
Button2.Visible:=True;
end;

procedure TForm4.Button2Click(Sender: TObject);
var x,y:integer;
begin
for x:=0 to Bitmap.Width-1 do
 for y:=0 to Bitmap.Height-1 do
  if Bitmap.Canvas.Pixels[x,y]=clRed then
    Bitmap.Canvas.Pixels[x,y]:=clWhite;
Image2.Picture.Bitmap:=Bitmap;
Button3.Visible:=True;
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
try
  Image2.Picture.SaveToFile('../../assets/verdict.bmp');
except
if TmpLng=1 then
begin
  ShowMessage('Error saving file!');
  Exit;
end
else
begin
  ShowMessage('������ ���������� �����!');
  Exit;
end;
end;
if TmpLng=1 then
  ShowMessage('Succesfully saved')
else
  ShowMessage('������� ���������');
end;

procedure TForm4.Button4Click(Sender: TObject);
begin
ChangeLanguage;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Bitmap.Free;
end;

end.
