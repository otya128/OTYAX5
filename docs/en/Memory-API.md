---
layout: default
title: Memory API
---
# Memory API

## NewArray[234]?[#$%]?
Create an array.
When type is omitted, it becomes integer type.

## malloc SIZE OUT PTR
Allocate memory for SIZE.
It is better to use SBArray if you do not ask for efficiency as it is cumbersome.

## free PTR
Release PTR.
If PTR is 0, do not do anything.

## GetRawMemory()
Get the sequence to use for malloc.
PTR corresponds to subscript.

## ReadArray PTR,ARRAY[],POS,LEN
Copy PTR to ARRAY starting from LEN minus POS.

## WriteArray PTR,ARRAY[],POS,LEN
Write ARRAY with LEN minus POS as the starting point in PTR.

## WriteInt PTR,VALUE
Write PTR to VALUE.

## ReadInt(PTR)
Read integers from PTR.

# String

## AllocString STR$ OUT PTR
Assign STR$.

## SetString PTR,STR$
Assign STR$ to PTR.

## GetString$(PTR)
Get STR$ assigned to PTR.

## FreeString PTR
Release PTR.

# Array

## AllocSBArray OUT PTR
Allocate Petit-com array.

## FreeSBArray PTR
Release Petit-com array.

## GetSBArray[](PTR)
Get array variable assigned to PTR.

## SetSBArray PTR,ARY[]
Assign array variables to PTR.
