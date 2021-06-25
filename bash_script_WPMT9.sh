#!/bin/bash

# Entfernen der Umbrüche aus der Liste

less -S 2021-05-23-Article_list_dirty.tsv

# Ausschneiden der beiden benötigten Spalten

cut -f 5,12 2021-05-23-Article_list_dirty.tsv > 2021-05-23-Article_list_two_columns.tsv

# Löschen leerer Zeilen

grep "\S" 2021-05-23-Article_list_two_columns.tsv > 2021-05-23-Article_list_no_blanks.tsv

# Löschen der Zeilen mit fehlerhaften Angaben

sed "24,32d" 2021-05-23-Article_list_no_blanks.tsv > 2021-05-23-Article_list_only_issn.tsv

# Entfernen der vorhandenen Buchstaben bei ISSN-Angaben
 
sed "s/ISSN://g" 2021-05-23-Article_list_only_issn.tsv | sed "s/Issn://g" | sed "s/issn://g" > 2021-05-23-Article_list_cleared.tsv

# Entfernen Leerzeichen am Zeilenanfang

sed "s/ //" 2021-05-23-Article_list_cleared.tsv > 2021-05-23-Article_list_cleared_no_blanks.tsv

# Entfernen der Duplikate

sort -n 2021-05-23-Article_list_cleared_no_blanks.tsv | uniq > 2021-05-23-Article_list_Dates_and_ISSNs.tsv

# Hinweis: zur besseren Übersichtlichkeit wurden ISSN und Date in Zeile 1 stehengelassen. Über den Befehl " sed "1d" " könnte man diese Zeile auch noch entfernen, so dass die finale
Lösung der Musterlösung identisch wird.
