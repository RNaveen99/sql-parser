// UPDATE table_reference SET assignment_list [WHERE where_condition] [ORDER BY ...] [LIMIT row_count]
// assignment_list: assignment [, assignment] ...
// assignment: col_name = value
// value: {expr | DEFAULT}

// UPDATE table_name SET column1 = value1, column2 = value2, ... WHERE condition;

%{
    #include<stdio.h>
    #include<stdlib.h>
    int yyerror(char const *s) {
        printf("%s\n", s);
        return 1;
    }
    int yylex();
%}

%token UPDATE  SET  WHERE ORDER BY ASC DESC LIMIT AND OR DEFAULT BETWEEN
%token KEYWORD
%token IDENTIFIER STRING_LITERAL NEGATIVE_DIGIT POSITIVE_DIGIT FLOAT DATE COMPARISION_OPERATOR
%left OR
%left AND
%left BETWEEN
%left '+' '-'
%left '*' '/'
%left UMINUS
%left ',' '(' ')'
%%

start:  query ';' {
        printf("Query Accepted\n");
        exit(1);
};
query:	UPDATE table_name SET assignment_list
    |   UPDATE table_name SET assignment_list option_list
    ;
assignment_list:	assignment_list ',' assignment_list
	|   '(' assignment ')'
    |	assignment
    ;
assignment: col_name '=' value;
table_name:	IDENTIFIER;
col_name:   IDENTIFIER;
value:  expr
    |   DEFAULT
    ;
expr:   expr '+' expr
    |   expr '-' expr
    |   expr '*' expr
    |   expr '/' expr
    |   real_number
    |   identifiers_strings
    ;
option_list:	WHERE condition_list
    |   ORDER BY order_by_list
    |   LIMIT POSITIVE_DIGIT
    |   WHERE condition_list ORDER BY order_by_list
    |   WHERE condition_list LIMIT POSITIVE_DIGIT
    |   ORDER BY order_by_list LIMIT POSITIVE_DIGIT
    |   WHERE condition_list ORDER BY order_by_list LIMIT POSITIVE_DIGIT
    ;
condition_list:	condition_list OR condition_list
	|	condition_list AND condition_list
    |   '(' condition ')'
	|	condition
	;
condition:	assignment
	|	col_name COMPARISION_OPERATOR real_number
    |   col_name BETWEEN real_number AND real_number
	;
identifiers_strings:	IDENTIFIER
	|	STRING_LITERAL
	;
real_number:	POSITIVE_DIGIT
	|	'-' real_number %prec UMINUS
	|	FLOAT
	;
order_by_list:	order_by_list ',' order_by_list
	|	col_name
	|	col_name ASC
    |   col_name DESC
    ;
%%

int main() {
    yyparse();
    return 1;
}
