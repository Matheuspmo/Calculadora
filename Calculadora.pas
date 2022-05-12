unit Calculadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, StrUtils;

type
  TForm1 = class(TForm)
    btn_0: TButton;
    btn_1: TButton;
    btn_2: TButton;
    btn_3: TButton;
    btn_4: TButton;
    btn_5: TButton;
    btn_6: TButton;
    btn_7: TButton;
    btn_8: TButton;
    btn_9: TButton;
    lb_tela1: TLabeledEdit;
    btn_adic: TButton;
    btn_sub: TButton;
    btn_mult: TButton;
    btn_div: TButton;
    lb_tela2: TLabeledEdit;
    btn_igual: TButton;
    btn_limpar: TButton;
    btn_virgula: TButton;
    btn_invertersinal: TButton;
    btn_limparentrada: TButton;
    btn_apagardigito: TButton;
    procedure btn_0Click(Sender: TObject);
    procedure btn_1Click(Sender: TObject);
    procedure btn_2Click(Sender: TObject);
    procedure btn_3Click(Sender: TObject);
    procedure btn_4Click(Sender: TObject);
    procedure btn_5Click(Sender: TObject);
    procedure btn_6Click(Sender: TObject);
    procedure btn_7Click(Sender: TObject);
    procedure btn_8Click(Sender: TObject);
    procedure btn_9Click(Sender: TObject);
    procedure btn_adicClick(Sender: TObject);
    procedure btn_subClick(Sender: TObject);
    procedure btn_divClick(Sender: TObject);
    procedure btn_multClick(Sender: TObject);
    procedure btn_igualClick(Sender: TObject);
    procedure btn_limparClick(Sender: TObject);
    procedure btn_virgulaClick(Sender: TObject);
    procedure btn_invertersinalClick(Sender: TObject);
    procedure btn_limparentradaClick(Sender: TObject);
    procedure btn_apagardigitoClick(Sender: TObject);
  private
    { Private declarations }
    valor, valor1, valor2 : double;
    botao, tela1, tela2, operador, sinal : string;
    aux, divPorZero : boolean;
    procedure BotaoNumero(botao: string; valor : double);
    procedure BotaoOperador(operador: string);
    procedure AtivarDesativarOperador;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.AtivarDesativarOperador;
begin
  if divPorZero = True then
  begin
    btn_adic.Enabled := False;
    btn_sub.Enabled := False;
    btn_mult.Enabled := False;
    btn_div.Enabled := False;
    btn_virgula.Enabled := False;
    btn_invertersinal.Enabled := False;
    divPorZero := False;
  end
  else
  begin
    btn_adic.Enabled := True;
    btn_sub.Enabled := True;
    btn_mult.Enabled := True;
    btn_div.Enabled := True;
    btn_virgula.Enabled := True;
    btn_invertersinal.Enabled := True;
  end;

end;

procedure TForm1.BotaoNumero(botao: string; valor : double);
begin

  AtivarDesativarOperador;

  if botao = ',' then
    if ContainsText(lb_tela1.text, ',') then
    begin
      botao := '';
      tela1 := '';
    end
    else
    begin
        lb_tela1.text := lb_tela1.text + botao;
        tela1 := '';
    end
  else
  begin
    valor := StrToFloat(botao);
    tela1 := valor.ToString;
  end;

  if (lb_tela1.text = '0') or (aux = true) then
  begin
    if (tela1 = '') and (ContainsText(lb_tela2.text, valor1.ToString)) then
    begin
      tela1 := '0,';
      lb_tela1.text := tela1;
    end
    else
    begin
      lb_tela1.text := tela1;
    end;
    aux := false;
  end
  else lb_tela1.text := lb_tela1.text + tela1;
end;

procedure TForm1.BotaoOperador(operador: string);
begin
  operador := sinal;
  aux := true;

  if valor1 = 0 then
    valor1 := StrToFloat(lb_tela1.text)
  else if ContainsText(lb_tela2.text, '=') then
    valor2 := valor2
  else valor2 := StrToFloat(lb_tela1.text);

  if operador = ' = ' then
  begin
    if (ContainsText(lb_tela2.text, '+')) or (ContainsText(lb_tela2.text, '-')) or (ContainsText(lb_tela2.text, 'x')) or (ContainsText(lb_tela2.text, '÷')) then
    begin
      if ContainsText(lb_tela2.text, '=') then
        lb_tela2.text := tela2
      else
      begin
        tela2 := tela2 + lb_tela1.text + sinal;
        lb_tela2.text := tela2;
      end;
      if ContainsText(lb_tela2.text, ' + ') then
        valor1 := valor1 + valor2
      else if ContainsText(lb_tela2.text, ' - ') then
        valor1 := valor1 - valor2
      else if ContainsText(lb_tela2.text, ' ÷ ') then
      begin
        if valor2 = 0 then
        begin
          divPorZero := True;
          lb_tela1.Font.Size := 16;
          lb_tela1.text := 'Não é possível dividir por zero';
          lb_tela2.text := tela2;
          AtivarDesativarOperador;
          abort;
        end
        else
          valor1 := valor1 / valor2;
      end
      else valor1 := valor1 * valor2;

      if ContainsText(lb_tela2.text, ' + ') then
        tela2 := valor1.ToString + ' + ' + valor2.ToString + ' = '
      else if ContainsText(lb_tela2.text, ' - ') then
        tela2 := valor1.ToString + ' - ' + valor2.ToString + ' = '
      else if ContainsText(lb_tela2.text, ' ÷ ') then
        tela2 := valor1.ToString + ' ÷ ' + valor2.ToString + ' = '
      else tela2 := valor1.ToString + ' x ' + valor2.ToString + ' = ';
    end
    else
    begin
      tela2 := tela2 + lb_tela1.text + sinal;
      lb_tela2.text := tela2;
      lb_tela1.text := valor1.ToString;
      tela2 := '';
      sinal := '';
    end;
    lb_tela1.text := valor1.ToString;
  end
  else
  begin
    if ContainsText(lb_tela1.text, ',') then
      begin
        lb_tela1.text := valor1.ToString;
        tela2 := lb_tela1.text + operador;
        lb_tela2.text := tela2;
      end;
    if ContainsText(lb_tela2.text, valor1.ToString) then
    begin
      if (ContainsText(lb_tela2.text, '÷')) and (valor2 = 0) then
      begin
        divPorZero := True;
        lb_tela1.Font.Size := 16;
        lb_tela1.text := 'Não é possível dividir por zero';
        tela2 := tela2 + tela1 + sinal;
        lb_tela2.text := tela2;
        AtivarDesativarOperador;
        abort;
      end;

      if (ContainsText(tela2, valor1.ToString)) and (aux = false) then
      begin
        if ContainsText(lb_tela2.text, ' + ') then
          valor1 := valor1 + valor2
        else if ContainsText(lb_tela2.text, ' - ') then
          valor1 := valor1 - valor2
        else if ContainsText(lb_tela2.text, ' ÷ ') then
          begin
            if valor2 = 0 then
            begin
              divPorZero := True;
              lb_tela1.Font.Size := 16;
              lb_tela1.text := 'Não é possível dividir por zero';
            end
          else
            valor1 := valor1 / valor2;
        end
        else valor1 := valor1 * valor2;

        lb_tela1.text := valor1.ToString;
        tela2 := valor1.ToString + sinal;
      end
      else tela2 := lb_tela1.text + operador;
    end
    else tela2 := lb_tela1.text + operador;

    lb_tela2.text := tela2;
  end;
