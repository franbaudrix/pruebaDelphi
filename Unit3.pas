unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unit2, StdCtrls, Menus, Grids, jpeg, ExtCtrls;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

        //como primera foto por default ponemos la del primer monstruo en la lista
        monstruoActual := listaMonstruos[posMonstruoActual];
        Image1.Picture.LoadFromFile(monstruoActual.imagenes + 'idle.png');
    end;

procedure TForm3.Button2Click(Sender: TObject);
    var
        monstruoActual: monstruo;
    begin
        //sumamos una posicion a posMonstruoActual
        posMonstruoActual := posMonstruoActual + 1;

        //si se pasa de los limites del array entonces empieza desde el otro lado
        if posMonstruoActual > Length(listaMonstruos) then
            posMonstruoActual := 1;
        // cargamos el monstruo correspondiente o una imagen de personaje...
        //...bloqueado si no existe
        monstruoActual := listaMonstruos[posMonstruoActual];
        if monstruoActual.nombre <> '' then
            Image1.Picture.LoadFromFile(monstruoActual.imagenes + 'idle.jpg')
        else
            Image1.Picture.LoadFromFile(RUTAimg + 'bloqueado.jpg');

    end;
procedure TForm3.Button1Click(Sender: TObject);
    var
        monstruoActual: monstruo;
    begin
        //sumamos una posicion a posMonstruoActual
        posMonstruoActual := posMonstruoActual - 1;

        //si se pasa de los limites del array entonces empieza desde el otro lado
        if posMonstruoActual < 1 then
            posMonstruoActual := Length(listaMonstruos);
        // cargamos el monstruo correspondiente o una imagen de personaje...
        //...bloqueado si no existe
        monstruoActual := listaMonstruos[posMonstruoActual];
        if monstruoActual.nombre <> '' then
            Image1.Picture.LoadFromFile(monstruoActual.imagenes + 'idle.jpg')
        else
            Image1.Picture.LoadFromFile(RUTAimg + 'bloqueado.jpg');

end;

end.
