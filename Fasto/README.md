# Fasto 2020
-----------------
The documentation pdf can be found in Fasto---IPS-2020/Fasto/faso/doc, read it.

## Common rules (will be revisited)
* If you get stuck and need to post an issue do so under 'Issues' above.
* Before you start editing any code, BRANCH!!! This help us use it, Github do not save changes 'one to one'
* Before you merge to master make sure the code works.
* Below you will find a TODO list, before starting mark the part you are working on with, your such that we don't do double work, and mark it with a -DONE- when finished but do not remove your name (to know where to go if something starnge happens)
* Test your code.


###### OBS: Visual studio code has syntaxs highlight for fsLexYacc (rename .fsp -> .fsy)

Now lets have fun


## TODO
-----------------------------------------------------------------------------------------------------------------------------
### Part 1
#### a - document p. 11
The following points are to be implemented in the Lexer, Parser, interpreter, type checker, and Mips code generator.
- Add the following operators *, /, &&, ||, ~, and not
- Add boolean values i.e. true, and false

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
- Add filter
- Add scan

### Part 3 
Optimization part.
Here we need to finish the following
- Copy propagation
- constant folding
- dead-binding removal

### Part 4 (Bonus)
This is not mandatory, but could be nice to do.
Implement Array comprehension
