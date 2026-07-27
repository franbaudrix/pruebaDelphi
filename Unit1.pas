unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Unit2, Unit3;

type

  TForm1 = class(TForm)
    Button2: TButton;
    Button1: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);

begin

    Form3.Hide;

    Form2.Show;
    Form2.BringToFront;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin

    Form2.Hide;
    
    Form3.Show;
    Form3.BringToFront;

end;

end.
