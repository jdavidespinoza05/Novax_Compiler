package codigo;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z]
D=[0-9]
espacio=[ \t\r\n]+
identChar=[[:letter:][:digit:]_]
simboloInvalido=[^[:letter:][:digit:]_ \t\r\n+\-*/%=<>!,;()\[\]{}:.\"]
%{
    private Symbol symbol(int type, Object value) {
        return new Symbol (type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type) {
        return new Symbol (type, yyline, yycolumn);
    }
    public int line;
%}
%%
"main" {return new Symbol(sym.Main, (int) yychar, yyline, yytext());}
"program" {return new Symbol(sym.Program, (int) yychar, yyline, yytext());}
"var" {return new Symbol(sym.Var, (int) yychar, yyline, yytext());}
"const" {return new Symbol(sym.Const, (int) yychar, yyline, yytext());}
"int" {return new Symbol(sym.Int, (int) yychar, yyline, yytext());}
"float" {return new Symbol(sym.Float, (int) yychar, yyline, yytext());}
"bool" {return new Symbol(sym.Bool, (int) yychar, yyline, yytext());}
"string" {return new Symbol(sym.String, (int) yychar, yyline, yytext());}
"array" {return new Symbol(sym.Array, (int) yychar, yyline, yytext());}
"function" {return new Symbol(sym.Function, (int) yychar, yyline, yytext());}
"return" {return new Symbol(sym.Return, (int) yychar, yyline, yytext());}
"if" {return new Symbol(sym.If, (int) yychar, yyline, yytext());}
"else" {return new Symbol(sym.Else, (int) yychar, yyline, yytext());}
"while" {return new Symbol(sym.While, (int) yychar, yyline, yytext());}
"do" {return new Symbol(sym.Do, (int) yychar, yyline, yytext());}
"for" {return new Symbol(sym.For, (int) yychar, yyline, yytext());}
"and" {return new Symbol(sym.And, (int) yychar, yyline, yytext());}
"or" {return new Symbol(sym.Or, (int) yychar, yyline, yytext());}
"not" {return new Symbol(sym.Not, (int) yychar, yyline, yytext());}
"print" {return new Symbol(sym.Print, (int) yychar, yyline, yytext());}
"read" {return new Symbol(sym.Read, (int) yychar, yyline, yytext());}
"break" {return new Symbol(sym.Break, (int) yychar, yyline, yytext());}
"continue" {return new Symbol(sym.Continue, (int) yychar, yyline, yytext());}
"void" {return new Symbol(sym.Void, (int) yychar, yyline, yytext());}
"true" {return new Symbol(sym.True, (int) yychar, yyline, yytext());}
"false" {return new Symbol(sym.False, (int) yychar, yyline, yytext());}
"++" {return new Symbol(sym.Doble_Suma, (int) yychar, yyline, yytext());}
"+" {return new Symbol(sym.Suma, (int) yychar, yyline, yytext());}
"--" {return new Symbol(sym.Doble_Resta, (int) yychar, yyline, yytext());}
"-" {return new Symbol(sym.Resta, (int) yychar, yyline, yytext());}
"==" {return new Symbol(sym.Doble_Igual, (int) yychar, yyline, yytext());}
"=" {return new Symbol(sym.Igual, (int) yychar, yyline, yytext());}
">=" {return new Symbol(sym.Mayor_Igual, (int) yychar, yyline, yytext());}
">" {return new Symbol(sym.Mayor, (int) yychar, yyline, yytext());}
"<=" {return new Symbol(sym.Menor_Igual, (int) yychar, yyline, yytext());}
"<" {return new Symbol(sym.Menor, (int) yychar, yyline, yytext());}
"!=" {return new Symbol(sym.Diferente, (int) yychar, yyline, yytext());}
"*" {return new Symbol(sym.Multiplicacion, (int) yychar, yyline, yytext());}
"/" {return new Symbol(sym.Division, (int) yychar, yyline, yytext());}
"%" {return new Symbol(sym.Porcentaje, (int) yychar, yyline, yytext());}
"," {return new Symbol(sym.Coma, (int) yychar, yyline, yytext());}
";" {return new Symbol(sym.Punto_Coma, (int) yychar, yyline, yytext());}
"(" {return new Symbol(sym.Parentesis_A, (int) yychar, yyline, yytext());}
")" {return new Symbol(sym.Parentesis_B, (int) yychar, yyline, yytext());}
"[" {return new Symbol(sym.ParentesisC_A, (int) yychar, yyline, yytext());}
"]" {return new Symbol(sym.ParentesisC_B, (int) yychar, yyline, yytext());}
"{" {return new Symbol(sym.Corchete_A, (int) yychar, yyline, yytext());}
"}" {return new Symbol(sym.Corchete_B, (int) yychar, yyline, yytext());}
":" {return new Symbol(sym.Dos_Puntos, (int) yychar, yyline, yytext());}
"." {return new Symbol(sym.Punto, (int) yychar, yyline, yytext());}

{L}({L}|{D})* {return new Symbol(sym.Identificador, (int) yychar, yyline, yytext());}

{espacio} {/* ignorar espacios */}

\"[^\"\r\n]*\"          {return new Symbol(sym.Literales_String, (int) yychar, yyline, yytext());}
\"[^\"\r\n]*            {return new Symbol(sym.Error_String_Sin_Cerrar, (int) yychar, yyline, yytext());}
0[0-7]+                 {return new Symbol(sym.Literales_Octales, (int) yychar, yyline, yytext());}
0[0-9]+                 {return new Symbol(sym.Error_Octal, (int) yychar, yyline, yytext());}
0[xX][0-9a-fA-F]+       {return new Symbol(sym.Literales_Hexadecimales, (int) yychar, yyline, yytext());}
0[xX]                   {return new Symbol(sym.Error_Hexadecimal, (int) yychar, yyline, yytext());}
{D}+"."{D}+             {return new Symbol(sym.Literales_Flotantes, (int) yychar, yyline, yytext());}
{D}+                    {return new Symbol(sym.Literales_Numeros, (int) yychar, yyline, yytext());}
{identChar}+            {return new Symbol(sym.Error_Identificador, (int) yychar, yyline, yytext());}


"//"[^\r\n]* {/*Ignorar linea*/}
"/*"([^*]|\*+[^*/])*\*+"/" {/*Ignorar bloque*/}
"/*"([^*]|\*+[^*/])*\**     {return new Symbol(sym.Error_Comentario_Sin_Cerrar, (int) yychar, yyline, yytext());}

{simboloInvalido}+ {return new Symbol(sym.Errores, (int) yychar, yyline, yytext());}
 . {return new Symbol(sym.Errores, (int) yychar, yyline, yytext());}

