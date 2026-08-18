# iris-classification-api
Build a REST API that uses a machine learning classification model to predict the species of an iris flower based on its measurements.

## 2. Dataset

The project uses the Iris dataset from scikit-learn.

The dataset contains four input features:
- Sepal length
- Sepal width
- Petal length
- Petal width

The target is the species of the iris flower.

## 3. Machine Learning Problem

This is a multi-class classification problem.

The model will predict one of three iris species:
- Setosa
- Versicolor
- Virginica

## 4. API Contract

The API will provide a POST /predict endpoint. It will accept four numerical inputs: sepal length, sepal width, petal length, and petal width. The API will validate the input values and send them to the trained machine learning model. The model will predict the iris species, and the API will return the predicted species as the response.

## 5. API Flow

Client
↓
POST /predict
↓
Input Validation
↓
Machine Learning Model
↓
Prediction
↓
API Response

## 6. Expected Output

The API will return the predicted iris flower species: Setosa, Versicolor, or Virginica.
