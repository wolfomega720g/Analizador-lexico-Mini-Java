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
"while"	{ return WHILE;}
"do"	{ return DO;}
"break"	{ return BREAK;}

"("    { return OPENPARENTHESIS;}
")"    { return CLOSEPARENTHESIS;}
"{"    { return OPENKEY;}
"}"    { return CLOSEKEY;}
"["		{ return OPENBRACKET;}
"]"		{ return CLOSEBRACKET;}
";"		{ return SEMICOLON;}

"||"	{ return OR;}
"&&"	{ return AND;}
"=="	{ return EQUALS;}

">"		{ return GREATER;}
"<"		{ return LOWER;}
">="	{ return GREATER_EQUALS;}
"<="	{ return LOWER_EQUALS;}



{white} {/*Ignore*/}
"//" {/*Ignore*/}
"="	{return igual;}
"+"	{return suma;}
{L}	{lexeme =yytext(); return variable;}
{D} {lexeme=yytext(); return numero; }
[0-9]+.[0-9]+ {lexeme=yytext(); return decimal; }
s*\+\+s {lexeme=yytext(); return incremento; }
[+-]?(\d+(\.\d*)?|\.\d+)([eE][+-]?\d+)? {lexeme=yytext(); return exponente; }

[a-z]+ ([0-9]+ | [a-z]+)* {lexeme=yytext(); return ID;}
"*"	{return multiplicacion;}
"-" {return resta;}
"/"	{return division;}
. {return ERROR;}