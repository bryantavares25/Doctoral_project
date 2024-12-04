# # #

# import pylustrator

# FIGURA 1

'''Figura 1 - Comparar propriedades genômicos para avaliar os genomas completos e os genomas completados.
Propriedades:
    - Conteúdo GC 
    - Completude Busco Result
    - Cromossomos
    - Tamanho
    - Quantidade de Ns
'''

'''import matplotlib.pyplot as plt

# Dados para o gráfico
categorias = ['A', 'B', 'C', 'D']
valores = [10, 20, 15, 25]

# Criando o gráfico de barras
plt.bar(categorias, valores, color='blue')

# Personalização do gráfico
plt.title('Gráfico de Barras com Matplotlib')
plt.xlabel('Categorias')
plt.ylabel('Valores')

# Exibindo o gráfico
#% start: automatic generated code from pylustrator
plt.figure(1).ax_dict = {ax.get_label(): ax for ax in plt.figure(1).axes}
import matplotlib as mpl
getattr(plt.figure(1), '_pylustrator_init', lambda: ...)()
plt.figure(1).axes[0].legend(loc=(0.07802, 0.6899), labelspacing=0.2, handlelength=0.8)
plt.figure(1).axes[0].set(position=[0.0554, 0.5517, 0.4212, 0.3675])
plt.figure(1).axes[0].patches[3].set_height(1.065341)
plt.figure(1).axes[0].patches[3].set_width(0.529376)
plt.figure(1).axes[0].patches[3].set_xy([3.184997, 21.244537])
#% end: automatic generated code from pylustrator
plt.show()
'''
#import pylustrator
import matplotlib.pyplot as plt
import numpy as np
import csv
#pylustrator.start()

def tsv_read(archive):
    data = []
    opened = open(archive, 'r', newline='', encoding='utf-8')
    read_tsv = csv.reader(opened, delimiter='\t')
    for line in read_tsv:
        data.append(line)
    return data

data=tsv_read("/home/lgef/Documentos/GitHub/Project_doctoral/IMPLEMENTACAO/Genomes/M_hyopneumoniae/Stats_DtC/scaffolds.tsv")

category=data[0]
print(category)
values1=data[1]
print(values1)
values2=int(data[2])
print(values2)

# Configuração para barras lado a lado
x = np.arange(len(category))  # Posições no eixo X
largura = 0.35  # Largura das barras

# Criação do gráfico
fig, ax = plt.subplots()
barras1 = ax.bar(x - largura/2, values1, largura, label='Draft', color='skyblue')
barras2 = ax.bar(x + largura/2, values2, largura, label='Whole', color='salmon')

# Personalização do gráfico
ax.set_xlabel('Categorias')
ax.set_ylabel('Valores')
ax.set_title('Gráfico de Barras Lado a Lado')
ax.set_xticks(x)
ax.set_xticklabels(category)
ax.legend()

# Exibição
plt.tight_layout()
plt.show()

