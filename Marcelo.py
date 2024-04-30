# # #

# # # # # L I B R A R I E S # # # # #

# In terminal pip install libraries
from Bio import SeqIO
import csv

# # # # # F U N C T I O N S # # # # #

# Function definition
def tsv_read(archive):
    data = []
    opened = open(archive, 'r', newline='', encoding='utf-8')
    read_tsv = csv.reader(opened, delimiter='\t')
    for line in read_tsv:
        data.append(line)
    return data

# Function definition
def tsv_selection(read, ref_list):
    select = []
    test = []
    for line in read:
        if line[3] in ref_list:
            select.append(line[0])
            test.append(line[3])
    print(test)
    return select

# Function definition
def tsv_write(data):
    with open(file_final, 'w', newline='') as arquivo_tsv:
        escritor = csv.writer(arquivo_tsv, delimiter=',')  # Define o delimitador como tabulação
        escritor.writerows(dados)  # Escreve todos os dados

# # # # # E X E C U T I O N # # # # #

# STARTED
print("\n S T A R T E D \n")

# STEP 1 - Select target IDs: tsv ids -> list

archive_initial = ""
ids_selected = tsv_read(archive_initial)

# STEP 2 - Read data: tsv data -> list

archive_initial = "/home/lgef/Documentos/banco.csv"
data_selected = tsv_selection(archive_initial, ids_selected)

# STEP 3 - Create tsv: tsv id + tsv data -> new archive 
file_final = "/home/lgef/Documentos/novo.csv"
tsv_write(data_selected)

# FINISHED
print("\n F I N I S H E D \n")

# # # # # # # # # # B. A. R. T. # # # # # # # # # #