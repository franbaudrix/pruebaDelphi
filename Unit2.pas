unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

type

  ataque = record
        nombre: string;
        dano: integer;
        cantidad: integer;
    end;

  TarrayDanos = array[1..3] of ataque;

  monstruo = record
        nombre: string;
        vida: integer;
        ataques: TarrayDanos;
        desbloqueado: boolean;
    end;

  //por ahora vamos a suponer que el usuario puede tener muchos personajes
  equipo = array[1..10] of monstruo;


  TForm2 = class(TForm)
    StringGrid1: TStringGrid;
    Edit2: TEdit;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    StringGrid2: TStringGrid;
    Button1: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  ataque1: ataque;
  ataque2: ataque;
  ataque3: ataque;

  monstruo1: monstruo;
  monstruo2: monstruo;
  monstruo3: monstruo;
  monstruo4: monstruo;
  monstruo5: monstruo;
  monstruo6: monstruo;

  arrayDanos, arrayDanos2: TarrayDanos;

  equipoJugador: equipo;
  equipo2: equipo;
  listaMonstruos: equipo;

  posMonstruoJugador, posMonstruoE2: integer;
  vidaJugador, vidaE2: integer;
  danoJugador, danoE2: integer;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);

const
    N = 100;

var
   i:integer;

begin
    StringGrid1.FixedCols := 0;
    StringGrid1.FixedRows := 0;
    StringGrid1.RowCount := 1;
    StringGrid1.ColCount := 100;
    StringGrid1.DefaultColWidth := 5;

    StringGrid2.FixedCols := 0;
    StringGrid2.FixedRows := 0;
    StringGrid2.RowCount := 1;
    StringGrid2.ColCount := 100;
    StringGrid2.DefaultColWidth := 5;

    //Seteo de los ataques genericos
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

    arrayDanos2[1] := ataque3;
    arrayDanos2[2] := ataque3;
    arrayDanos2[3] := ataque3;

    //Seteo de los monstruos genericos
    monstruo1.nombre := 'Kaki';
    monstruo1.vida := 50;
    monstruo1.ataques := arrayDanos;
    monstruo1.desbloqueado := True;
    monstruo2.nombre := 'Enzo';
    monstruo2.vida := 70;
    monstruo2.ataques := arrayDanos;
    monstruo2.desbloqueado := True;
    monstruo3.nombre := 'Jorel';
    monstruo3.vida := 100;
    monstruo3.ataques := arrayDanos;
    monstruo3.desbloqueado := False;
    monstruo4.nombre := 'Joaco';
    monstruo4.vida := 20;
    monstruo4.ataques := arrayDanos2;
    monstruo4.desbloqueado := True;
    monstruo5.nombre := 'Ivan';
    monstruo5.vida := 30;
    monstruo5.ataques := arrayDanos2;
    monstruo5.desbloqueado := True;
    monstruo6.nombre := 'Budin';
    monstruo6.vida := 10;
    monstruo6.ataques := arrayDanos2;
    monstruo6.desbloqueado := True;

    //Seteo de los equipos rivales
    equipoJugador[1] := monstruo1;
    equipoJugador[2] := monstruo2;
    equipoJugador[3] := monstruo3;

    equipo2[1] := monstruo1;
    equipo2[2] := monstruo2;
    equipo2[3] := monstruo3;

    //Enlistado de todos los monstruos disponibles y no disponibles
    listaMonstruos[1] := monstruo1;
    listaMonstruos[2] := monstruo2;
    listaMonstruos[3] := monstruo3;
    listaMonstruos[4] := monstruo4;
    listaMonstruos[5] := monstruo5;
    listaMonstruos[6] := monstruo6;

    //Configuracion titulos de botones (nombre de los monstruos) del oponente
    button1.caption := monstruo1.nombre;
    button9.caption := monstruo2.nombre;
    button10.caption := monstruo3.nombre;

    //Nombres de los ataques y su cantidad restante del oponente
    button11.caption := equipo2[1].ataques[1].nombre + ' ' + inttostr(equipo2[1].ataques[1].cantidad);
    button12.caption := equipo2[1].ataques[2].nombre + ' ' + inttostr(equipo2[1].ataques[2].cantidad);
    button13.caption := equipo2[1].ataques[3].nombre + ' ' + inttostr(equipo2[1].ataques[3].cantidad);

    posMonstruoJugador := 1;
    vidaJugador := equipoJugador[posMonstruoJugador].vida;

    posMonstruoE2 := 1;
    vidaE2 := equipo2[posMonstruoE2].vida;

