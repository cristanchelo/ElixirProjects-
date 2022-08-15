# SophosApp

**This is information about SophosApp**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `sophos_app` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:sophos_app, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/sophos_app>.

## Modules

## SophosApp.AdventOfCode

This module contains three modules related with the AdventOfCode 2015 Challange https://adventofcode.com/2015: 

**SophosApp.AdventOfCode.Day1: Not Quite Lisp**

Module with functions related with Day 1 https://adventofcode.com/2015/day/1: 
`Exercise 1: What floor do the instructions take Santa?`
`Exercise 2: What is the position of the character that causes Santa to first enter the basement?`

**SophosApp.AdventOfCode.Day2: I Was Told There Would Be No Math**

Module with functions related with Day 2 https://adventofcode.com/2015/day/2: 
`Exercise 1: How many total square feet of wrapping paper should they order?`
`Exercise 2: How many total feet of ribbon should they order?`

**SophosApp.AdventOfCode.Day3: Perfectly Spherical Houses in a Vacuum**

Module with functions related with Day 3 https://adventofcode.com/2015/day/2: 
`Exercise 1: How many houses receive at least one present?`
`Exercise 2: How many houses receive at least one present?`

## SophosApp.ProjectEuler

This module contains `list_three_five_nums_with_sum`, and `list_three_five_nums_with_sum_filter` functions
to obtain get a list of numbers from 0 to N, which are multiples of 3 and 5, and sum result .

## SophosApp.Example

This module is for only testing purposes (Related to call modules into others).

## SophosApp.FactorialServer

This module calls `Factorial` module definition, using Elixir process management.

## SophosApp.Factorial

This module contains `Factorial` definition, with Recursion and Pattern Matching

## SophosApp.FibonacciServer

This module calls `Fibonacci` module definition, using Elixir process management.

## SophosApp.Fibonacci

This module contains `Fibonacci` definition, with Recursion and Pattern Matching

## SophosApp.FizzBuzz

This module contains `exec_fizz_buzz` definition, with Recursion and Pattern Matching.
This module executes Fizz Buzz Game: https://en.wikipedia.org/wiki/Fizz_buzz

## SophosApp.GenericServer

This module contains functions with generic calls related with Elixir Process management.

## SophosApp.Greeter

This module is for only testing purposes (Related to Pattern Matching).

## SophosApp.Hello

This module is for only testing purposes (Related to Use and Macro definitions).

## SophosApp.Math

This module contains `GCD`, `Sum` and `Rectangle area` functions.

## SophosApp.MyList

This module contains `sum list elements`, `list size` and `apply functions to each element into list` definitions.

## SophosApp.ParallelList

This module contains `pmap` definitions. Call a list of processes and apply a function for each element. 

## SophosApp.PingPongProc

This module contains `handle_message` definition to do a Ping-Pong between two processes in the same terminal.
It calls `SophosApp.GenericServer` to manage processes. 

How to use:
```elixir
pid_ping = SophosApp.GenericServer.start_process(SophosApp.PingPongProc, [])
pid_pong = SophosApp.GenericServer.start_process(SophosApp.PingPongProc, [])

send pid_ping, {pid_pong, :pong}
```

