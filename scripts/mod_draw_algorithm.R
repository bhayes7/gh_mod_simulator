# the algorithm for drawing a modifier card is:
# 
# STEP 1: determining the modifier for an attack
# if modifier deck is empty:
#   immediately shuffle
# if the attack has neither advantage nor disadvantage:
#   draw the top card of the modifier deck
#   do:
#     total modifier += drawn card modifier
#     effects list += drawn card effect
#     drawn card goes to discard pile
#   while drawn card is rolling
#   if crit in effects list:
#     return total modifier * 2, effects list minus crit
#   if miss in effects list:
#     return 0, effects list minus miss
#   else:
#     return total modifier, effects list
#
# if the attack has advantage:
#   perform the above algorithm twice, yielding mod1 and mod2
#   if total modifier of mod1 >= total modifier of mod 2 && length of effects list of mod1 >= length of effects list of mod2:
#     return mod1
#   if total modifier of mod1 =< total modifier of mod 2 && length of effects list of mod1 =< length of effects list of mod2:
#     return mod2
#   else:
#     flip a coin to determine whether to return mod1 or mod2
#
# if the attack has disadvantage:
#   perform the above algorithm twice, yielding mod1 and mod2
#   if total modifier of mod1 <= total modifier of mod 2 && length of effects list of mod1 <= length of effects list of mod2:
#     return mod1
#   if total modifier of mod1 >= total modifier of mod 2 && length of effects list of mod1 >= length of effects list of mod2:
#     return mod2
#   else:
#     flip a coin to determine whether to return mod1 or mod2
#
# note: may later decide to allow player to determine result of advantage/disadvantage, since it is not necessarily
# the case that the modifier with the higher damage value and longer list of effect would be the preferable one.
# This could be circumvented somewhat by ranking all possible effects, i.e. immobilize < disarm < stun,
# but even this becomes impossible because the value of, say, infusefire vs. infuseice is entirely contextual.
#
# STEP 2: handling the discard pile
#   for each card in the discard pile:
#     if the card is disposable, remove it
#   if any card in the discard pile is shuffle:
#     unlock shuffle option
#   when shuffle option is selected:
#     add all cards remaining in discard pile to the deck
#     randomly re-determine the deck's order