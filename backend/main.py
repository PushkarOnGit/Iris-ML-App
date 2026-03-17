from fastapi import FastAPI
import pickle
import numpy as np
from schema import IrisInput

app = FastAPI()

try:
    model = pickle.load(open("model/iris_pipeline.pkl", "rb"))
except Exception as e:
    model = None
    print("Error loading model:", e)


@app.get("/")
def home():
    return {"message": "Iris Prediction API is running..."}


@app.post("/predict")
def predict(data: IrisInput):
    if model is None:
        return {"error": "Model not loaded"}

    try:
        features = np.array(
            [[data.sepal_length, data.sepal_width, data.petal_length, data.petal_width]]
        )

        prediction = model.predict(features)

        return {"prediction": prediction[0]}

    except Exception as e:
        return {"error": str(e)}
