import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense
from tensorflow.keras.utils import to_categorical
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
import numpy as np

# Example data generation (replace with your actual dataset)
np.random.seed(42)  # For reproducibility
num_samples = 1000
# Generate random data for 'time', 'cost', 'season', 'tourist level'
X = np.random.rand(num_samples, 4)  
# Generate random labels for simplicity (e.g., 0: beach, 1: museum, 2: park)
y = np.random.randint(0, 3, num_samples)  
y = to_categorical(y, num_classes=3)  # One-hot encoding the labels

# Splitting dataset into training and test sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Feature scaling
scaler = StandardScaler().fit(X_train)
X_train = scaler.transform(X_train)
X_test = scaler.transform(X_test)

# Model creation
model = Sequential([
    Dense(64, input_shape=(4,), activation='relu'),  # Adjust input_shape based on feature count
    Dense(64, activation='relu'),
    Dense(3, activation='softmax')  # Output layer neurons = number of classes
])

# Compile the model
model.compile(optimizer='adam', loss='categorical_crossentropy', metrics=['accuracy'])

# Train the model
model.fit(X_train, y_train, validation_split=0.2, epochs=100, batch_size=32)

# Evaluate the model
loss, accuracy = model.evaluate(X_test, y_test)
print(f"Test Accuracy: {accuracy*100:.2f}%")
