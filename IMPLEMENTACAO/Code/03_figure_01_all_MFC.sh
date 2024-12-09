#!/bin/bash

#conda init bash

# # # # #

# Folders
pcH=/home/bryan/
pcL=/home/lgef/
pcR=/home/regenera/
direc_mfc=${pcL}Documentos/GitHub/Project_doctoral/IMPLEMENTACAO/Genomes/M_flocculare
mfc_strains=${pcL}Documentos/GitHub/Project_doctoral/IMPLEMENTACAO/Genomes/M_flocculare/strains/
mfc_table=${pcL}Documentos/GitHub/Project_doctoral/IMPLEMENTACAO/Genomes/mfc_table.tsv
mfc_list=${pcL}Documentos/GitHub/Project_doctoral/IMPLEMENTACAO/Genomes/mfc_list.txt
mfc_temp=${pcL}Documentos/GitHub/Project_doctoral/IMPLEMENTACAO/Genomes/mfc_result.txt

# EXECUTION

# # # DATA COLLECT # # #

mkdir -p ${direc_mfc}/stats_dtc/

complete=()
uncomplete=()
for file in $(cat $mfc_list); do
    result=$(awk -v id="$file" '($5 == id && ($0 ~ /Complete/ || $0 ~ /Chromosome/)) {print $5}' $mfc_table)
    if [ -n "$result" ]; then
        found=true
        complete+=($file)
    else
        found=false
        uncomplete+=($file)
    fi
    echo $file $found
done

# Total lenght - FROM QUAST
category=()
values1=()
values2=()
for i in "${complete[@]}"; do
    cat=$i
    val1=$(awk -F'\t' 'NR>1 {print $8}' ${mfc_strains}${i}/Use/quast_complete/transposed_report.tsv)
    val2=$(awk -F'\t' 'NR>1 {print $8}' ${mfc_strains}${i}/Use/quast_complete/transposed_report.tsv)
    category+=($cat)
    values1+=($val1)
    values2+=($val2)
done
for i in "${uncomplete[@]}"; do
    cat=$i
    val1=$(awk -F'\t' 'NR>1 {print $8}' ${mfc_strains}${i}/Use/quast_draft/transposed_report.tsv)
    val2=$(awk -F'\t' 'NR>1 {print $8}' ${mfc_strains}${i}/Use/quast_complete/transposed_report.tsv)
    category+=($cat)
    values1+=($val1)
    values2+=($val2)
done
echo "${category[@]}"
echo "${values1[@]}"
echo "${values2[@]}"
tsv_line=$(printf "%s\t" "${category[@]}")
tsv_line=${tsv_line%$'\t'}
echo "$tsv_line" > ${direc_mfc}/stats_dtc/totallenght.tsv
tsv_line=$(printf "%s\t" "${values1[@]}")
tsv_line=${tsv_line%$'\t'}
echo "$tsv_line" >> ${direc_mfc}/stats_dtc/totallenght.tsv
tsv_line=$(printf "%s\t" "${values2[@]}")
tsv_line=${tsv_line%$'\t'}
echo "$tsv_line" >> ${direc_mfc}/stats_dtc/totallenght.tsv

# Scaffold - FROM QUAST
category=()
values1=()
values2=()
for i in "${complete[@]}"; do
    cat=$i
    val1=$(awk -F'\t' 'NR>1 {print $2}' ${mfc_strains}${i}/Use/quast_complete/transposed_report.tsv)
    val2=$(awk -F'\t' 'NR>1 {print $2}' ${mfc_strains}${i}/Use/quast_complete/transposed_report.tsv)
    category+=($cat)
    values1+=($val1)
    values2+=($val2)
done
for i in "${uncomplete[@]}"; do
    cat=$i
    val1=$(awk -F'\t' 'NR>1 {print $2}' ${mfc_strains}${i}/Use/quast_draft/transposed_report.tsv)
    val2=$(awk -F'\t' 'NR>1 {print $2}' ${mfc_strains}${i}/Use/quast_complete/transposed_report.tsv)
    category+=($cat)
    values1+=($val1)
    values2+=($val2)
