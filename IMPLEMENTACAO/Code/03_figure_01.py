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

import matplotlib.pyplot as plt
import pylustrator
pylustrator.start()

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
plt.figure(1).axes[0].set(position=[0.1521, 0.5475, 0.3057, 0.3782], xlim=(-0.6394, 3.541), ylim=(0.5006, 26.75))
plt.figure(1).axes[0].patches[3].set_height(1.065341)
plt.figure(1).axes[0].patches[3].set_width(0.529376)
plt.figure(1).axes[0].patches[3].set_xy([3.184997, 21.244537])
#% end: automatic generated code from pylustrator
plt.show()