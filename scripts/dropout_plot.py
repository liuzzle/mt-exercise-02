import matplotlib.pyplot as plt

# Generate 40 epochs
epochs = list(range(1, 41))

# Hypothetical validation loss trends for 40 epochs
val_loss_02 = [0.9 - i*0.005 + (0.01 if i % 7 == 0 else 0) for i in range(40)]
val_loss_05 = [0.95 - i*0.004 + (0.015 if i % 10 == 0 else 0)
               for i in range(40)]
val_loss_08 = [1.1 - i*0.003 + (0.02 if i % 9 == 0 else 0) for i in range(40)]

# Plotting
plt.figure(figsize=(12, 6))
plt.plot(epochs, val_loss_02, marker='o', label='Dropout 0.2')
plt.plot(epochs, val_loss_05, marker='s', label='Dropout 0.5')
plt.plot(epochs, val_loss_08, marker='^', label='Dropout 0.8')

plt.title('Validation Loss vs Epochs for Different Dropout Rates')
plt.xlabel('Epoch')
plt.ylabel('Validation Loss')
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.show()
