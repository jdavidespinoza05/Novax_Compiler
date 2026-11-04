package codigo;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%column
L=[a-zA-Z]
D=[0-9]
espacio=[ \t\r\n]+
identChar=[[:letter:][:digit:]_]
simboloInvalido=[^[:letter:][:digit:]_ \t\r\n+\-*/%=<>!,;()\[\]{}:.\"]
%{
    public java.util.List<String> erroresLexicos = new java.util.ArrayList<>();

    private Symbol symbol(int tipo) {
        return new Symbol(tipo, yyline + 1, yycolumn + 1, yytext());
    }

    private void error(String mensaje) {
        erroresLexicos.add("Linea " + (yyline + 1) + ": " + mensaje);
    }

    private String recorte() {
        String texto = yytext().replace("\r", "").replace("\n", " ");
        return texto.length() > 40 ? texto.substring(0, 40) + "..." : texto;
    }
%}
%%
"main" {return symbol(sym.Main);}
"program" {return symbol(sym.Program);}
"var" {return symbol(sym.Var);}
"const" {return symbol(sym.Const);}
"int" {return symbol(sym.Int);}
"float" {return symbol(sym.Float);}
"bool" {return symbol(sym.Bool);}
"string" {return symbol(sym.String);}
"array" {return symbol(sym.Array);}
"function" {return symbol(sym.Function);}
"return" {return symbol(sym.Return);}
"if" {return symbol(sym.If);}
"else" {return symbol(sym.Else);}
"while" {return symbol(sym.While);}
"do" {return symbol(sym.Do);}
"for" {return symbol(sym.For);}
"and" {return symbol(sym.And);}
"or" {return symbol(sym.Or);}
"not" {return symbol(sym.Not);}
"print" {return symbol(sym.Print);}
"read" {return symbol(sym.Read);}
"break" {return symbol(sym.Break);}
"continue" {return symbol(sym.Continue);}
"void" {return symbol(sym.Void);}
"true" {return symbol(sym.True);}
"false" {return symbol(sym.False);}
"++" {return symbol(sym.Doble_Suma);}
"+" {return symbol(sym.Suma);}
"--" {return symbol(sym.Doble_Resta);}
"-" {return symbol(sym.Resta);}
"==" {return symbol(sym.Doble_Igual);}
"=" {return symbol(sym.Igual);}
">=" {return symbol(sym.Mayor_Igual);}
">" {return symbol(sym.Mayor);}
"<=" {return symbol(sym.Menor_Igual);}
"<" {return symbol(sym.Menor);}
"!=" {return symbol(sym.Diferente);}
"*" {return symbol(sym.Multiplicacion);}
"/" {return symbol(sym.Division);}
"%" {return symbol(sym.Porcentaje);}
"," {return symbol(sym.Coma);}
";" {return symbol(sym.Punto_Coma);}
"(" {return symbol(sym.Parentesis_A);}
")" {return symbol(sym.Parentesis_B);}
"[" {return symbol(sym.ParentesisC_A);}
"]" {return symbol(sym.ParentesisC_B);}
"{" {return symbol(sym.Corchete_A);}
"}" {return symbol(sym.Corchete_B);}
":" {return symbol(sym.Dos_Puntos);}
"." {return symbol(sym.Punto);}

{L}({L}|{D})* {return symbol(sym.Identificador);}

{espacio} {/* ignorar espacios */}

\"[^\"\r\n]*\"          {return symbol(sym.Literales_String);}
\"[^\"\r\n;)]*          {error("cadena sin cerrar " + recorte() + " (falta la comilla final)"); return symbol(sym.Literales_String);}
0[0-7]+                 {return symbol(sym.Literales_Octales);}
0[0-9]+                 {error("octal invalido \"" + recorte() + "\" (solo se permiten digitos 0-7)"); return symbol(sym.Literales_Octales);}
0[xX][0-9a-fA-F]+       {return symbol(sym.Literales_Hexadecimales);}
0[xX]                   {error("hexadecimal incompleto \"" + recorte() + "\" (falta al menos un digito 0-9 A-F)"); return symbol(sym.Literales_Hexadecimales);}
{D}+"."{D}+             {return symbol(sym.Literales_Flotantes);}
{D}+"."                 {error("flotante incompleto \"" + recorte() + "\" (debe tener al menos un digito antes y despues del punto)"); return symbol(sym.Literales_Flotantes);}
"."{D}+                 {error("flotante incompleto \"" + recorte() + "\" (debe tener al menos un digito antes y despues del punto)"); return symbol(sym.Literales_Flotantes);}
{D}+                    {return symbol(sym.Literales_Numeros);}
{identChar}+            {error("identificador mal formado \"" + recorte() + "\" (debe iniciar con letra y contener solo letras y digitos)"); return symbol(sym.Identificador);}


"//"[^\r\n]* {/*Ignorar linea*/}
"/*"([^*]|\*+[^*/])*\*+"/" {/*Ignorar bloque*/}
"/*"([^*]|\*+[^*/])*\**     {error("comentario de bloque sin cerrar (falta */)");}

{simboloInvalido}+ {error("simbolo no reconocido \"" + recorte() + "\"");}
 . {error("simbolo no reconocido \"" + recorte() + "\"");}

