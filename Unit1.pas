unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Unit2;

type

  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Edit2: TEdit;
    Button1: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
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
  private

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

    //Seteo de los monstruos genericos
    monstruo1.nombre := 'Kaki';
    monstruo1.vida := 50;
    monstruo1.ataques := arrayDanos;
    monstruo2.nombre := 'Enzo';
    monstruo2.vida := 70;
    monstruo2.ataques := arrayDanos;
    monstruo3.nombre := 'Jorel';
    monstruo3.vida := 100;
    monstruo3.ataques := arrayDanos;

    //Seteo de los equipos participantes
    equipo1[1] := monstruo1;
    equipo1[2] := monstruo2;
    equipo1[3] := monstruo3;

    equipo2[1] := monstruo1;
    equipo2[2] := monstruo2;
    equipo2[3] := monstruo3;

    //Configuracion titulos de botones (nombre de los monstruos)
    button3.caption := monstruo1.nombre;
    button4.caption := monstruo2.nombre;
    button5.caption := monstruo3.nombre;

    button1.caption := monstruo1.nombre;
    button9.caption := monstruo2.nombre;
    button10.caption := monstruo3.nombre;

    //Nombres de los ataques y su cantidad restante
    button6.caption := equipo1[1].ataques[1].nombre + ' ' + inttostr(equipo1[1].ataques[1].cantidad);
    button7.caption := equipo1[1].ataques[2].nombre + ' ' + inttostr(equipo1[1].ataques[2].cantidad);
    button8.caption := equipo1[1].ataques[3].nombre + ' ' + inttostr(equipo1[1].ataques[3].cantidad);

    button11.caption := equipo2[1].ataques[1].nombre + ' ' + inttostr(equipo2[1].ataques[1].cantidad);
    button12.caption := equipo2[1].ataques[2].nombre + ' ' + inttostr(equipo2[1].ataques[2].cantidad);
    button13.caption := equipo2[1].ataques[3].nombre + ' ' + inttostr(equipo2[1].ataques[3].cantidad);

    posMonstruoJ1 := 1;
    vidaJ1 := equipo1[posMonstruoJ1].vida;

    posMonstruoJ2 := 1;
    vidaJ2 := equipo2[posMonstruoJ2].vida;

end;

//Barra de vida del jugador 1
procedure TForm1.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);

var
    color_vida: TColor;

begin
    if vidaJ1 <= 5 then
        color_vida := Clred
    else if vidaJ1 <= 25 then
        color_vida := Clyellow
    else
        color_vida := Clgreen;

    if (Acol < vidaJ1) then
    begin
      StringGrid1.Canvas.Brush.Color := color_vida;
    end
    else
    begin
      StringGrid1.Canvas.Brush.Color := clWhite;
    end;

    StringGrid1.Canvas.FillRect(Rect);  
end;

//Barra de vida del jugador 2
procedure TForm1.StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);

var
    color_vida: TColor;

begin
    if vidaJ2 <= 5 then
        color_vida := Clred
    else if vidaJ2 <= 25 then
        color_vida := Clyellow
    else
        color_vida := Clgreen;

    if (Acol < vidaJ2) then
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
//procedure TForm1.Button2Click(Sender: TObject);
//begin
//    curacion := strtoint(Edit2.Text);
//    vida := vida + curacion;
//    if vida > StringGrid1.ColCount then //Definimos el limite maximo
//      vida:= StringGrid1.ColCount;
//
//    equipo1[posMonstruo].vida := vida;
//    StringGrid1.Invalidate;
//end;

