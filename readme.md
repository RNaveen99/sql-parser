# sql parser

A simple parser for sql made using lex yacc / [GNU's flex bison](https://www.gnu.org/software/bison/manual/).

It currently supports only selected sql queries as stated below.

## How to make

- go to source folder `cd src`
- `make` to build : this will generate the usual files and executes the executable file

## Assumptions

- each statement ends with `semicolon`

## Cases Handled
- 
    ```
    UPDATE table_reference SET assignment_list [WHERE where_condition] [ORDER BY ...] [LIMIT row_count]
    ```

- keywords cant be identifiers


## Reference links

- Lex Yacc Introduction
  - [https://silcnitc.github.io/lex.html](https://silcnitc.github.io/lex.html)
  - [https://silcnitc.github.io/yacc.html](https://silcnitc.github.io/yacc.html)
  - [https://silcnitc.github.io/ywl.html](https://silcnitc.github.io/ywl.html)
  - [http://epaperpress.com/lexandyacc/intro.html](http://epaperpress.com/lexandyacc/intro.html)
  - [http://dinosaur.compilertools.net/lex/](http://dinosaur.compilertools.net/lex/)
  - [http://dinosaur.compilertools.net/yacc/](http://dinosaur.compilertools.net/yacc/)

- Lex yacc primer
  - [http://tldp.org/HOWTO/Lex-YACC-HOWTO-7.html](http://tldp.org/HOWTO/Lex-YACC-HOWTO-7.html)

- Bison manual references
  - [http://www.gnu.org/software/bison/manual/html_node/Understanding.html](http://www.gnu.org/software/bison/manual/html_node/Understanding.html)
  - [http://www.gnu.org/software/bison/manual/bison.html#Action-Features](http://www.gnu.org/software/bison/manual/bison.html#Action-Features)
  - [http://www.gnu.org/software/bison/manual/bison.html#Algorithm](http://www.gnu.org/software/bison/manual/bison.html#Algorithm)
  - [http://www.gnu.org/software/bison/manual/html_node/Error-Recovery.html](http://www.gnu.org/software/bison/manual/html_node/Error-Recovery.html)
