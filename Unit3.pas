unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unit2, StdCtrls, Menus, Grids, jpeg, ExtCtrls;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    StringGrid1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  posMonstruoActual: integer; // para identificar al monstro seleccionado actualmente

implementation

{$R *.dfm}

procedure TForm3.FormCreate(Sender: TObject);

    var
        i: integer;
        monstruoActual: monstruo;

    begin

        posMonstruoActual := 1;

        StringGrid1.FixedCols := 0;
        StringGrid1.FixedRows := 0;
        StringGrid1.ColCount := 1;
        StringGrid1.ScrollBars := ssNone;
        StringGrid1.RowCount := Length(equipoJugador);
        StringGrid1.Width := StringGrid1.ColWidths[0];
        StringGrid1.Height := StringGrid1.RowHeights[0] * StringGrid1.RowCount;

        for i := 1 to 6 do
            StringGrid1.Cells[0, i - 1] := Unit2.listaMonstruos[i].nombre;

        monstruoActual := listaMonstruos[posMonstruoActual];
        Image1.Picture.LoadFromFile(monstruoActual.imagenes + 'idle.jpg');
    end;





procedure TForm3.Button2Click(Sender: TObject);
    var
        monstruoActual: monstruo;
    begin
        //sumamos una posicion a posMonstruoActual y actualizamos la image1 con la
        // imagen correspondiente
        posMonstruoActual := posMonstruoActual + 1;
        monstruoActual := listaMonstruos[posMonstruoActual];
        if monstruoActual.nombre <> '' then
            Image1.Picture.LoadFromFile(monstruoActual.imagenes + 'idle.jpg')
        else
            Image1.Picture.LoadFromFile(RUTAimg + 'bloqueado.jpg');

    end;
end.
