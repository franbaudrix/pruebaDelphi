unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit2, Unit3;

type
  TForm4 = class(TForm)
    ListBox1: TListBox;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.FormCreate(Sender: TObject);

var
    i: integer;

begin

    for i := 1 to Length(Unit2.listaMonstruos) do
        //Le mostramos al usuario unicamente los monstruos que hayan sido desbloqueados
        if Unit2.listaMonstruos[i].desbloqueado = True then
          ListBox1.Items.Add(Unit2.listaMonstruos[i].nombre);


end;

procedure TForm4.Button1Click(Sender: TObject);
var
  i,j, posE:integer;
begin
  posE := 1; //Posicion del monstruo en el equipo jugador
  for i:= 0 to ListBox1.Count - 1 do
    if ListBox1.Selected[i] then //Buscamos los monstruos seleccionados
    begin
      for j:= 1 to Length(Unit2.listaMonstruos) do
      begin
        if Unit2.listaMonstruos[j].nombre = ListBox1.Items[i] then
          equipoJugador[posE] := Unit2.listaMonstruos[j];
      end;
      posE := posE + 1;
    end;
  
  Form4.Hide;

  Form2.Show;
  Form2.BringToFront;
end;

end.
