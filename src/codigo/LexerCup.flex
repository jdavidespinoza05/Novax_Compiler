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
"main" {return new Symbol(sym.Main, yychar, yyline, yytext());}
"program" {return new Symbol(sym.Program, yychar, yyline, yytext());}
"var" {return new Symbol(sym.Var, yychar, yyline, yytext());}
"const" {return new Symbol(sym.Const, yychar, yyline, yytext());}
"int" {return new Symbol(sym.Int, yychar, yyline, yytext());}
"float" {return new Symbol(sym.Float, yychar, yyline, yytext());}
"bool" {return new Symbol(sym.Bool, yychar, yyline, yytext());}
"string" {return new Symbol(sym.String, yychar, yyline, yytext());}
"array" {return new Symbol(sym.Array, yychar, yyline, yytext());}
"function" {return new Symbol(sym.Function, yychar, yyline, yytext());}
"return" {return new Symbol(sym.Return, yychar, yyline, yytext());}
"if" {return new Symbol(sym.If, yychar, yyline, yytext());}
"else" {return new Symbol(sym.Else, yychar, yyline, yytext());}
"while" {return new Symbol(sym.While, yychar, yyline, yytext());}
"do" {return new Symbol(sym.Do, yychar, yyline, yytext());}
"for" {return new Symbol(sym.For, yychar, yyline, yytext());}
"and" {return new Symbol(sym.And, yychar, yyline, yytext());}
"or" {return new Symbol(sym.Or, yychar, yyline, yytext());}
"not" {return new Symbol(sym.Not, yychar, yyline, yytext());}
"print" {return new Symbol(sym.Print, yychar, yyline, yytext());}
"read" {return new Symbol(sym.Read, yychar, yyline, yytext());}
"break" {return new Symbol(sym.Break, yychar, yyline, yytext());}
"continue" {return new Symbol(sym.Continue, yychar, yyline, yytext());}
"void" {return new Symbol(sym.Void, yychar, yyline, yytext());}
"true" {return new Symbol(sym.True, yychar, yyline, yytext());}
"false" {return new Symbol(sym.False, yychar, yyline, yytext());}
"++" {return new Symbol(sym.Doble_Suma, yychar, yyline, yytext());}
"+" {return new Symbol(sym.Suma, yychar, yyline, yytext());}
"--" {return new Symbol(sym.Doble_Resta, yychar, yyline, yytext());}
"-" {return new Symbol(sym.Resta, yychar, yyline, yytext());}
"==" {return new Symbol(sym.Doble_Igual, yychar, yyline, yytext());}
"=" {return new Symbol(sym.Igual, yychar, yyline, yytext());}
">=" {return new Symbol(sym.Mayor_Igual, yychar, yyline, yytext());}
">" {return new Symbol(sym.Mayor, yychar, yyline, yytext());}
"<=" {return new Symbol(sym.Menor_Igual, yychar, yyline, yytext());}
"<" {return new Symbol(sym.Menor, yychar, yyline, yytext());}
"!=" {return new Symbol(sym.Diferente, yychar, yyline, yytext());}
"*" {return new Symbol(sym.Multiplicacion, yychar, yyline, yytext());}
"/" {return new Symbol(sym.Division, yychar, yyline, yytext());}
"%" {return new Symbol(sym.Porcentaje, yychar, yyline, yytext());}
"," {return new Symbol(sym.Coma, yychar, yyline, yytext());}
";" {return new Symbol(sym.Punto_Coma, yychar, yyline, yytext());}
"(" {return new Symbol(sym.Parentesis_A, yychar, yyline, yytext());}
")" {return new Symbol(sym.Parentesis_B, yychar, yyline, yytext());}
"[" {return new Symbol(sym.ParentesisC_A, yychar, yyline, yytext());}
"]" {return new Symbol(sym.ParentesisC_B, yychar, yyline, yytext());}
"{" {return new Symbol(sym.Corchete_A, yychar, yyline, yytext());}
"}" {return new Symbol(sym.Corchete_B, yychar, yyline, yytext());}
":" {return new Symbol(sym.Dos_Puntos, yychar, yyline, yytext());}
"." {return new Symbol(sym.Punto, yychar, yyline, yytext());}

{L}({L}|{D})* {return new Symbol(sym.Identificador, yychar, yyline, yytext());}

{espacio} {/* ignorar espacios */}

\"[^\"\r\n]*\"          {return new Symbol(sym.Literales_String, yychar, yyline, yytext());}
\"[^\"\r\n]*            {return new Symbol(sym.Error_String_Sin_Cerrar, yychar, yyline, yytext());}
0[0-7]+                 {return new Symbol(sym.Literales_Octales, yychar, yyline, yytext());}
0[0-9]+                 {return new Symbol(sym.Error_Octal, yychar, yyline, yytext());}
0[xX][0-9a-fA-F]+       {return new Symbol(sym.Literales_Hexadecimales, yychar, yyline, yytext());}
0[xX]                   {return new Symbol(sym.Error_Hexadecimal, yychar, yyline, yytext());}
{D}+"."{D}+             {return new Symbol(sym.Literales_Flotantes, yychar, yyline, yytext());}
{D}+                    {return new Symbol(sym.Literales_Numeros, yychar, yyline, yytext());}
{identChar}+            {return new Symbol(sym.Error_Identificador, yychar, yyline, yytext());}


"//"[^\r\n]* {/*Ignorar linea*/}
"/*"([^*]|\*+[^*/])*\*+"/" {/*Ignorar bloque*/}
"/*"([^*]|\*+[^*/])*\**     {return new Symbol(sym.Error_Comentario_Sin_Cerrar, yychar, yyline, yytext());}

{simboloInvalido}+ {return new Symbol(sym.Errores, yychar, yyline, yytext());}
 . {return new Symbol(sym.Errores, yychar, yyline, yytext());}

