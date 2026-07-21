unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

type
  ataqueRegistro = record
    nombre:string;
    dano:integer;
    tipo:string;
    end;

  arrayAtaques = array[1..5] of ataqueRegistro;

  monstruoRegistro = record
      nombre:string;
      vida:integer;
      //ataques: arrayAtaques;
    end;

  equipoArray = array[1..3] of monstruoRegistro;

  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Edit1: TEdit;
    Button1: TButton;
    Edit2: TEdit;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }

    vida: integer;
    dano: integer;
    curacion: integer;
    posMonstruo: integer;

    //Creacion de equipo 1
    monstruo1: monstruoRegistro;
    monstruo2: monstruoRegistro;
    monstruo3: monstruoRegistro;
    equipo1: equipoArray;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);

const
    N = 100;

begin
    StringGrid1.FixedCols := 0;
    StringGrid1.FixedRows := 0;
    StringGrid1.RowCount := 1;
    StringGrid1.ColCount := 100;
    StringGrid1.DefaultColWidth := 5;

    monstruo1.nombre := 'Kaki';
    monstruo1.vida := 50;
    monstruo2.nombre := 'Enzo';
    monstruo2.vida := 70;
    monstruo3.nombre := 'Jorel';
    monstruo3.vida := 100;

    equipo1[1] := monstruo1;
    equipo1[2] := monstruo2;
    equipo1[3] := monstruo3;

    posMonstruo := 1;
    vida := equipo1[posMonstruo].vida;
end;

procedure TForm1.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);

var
    color_vida: TColor;

begin
    if vida <= 5 then
        color_vida := Clred
    else if vida <= 25 then
        color_vida := Clyellow
    else
        color_vida := Clgreen;

    if (Acol < vida) then
    begin
      StringGrid1.Canvas.Brush.Color := color_vida;
    end
    else
    begin
      StringGrid1.Canvas.Brush.Color := clWhite;
    end;

    StringGrid1.Canvas.FillRect(Rect);  
end;

//Boton para hacer danio
procedure TForm1.Button1Click(Sender: TObject);
begin
    dano := strtoint(Edit1.Text);
    vida := vida - dano;
    if vida < 0 then //Definimos el limite minimo
      vida := 0;
    
    equipo1[posMonstruo].vida := vida;
    StringGrid1.Invalidate;
end;

//Boton para curar 
procedure TForm1.Button2Click(Sender: TObject);
begin
    curacion := strtoint(Edit2.Text);
    vida := vida + curacion;
    if vida > StringGrid1.ColCount then //Definimos el limite maximo
      vida:= StringGrid1.ColCount;

    equipo1[posMonstruo].vida := vida;
    StringGrid1.Invalidate;
end;

//BOTONES PARA CAMBAIR DE MONSTRUO
procedure TForm1.Button3Click(Sender: TObject);
begin
  posMonstruo := 1;
  vida := equipo1[posMonstruo].vida;
  StringGrid1.Invalidate;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  posMonstruo := 2;
  vida := equipo1[posMonstruo].vida;
  StringGrid1.Invalidate;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  posMonstruo := 3;
  vida := equipo1[posMonstruo].vida;
  StringGrid1.Invalidate;
end;

end.
