build: parser.l parser.y
	bison -yvd parser.y
	flex parser.l
	gcc lex.yy.c y.tab.c -o parser
	./parser.exe