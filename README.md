# compiler_project

Repo to track compiler project.

To compile/run

-Creates a lex.yy.c file to be compiled
flex projlex.l 

-creates a exe object named a.out from the lexical C file
gcc lex.yy.c -o a.out 

-Runs the program based on input in test_input.txt
./a.out 
