%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);
int yylex(void);

typedef struct var {
    char *name;
    int value;
    struct var *next;
} var_t;

var_t *var_list = NULL;

int get_var_value(const char *name);
void set_var_value(const char *name, int value);
%}

%union {
    int num;
    char *str;
}

%token <str> ID
%token <num> NUMBER
%token <str> STRING_LITERAL
%token RAKHO DEKHAO BOL JODI NOILE
%token EQ NE GE LE

%type <num> expr
%type <str> string

%left '+' '-'
%left '*' '/'
%nonassoc LOWER_THAN_ELSE
%nonassoc ELSE
%nonassoc '>' '<' EQ NE GE LE

%%

program:
    statement_list
    ;

statement_list:
    statement
    | statement_list statement
    ;

statement:
    matched_statement
    | unmatched_statement
    ;

matched_statement:
      RAKHO ID '=' expr ';'          { set_var_value($2, $4); }
    | DEKHAO ID ';'                  { printf("%s = %d\n", $2, get_var_value($2)); }
    | BOL string ';'                 { printf("%s\n", $2); }
    | BOL expr ';'                   { printf("%d\n", $2); }
    | JODI '(' expr ')' matched_statement NOILE matched_statement
      {
        if ($3) {
            printf("(Condition true) ");
        } else {
            
            printf("(Condition false) ");
        }
      }
    ;

unmatched_statement:
      JODI '(' expr ')' statement %prec LOWER_THAN_ELSE
      {
        if ($3) {
            printf("(Condition true) ");
        }
      }
    | JODI '(' expr ')' matched_statement NOILE unmatched_statement
      {
        if ($3) {
            printf("(Condition true) ");
        } else {
            printf("(Condition false) ");
        }
      }
    ;

string:
      STRING_LITERAL                 { $$ = $1; }
    ;

expr:
      NUMBER                         { $$ = $1; }
    | ID                             { $$ = get_var_value($1); }
    | expr '+' expr                  { $$ = $1 + $3; }
    | expr '-' expr                  { $$ = $1 - $3; }
    | expr '*' expr                  { $$ = $1 * $3; }
    | expr '/' expr                  { 
        if ($3 != 0) $$ = $1 / $3;
        else { yyerror("Division by zero"); $$ = 0; }
      }
    | '(' expr ')'                   { $$ = $2; }
    | expr '>' expr                  { $$ = $1 > $3; }
    | expr '<' expr                  { $$ = $1 < $3; }
    | expr EQ expr                   { $$ = $1 == $3; }
    | expr NE expr                   { $$ = $1 != $3; }
    | expr GE expr                   { $$ = $1 >= $3; }
    | expr LE expr                   { $$ = $1 <= $3; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int get_var_value(const char *name) {
    var_t *curr = var_list;
    while(curr) {
        if(strcmp(curr->name, name) == 0)
            return curr->value;
        curr = curr->next;
    }
    fprintf(stderr, "Undefined variable '%s', returning 0\n", name);
    return 0;
}

void set_var_value(const char *name, int value) {
    var_t *curr = var_list;
    while(curr) {
        if(strcmp(curr->name, name) == 0) {
            curr->value = value;
            return;
        }
        curr = curr->next;
    }
    var_t *new_var = malloc(sizeof(var_t));
    new_var->name = strdup(name);
    new_var->value = value;
    new_var->next = var_list;
    var_list = new_var;
}

int main() {
    printf(" _______________________________\n"
       "|                               |\n"
       "|            KOTHA              |\n"
       "|     A Bangla Interpreter      |\n"
       "|_______________________________|\n");

    yyparse();
    return 0;
}