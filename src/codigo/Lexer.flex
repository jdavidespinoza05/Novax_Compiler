package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    public String lexeme;
%}
%%
"main" |
"program" |
"var" |
"const" |
"int" |
"float" |
"bool" |
"string" |
"array" |
"function" |
"return" |
"if" |
"else" |
"while" |
"do" |
"for" |
"and" |
"or" |
"not" |
"print" |
"read" |
"break" |
"continue" |
"void" {lexeme=yytext(); return PALABRAS_RESERVADAS;}
"true" |
"false" {lexeme=yytext(); return LITERALES;}
"++" |
"+" |
"--" |
"-" |
"==" |
"=" |
">=" |
">" |
"<=" |
"<" |
"!=" |
"*" |
"/" |
"%" {lexeme=yytext(); return OPERADORES;}
"," |
";" |
"(" |
")" |
"[" |
"]" |
"{" |
"}" |
":" |
"." {lexeme=yytext(); return SEPARADORES;}
{L}({L}|{D})* {lexeme=yytext(); return IDENTIFICADORES;}

"[^\n]*" {lexeme=yytext(); return LITERALES_STRINGS;}
0[0-7]+                 {lexeme=yytext(); return LITERALES_OCTALES;}
0[xX][0-9a-fA-F]+       {lexeme=yytext(); return LITERALES_HEXADECIMALES;}
-?{D}+"."{D}+           {lexeme=yytext(); return LITERALES_FLOTANTES;}
-?{D}+                  {lexeme=yytext(); return LITERALES_NUMEROS;}


"//"[^\r\n]* {/*Ignorar linea*/}           
"/*" [^*] ~"*/" {/*Ignorar linea*/}   
"/*"([^*]|\*+[^*/])*\*+"/" {/*Ignorar bloque*/}

 . {return ERRORES;}

