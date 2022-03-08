# compiler_project

Repo to track compiler project.

To compile/run

flex projlex.l #Creates a lex.yy.c file to be compiled

gcc lex.yy.c -o a.out #creates a exe object named a.out from the lexical C file

./a.out #Runs the program based on input in test_input.txt
