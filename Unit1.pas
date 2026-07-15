unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Edit1: TEdit;
    Button1: TButton;
    Edit2: TEdit;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }

    vida: integer;

    HizoDano: Boolean;
    dano: integer;
    pos_dano: integer;

    HizoCurar: Boolean;
    curacion: integer;
    pos_curacion: integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);

const
    N = 50;

begin
    StringGrid1.FixedCols := 0;
    StringGrid1.FixedRows := 0;
    StringGrid1.RowCount := 1;
    StringGrid1.ColCount := 50;
    StringGrid1.DefaultColWidth := 5;

    vida := StringGrid1.ColCount;
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

    // evitamos que la vida se salga del rango
    if vida < 0 then
        vida := 0
    else if vida > StringGrid1.ColCount then
        vida := StringGrid1.ColCount;

    if hizoDano and (Acol >= vida) then
        begin
            hizoDano := False;
            StringGrid1.Canvas.Brush.Color := clWhite;
        end
    else if hizoCurar and (Acol <= vida) then
        begin
            hizoCurar := False;
            StringGrid1.Canvas.Brush.Color := color_vida;
        end
    else if (Acol <= vida) then
        begin
            StringGrid1.Canvas.Brush.Color := color_vida;
        end
    else if (Acol >= vida) then
        begin
            StringGrid1.Canvas.Brush.Color := clWhite;
        end;
        
    StringGrid1.Canvas.FillRect(Rect);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
    HizoDano := True;
    dano := strtoint(Edit1.Text);
    vida := vida - dano;
    StringGrid1.Invalidate;
end;



procedure TForm1.Button2Click(Sender: TObject);
begin
    HizoCurar := True;
    curacion := strtoint(Edit2.Text);
    vida := vida + curacion;
    StringGrid1.Invalidate;
end;

end.
