#!/bin/bash

dir=/home/lgef
#dir=/home/bryan

refproteases=(MHP7448_RS00135 MHP7448_RS00160 MHP7448_RS00735 MHP7448_RS00780 MHP7448_RS00895 MHP7448_RS00965 MHP7448_RS01125 MHP7448_RS01645 MHP7448_RS01695 MHP7448_RS01760 MHP7448_RS01830 MHP7448_RS01965 MHP7448_RS02430 MHP7448_RS02535 MHP7448_RS02710 MHP7448_RS02825 MHP7448_RS02840 MHP7448_RS02910 MHP7448_RS03080 MHP7448_RS03310 MHP7448_RS03360 MHP7448_RS03395 MHP7448_RS03465 MHP7448_RS03555 MHP7448_RS03865 MHP7448_RS03870 MHP7448_RS04050)

awk ' NR==1 {print}' /home/bryan/Documentos/GitHub/Project_doctoral/IMPLEMENTACAO/Gene_clusters/orthofinder/output_proteins/gene_id/Orthogroups/Orthogroups.tsv > /home/bryan/Documentos/GitHub/Project_doctoral/IMPLEMENTACAO/Gene_clusters/orthofinder/output_proteins/gene_id/Orthogroups/Orthogroups_test.tsv

for i in ${refproteases[@]}; do grep $i /home/bryan/Documentos/GitHub/Project_doctoral/IMPLEMENTACAO/Gene_clusters/orthofinder/output_proteins/gene_id/Orthogroups/Orthogroups.tsv >> /home/bryan/Documentos/GitHub/Project_doctoral/IMPLEMENTACAO/Gene_clusters/orthofinder/output_proteins/gene_id/Orthogroups/Orthogroups_test.tsv; done




# DICIO

# 
