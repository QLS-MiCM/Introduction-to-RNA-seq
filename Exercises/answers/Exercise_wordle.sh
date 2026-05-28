#!/usr/bin/env bash
# Mini-capstone: solve today's Wordle with cat + tr + egrep.
#
# Wordle = guess a 5-letter English word in 6 tries.
# After each guess the game tells you, per letter:
#   GREEN  -- right letter, right position
#   YELLOW -- right letter, wrong position
#   GRAY   -- letter not in the word
#
# Translate those clues into three filters:
#   gray   letters -> egrep -v '[…]'   drop words containing ANY of these
#   yellow letters -> egrep    '[…]'   keep words containing one of these
#   length         -> egrep "^.{5}$"   exact length

# Example: gray = w,a,i,o,r,c,h,d,e,n   yellow candidates = s,t
cat /usr/share/dict/words \
  | tr '[:upper:]' '[:lower:]' \
  | egrep -v '[waiorchdene]'   \
  | egrep    '[st]'            \
  | egrep   "^.{5}$"
