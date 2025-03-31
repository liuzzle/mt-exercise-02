import os
import pandas as pd
import matplotlib.pyplot as plt

log_dir = "logs"
dropout_values = [0, 0.2, 0.4, 0.6, 0.8]

# Load data
data = {}
for dropout in dropout_values:
    log_file = os.path.join(log_dir, f"perplexity_dropout_{dropout}.txt")
    df = pd.read_csv(log_file, sep="\t")
    data[dropout] = df

# Generate tables
print("Validation Perplexities")
print(pd.concat([df.set_index("Epoch")["Validation Perplexity"].rename(f"Dropout {d}") for d, df in data.items()], axis=1))

# Plot perplexities
plt.figure(figsize=(10, 5))

for dropout, df in data.items():
    plt.plot(df["Epoch"], df["Validation Perplexity"], label=f"Dropout {dropout}")

plt.xlabel("Epoch")
plt.ylabel("Validation Perplexity")
plt.title("Validation Perplexity vs. Dropout")
plt.legend()
plt.grid()
plt.savefig("validation_perplexity_plot.png")
plt.show()