end;

//Barra de vida del jugador
procedure TForm2.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);

var
    color_vida: TColor;

begin
    if vidaJugador <= 5 then
        color_vida := Clred
    else if vidaJugador <= 25 then
        color_vida := Clyellow
    else
        color_vida := Clgreen;

    if (Acol < vidaJugador) then
    begin
      StringGrid1.Canvas.Brush.Color := color_vida;
    end
    else
    begin
      StringGrid1.Canvas.Brush.Color := clWhite;
    end;

    StringGrid1.Canvas.FillRect(Rect);  
end;

//Barra de vida del rival
procedure TForm2.StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);

var
    color_vida: TColor;

begin
    if vidaE2 <= 5 then
        color_vida := Clred
    else if vidaE2 <= 25 then
        color_vida := Clyellow
    else
        color_vida := Clgreen;

    if (Acol < vidaE2) then
    begin
      StringGrid2.Canvas.Brush.Color := color_vida;
    end
    else
    begin
      StringGrid2.Canvas.Brush.Color := clWhite;
    end;

    StringGrid2.Canvas.FillRect(Rect);  
end;

//Boton para curar 
//procedure TForm2.Button2Click(Sender: TObject);
//begin
//    curacion := strtoint(Edit2.Text);
//    vida := vida + curacion;
//    if vida > StringGrid1.ColCount then //Definimos el limite maximo
//      vida:= StringGrid1.ColCount;
//
//    equipoJugador[posMonstruo].vida := vida;
//    StringGrid1.Invalidate;
//end;

//BOTONES PARA CAMBIAR DE MONSTRUO JUGADOR
procedure TForm2.Button3Click(Sender: TObject);
begin
  posMonstruoJugador := 1;
  vidaJugador := equipoJugador[posMonstruoJugador].vida;
  StringGrid1.Invalidate;

  button6.caption := equipoJugador[posMonstruoJugador].ataques[1].nombre + ' ' + inttostr(equipoJugador[posMonstruoJugador].ataques[1].cantidad);
  button7.caption := equipoJugador[posMonstruoJugador].ataques[2].nombre + ' ' + inttostr(equipoJugador[posMonstruoJugador].ataques[2].cantidad);
  button8.caption := equipoJugador[posMonstruoJugador].ataques[3].nombre + ' ' + inttostr(equipoJugador[posMonstruoJugador].ataques[3].cantidad);
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  posMonstruoJugador := 2;
  vidaJugador := equipoJugador[posMonstruoJugador].vida;
  StringGrid1.Invalidate;

  button6.caption := equipoJugador[posMonstruoJugador].ataques[1].nombre + ' ' + inttostr(equipoJugador[posMonstruoJugador].ataques[1].cantidad);
  button7.caption := equipoJugador[posMonstruoJugador].ataques[2].nombre + ' ' + inttostr(equipoJugador[posMonstruoJugador].ataques[2].cantidad);
  button8.caption := equipoJugador[posMonstruoJugador].ataques[3].nombre + ' ' + inttostr(equipoJugador[posMonstruoJugador].ataques[3].cantidad);
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
  posMonstruoJugador := 3;
  vidaJugador := equipoJugador[posMonstruoJugador].vida;
  StringGrid1.Invalidate;

  button6.caption := equipoJugador[posMonstruoJugador].ataques[1].nombre + ' ' + inttostr(equipoJugador[posMonstruoJugador].ataques[1].cantidad);
  button7.caption := equipoJugador[posMonstruoJugador].ataques[2].nombre + ' ' + inttostr(equipoJugador[posMonstruoJugador].ataques[2].cantidad);
  button8.caption := equipoJugador[posMonstruoJugador].ataques[3].nombre + ' ' + inttostr(equipoJugador[posMonstruoJugador].ataques[3].cantidad);
end;

