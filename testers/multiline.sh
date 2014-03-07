#!/bin/bash
#


ori="<html>\n</html>\n"

msi="abc bin\n case word in pattern \n);;esac"

echo $ori|sed "s|\\(<html>\\)|\\1${msi}|"

#mklllllllllllllllll
