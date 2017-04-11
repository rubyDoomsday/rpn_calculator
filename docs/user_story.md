# RPN Calculator Exercise
## Overview
The goal of this exercise is to implement a command-line calculator which uses reverse polish notation (RPN).
Reverse Polish notation (RPN) is a mathematical notation in which every operator follows all of its operands, in contrast to Polish notation (PN), which puts the operator before its operands. It is also known as postfix notation. It does not need any parentheses as long as each operator has a fixed number of operands.

### For example:
```
=> 6 2 +
=> 8
```

## Requirements:
* [x] The calculator should support the four basic arithmetic operations:
  1. Addition +
  1. Subtraction -
  1. Multiplication *
  1. Division /
* [x] The calculator should handle erroneous input gracefully
* [x] The calculator should provide a read–evaluate–print loop (REPL) interface that supports entry of expressions (see below)
* [ ] The program should exit when either `q` or the end-of-input indicator Ctrl+D is entered

## Valid inputs
Expressions can be entered as a single line, e.g.
```
input expression > 4 5 + result: 9.0
input expression > 9.5 2 / result: 4.75
input expression > 4 5 + 3 * result: 27.0

input expression > 4 result: 4.0
input expression > 5 result: 5.0
input expression > + result: 9.0
input expression > 3 result: 3.0
input expression > * result: 27.0

input expression > 4 5 + result: 9.0
input expression > 3 result: 3.0
input expression > * result: 27.0
```

## Additional Context
The calculator should be designed with the following future feature alterations in mind:
* [x] Change of interface (e.g. REST API, WebSocket, etc)
* [x] Addition of operators beyond the standard arithmetic operators
