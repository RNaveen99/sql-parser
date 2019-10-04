# **sql parser**

A simple parser for sql made using lex yacc / [GNU's flex bison](https://www.gnu.org/software/bison/manual/).

It currently supports only selected sql queries as stated below.

## How to make

- go to source folder `cd src`
- `make` to build : this will generate the usual files and executes the executable file

## Assumptions

- queries are `case-insensitive`
- each query ends with `semicolon`
- keywords cant be identifiers

## Syntax
> UPDATE table_reference SET assignment_list [WHERE where_condition] [ORDER BY ...] [LIMIT row_count]

## Cases Handled
- ## **update** *table_reference* **set** *assignment_list*
    ```
    update customer set bonus = 1000;
    update customer set bonus = 1000, gst = 200;
    update customer set bonus = 1000, gst = 200, bonus_type = 'Diwali';
    update customer set bonus = 1000, gst = 200, bonus_type = 'Diwali', extra = bonus + 200;
    update customer set bonus = 1000, gst = 2 * 10 ;
    update customer set bonus = 1000, gst = 2 * 5 + 5 - 10 / 2;
    ```

- ## **update** *table_reference* **set** *assignment_list* **where** *condition_list*
    ```
    update customer set bonus = 1000, gst = 20 where bonus_type = 'Diwali';
    update customer set bonus = 1000, gst = 20 where bonus_type = 'Diwali' and salary >= 40000;
    update customer set bonus = 1000, gst = 20 where bonus_type = 'Diwali' and salary >= 40000 or salary <= 20000;
    update customer set bonus = 1000, gst = 20 where bonus_type = 'Diwali' and salary between 40000 and 20000;
    ```

- ## **update** *table_reference* **set** *assignment_list* **order by** *column*
    ```
    update customer set bonus = 1000, gst = 20 order by cid;
    update customer set bonus = 1000, gst = 20 order by cid asc, salary desc;
    ```

- ## **update** *table_reference* **set** *assignment_list* **Limit** *row_count*
    ```
    update customer set bonus = 1000, gst = 20 limit 10;
    ```

- ## **update** *table_reference* **set** *assignment_list* **where** *condition_list* **order by** *column* **Limit** *row_count*
    ```
    update customer set bonus = 1000, gst = 20 where bonus_type = 'Diwali' and salary >= 40000 or salary <= 20000 order by cid desc limit 5;
    ```

## Cases Not Handled
- ## multi-table updates
    ```
    update items,month set items.price=month.price where items.id = month.id;
    ```
- ## Binary operator such as XOR, NOT, |(or), &(and)

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