//BOTONES PARA CAMBIAR DE MONSTRUO JUGADOR 1
procedure TForm1.Button3Click(Sender: TObject);
begin
  posMonstruoJ1 := 1;
  vidaJ1 := equipo1[posMonstruoJ1].vida;
  StringGrid1.Invalidate;

  button6.caption := equipo1[posMonstruoJ1].ataques[1].nombre + ' ' + inttostr(equipo1[posMonstruoJ1].ataques[1].cantidad);
  button7.caption := equipo1[posMonstruoJ1].ataques[2].nombre + ' ' + inttostr(equipo1[posMonstruoJ1].ataques[2].cantidad);
  button8.caption := equipo1[posMonstruoJ1].ataques[3].nombre + ' ' + inttostr(equipo1[posMonstruoJ1].ataques[3].cantidad);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  posMonstruoJ1 := 2;
  vidaJ1 := equipo1[posMonstruoJ1].vida;
  StringGrid1.Invalidate;

  button6.caption := equipo1[posMonstruoJ1].ataques[1].nombre + ' ' + inttostr(equipo1[posMonstruoJ1].ataques[1].cantidad);
  button7.caption := equipo1[posMonstruoJ1].ataques[2].nombre + ' ' + inttostr(equipo1[posMonstruoJ1].ataques[2].cantidad);
  button8.caption := equipo1[posMonstruoJ1].ataques[3].nombre + ' ' + inttostr(equipo1[posMonstruoJ1].ataques[3].cantidad);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  posMonstruoJ1 := 3;
  vidaJ1 := equipo1[posMonstruoJ1].vida;
  StringGrid1.Invalidate;

  button6.caption := equipo1[posMonstruoJ1].ataques[1].nombre + ' ' + inttostr(equipo1[posMonstruoJ1].ataques[1].cantidad);
  button7.caption := equipo1[posMonstruoJ1].ataques[2].nombre + ' ' + inttostr(equipo1[posMonstruoJ1].ataques[2].cantidad);
  button8.caption := equipo1[posMonstruoJ1].ataques[3].nombre + ' ' + inttostr(equipo1[posMonstruoJ1].ataques[3].cantidad);
end;

//Botones para elegir el danio deseado JUGADOR 1
procedure TForm1.Button6Click(Sender: TObject);
begin
  //Chequeamos que el ataque elegido siga teniendo usos
  if equipo1[posMonstruoJ1].ataques[1].cantidad > 0 then
  begin
    equipo1[posMonstruoJ1].ataques[1].cantidad := equipo1[posMonstruoJ1].ataques[1].cantidad - 1;
    button6.caption := equipo1[posMonstruoJ1].ataques[1].nombre + ' ' + inttostr(equipo1[posMonstruoJ1].ataques[1].cantidad);
    danoJ1 := equipo1[posMonstruoJ1].ataques[1].dano;
    vidaJ2 := vidaJ2 - danoJ1;
    if vidaJ2 < 0 then //Definimos el limite minimo
      vidaJ2 := 0;
  end;
    
  equipo2[posMonstruoJ2].vida := vidaJ2;
  StringGrid2.Invalidate;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  //Chequeamos que el ataque elegido siga teniendo usos
  if equipo1[posMonstruoJ1].ataques[2].cantidad > 0 then
  begin
    equipo1[posMonstruoJ1].ataques[2].cantidad := equipo1[posMonstruoJ1].ataques[2].cantidad - 1;
    button7.caption := equipo1[posMonstruoJ1].ataques[2].nombre + ' ' + inttostr(equipo1[posMonstruoJ1].ataques[2].cantidad);
    danoJ1 := equipo1[posMonstruoJ1].ataques[2].dano;
    vidaJ2 := vidaJ2 - danoJ1;
    if vidaJ2 < 0 then //Definimos el limite minimo
      vidaJ2 := 0;
  end;
    
  equipo2[posMonstruoJ2].vida := vidaJ2;
  StringGrid2.Invalidate;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  //Chequeamos que el ataque elegido siga teniendo usos
  if equipo1[posMonstruoJ1].ataques[3].cantidad > 0 then
  begin
    equipo1[posMonstruoJ1].ataques[3].cantidad := equipo1[posMonstruoJ1].ataques[3].cantidad - 1;
    button8.caption := equipo1[posMonstruoJ1].ataques[3].nombre + ' ' + inttostr(equipo1[posMonstruoJ1].ataques[3].cantidad);
    danoJ1 := equipo1[posMonstruoJ1].ataques[3].dano;
    vidaJ2 := vidaJ2 - danoJ1;
    if vidaJ2 < 0 then //Definimos el limite minimo
      vidaJ2 := 0;
  end;
    
  equipo2[posMonstruoJ2].vida := vidaJ2;
  StringGrid2.Invalidate;
end;

