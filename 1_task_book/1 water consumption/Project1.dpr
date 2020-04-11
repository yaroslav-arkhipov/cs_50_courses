program Project1;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in '..\..\..\..\Desktop\cs50\1 task book\Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
