unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm4 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  BMP: TBitmap;
  TmpLng: Integer=0;
  BmpCreated:integer=0;
  BmpResized: integer = 0;

implementation

{$R *.dfm}

procedure ChangeLanguage;
begin
   if TmpLng=1 then
  begin
   Form4.Button1.Caption:='��������� ��������';
   Form4.Button2.Caption:='�������� ������';
   Form4.Button3.Caption:='��������� ��������';
   if BmpCreated=1 then
    Form4.Label1.Caption:='��������� �������: ������ '+IntToStr(BMP.Width)+' ������ '+IntToStr(BMP.Height)
   else
    Form4.Label1.Caption:='��������� �������:';
   if BmpResized=1 then
     Form4.Label2.Caption:='���������� �������: ������ '+IntToStr(BMP.Width)+' ������ '+IntToStr(BMP.Height)
   else
    Form4.Label2.Caption:='���������� �������:';
   Form4.Label3.Caption:='������:';
   Form4.Label4.Caption:='������:';
   TmpLng:=0;
  end
  else
  begin
   Form4.Button1.Caption:='Load picture';
   Form4.Button2.Caption:='Resize picture';
   Form4.Button3.Caption:='Save picture';
   if BmpCreated=1 then
    Form4.Label1.Caption:='Initial sizes: width '+IntToStr(BMP.Width)+' height '+IntToStr(BMP.Height)
   else
    Form4.Label1.Caption:='Initial sizes:';
   if BmpResized=1 then
     Form4.Label2.Caption:='Resized: width '+IntToStr(BMP.Width)+' height '+IntToStr(BMP.Height)
   else
     Form4.Label2.Caption:='Resized:';
   Form4.Label3.Caption:='Width:';
   Form4.Label4.Caption:='Height:';
   TmpLng:=1;
  end;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
BMP:=TBitmap.Create;
BMP.LoadFromFile('../../assets/small.bmp');
Image1.Picture.Bitmap:=BMP;
BmpCreated:=1;
if TmpLng=1 then
Label1.Caption:='Initial sizes: width '+IntToStr(BMP.Width)+' height '+IntToStr(BMP.Height)
else
Label1.Caption:='��������� �������: ������ '+IntToStr(BMP.Width)+' ������ '+IntToStr(BMP.Height);
Edit1.Visible:=True;
Edit2.Visible:=True;
Button2.Visible:=True;
Label3.Visible:=True;
Label4.Visible:=True;
end;

procedure TForm4.Button2Click(Sender: TObject);
var NewWidth, NewHeight:integer;
begin
if (Edit1.Text='') or (Edit2.Text='') then
begin
  if TmpLng=1 then
    ShowMessage('Enter new image size')
  else
    ShowMessage('������� ����� ������� ��������');
  Exit;
end
else
begin
  if TryStrToInt(Edit1.Text, NewWidth) then
   NewWidth:=NewWidth
  else
   begin
  if TmpLng=1 then
    ShowMessage('Enter valid width (integer)')
  else
    ShowMessage('������� ���������� ������ (����� �����)');
    Exit;
   end;
  if TryStrToInt(Edit2.Text, NewHeight) then
   NewHeight:=NewHeight
  else
   begin
  if TmpLng=1 then
    ShowMessage('Enter valid height (integer)')
  else
    ShowMessage('������� ���������� ������ (����� �����)');
    Exit;
   end;
BMP.Width:=NewWidth;
BMP.Height:=NewHeight;
Image2.Picture.Bitmap:=BMP;
if TmpLng=1 then
Label2.Caption:='Resized: width '+IntToStr(BMP.Width)+' height '+IntToStr(BMP.Height)
else
Label2.Caption:='���������� ������: ������ '+IntToStr(BMP.Width)+' ������ '+IntToStr(BMP.Height);
Button3.Visible:=True;
BmpResized:=1;
end;
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
Image2.Picture.Bitmap.SaveToFile('../../assets/resized.bmp');
end;

procedure TForm4.Button4Click(Sender: TObject);
begin
ChangeLanguage;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 BMP.Free;
end;

end.
