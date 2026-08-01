unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls, jpeg;

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
        imagenes: string;
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
    Label1: TLabel;
    Image1: TImage;
    Image2: TImage;
    Label2: TLabel;
    Timer1: TTimer;
    Timer2: TTimer;
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
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    frameActualDanoUsuario: integer;
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

// la declaramos aca para poder usarla en otros units
function RUTAimg: string;

implementation

{$R *.dfm}

// nos devuelve la ruta de la carpeta donde estan las img de los personajes
function RUTAimg: string;
    begin
        Result := (ExtractFilePath(Application.ExeName) + 'imgPersonajes\');
    end;

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
    StringGrid1.Width := 500;
    StringGrid1.DefaultColWidth := StringGrid1.ClientWidth div StringGrid1.ColCount;
    StringGrid1.ScrollBars := ssNone;

    StringGrid2.FixedCols := 0;
    StringGrid2.FixedRows := 0;
    StringGrid2.RowCount := 1;
    StringGrid2.ColCount := 100;
    StringGrid2.Width := 500;
    StringGrid2.DefaultColWidth := StringGrid1.ClientWidth div StringGrid1.ColCount;
    StringGrid2.ScrollBars := ssNone;


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

    arrayDanos2[1] := ataque1;
    arrayDanos2[2] := ataque2;
    arrayDanos2[3] := ataque3;

    //Seteo de los monstruos genericos
    monstruo1.nombre := 'Capi';
    monstruo1.vida := 100;
    monstruo1.ataques := arrayDanos;
    monstruo1.desbloqueado := True;
    monstruo1.imagenes := RUTAimg + 'capi\';

    monstruo2.nombre := 'Gachin';
    monstruo2.vida := 100;
    monstruo2.ataques := arrayDanos;
    monstruo2.desbloqueado := True;
    monstruo2.imagenes := RUTAimg + 'gachin\';

    monstruo3.nombre := 'Helarila';
    monstruo3.vida := 100;
    monstruo3.ataques := arrayDanos;
    monstruo3.desbloqueado := True;
    monstruo3.imagenes := RUTAimg + 'helarila\';

    monstruo4.nombre := 'Tomatina';
    monstruo4.vida := 100;
    monstruo4.ataques := arrayDanos2;
    monstruo4.desbloqueado := True;
    monstruo4.imagenes := RUTAimg + 'tomatina\';

    monstruo5.nombre := 'Ungaunge';
    monstruo5.vida := 100;
    monstruo5.ataques := arrayDanos2;
    monstruo5.desbloqueado := True;
    monstruo5.imagenes := RUTAimg + 'ungaunge\';

    monstruo6.nombre := 'Guitella';
    monstruo6.vida := 100;
    monstruo6.ataques := arrayDanos2;
    monstruo6.desbloqueado := True;
    monstruo6.imagenes := RUTAimg + 'guitella\';

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
    //asignamos la vida del jugador 
    vidaJugador := equipoJugador[posMonstruoJugador].vida;

    vidaE2 := equipo2[posMonstruoE2].vida;

    //insertar la vida del enemigo


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

procedure ResetearCantidadDeAtaques();
    begin
        Form2.button6.caption := equipoJugador[posMonstruoJugador].ataques[1].nombre + ' ' + inttostr(equipoJugador[posMonstruoJugador].ataques[1].cantidad);
        Form2.button7.caption := equipoJugador[posMonstruoJugador].ataques[2].nombre + ' ' + inttostr(equipoJugador[posMonstruoJugador].ataques[2].cantidad);
        Form2.button8.caption := equipoJugador[posMonstruoJugador].ataques[3].nombre + ' ' + inttostr(equipoJugador[posMonstruoJugador].ataques[3].cantidad);
    end;

//BOTONES PARA CAMBIAR DE MONSTRUO JUGADOR

procedure CambiarMonstruo(PosMonstruo: integer);

    var
        nuevoMonstruo: monstruo;

    begin
        //extraemos los datos del monstruo
        posMonstruoJugador := PosMonstruo;
        nuevoMonstruo := equipoJugador[posMonstruoJugador];

        //asignamos su valor de vida
        vidaJugador := nuevoMonstruo.vida;

        //hacemos que se recarhge el stringgrid
        Form2.StringGrid1.Invalidate;

        //le asignamos la imagen correspondiente
        Form2.Image1.picture.LoadFromFile(nuevoMonstruo.imagenes + 'idle.jpg');

        // mostramos la cantidad actualizada de ataques que tiene el usuario
        ResetearCantidadDeAtaques();

        // el usuario ya uso su turno y le toca al enemigo
        turno:= False;

        Form2.LogicaIA; //Ejecutamos el procedimiento para que la IA ataque
    end;

procedure TForm2.Button3Click(Sender: TObject);
    begin
        if (turno) and (equipoJugador[1].vida > 0) then
            CambiarMonstruo(1);
    end;

procedure TForm2.Button4Click(Sender: TObject);
    begin
        if (turno) and (equipoJugador[2].vida > 0) then
            CambiarMonstruo(2);
    end;

procedure TForm2.Button5Click(Sender: TObject);
    begin
        if (turno) and (equipoJugador[3].vida > 0) then
        CambiarMonstruo(3);
    end;

//Botones para elegir el danio deseado JUGADOR

procedure hacerDano(posAtaque: integer);
    begin
        //Chequeamos que el ataque elegido siga teniendo usos
        if equipoJugador[posMonstruoJugador].ataques[posAtaque].cantidad > 0 then
            begin
                equipoJugador[posMonstruoJugador].ataques[posAtaque].cantidad := equipoJugador[posMonstruoJugador].ataques[posAtaque].cantidad - 1;

                if posAtaque = 1 then
                    Form2.button6.caption := equipoJugador[posMonstruoJugador].ataques[posAtaque].nombre + ' ' + inttostr(equipoJugador[posMonstruoJugador].ataques[posAtaque].cantidad)
                else if posAtaque = 2 then
                    Form2.button7.caption := equipoJugador[posMonstruoJugador].ataques[posAtaque].nombre + ' ' + inttostr(equipoJugador[posMonstruoJugador].ataques[posAtaque].cantidad)
                else
                    Form2.button8.caption := equipoJugador[posMonstruoJugador].ataques[posAtaque].nombre + ' ' + inttostr(equipoJugador[posMonstruoJugador].ataques[posAtaque].cantidad);

                danoJugador := equipoJugador[posMonstruoJugador].ataques[posAtaque].dano;
                vidaE2 := vidaE2 - danoJugador;
                if vidaE2 < 0 then //Definimos el limite minimo
                    vidaE2 := 0;
            end;
        equipo2[posMonstruoE2].vida := vidaE2;
        Form2.StringGrid2.Invalidate;
        turno:= False; //Cambiamos la variable turno para que ataque al rival
        Form2.LogicaIA; //Ejecutamos el procedimiento para que la IA ataque
    end;

procedure TForm2.Button6Click(Sender: TObject);
    begin
        if (turno) and (equipoJugador[posMonstruoJugador].vida > 0) then
        hacerDano(1);
    end;

procedure TForm2.Button7Click(Sender: TObject);
    begin
        if (turno) and (equipoJugador[posMonstruoJugador].vida > 0) then
        hacerDano(2);
    end;

procedure TForm2.Button8Click(Sender: TObject);
    begin
        if (turno) and (equipoJugador[posMonstruoJugador].vida > 0) then
            hacerDano(3);
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

        ResetearCantidadDeAtaques();

        posMonstruoJugador := 1;
        vidaJugador := equipoJugador[posMonstruoJugador].vida;

        //cargamos la imagen del primer integrante del equipo
        Image1.Picture.LoadFromFile(equipoJugador[posMonstruoJugador].imagenes + 'idle.jpg');
    end;


//Procedure para la logica de la IA
procedure TForm2.LogicaIA;
    begin
        Label2.caption := 'Es el turno de malosaurio';
        turno := False;
        Timer1.Enabled := True; // despues de 2 segundos vuelve a ser falso
    end;

procedure AnimacionDanoUsuario();
    begin
        Form2.frameActualDanoUsuario := 0;
        Form2.Timer2.Interval := 500; // 400 ms entre frames (se ejecuta la funcion timer en intervalos de 400)
        Form2.Timer2.Enabled := True; // activamos el ciclo de activacion de la funcion timer
        // ponemos la primer imagen de la animacion de dano asi el personaje cambia apenas le hacen dano
        Form2.Image1.Picture.LoadFromFile(equipoJugador[posMonstruoJugador].imagenes + 'dano.jpg');
    end;

procedure TForm2.Timer2Timer(Sender: TObject);

    var
        Ruta: string;
        personajeActual: monstruo;

    begin
        // definimos la ruta de la carpeta donde estan las fotos
        personajeActual := equipoJugador[posMonstruoJugador];
        Ruta := personajeActual.imagenes;

        // para cada intervalo se pone una foto distinta
        case frameActualDanoUsuario of
            0: Image1.Picture.LoadFromFile(Ruta + 'dano.jpg');
            1: Image1.Picture.LoadFromFile(Ruta + 'enojado.jpg');
        end;

        // por cada intervalo vamos sumando valor al frameActual (para representar el iteracion de los frames)
        frameActualDanoUsuario := frameActualDanoUsuario + 1;

        // una vez que llegamos al frame final de la animacion frenamos la animacion
        if frameActualDanoUsuario > 2 then
            begin
                Timer2.Enabled := False; // detenemos el ciclo de intervalos o como se diga
                Image1.Picture.LoadFromFile(Ruta + 'idle.jpg'); // volvemos al estado normal del personaje
            end;
    end;

//esta funcion se ejecuta una vez que haya pasado el tiempo predeterminado

procedure TForm2.Timer1Timer(Sender: TObject);

var
    danoRandom: integer; //Variable para generar una posicion random del array danios

begin
    if turno = False then //turno = False es el turno de la IA
        begin
            //If que chequea que al menos un monstruo tenga vida, sino gano el jugador usuario
            if (equipo2[1].vida > 0) or (equipo2[2].vida > 0) or (equipo2[3].vida > 0) then
                if equipo2[posMonstruoE2].vida > 0 then
                    begin
                        AnimacionDanoUsuario();
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

    Label2.Caption := 'Es tu turno';
    Timer1.Enabled := False;
end;

end.
