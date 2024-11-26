# # # # #

# Organization

# Create folder by species
# In collumn
awk -F'\t' 'NR > 1 && !seen[$5]++ {print $5}' IMPLEMENTAÇÃO/Genomes/mhp_table.tsv > IMPLEMENTAÇÃO/Genomes/mhp_list.txt
awk -F'\t' 'NR > 1 && !seen[$5]++ {print $5}' IMPLEMENTAÇÃO/Genomes/mfc_table.tsv > IMPLEMENTAÇÃO/Genomes/mfc_list.txt

direc_mhp=/home/lgef/Documents/GitHub/Project_doctoral/IMPLEMENTAÇÃO/Genomes/M_hyopneumoniae
direc_mfc=/home/lgef/Documents/GitHub/Project_doctoral/IMPLEMENTAÇÃO/Genomes/M_flocculare

while IFS= read -r line; do a=$line; mkdir -p {$direc}{$a}; done < "IMPLEMENTAÇÃO/Genomes/mhp_list.txt"
while IFS= read -r line; do a=$line; mkdir -p {$direc}{$a}; done < "IMPLEMENTAÇÃO/Genomes/mfc_list.txt"

# # # # # # #

# Move files

# /home/lgef/Documentos/GitHub/Project_doctoral/IMPLEMENTAÇÃO/Code/00_organization.bash
for i in "${seqid[@]}"; do mkdir -p {$direc}{$ids}; done
for i in ; do mv {$direc}Genomes/M_hyopneumoniae/MHP_ncbi_dataset/ncbi_dataset/data/**GCA_000008205.1**; done

