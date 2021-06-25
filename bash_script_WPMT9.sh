#!/bin/bash

# Entfernen der Umbrüche aus der Liste

less -S 2021-05-23-Article_list_dirty.tsv

# Ausschneiden der beiden benötigten Spalten

cut -f 5,12 2021-05-23-Article_list_dirty.tsv > 2021-05-23-Article_list_two_columns.tsv

# Löschen leerer Zeilen

grep "\S" 2021-05-23-Article_list_two_columns.tsv > 2021-05-23-Article_list_no_blanks.tsv

sed "24,32d" 2021-05-23-Article_list_no_blanks.tsv > 2021-05-23-Article_list_only_issn.tsv