//Botones para elegir el danio deseado JUGADOR
procedure TForm2.Button6Click(Sender: TObject);
begin
  //Chequeamos que el ataque elegido siga teniendo usos
  if equipoJugador[posMonstruoJugador].ataques[1].cantidad > 0 then
  begin
    equipoJugador[posMonstruoJugador].ataques[1].cantidad := equipoJugador[posMonstruoJugador].ataques[1].cantidad - 1;
    button6.caption := equipoJugador[posMonstruoJugador].ataques[1].nombre + ' ' + inttostr(equipoJugador[posMonstruoJugador].ataques[1].cantidad);
    danoJugador := equipoJugador[posMonstruoJugador].ataques[1].dano;
    vidaE2 := vidaE2 - danoJugador;
    if vidaE2 < 0 then //Definimos el limite minimo
      vidaE2 := 0;
  end;
    
  equipo2[posMonstruoE2].vida := vidaE2;
  StringGrid2.Invalidate;
end;

procedure TForm2.Button7Click(Sender: TObject);
begin
  //Chequeamos que el ataque elegido siga teniendo usos
  if equipoJugador[posMonstruoJugador].ataques[2].cantidad > 0 then
  begin
    equipoJugador[posMonstruoJugador].ataques[2].cantidad := equipoJugador[posMonstruoJugador].ataques[2].cantidad - 1;
    button7.caption := equipoJugador[posMonstruoJugador].ataques[2].nombre + ' ' + inttostr(equipoJugador[posMonstruoJugador].ataques[2].cantidad);
    danoJugador := equipoJugador[posMonstruoJugador].ataques[2].dano;
    vidaE2 := vidaE2 - danoJugador;
    if vidaE2 < 0 then //Definimos el limite minimo
      vidaE2 := 0;
  end;
    
  equipo2[posMonstruoE2].vida := vidaE2;
  StringGrid2.Invalidate;
end;

procedure TForm2.Button8Click(Sender: TObject);
begin
  //Chequeamos que el ataque elegido siga teniendo usos
  if equipoJugador[posMonstruoJugador].ataques[3].cantidad > 0 then
  begin
    equipoJugador[posMonstruoJugador].ataques[3].cantidad := equipoJugador[posMonstruoJugador].ataques[3].cantidad - 1;
    button8.caption := equipoJugador[posMonstruoJugador].ataques[3].nombre + ' ' + inttostr(equipoJugador[posMonstruoJugador].ataques[3].cantidad);
    danoJugador := equipoJugador[posMonstruoJugador].ataques[3].dano;
    vidaE2 := vidaE2 - danoJugador;
    if vidaE2 < 0 then //Definimos el limite minimo
      vidaE2 := 0;
  end;
    
  equipo2[posMonstruoE2].vida := vidaE2;
  StringGrid2.Invalidate;
end;

//BOTONES PARA CAMBIAR DE MONSTRUO RIVAL
procedure TForm2.Button1Click(Sender: TObject);
begin
  posMonstruoE2 := 1;
  vidaE2 := equipo2[posMonstruoE2].vida;
  StringGrid2.Invalidate;

  button11.caption := equipoJugador[posMonstruoE2].ataques[1].nombre + ' ' + inttostr(equipoJugador[posMonstruoE2].ataques[1].cantidad);
  button12.caption := equipoJugador[posMonstruoE2].ataques[2].nombre + ' ' + inttostr(equipoJugador[posMonstruoE2].ataques[2].cantidad);
  button13.caption := equipoJugador[posMonstruoE2].ataques[3].nombre + ' ' + inttostr(equipoJugador[posMonstruoE2].ataques[3].cantidad);
end;

procedure TForm2.Button9Click(Sender: TObject);
begin
  posMonstruoE2 := 2;
  vidaE2 := equipo2[posMonstruoE2].vida;
  StringGrid2.Invalidate;

  button11.caption := equipo2[posMonstruoE2].ataques[1].nombre + ' ' + inttostr(equipo2[posMonstruoE2].ataques[1].cantidad);
  button12.caption := equipo2[posMonstruoE2].ataques[2].nombre + ' ' + inttostr(equipo2[posMonstruoE2].ataques[2].cantidad);
  button13.caption := equipo2[posMonstruoE2].ataques[3].nombre + ' ' + inttostr(equipo2[posMonstruoE2].ataques[3].cantidad);
end;

