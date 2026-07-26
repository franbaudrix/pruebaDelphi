unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Unit2;

type

  TForm1 = class(TForm)
    Button14: TButton;
    procedure Button14Click(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button14Click(Sender: TObject);

begin

    Form2.Show;
    Form2.BringToFront;

end;

end.
