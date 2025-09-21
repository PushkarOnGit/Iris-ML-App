#Necessary packages
import pandas as pd 
from sklearn.preprocessing import StandardScaler
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split

#importing dataset
df = pd.read_csv('data/Iris.csv')

#This is how the data is organized... see the first 5 tuples of the dataset
df.head()

#x is independent and Y is dependent variable 