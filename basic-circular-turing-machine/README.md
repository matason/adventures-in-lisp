# Turing Machines #
In 1936, Alan Turing published a paper entitled, "ON COMPUTABLE NUMBERS, WITH AN
APPLICATION TO THE ENTSCHEIDUNGSPROBLEM". In it he set out the idea of machines
that are capable of computing anything that is computable.

## Terminology ##
* __m-configuration__ - the machine configuration, shortened to _m-config_
* __tape__ - the anologue of paper
* __square__ - a position on the tape, see _f-square_ and _e-square_ below
* __symbol__ - a mark within a square
* __r-th square__ or __scanned square__ - the square that is currently _in_ the machine
* __scanned symbol__ - the only symbol the machine is directly aware of
* __configuration__ - the _m-configuration_ and the _scanned symbol_ taken together form the _configuration_
* __f-square__ or figures (__0__ or __1__) - a square containing a symbol that is a part of the result, _f-squares_ form a continous sequence, there are no blanks until the end is reached
* __e-square__ - a square containing other symbols, liable to erasure, used only to produce the result

## Actions ##
* __R__ - move along the tape to the right
* __L__ - move along the tape to the left
* __P__ - print a symbol on the tape
* __E__ - erase the scanned symbol from the tape

## Machine types ##
* __circular__ - a computing machine that writes a series of figures
* __circle-free__ - a computing machine that writes both figures (f-squares) and e-squares, these are normally alternating starting with an f-square

## Lisp ##
* __FASL__ - file extension, fast-load file

Variables in global scope (such as *tape*) are conventionally prefixed and suffixed with an asterisk.