done
echo "${category[@]}"
echo "${values1[@]}"
echo "${values2[@]}"
tsv_line=$(printf "%s\t" "${category[@]}")
tsv_line=${tsv_line%$'\t'}
echo "$tsv_line" > ${direc_mfc}/stats_dtc/scaffolds.tsv
tsv_line=$(printf "%s\t" "${values1[@]}")
tsv_line=${tsv_line%$'\t'}
echo "$tsv_line" >> ${direc_mfc}/stats_dtc/scaffolds.tsv
tsv_line=$(printf "%s\t" "${values2[@]}")
tsv_line=${tsv_line%$'\t'}
echo "$tsv_line" >> ${direc_mfc}/stats_dtc/scaffolds.tsv

# GC content - FROM QUAST
category=()
values1=()
values2=()
for i in "${complete[@]}"; do
    cat=$i
    val1=$(awk -F'\t' 'NR>1 {print $17}' ${mfc_strains}${i}/Use/quast_complete/transposed_report.tsv)
    val2=$(awk -F'\t' 'NR>1 {print $17}' ${mfc_strains}${i}/Use/quast_complete/transposed_report.tsv)
    category+=($cat)
    values1+=($val1)
    values2+=($val2)
done
for i in "${uncomplete[@]}"; do
    cat=$i
    val1=$(awk -F'\t' 'NR>1 {print $17}' ${mfc_strains}${i}/Use/quast_draft/transposed_report.tsv)
    val2=$(awk -F'\t' 'NR>1 {print $17}' ${mfc_strains}${i}/Use/quast_complete/transposed_report.tsv)
    category+=($cat)
    values1+=($val1)
    values2+=($val2)
done
echo "${category[@]}"
echo "${values1[@]}"
echo "${values2[@]}"
tsv_line=$(printf "%s\t" "${category[@]}")
tsv_line=${tsv_line%$'\t'}
echo "$tsv_line" > ${direc_mfc}/stats_dtc/gccontent.tsv
tsv_line=$(printf "%s\t" "${values1[@]}")
tsv_line=${tsv_line%$'\t'}
echo "$tsv_line" >> ${direc_mfc}/stats_dtc/gccontent.tsv
tsv_line=$(printf "%s\t" "${values2[@]}")
tsv_line=${tsv_line%$'\t'}
echo "$tsv_line" >> ${direc_mfc}/stats_dtc/gccontent.tsv

# Completeness - FROM BUSCO
category=()
values1=()
values2=()
for i in "${complete[@]}"; do
    cat=$i
    val1=$(jq '.results."Complete percentage"' ${mfc_strains}${i}/Use/busco_complete/short_summary.specific.mycoplasmatales_odb10.busco_complete.json)
    val2=$(jq '.results."Complete percentage"' ${mfc_strains}${i}/Use/busco_complete/short_summary.specific.mycoplasmatales_odb10.busco_complete.json)
    category+=($cat)
    values1+=($val1)
    values2+=($val2)
done
for i in "${uncomplete[@]}"; do
    cclearat=$i
    val1=$(jq '.results."Complete percentage"' ${mfc_strains}${i}/Use/busco_draft/short_summary.specific.mycoplasmatales_odb10.busco_draft.json)
    val2=$(jq '.results."Complete percentage"' ${mfc_strains}${i}/Use/busco_complete/short_summary.specific.mycoplasmatales_odb10.busco_complete.json)
    category+=($cat)
    values1+=($val1)
    values2+=($val2)
done
echo "${category[@]}"
echo "${values1[@]}"
echo "${values2[@]}"
tsv_line=$(printf "%s\t" "${category[@]}")
tsv_line=${tsv_line%$'\t'}
echo "$tsv_line" > ${direc_mfc}/stats_dtc/competenessbusco.tsv
tsv_line=$(printf "%s\t" "${values1[@]}")
tsv_line=${tsv_line%$'\t'}
echo "$tsv_line" >> ${direc_mfc}/stats_dtc/competenessbusco.tsv
tsv_line=$(printf "%s\t" "${values2[@]}")
tsv_line=${tsv_line%$'\t'}
echo "$tsv_line" >> ${direc_mfc}/stats_dtc/competenessbusco.tsv

# END