end;

procedure TForm1.btn_0Click(Sender: TObject);
begin
  botao := '0';
  BotaoNumero(botao, valor);
end;

procedure TForm1.btn_1Click(Sender: TObject);
begin
  botao := '1';
  BotaoNumero(botao, valor);
end;

procedure TForm1.btn_2Click(Sender: TObject);
begin
  botao := '2';
  BotaoNumero(botao, valor);
end;

procedure TForm1.btn_3Click(Sender: TObject);
begin
  botao := '3';
  BotaoNumero(botao, valor);
end;

procedure TForm1.btn_4Click(Sender: TObject);
begin
  botao := '4';
  BotaoNumero(botao, valor);
end;

procedure TForm1.btn_5Click(Sender: TObject);
begin
  botao := '5';
  BotaoNumero(botao, valor);
end;

procedure TForm1.btn_6Click(Sender: TObject);
begin
  botao := '6';
  BotaoNumero(botao, valor);
end;

procedure TForm1.btn_7Click(Sender: TObject);
begin
  botao := '7';
  BotaoNumero(botao, valor);
end;

procedure TForm1.btn_8Click(Sender: TObject);
begin
  botao := '8';
  BotaoNumero(botao, valor);
end;

procedure TForm1.btn_9Click(Sender: TObject);
begin
  botao := '9';
  BotaoNumero(botao, valor);
end;

procedure TForm1.btn_adicClick(Sender: TObject);
begin
  sinal := ' + ';
  BotaoOperador(operador);
end;

procedure TForm1.btn_apagardigitoClick(Sender: TObject);
begin
  if lb_tela1.text = 'Não é possível dividir por zero'  then
  begin
    tela1 := '0';
    tela2 := '';
    lb_tela1.text := tela1;
    lb_tela2.text := tela2;
    valor1 := 0;
    valor2 := 0;
    AtivarDesativarOperador;
  end
  else
  begin
    lb_tela1.text := Copy(lb_tela1.text, 0, Length(lb_tela1.text) - 1);
    if lb_tela1.text = '' then
      lb_tela1.text := '0';
  end;
  lb_tela1.Font.Size := 30;
end;

procedure TForm1.btn_invertersinalClick(Sender: TObject);
begin
  lb_tela1.text := FloatToStr(StrToFloat(lb_tela1.text) * -1);
end;

procedure TForm1.btn_divClick(Sender: TObject);
begin
  sinal := ' ÷ ';
  BotaoOperador(operador);
end;

procedure TForm1.btn_igualClick(Sender: TObject);
begin
  sinal := ' = ';
  BotaoOperador(operador);
end;

procedure TForm1.btn_limparClick(Sender: TObject);
begin
  tela1 := '0';
  tela2 := '';
  lb_tela1.text := tela1;
  lb_tela2.text := tela2;
  valor1 := 0;
  valor2 := 0;
  AtivarDesativarOperador;
  lb_tela1.Font.Size := 30;
end;

procedure TForm1.btn_limparentradaClick(Sender: TObject);
begin
  if lb_tela1.text = 'Não é possível dividir por zero'  then
  begin
    tela1 := '0';
    tela2 := '';
    lb_tela1.text := tela1;
    lb_tela2.text := tela2;
    valor1 := 0;
    valor2 := 0;
    AtivarDesativarOperador;
  end
  else
  begin
    tela1 := '0';
    lb_tela1.text := tela1;
  end;
  lb_tela1.Font.Size := 30;
end;

procedure TForm1.btn_multClick(Sender: TObject);
begin
  sinal := ' x ';
  BotaoOperador(operador);
end;

procedure TForm1.btn_subClick(Sender: TObject);
begin
  sinal := ' - ';
  BotaoOperador(operador);
end;

procedure TForm1.btn_virgulaClick(Sender: TObject);
begin
  botao := ',';
  BotaoNumero(botao, valor);
end;

end.
