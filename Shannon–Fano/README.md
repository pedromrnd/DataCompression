Shannon-Fano
===============

1 - For a given list of symbols, develop a corresponding list of probabilities or frequency counts so that each symbol’s relative frequency of occurrence is known.
2 - Sort the lists of symbols according to frequency, with the most frequently occurring symbols at the left and the least common at the right.
3 - Divide the list into two parts, with the total frequency counts of the left part being as close to the total of the right as possible.
4 - The left part of the list is assigned the binary digit 0, and the right part is assigned the digit 1. This means that the codes for the symbols in the first part will all start with 0, and the codes in the second part will all start with 1.
5 - Recursively apply the steps 3 and 4 to each of the two halves, subdividing groups and adding bits to the codes until each symbol has become a corresponding code leaf on the tree.