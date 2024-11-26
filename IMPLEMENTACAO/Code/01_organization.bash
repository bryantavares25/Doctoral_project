# # # # #

# Organization USE

# Folders
pcH=/home/bryan/
pcL=/home/lgef/
direc_mhp=${pcL}Documentos/GitHub/Project_doctoral/IMPLEMENTACAO/Genomes/M_hyopneumoniae/MHP_ncbi_dataset/ncbi_dataset/data/
direc_mfc=${pcL}Documentos/GitHub/Project_doctoral/IMPLEMENTACAO/Genomes/M_flocculare/MFC_ncbi_dataset/ncbi_dataset/data/
mhp_table="IMPLEMENTACAO/Genomes/mhp_table.tsv" # Curadoria manual
mhp_list="IMPLEMENTACAO/Genomes/mhp_list.txt"
mhp_temp="IMPLEMENTACAO/Genomes/mhp_result.txt"
mfc_table="IMPLEMENTACAO/Genomes/mfc_table.tsv" # Curadoria manual
mfc_list="IMPLEMENTACAO/Genomes/mfc_list.txt"
mfc_temp="IMPLEMENTACAO/Genomes/mfc_result.txt"

if exist GCF** cp GCF; elif exist GCA** cp GCA

mhp=/home/lgef/Documentos/GitHub/Project_doctoral/IMPLEMENTACAO/Genomes/M_hyopneumoniae/MHP_ncbi_dataset/ncbi_dataset/data/strains/
mfc=/home/lgef/Documentos/GitHub/Project_doctoral/IMPLEMENTACAO/Genomes/M_flocculare/MFC_ncbi_dataset/ncbi_dataset/data/strains/

for file in 

if ls ${mfc}ATCC27716/GCF* 1> /dev/null 2>&1; then
    cp -r ${mfc}ATCC27716/GCF* ${mfc}ATCC27716/Use/
elif ls ${mfc}ATCC27716/GCA* 1> /dev/null 2>&1; then
    cp -r ${mfc}ATCC27716/GCA* ${mfc}ATCC27716/Use/
else
    echo "Nenhum arquivo GCF ou GCA encontrado."
fi
