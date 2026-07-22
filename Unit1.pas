unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

type
  ataqueRegistro = record
    nombre:string;
    dano:integer;
    cantidad:integer;
    end;

  arrayAtaques = array[1..3] of ataqueRegistro;

  monstruoRegistro = record
      nombre:string;
      vida:integer;
      ataques: arrayAtaques;
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
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
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

    //Creacion de los ataques (por ahora usaremos los mismos para todos)
    ataque1: ataqueRegistro;
    ataque2: ataqueRegistro;
    ataque3: ataqueRegistro;
    arrayDanos: arrayAtaques;

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

    //Seteo de los ataques
    ataque1.nombre := 'Bala';
    ataque1.dano := 5;
    ataque1.cantidad := 10;
    ataque2.nombre := 'Bola de fuego';
    ataque2.dano := 10;
    ataque2.cantidad := 5;
    ataque3.nombre := 'Bomba';
    ataque3.dano := 20;
    ataque3.cantidad := 2;

    arrayDanos[1] := ataque1;
    arrayDanos[2] := ataque2;
    arrayDanos[3] := ataque3;

    //Seteo de los monstruos
    monstruo1.nombre := 'Kaki';
    monstruo1.vida := 50;
    monstruo1.ataques := arrayDanos;
    monstruo2.nombre := 'Enzo';
    monstruo2.vida := 70;
    monstruo2.ataques := arrayDanos;
    monstruo3.nombre := 'Jorel';
    monstruo3.vida := 100;
    monstruo3.ataques := arrayDanos;

    equipo1[1] := monstruo1;
    equipo1[2] := monstruo2;
    equipo1[3] := monstruo3;

    //Configuracion titulos de botones
    button3.caption := monstruo1.nombre;
    button4.caption := monstruo2.nombre;
    button5.caption := monstruo3.nombre;

    button6.caption := equipo1[1].ataques[1].nombre;
    button7.caption := equipo1[1].ataques[2].nombre;
    button8.caption := equipo1[1].ataques[3].nombre;

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

//Botones para elegir el danio deseado
procedure TForm1.Button6Click(Sender: TObject);
begin
  //Chequeamos que el ataque elegido siga teniendo usos
  if equipo1[posMonstruo].ataques[1].cantidad > 0 then
  begin
    dano := equipo1[posMonstruo].ataques[1].dano;
    vida := vida - dano;
    if vida < 0 then //Definimos el limite minimo
      vida := 0;
    equipo1[posMonstruo].ataques[1].cantidad := equipo1[posMonstruo].ataques[1].cantidad - 1;
    button6.caption := equipo1[posMonstruo].ataques[1].nombre + ' ' + inttostr(equipo1[posMonstruo].ataques[1].cantidad);
  end;
    
  equipo1[posMonstruo].vida := vida;
  StringGrid1.Invalidate;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  //Chequeamos que el ataque elegido siga teniendo usos
  if equipo1[posMonstruo].ataques[2].cantidad > 0 then
  begin
    dano := equipo1[posMonstruo].ataques[2].dano;
    vida := vida - dano;
    if vida < 0 then //Definimos el limite minimo
      vida := 0;
    equipo1[posMonstruo].ataques[2].cantidad := equipo1[posMonstruo].ataques[2].cantidad - 1;
    button7.caption := equipo1[posMonstruo].ataques[2].nombre + ' ' + inttostr(equipo1[posMonstruo].ataques[2].cantidad);
  end;
  equipo1[posMonstruo].vida := vida;
  StringGrid1.Invalidate;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  //Chequeamos que el ataque elegido siga teniendo usos
  if equipo1[posMonstruo].ataques[3].cantidad > 0 then
  begin
    dano := equipo1[posMonstruo].ataques[3].dano;
    vida := vida - dano;
    if vida < 0 then //Definimos el limite minimo
      vida := 0;
    equipo1[posMonstruo].ataques[3].cantidad := equipo1[posMonstruo].ataques[3].cantidad - 1;
    button8.caption := equipo1[posMonstruo].ataques[3].nombre + ' ' + inttostr(equipo1[posMonstruo].ataques[3].cantidad);
  end;
  equipo1[posMonstruo].vida := vida;
  StringGrid1.Invalidate;
end;
end.
