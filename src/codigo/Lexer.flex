package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
%line
L=[a-zA-Z]
D=[0-9]
espacio=[ \t\r]+
identChar=[[:letter:][:digit:]_]
simboloInvalido=[^[:letter:][:digit:]_ \t\r\n+\-*/%=<>!,;()\[\]{}:.\"]
%{
    public String lexeme;
    public int line;
%}
%%
"main" {lexeme=yytext(); line=yyline+1; return Main;}
"\n" {lexeme=yytext(); line=yyline+1; return Salto_Linea;}
"program" {lexeme=yytext(); line=yyline+1; return Program;}
"var" {lexeme=yytext(); line=yyline+1; return Var;}
"const" {lexeme=yytext(); line=yyline+1; return Const;}
"int" {lexeme=yytext(); line=yyline+1; return Int;}
"float" {lexeme=yytext(); line=yyline+1; return Float;}
"bool" {lexeme=yytext(); line=yyline+1; return Bool;}
"string" {lexeme=yytext(); line=yyline+1; return String;}
"array" {lexeme=yytext(); line=yyline+1; return Array;}
"function" {lexeme=yytext(); line=yyline+1; return Function;}
"return" {lexeme=yytext(); line=yyline+1; return Return;}
"if" {lexeme=yytext(); line=yyline+1; return If;}
"else" {lexeme=yytext(); line=yyline+1; return Else;}
"while" {lexeme=yytext(); line=yyline+1; return While;}
"do" {lexeme=yytext(); line=yyline+1; return Do;}
"for" {lexeme=yytext(); line=yyline+1; return For;}
"and" {lexeme=yytext(); line=yyline+1; return And;}
"or" {lexeme=yytext(); line=yyline+1; return Or;}
"not" {lexeme=yytext(); line=yyline+1; return Not;}
"print" {lexeme=yytext(); line=yyline+1; return Print;}
"read" {lexeme=yytext(); line=yyline+1; return Read;}
"break" {lexeme=yytext(); line=yyline+1; return Break;}
"continue" {lexeme=yytext(); line=yyline+1; return Continue;}
"void" {lexeme=yytext(); line=yyline+1; return Void;}
"true" {lexeme=yytext(); line=yyline+1; return True;}
"false" {lexeme=yytext(); line=yyline+1; return False;}

"++" {lexeme=yytext(); line=yyline+1; return Doble_Suma;}
"+" {lexeme=yytext(); line=yyline+1; return Suma;}
"--" {lexeme=yytext(); line=yyline+1; return Doble_Resta;}
"-" {lexeme=yytext(); line=yyline+1; return Resta;}
"==" {lexeme=yytext(); line=yyline+1; return Doble_Igual;}
"=" {lexeme=yytext(); line=yyline+1; return Igual;}
">=" {lexeme=yytext(); line=yyline+1; return Mayor_Igual;}
">" {lexeme=yytext(); line=yyline+1; return Mayor;}
"<=" {lexeme=yytext(); line=yyline+1; return Menor_Igual;}
"<" {lexeme=yytext(); line=yyline+1; return Menor;}
"!=" {lexeme=yytext(); line=yyline+1; return Diferente;}
"*" {lexeme=yytext(); line=yyline+1; return Multiplicacion;}
"/" {lexeme=yytext(); line=yyline+1; return Division;}
"%" {lexeme=yytext(); line=yyline+1; return Porcentaje;}
"," {lexeme=yytext(); line=yyline+1; return Coma;}
";" {lexeme=yytext(); line=yyline+1; return Punto_Coma;}
"(" {lexeme=yytext(); line=yyline+1; return Parentesis_A;}
")" {lexeme=yytext(); line=yyline+1; return Parentesis_B;}
"[" {lexeme=yytext(); line=yyline+1; return Parentesis_Cuadrado_A;}
"]" {lexeme=yytext(); line=yyline+1; return Parentesis_Cuadrado_B;}
"{" {lexeme=yytext(); line=yyline+1; return Corchete_A;}
"}" {lexeme=yytext(); line=yyline+1; return Corchete_B;}
":" {lexeme=yytext(); line=yyline+1; return Dos_Puntos;}
"." {lexeme=yytext(); line=yyline+1; return Punto;}
{L}({L}|{D})* {lexeme=yytext(); line=yyline+1; return IDENTIFICADORES;}

{espacio} {/* ignorar espacios */}

\"[^\"\r\n]*\"          {lexeme=yytext(); line=yyline+1; return LITERALES_STRINGS;}
\"[^\"\r\n]*            {lexeme=yytext(); line=yyline+1; return ERROR_STRING_SIN_CERRAR;}
0[0-7]+                 {lexeme=yytext(); line=yyline+1; return LITERALES_OCTALES;}
0[0-9]+                 {lexeme=yytext(); line=yyline+1; return ERROR_OCTAL;}
0[xX][0-9a-fA-F]+       {lexeme=yytext(); line=yyline+1; return LITERALES_HEXADECIMALES;}
0[xX]                   {lexeme=yytext(); line=yyline+1; return ERROR_HEXADECIMAL;}
{D}+"."{D}+             {lexeme=yytext(); line=yyline+1; return LITERALES_FLOTANTES;}
{D}+                    {lexeme=yytext(); line=yyline+1; return LITERALES_NUMEROS;}
{identChar}+            {lexeme=yytext(); line=yyline+1; return ERROR_IDENTIFICADOR;}


"//"[^\r\n]* {/*Ignorar linea*/}
"/*"([^*]|\*+[^*/])*\*+"/" {/*Ignorar bloque*/}
"/*"([^*]|\*+[^*/])*\**     {lexeme=yytext(); line=yyline+1; return ERROR_COMENTARIO_SIN_CERRAR;}

{simboloInvalido}+ {lexeme=yytext(); line=yyline+1; return ERRORES;}
 . {lexeme=yytext(); line=yyline+1; return ERRORES;}