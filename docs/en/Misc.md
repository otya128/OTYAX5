---
layout: default
title: Misc
---
## FindArray(ARY[],V)
Search V from ARY and return the position.\
If not found, -1

## ShortToRGB(IN)
Convert PetitCom physical color to RGB value.

## RGBToShort(IN)
Converts the RGB value to the PetitCom physical color.

## SplitInt IN OUT X,Y
Insert the upper 16 bits of IN in Y and the lower 16 bits in X.

## _BIN$(IN)
Make IN a binary string.

## InsertStr$(BASE$,POS,INS$)
Insert INS$ into POS for BASE$.

## InsertStrB BASE$,POS,IN$
A destructive operation version of InsertStr$(BASE$,POS,INS$).

## RemoveStr$(THIS$,POS,LEN)
Delete LEN characters from POS for THIS$.

## RemoveStrB THIS$,POS,LEN
Destructive operation version of RemoveStr$(THIS$,POS,LEN).

## ReplaceStr$(THIS$,STR$,TO$)
Replace STR$ in TOIS$ with TO$.

## GetFileExtension(FILE$)
Get the extension of FILE$.\
If there is no extension, it returns an empty string.

## ArrayFill ARY[],V,OFF,LEN
In the version of PetitCom without FILL, turn OFF from LEN character ARY to V more efficiently than FOR loop.

## Split(STR$,SP$)
Split STR$ by SP$ and return it as an array.

## ToUpper$(STR$)
Capitalize STR$ in ASCII character range.

## ToUpper STR$
A destructive operation version of ToUpper$(STR$).

## ToLower$(STR$)
Make STR$ lowercase in the range of ASCII characters.

## ToLower STR$
A destructive operation version of ToLower$(STR$).

## LASTINSTR(S1$,S2$)
Search S2$ against S1$ from the reverse direction.\
If not found, it returns -1.
