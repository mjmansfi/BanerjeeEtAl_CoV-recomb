#!/bin/bash

cat DPP4.ordered.shared.tsv  | awk -F '\t' '{print $7}' | while read ID;
do
	HEADER=$(grep "$ID" ./DPP4/DPP4_refseq_protein.linsi.mfa)
	SEQ=$(grep "$ID" ./DPP4/DPP4_refseq_protein.linsi.mfa -A 1 | tail -n 1)
	TAX=$(echo "$HEADER" | cut -d '[' -f 2 | cut -d ']' -f 1 | sed 's/ /_/g')
	printf ">$TAX\n$SEQ\n"
done > DPP4.ordered.shared.mfa
