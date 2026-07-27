unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unit2, StdCtrls, Menus, Grids;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    StringGrid1: TStringGrid;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.FormCreate(Sender: TObject);

var
    i: integer;

begin

    StringGrid1.FixedCols := 0;
    StringGrid1.FixedRows := 0;
    StringGrid1.ColCount := 1;
    StringGrid1.ScrollBars := ssNone;
    StringGrid1.RowCount := Length(Unit2.equipo1);
    StringGrid1.Width := StringGrid1.ColWidths[0];
    StringGrid1.Height := StringGrid1.RowHeights[0] * StringGrid1.RowCount;

    for i := 1 to 3 do
        StringGrid1.Cells[0, i - 1] := Unit2.equipo1[i].nombre;



end;



end.
