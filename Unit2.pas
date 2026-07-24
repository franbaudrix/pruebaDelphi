unit Unit2;

interface

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

var

    vidaJ1: integer;
    danoJ1: integer;
    curacionJ1: integer;
    posMonstruoJ1: integer;

    vidaJ2: integer;
    danoJ2: integer;
    curacionJ2: integer;
    posMonstruoJ2: integer;

    //Creacion de monstruos genericos
    monstruo1: monstruoRegistro;
    monstruo2: monstruoRegistro;
    monstruo3: monstruoRegistro;

    //Creacion de los ataques (por ahora usaremos los mismos para todos)
    ataque1: ataqueRegistro;
    ataque2: ataqueRegistro;
    ataque3: ataqueRegistro;
    arrayDanos: arrayAtaques;

    equipo1: equipoArray;
    equipo2: equipoArray;

implementation

end.
