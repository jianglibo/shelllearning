#!/bin/bash

(
# Inside parentheses, and therefore a subshell . . .
while [ 1 ]   # Endless loop.
do
  echo "Subshell running . . ."
done
)

#  Script will run forever,
#+ or at least until terminated by a Ctl-C.

exit $?  # End of script (but will never get here).

#外部命令都会fork一个subprocess，erbuiltin则不会。

( command1; command2; command3; ... )会是subshell
