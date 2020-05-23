# Fasto 2020
-----------------
The documentation pdf can be found in Fasto---IPS-2020/Fasto/fasto/doc, read it.

## Common rules (will be revisited)
* If you get stuck and need to post an issue do so under 'Issues' above.
* Before you start editing any code, BRANCH!!! This help us use it, Github do not save changes 'one to one'
* Before you merge to master make sure the code works.
* Below you will find a TODO list, before starting mark the part you are working on with, your such that we don't do double work, and mark it with a -DONE- when finished but do not remove your name (to know where to go if something starnge happens)
* When done add a breaf comment below the task. Just so that we better can write the report later on.
* Test your code.

The first rule are also so that we can go back and look when writing the report such that we can highlight problems we have had.

###### OBS: Visual studio code has syntaxs highlight for fsLexYacc (rename .fsp -> .fsy)

Now lets have fun

## TODO
-----------------------------------------------------------------------------------------------------------------------------
### Part 1
a and b are in the making by Kasper
#### a - document p. 11
The following points are to be implemented in the Lexer, Parser, interpreter, type checker, and Mips code generator.
- Add the following operators *, /, &&, ||, ~, and not
- Add boolean values i.e. true, and false

Comment on implementation:
general note : I have looked at the implementation (typechecker.fs) of checkBinOp to find out how to check negate and not else copy pasted (all files) with small alterations to the four others.

Lexer and parser : added the patterns and tokens part (a) needing part (b)
Intepreter : added part (a) Done. Checked that short circuit works. (line 178-197)
TypeChecker

#### b - document p. 12
In the Lexer and Parser do the following.
expand both such that the compiler/inteperter accept the following line of code
```fsharp
let x = 3; y = 2*x; z= iota(y+4) in write(z)
```
This should be the equavivalent of
```fsharp
let x = 3 in let y = 2*x in let z = iota(y+4) in rwite(z)
```
This task include adding tokens in the Lexer and adding and/or changing nonterminals and productions in the Parser

### Part 2 - document p. 12
Implement replicate, filter and scan. This goes for all phases from lexer to Mips code generator.
since each can be time consuming I recomment that you only assign yourself to only one at a time.
- Add replicate
	- **Finished tasks**
		- Added parsing and lexing functionality
		- The Fasto interpreter now supports the ``replicate`` function
		- Type-checking implemented
		- MIPS code generation implemented for REPLICATE
	- **To do**
		- INTERPRETER: Add support for arrays (see interpreter.fs)
- Add filter
	- **Finished tasks**
		- Added parsing and lexing functionality
		- The Fasto interpreter now supports the ``filter`` function
		- Type-checking implemented
	- **To do**
		- MIPS code generation
		- Testing
- Add scan
	- **Finished tasks**
		- Added parsing and lexing functionality
	- **To do**
		- Add support for ``scan`` in the Fasto interpreter
		- Type-checking
		- MIPS code generation
		- Testing

### Part 3 - document p. 12
Optimization part.
Here we need to finish the following
- Copy propagation
- constant folding
- dead-binding removal

### Part 4 (Bonus) - document p. 13
This is not mandatory, but could be nice to do.
Implement Array comprehension
