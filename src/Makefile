build: parser.l parser.y
	bison -yd parser.y
	flex parser.l
	gcc lex.yy.c y.tab.c -o parser
	./parser.exe