procedure TForm2.Button10Click(Sender: TObject);
begin
  posMonstruoE2 := 3;
  vidaE2 := equipo2[posMonstruoE2].vida;
  StringGrid2.Invalidate;

  button11.caption := equipo2[posMonstruoE2].ataques[1].nombre + ' ' + inttostr(equipo2[posMonstruoE2].ataques[1].cantidad);
  button12.caption := equipo2[posMonstruoE2].ataques[2].nombre + ' ' + inttostr(equipo2[posMonstruoE2].ataques[2].cantidad);
  button13.caption := equipo2[posMonstruoE2].ataques[3].nombre + ' ' + inttostr(equipo2[posMonstruoE2].ataques[3].cantidad);
end;

//Botones para elegir el danio deseado RIVAL
procedure TForm2.Button11Click(Sender: TObject);
begin
  //Chequeamos que el ataque elegido siga teniendo usos
  if equipo2[posMonstruoE2].ataques[1].cantidad > 0 then
  begin
    equipo2[posMonstruoE2].ataques[1].cantidad := equipo2[posMonstruoE2].ataques[1].cantidad - 1;
    button11.caption := equipo2[posMonstruoE2].ataques[1].nombre + ' ' + inttostr(equipo2[posMonstruoE2].ataques[1].cantidad);
    danoE2 := equipo2[posMonstruoE2].ataques[1].dano;
    vidaJugador := vidaJugador - danoE2;
    if vidaJugador < 0 then //Definimos el limite minimo
      vidaJugador := 0;
  end;
    
  equipoJugador[posMonstruoJugador].vida := vidaJugador;
  StringGrid1.Invalidate;
end;

procedure TForm2.Button12Click(Sender: TObject);
begin
  //Chequeamos que el ataque elegido siga teniendo usos
  if equipo2[posMonstruoE2].ataques[2].cantidad > 0 then
  begin
    equipo2[posMonstruoE2].ataques[2].cantidad := equipo2[posMonstruoE2].ataques[2].cantidad - 1;
    button12.caption := equipo2[posMonstruoE2].ataques[2].nombre + ' ' + inttostr(equipo2[posMonstruoE2].ataques[2].cantidad);
    danoE2 := equipo2[posMonstruoE2].ataques[2].dano;
    vidaJugador := vidaJugador - danoE2;
    if vidaJugador < 0 then //Definimos el limite minimo
      vidaJugador := 0;
  end;
    
  equipoJugador[posMonstruoJugador].vida := vidaJugador;
  StringGrid1.Invalidate;
end;

procedure TForm2.Button13Click(Sender: TObject);
begin
  //Chequeamos que el ataque elegido siga teniendo usos
  if equipo2[posMonstruoE2].ataques[3].cantidad > 0 then
  begin
    equipo2[posMonstruoE2].ataques[3].cantidad := equipo2[posMonstruoE2].ataques[3].cantidad - 1;
    button13.caption := equipo2[posMonstruoE2].ataques[3].nombre + ' ' + inttostr(equipo2[posMonstruoE2].ataques[3].cantidad);
    danoE2 := equipo2[posMonstruoE2].ataques[3].dano;
    vidaJugador := vidaJugador - danoE2;
    if vidaJugador < 0 then //Definimos el limite minimo
      vidaJugador := 0;
  end;
    
  equipoJugador[posMonstruoJugador].vida := vidaJugador;
  StringGrid1.Invalidate;
end;

procedure TForm2.Button14Click(Sender: TObject);

begin

    Form2.Show;
    Form2.BringToFront;

end;

procedure TForm2.FormShow(Sender: TObject);
begin
  button3.caption := equipoJugador[1].nombre;
  button4.caption := equipoJugador[2].nombre;
  button5.caption := equipoJugador[3].nombre;

  button6.caption := equipoJugador[1].ataques[1].nombre + ' ' + inttostr(equipoJugador[1].ataques[1].cantidad);
  button7.caption := equipoJugador[1].ataques[2].nombre + ' ' + inttostr(equipoJugador[1].ataques[2].cantidad);
  button8.caption := equipoJugador[1].ataques[3].nombre + ' ' + inttostr(equipoJugador[1].ataques[3].cantidad);

  posMonstruoJugador := 1;
  vidaJugador := equipoJugador[posMonstruoJugador].vida;
end;

end.
 