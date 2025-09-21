#Necessary packages
import pandas as pd 
from sklearn.preprocessing import StandardScaler
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
import pickle 
#importing dataset
df = pd.read_csv('backend/data/iris.csv')

#This is how the data is organized... see the first 5 tuples of the dataset
print(df.head())

#Now initializing dependent and independent variables 
X = df[['SepalLengthCm', 'SepalWidthCm', 'PetalLengthCm', 'PetalWidthCm']]
y = df['Species']

#Splitting the datset in train test split
X_train, X_test, y_train, y_test = train_test_split(X,y, test_size=0.3, random_state=42)

#Feature Scaling
sc = StandardScaler()
X_train = sc.fit_transform(X_train)
X_test = sc.transform(X_test)

#Instanciating the model 
classifier = RandomForestClassifier()
classifier.fit(X_train, y_train)

#Making a pickle file of the model
pickle.dump(classifier, open('model.pkl', 'wb'))