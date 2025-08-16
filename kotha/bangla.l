%{
#include "bangla.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);
%}

%%

"rakho"      { return RAKHO; }
"dekhao"     { return DEKHAO; }
"bolo"       { return BOL; }    
"jodi"       { return JODI; }
"noile"      { return NOILE; }

"+"    { return '+'; }
"-"    { return '-'; }
"*"    { return '*'; }
"/"    { return '/'; }
"="    { return '='; }
";"    { return ';'; }
"("    { return '('; }
")"    { return ')'; }
">"    { return '>'; }
"<"    { return '<'; }
"=="   { return EQ; }
"!="   { return NE; }
">="   { return GE; }
"<="   { return LE; }

[a-zA-Z_][a-zA-Z0-9_]* { yylval.str = strdup(yytext); return ID; }
[0-9]+       { yylval.num = atoi(yytext); return NUMBER; }
\"([^"]*)\"  { 
    yylval.str = strdup(yytext+1); 
    yylval.str[strlen(yylval.str)-1] = 0; 
    return STRING_LITERAL; 
}

[ \t\r\n]+   { /* skip whitespace */ }
.            { yyerror("Unknown character"); }

%%

int yywrap() { return 1; }