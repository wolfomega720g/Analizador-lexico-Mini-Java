package Jflextest;
import static Jflextest.Token.*;
%%
%class NewLexer
%type Token

L = [a-z]+
D = [0-9]+
white=[ \t\r\n]+

%{
	public String lexeme;
%}
%%



"if"    { return IF;}
"then"	{ return THEN;}
"else"	{ return ELSE;}
"for"	{ return FOR;}


{white} {/*Ignore*/}
"//" {/*Ignore*/}
"="	{return igual;}
"+"	{return suma;}
{L}	{lexeme =yytext(); return variable;}
{D} {lexeme=yytext(); return numero; }
[0-9]+.[0-9]+ {lexeme=yytext(); return decimal; }
[a-z]*[A-Z]*\+\+ {lexeme=yytext(); return incremento; }
[+-]?(\d+(\.\d*)?|\.\d+)([eE][+-]?\d+)? {lexeme=yytext(); return exponente; }

[a-z]+ ([0-9]+ | [a-z]+)* {lexeme=yytext(); return ID;}
"*"	{return multiplicacion;}
"-" {return resta;}
"/"	{return division;}
. {return ERROR;}