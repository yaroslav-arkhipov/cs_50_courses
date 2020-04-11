unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.ScrollBox, FMX.Memo, FMX.StdCtrls, FMX.Controls.Presentation;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Memo1: TMemo;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.Button1Click(Sender: TObject);
var height, i, j:integer;
begin
Memo1.Lines.Clear;
height:=StrToInt(Edit1.Text);
if (height<0) or (height>23) then Label1.Text:='������� ������������� �������� �� 0 �� 23'
else
begin
  for i:=0 to height-1 do
  begin
  for j:=0 to height-1 do
  begin
    if j<(height-1-i) then
    Memo1.Text:=(Memo1.Text+' ')
    else
    Memo1.Text:=(Memo1.Text+'!');
  end;
  Memo1.Lines.Add(#13);
  end;
end;
end;

end.