//BOTONES PARA CAMBIAR DE MONSTRUO JUGADOR 2
procedure TForm1.Button1Click(Sender: TObject);
begin
  posMonstruoJ2 := 1;
  vidaJ2 := equipo2[posMonstruoJ2].vida;
  StringGrid2.Invalidate;

  button11.caption := equipo1[posMonstruoJ2].ataques[1].nombre + ' ' + inttostr(equipo1[posMonstruoJ2].ataques[1].cantidad);
  button12.caption := equipo1[posMonstruoJ2].ataques[2].nombre + ' ' + inttostr(equipo1[posMonstruoJ2].ataques[2].cantidad);
  button13.caption := equipo1[posMonstruoJ2].ataques[3].nombre + ' ' + inttostr(equipo1[posMonstruoJ2].ataques[3].cantidad);
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  posMonstruoJ2 := 2;
  vidaJ2 := equipo2[posMonstruoJ2].vida;
  StringGrid2.Invalidate;

  button11.caption := equipo2[posMonstruoJ2].ataques[1].nombre + ' ' + inttostr(equipo2[posMonstruoJ2].ataques[1].cantidad);
  button12.caption := equipo2[posMonstruoJ2].ataques[2].nombre + ' ' + inttostr(equipo2[posMonstruoJ2].ataques[2].cantidad);
  button13.caption := equipo2[posMonstruoJ2].ataques[3].nombre + ' ' + inttostr(equipo2[posMonstruoJ2].ataques[3].cantidad);
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  posMonstruoJ2 := 3;
  vidaJ2 := equipo2[posMonstruoJ2].vida;
  StringGrid2.Invalidate;

  button11.caption := equipo2[posMonstruoJ2].ataques[1].nombre + ' ' + inttostr(equipo2[posMonstruoJ2].ataques[1].cantidad);
  button12.caption := equipo2[posMonstruoJ2].ataques[2].nombre + ' ' + inttostr(equipo2[posMonstruoJ2].ataques[2].cantidad);
  button13.caption := equipo2[posMonstruoJ2].ataques[3].nombre + ' ' + inttostr(equipo2[posMonstruoJ2].ataques[3].cantidad);
end;

//Botones para elegir el danio deseado JUGADOR 2
procedure TForm1.Button11Click(Sender: TObject);
begin
  //Chequeamos que el ataque elegido siga teniendo usos
  if equipo2[posMonstruoJ2].ataques[1].cantidad > 0 then
  begin
    equipo2[posMonstruoJ2].ataques[1].cantidad := equipo2[posMonstruoJ2].ataques[1].cantidad - 1;
    button11.caption := equipo2[posMonstruoJ2].ataques[1].nombre + ' ' + inttostr(equipo2[posMonstruoJ2].ataques[1].cantidad);
    danoJ2 := equipo2[posMonstruoJ2].ataques[1].dano;
    vidaJ1 := vidaJ1 - danoJ2;
    if vidaJ1 < 0 then //Definimos el limite minimo
      vidaJ1 := 0;
  end;
    
  equipo1[posMonstruoJ1].vida := vidaJ1;
  StringGrid1.Invalidate;
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  //Chequeamos que el ataque elegido siga teniendo usos
  if equipo2[posMonstruoJ2].ataques[2].cantidad > 0 then
  begin
    equipo2[posMonstruoJ2].ataques[2].cantidad := equipo2[posMonstruoJ2].ataques[2].cantidad - 1;
    button12.caption := equipo2[posMonstruoJ2].ataques[2].nombre + ' ' + inttostr(equipo2[posMonstruoJ2].ataques[2].cantidad);
    danoJ2 := equipo2[posMonstruoJ2].ataques[2].dano;
    vidaJ1 := vidaJ1 - danoJ2;
    if vidaJ1 < 0 then //Definimos el limite minimo
      vidaJ1 := 0;
  end;
    
  equipo1[posMonstruoJ1].vida := vidaJ1;
  StringGrid1.Invalidate;
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
  //Chequeamos que el ataque elegido siga teniendo usos
  if equipo2[posMonstruoJ2].ataques[3].cantidad > 0 then
  begin
    equipo2[posMonstruoJ2].ataques[3].cantidad := equipo2[posMonstruoJ2].ataques[3].cantidad - 1;
    button13.caption := equipo2[posMonstruoJ2].ataques[3].nombre + ' ' + inttostr(equipo2[posMonstruoJ2].ataques[3].cantidad);
    danoJ2 := equipo2[posMonstruoJ2].ataques[3].dano;
    vidaJ1 := vidaJ1 - danoJ2;
    if vidaJ1 < 0 then //Definimos el limite minimo
      vidaJ1 := 0;
  end;
    
  equipo1[posMonstruoJ1].vida := vidaJ1;
  StringGrid1.Invalidate;
end;

end.
