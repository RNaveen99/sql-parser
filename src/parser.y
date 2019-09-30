%{
    #include<stdio.h>
    #include<stdlib.h>
    int yyerror(char const *s) {
        printf("%s\n", s);
        return 1;
    }
    int yylex();
%}

%token UPDATE  SET  WHERE ORDER BY ASC DESC LIMIT AND OR
%token KEYWORD
%token IDENTIFIER STRING_LITERAL NEGATIVE_DIGIT POSITIVE_DIGIT FLOAT DATE OPERATOR
%left OR
%left AND
%left ',' '(' ')'
%%

start:  query ';' {
        printf("Query Accepted\n");
        exit(1);
};
query:	UPDATE table_name SET assignment_list
    |   UPDATE table_name SET assignment_list option_list
    ;
table_name:	IDENTIFIER;
assignment_list:	assignment_list ',' assignment_list
	|	assignment
    ;
assignment:	'(' assignment ')'
	|	IDENTIFIER '=' real_number
    |   IDENTIFIER '=' identifiers_strings
    ;
option_list:	WHERE condition_list
    |   ORDER BY order_by_list
    |   LIMIT POSITIVE_DIGIT
    |   WHERE condition_list ORDER BY order_by_list
    |   WHERE condition_list LIMIT POSITIVE_DIGIT
    |   WHERE condition_list ORDER BY order_by_list LIMIT POSITIVE_DIGIT
    ;
condition_list:	condition OR condition
	|	condition AND condition
	|	condition
	;
condition:	'(' condition ')'
	|	IDENTIFIER '=' identifiers_strings
	|	IDENTIFIER '=' real_number
	|	IDENTIFIER OPERATOR real_number
	;
identifiers_strings:	IDENTIFIER
	|	STRING_LITERAL
	;
real_number:	POSITIVE_DIGIT
	|	NEGATIVE_DIGIT
	|	FLOAT
	;
order_by_list:	order_by_list ',' order_by_list
	|	IDENTIFIER
	|	IDENTIFIER ASC
    |   IDENTIFIER DESC
    ;
%%

int main() {
    yyparse();
    return 1;
}
