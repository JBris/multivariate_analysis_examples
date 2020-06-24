import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.ticker import MaxNLocator
from sklearn.decomposition import FactorAnalysis
from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import train_test_split

def load_data():
  df = pd.read_csv('~/data/concrete.csv')
  return df

def fa_plot(score, coeff, labels):
    xs = score[:,0]
    ys = score[:,1]
    n = coeff.shape[0]
    scalex = 1.0/(xs.max() - xs.min())
    scaley = 1.0/(ys.max() - ys.min())
    plt.scatter(xs * scalex,ys * scaley)
    for i in range(n):
        plt.arrow(0, 0, coeff[i,0], coeff[i,1],color = 'r',alpha = 0.5)
        plt.text(coeff[i,0]* 1.15, coeff[i,1] * 1.15, labels[i], color = 'g', ha = 'center', va = 'center')
    plt.xlim(-1,1)
    plt.ylim(-1,1)
    plt.xlabel("Factor {}".format(1))
    plt.ylabel("Factor {}".format(2))
    plt.grid()
    plt.show()
    
def do_fa(df):
  columns = ["cement", "slag", "fly_ash", "water", "superplasticizer", "coarse_aggregate", "fine_aggregate"]
  X = df[columns]
  X_std = StandardScaler().fit_transform(X)
  
  fa = FactorAnalysis(n_components=4, random_state=100)
  X_fa = fa.fit_transform(X_std)
  fa_summary = pd.DataFrame(fa.components_, columns=columns)  
  print(fa_summary) 
  fa_plot(X_fa[:,0:2],np.transpose(fa.components_[0:2, :]), columns)
    
df = load_data()
plt.close()
do_fa(df)
