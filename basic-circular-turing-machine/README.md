# Turing Machines #
In 1936, Alan Turing published a paper entitled, "ON COMPUTABLE NUMBERS, WITH AN
APPLICATION TO THE ENTSCHEIDUNGSPROBLEM". In it he set out the idea of machines
that are capable of computing anything that is computable.

## Terminology ##
m-configuration - the machine configuration, shortened to m-config
tape - the anologue of paper
square - a position on the tape, see f-square and e-square below
symbol - a mark within a square
r-th square or scanned square - the square that is currently *in* the machine
scanned symbol - the only symbol the machine is directly aware of
configuration - the m-configuration and the scanned symbol taken together form the configuration
f-square or figures (0 or 1) - a square containing a symbol that is a part of the result, f-squares form a continous sequence, there are no blanks until the end is reached
e-square - a square containing other symbols, liable to erasure, used only to produce the result

## Actions ##
R - move along the tape to the right
L - move along the tape to the left
P - print a symbol on the tape
E - erase the scanned symbol from the tape

## Machine types ##
circular - a computing machine that writes a series of figures
circle-free - a computing machine that writes both figures (f-squares) and e-squares, these are normally alternating starting with an f-square

## Lisp ##
FASL - file extension, fast-load file

Variables in global scope (such as *tape*) are conventionally prefixed and suffixed with an asterisk.
