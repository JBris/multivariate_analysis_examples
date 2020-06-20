import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.ticker import MaxNLocator
from sklearn.decomposition import PCA
from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import train_test_split

def load_data():
  df = pd.read_csv('~/data/concrete.csv')
  return df
  
def do_pca(df, kaiser_criterion = True):
  columns = ["cement", "slag", "fly_ash", "water", "superplasticizer", "coarse_aggregate", "fine_aggregate"]
  X = df[columns]
  X_std = StandardScaler().fit_transform(X)
  
  if kaiser_criterion is True:
    pca = PCA()
    X_pca = pca.fit(X_std).transform(X_std)
    #4 PCs using Kaiser-criterion
    print('\nEigenvalues \n%s' %pca.explained_variance_)
    print('Eigenvectors \n%s' %pca.components_)
    ax = plt.figure().gca()
    ax.plot(pca.explained_variance_)
    ax.xaxis.set_major_locator(MaxNLocator(integer=True))
    plt.xlabel('Principal Component')
    plt.ylabel('Eigenvalue')
    plt.axhline(y=1, linewidth=1, color='r', alpha=0.5)
    plt.title('Scree Plot of PCA: Component Eigenvalues')
    plt.show()

  pca = PCA(n_components=4)
  X_pca = pca.fit(X_std).transform(X_std)
    
  print('\nEigenvalues \n%s' %pca.explained_variance_)
  ax = plt.figure().gca()
  ax.plot(pca.explained_variance_)
  ax.xaxis.set_major_locator(MaxNLocator(integer=True))
  plt.xlabel('Principal Component')
  plt.ylabel('Eigenvalue')
  plt.axhline(y=1, linewidth=1, color='r', alpha=0.5)
  plt.title('Scree Plot of PCA: Component Eigenvalues')
  plt.show()
    
  ax = plt.figure().gca()
  ax.plot(np.cumsum(pca.explained_variance_ratio_))
  ax.xaxis.set_major_locator(MaxNLocator(integer=True))
  plt.xlabel('Number of Components')
  plt.ylabel('Cumulative Explained Variance')
  plt.axvline(x=1, linewidth=1, color='r', alpha=0.5)
  plt.title('Explained Variance of PCA by Component')
  plt.show()

  results = pd.DataFrame(pca.components_).transpose()
  results.columns = ['Component 1', 'Component 2', 'Component 3', 'Component 4']
  results.index=columns
  print(results)
    
df = load_data()
do_pca(df, False)
