# BrainTumorCassification
'''
# Load the VGG16 model with pre-trained weights on ImageNet
base_model = VGG16(weights='imagenet', include_top=False, input_shape=(200, 200, 3))

# Freeze the layers of the pre-trained model
for layer in base_model.layers:
    layer.trainable = False

# Create a Sequential model and add the VGG16 base model
model = Sequential()
model.add(base_model)

# Add custom layers on top of the VGG16 base model
model.add(Flatten())
model.add(Dense(512, activation='relu'))
model.add(Dropout(0.3))
model.add(Dense(2, activation='softmax'))

# Compile the model
model.compile(loss='categorical_crossentropy', optimizer='adam', metrics=['accuracy'])
'''
