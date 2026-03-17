import pandas as pd
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
import pickle

df = pd.read_csv("backend/data/iris.csv")

X = df[["SepalLengthCm", "SepalWidthCm", "PetalLengthCm", "PetalWidthCm"]]
y = df["Species"]

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)

pipeline = Pipeline([("scaler", StandardScaler()), ("model", RandomForestClassifier())])

pipeline.fit(X_train, y_train)

pickle.dump(pipeline, open("backend/model/iris_pipeline.pkl", "wb"))

print("Model trained and saved successfully!")
