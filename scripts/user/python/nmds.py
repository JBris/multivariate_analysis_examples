import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import offsetbox
from sklearn.manifold import MDS
from sklearn.preprocessing import MinMaxScaler
from sklearn.model_selection import train_test_split

def load_data():
  df = pd.read_csv('~/data/concrete.csv')
  return df
  
def plot_embedding(X, title, columns):
  X_scale = MinMaxScaler().fit_transform(X)
  print(X_scale)
  plt.title(title)
  plt.xlim(-.5, 1.5) 
  plt.ylim(-.5, 1.5)
  for i in range(X_scale.shape[0]):
    plt.text(X_scale[i, 0], X_scale[i, 1], str(columns[i]),
      color='navy',
      fontdict={'weight': 'bold', 'size': 10})
  plt.show()
    
def do_nmds(df):
  columns = ["cement", "slag", "fly_ash", "water", "superplasticizer", "coarse_aggregate", "fine_aggregate"]
  X = df[columns]
  X_corr = X.corr(method="pearson")
  nmds = MDS(n_components=2, metric=False, dissimilarity="precomputed", n_jobs=-1)
  X_mds = nmds.fit_transform(X_corr)
  plot_embedding(X_mds, "NMDS", columns)
  
df = load_data()
plt.close()
do_nmds(df)
