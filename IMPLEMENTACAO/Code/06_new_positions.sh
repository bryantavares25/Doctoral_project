#!/bin/bash

conda init bash

# START > > > ZERO

# ARCHIVE
#dir=/home/lgef
dir=/home/bryan

# INPUT FILE
input_gff=$dir/Documentos/GitHub/Project_doctoral/BIOINFO_TEST/11/genomic.gff

# EXECUTION

# Recovery from .gff: seqregion ($1) | strand ($7) | start | stop | ID | gene_biotype > > > file.txt
awk '$2 == "RefSeq" && $3 != "Region" {
    split($9, a, ";")
    split(a[1], b, "-")
    split(a[4], c, "=")
    split(a[5], d, "=")
    if (c[1] == "gene_biotype") {
        print $1, $7, $4, $5, b[2], c[2]}
    if (d[1] == "gene_biotype") {
        print $1, $7, $4, $5, b[2], d[2]}
}' genomic.gff > teste.txt

# Create the .txt: seqregion | start | stop
awk '{print $1, $3 -1, $4}' teste.txt > teste_02.txt

# Recovery from .fna with base from .txt and ID: >ID+fasta sequence
seqtk subseq GCF_002193015.1_ASM219301v1_genomic.fna teste_02.txt > teste.fasta

t=$(awk '{print $2, $3}' teste_02.txt)
t=$(awk '{print $1 $3 $4}' teste.txt)
for c in $t; do echo $c; done
seqkit locate -i -p "" $t ALL_GCF_002193015.fna

# # #

awk '/^>/ {if (seq) print seq; seq=""; print; next} {seq = seq $0} END {if (seq) print seq}' /home/bryan/Documentos/GitHub/Project_doctoral/BIOINFO_TEST/11/teste.fasta > output_ordenado.fasta
echo "Sequências FASTA extraídas e ordenadas em 'output_ordenado.fasta'."
awk '/^>/ {if (seq) {print seq > output_file}; seq=""; output_file=substr($0,2)".fasta"; print $0 > output_file; next} {seq = seq $0} END {if (seq) print seq > output_file}' /home/bryan/Documentos/GitHub/Project_doctoral/BIOINFO_TEST/11/teste.fasta

# # #

#### CORRECT
sequence=$(awk '!/^>/' "$input_file")
echo "${sequence[@]}" # Exibir a sequência
for i in $sequence; do
    seqkit locate -i -p "$i" /home/lgef/Documentos/GitHub/Project_doctoral/BIOINFO_TEST/11/ALL_GCF_002193015.fna >> /home/lgef/Documentos/GitHub/Project_doctoral/BIOINFO_TEST/11/ALL_FASTA.fasta
done

# limpar ALL_FASTA.fasta # CURADORIA MANUAL

#### OUTPUT : FASTA SEQ

#### SUBSTITUIR:

# mapa.tsv > > > NZ_MWWN01000001.1 1 1624 NZ_MWWN01000002.1 2 1625
# Cria o código para construção automática do mapa de substituição


# Substituição
awk 'BEGIN { OFS="\t" }
NR==FNR {
    map[$1 FS $2 FS $3] = $4 FS $5 FS $6
    next
}
{
    key = $1 FS $4 FS $5
    if (key in map) {
        split(map[key], new_values, FS)
        $1 = new_values[1]
        $4 = new_values[2]
        $5 = new_values[3]
    }
    print
}' mapa.tsv genomic.gff > genomic_novo.gff

# END > > > 


''' A partir do genomic_novo_gff gerado, será possível prosseguir para as análises estruturais'''