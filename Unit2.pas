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
    Button14: TButton;
    Label1: TLabel;
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
    procedure Button14Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LogicaIA;
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

  turno: boolean;

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
    monstruo1.vida := 100;
    monstruo1.ataques := arrayDanos;
    monstruo1.desbloqueado := True;
    monstruo2.nombre := 'Enzo';
    monstruo2.vida := 100;
    monstruo2.ataques := arrayDanos;
    monstruo2.desbloqueado := True;
    monstruo3.nombre := 'Jorel';
    monstruo3.vida := 100;
    monstruo3.ataques := arrayDanos;
    monstruo3.desbloqueado := False;
    monstruo4.nombre := 'Joaco';
    monstruo4.vida := 10;
    monstruo4.ataques := arrayDanos2;
    monstruo4.desbloqueado := True;
    monstruo5.nombre := 'Ivan';
    monstruo5.vida := 10;
    monstruo5.ataques := arrayDanos2;
    monstruo5.desbloqueado := True;
    monstruo6.nombre := 'Budin';
    monstruo6.vida := 10;
    monstruo6.ataques := arrayDanos2;
    monstruo6.desbloqueado := True;

    //Seteo de los equipos rivales
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

    Randomize;
    posMonstruoE2 := Random(3) + 1;

    //Configuracion LABEL con nombre monstruo del RIVAL
    label1.caption := equipo2[posMonstruoE2].nombre;

    posMonstruoJugador := 1;
    vidaJugador := equipoJugador[posMonstruoJugador].vida;

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
  if (turno) and (equipoJugador[1].vida > 0) then
    posMonstruoJugador := 1;
    vidaJugador := equipoJugador[posMonstruoJugador].vida;
    StringGrid1.Invalidate;

    button6.caption := equipoJugador[posMonstruoJugador].ataques[1].nombre + ' ' + inttostr(equipoJugador[posMonstruoJugador].ataques[1].cantidad);
    button7.caption := equipoJugador[posMonstruoJugador].ataques[2].nombre + ' ' + inttostr(equipoJugador[posMonstruoJugador].ataques[2].cantidad);
    button8.caption := equipoJugador[posMonstruoJugador].ataques[3].nombre + ' ' + inttostr(equipoJugador[posMonstruoJugador].ataques[3].cantidad);
    turno:= False;
    LogicaIA; //Ejecutamos el procedimiento para que la IA ataque
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  if (turno) and (equipoJugador[2].vida > 0) then
    posMonstruoJugador := 2;
    vidaJugador := equipoJugador[posMonstruoJugador].vida;
    StringGrid1.Invalidate;

    button6.caption := equipoJugador[posMonstruoJugador].ataques[1].nombre + ' ' + inttostr(equipoJugador[posMonstruoJugador].ataques[1].cantidad);
    button7.caption := equipoJugador[posMonstruoJugador].ataques[2].nombre + ' ' + inttostr(equipoJugador[posMonstruoJugador].ataques[2].cantidad);
    button8.caption := equipoJugador[posMonstruoJugador].ataques[3].nombre + ' ' + inttostr(equipoJugador[posMonstruoJugador].ataques[3].cantidad);
    turno:= False;
    LogicaIA; //Ejecutamos el procedimiento para que la IA ataque
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
  if (turno) and (equipoJugador[3].vida > 0) then
    posMonstruoJugador := 3;
    vidaJugador := equipoJugador[posMonstruoJugador].vida;
    StringGrid1.Invalidate;

    button6.caption := equipoJugador[posMonstruoJugador].ataques[1].nombre + ' ' + inttostr(equipoJugador[posMonstruoJugador].ataques[1].cantidad);
    button7.caption := equipoJugador[posMonstruoJugador].ataques[2].nombre + ' ' + inttostr(equipoJugador[posMonstruoJugador].ataques[2].cantidad);
    button8.caption := equipoJugador[posMonstruoJugador].ataques[3].nombre + ' ' + inttostr(equipoJugador[posMonstruoJugador].ataques[3].cantidad);
    turno:= False;
    LogicaIA; //Ejecutamos el procedimiento para que la IA ataque
end;

//Botones para elegir el danio deseado JUGADOR
procedure TForm2.Button6Click(Sender: TObject);
begin
  if (turno) and (equipoJugador[posMonstruoJugador].vida > 0) then
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
    turno:= False; //Cambiamos la variable turno para que ataque al rival
    LogicaIA; //Ejecutamos el procedimiento para que la IA ataque
  end;
end;

procedure TForm2.Button7Click(Sender: TObject);
begin
  if (turno) and (equipoJugador[posMonstruoJugador].vida > 0) then
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
    turno:= False;//Cambiamos la variable turno para que ataque al rival
    LogicaIA; //Ejecutamos el procedimiento para que la IA ataque
  end;
end;

procedure TForm2.Button8Click(Sender: TObject);
begin
  if (turno) and (equipoJugador[posMonstruoJugador].vida > 0) then
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
    turno:= False;//Cambiamos la variable turno para que ataque al rival
    LogicaIA; //Ejecutamos el procedimiento para que la IA ataque
  end;
end;

procedure TForm2.Button14Click(Sender: TObject);

begin

    Form2.Show;
    Form2.BringToFront;

end;

//Codigo que se ejecuta cuando se abre la pestania de batalla
procedure TForm2.FormShow(Sender: TObject);
begin
  turno := True;
  button3.caption := equipoJugador[1].nombre;
  button4.caption := equipoJugador[2].nombre;
  button5.caption := equipoJugador[3].nombre;

  button6.caption := equipoJugador[1].ataques[1].nombre + ' ' + inttostr(equipoJugador[1].ataques[1].cantidad);
  button7.caption := equipoJugador[1].ataques[2].nombre + ' ' + inttostr(equipoJugador[1].ataques[2].cantidad);
  button8.caption := equipoJugador[1].ataques[3].nombre + ' ' + inttostr(equipoJugador[1].ataques[3].cantidad);

  posMonstruoJugador := 1;
  vidaJugador := equipoJugador[posMonstruoJugador].vida;
end;

//Procedure para la logica de la IA
procedure TForm2.LogicaIA;
var
  danoRandom:integer;//Variable para generar una posicion random del array danios
begin
  if turno = False then //False es el turno de la IA
  begin
    //If que chequea que al menos un monstruo tenga vida, sino gano el jugador usuario
    if (equipo2[1].vida > 0) or (equipo2[2].vida > 0) or (equipo2[3].vida > 0) then
      if equipo2[posMonstruoE2].vida > 0 then
      begin
        danoRandom := Random(3)+1;
        vidaJugador := vidaJugador - equipo2[posMonstruoE2].ataques[danoRandom].dano;
        equipoJugador[posMonstruoJugador].vida := vidaJugador;
        StringGrid1.Invalidate;
        turno := True;
      end
      else
      begin
        Randomize;
        //Bucle repeat para buscar la posicion random de un monstruo con vida
        repeat
          posMonstruoE2 := Random(3) + 1;
        until equipo2[posMonstruoE2].vida > 0;

        //No atacara porque utiliza su turno para cambiar de monstruo
        vidaE2:= equipo2[posMonstruoE2].vida;
        label1.caption := equipo2[posMonstruoE2].nombre;

        turno:=True;
      end
    else
      //Si todos los monstruos han sido derrotados, ganara el jugador usuario
      Label1.caption := 'Gano jugador 1';
  end;
  if (equipoJugador[1].vida <= 0) and (equipoJugador[2].vida <= 0) and (equipoJugador[3].vida <= 0) then
    Label1.caption := 'Gano jugador 2';
end;   

end.
 