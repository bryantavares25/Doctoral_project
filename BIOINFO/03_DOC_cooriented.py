# Simulação dos dados que você forneceu em um DataFrame

# # # Adicionar verificação de C O N T I G
# Converte os dados para um DataFrame

import pandas as pd

file = 'BIOINFO/MHP_7448_dataset/ncbi_dataset/data/GCF_000008225.1/genomic_gff_cleaned.tsv'
df = pd.read_csv(file, sep='\t', header=None, names=['seqname', 'start', 'end', 'strand', 'ID', 'Parent', 'Teste'])

co_oriented_groups = []
current_group = [df.iloc[0]['Parent']]
current_strand = df.iloc[0]['strand']

for i in range(1, len(df)):
    if df.iloc[i]['strand'] == current_strand:
        current_group.append(df.iloc[i]['Parent'])
        print(current_group)
    else:
        if len(current_group) >= 1:
            co_oriented_groups.append(current_group)
        current_group = [df.iloc[i]['Parent']]
        current_strand = df.iloc[i]['strand']

if len(current_group) >= 1:
    co_oriented_groups.append(current_group)

a = 0
for group in co_oriented_groups:
    a = a+1
    print(f"Grupo de genes co-orientados: {', '.join(group)}")
print(a)

