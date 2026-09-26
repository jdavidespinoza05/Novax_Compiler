package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
%line
L=[a-zA-Z]+
D=[0-9]+
espacio=[ \t\r\n]+
%{
    public String lexeme;
    public int line;
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
"void" |
"true" |
"false" {lexeme=yytext(); line=yyline+1; return PALABRAS_RESERVADAS;}
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
"%" {lexeme=yytext(); line=yyline+1; return OPERADORES;}
"," |
";" |
"(" |
")" |
"[" |
"]" |
"{" |
"}" |
":" |
"." {lexeme=yytext(); line=yyline+1; return SEPARADORES;}
{L}({L}|{D})* {lexeme=yytext(); line=yyline+1; return IDENTIFICADORES;}

{espacio} {/* ignorar línea */}

\"[^\"\n]*\"            {lexeme=yytext(); line=yyline+1; return LITERALES_STRINGS;}
\"[^\"\n]*              {lexeme=yytext(); line=yyline+1; return ERRORES;}
0[0-7]+                 {lexeme=yytext(); line=yyline+1; return LITERALES_OCTALES;}
0[0-9]+                 {lexeme=yytext(); line=yyline+1; return ERRORES;}
0[xX][0-9a-fA-F]+       {lexeme=yytext(); line=yyline+1; return LITERALES_HEXADECIMALES;}
0[xX]                   {lexeme=yytext(); line=yyline+1; return ERRORES;}
{D}+"."{D}+             {lexeme=yytext(); line=yyline+1; return LITERALES_FLOTANTES;}
{D}+                    {lexeme=yytext(); line=yyline+1; return LITERALES_NUMEROS;}
{D}+{L}({L}|{D})*       {lexeme=yytext(); line=yyline+1; return ERRORES;}


"//"[^\r\n]* {/*Ignorar linea*/}           
"/*"([^*]|\*+[^*/])*\*+"/" {/*Ignorar bloque*/}
"/*"([^*]|\*+[^*/])*        {lexeme=yytext(); line=yyline+1; return ERRORES;}

 . {lexeme=yytext(); line=yyline+1; return ERRORES;}