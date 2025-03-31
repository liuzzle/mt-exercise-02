# Language Modeling with WikiText-2

This repository contains scripts and tools for training language models on the WikiText-2 dataset. The project includes preprocessing steps, model training, and evaluation. We train the models with [Pytorch example code](https://github.com/pytorch/examples/tree/master/word_language_model)

---

## **Table of Contents**
1. [Requirements](#requirements)
2. [Setup](#setup)
3. [Downloading and Preprocessing Data](#downloading-and-preprocessing-data)
4. [Training the Model](#training-the-model)
5. [Evaluating the Model](#evaluating-the-model)

---

## **Requirements**

Ensure you have the following installed:
- Python 3.8 or later
- PyTorch 1.12 or later
- Additional Python libraries:
  - `numpy`
  - `matplotlib`
  - `torch`
  - `argparse`

Install the required Python packages using:
```bash
pip install -r tools/pytorch-examples/word_language_model/requirements.txt
```
---
## Setup

Setup
Clone the repository and navigate to the project directory:
```bash
git clone https://github.com/liuzzle/mt-exercise-02/
cd <repository-folder>
```
---
## Downloading and Preprocessing Data
**1. Download the WikiText-2 Dataset**
Run the `download_data.sh` script to download and link the WikiText-2 dataset:
```bash
./scripts/download_data.sh
```

This script will:

- Link the raw WikiText-2 data to the `data/wikitext-2` directory.
- Preprocess the data by cleaning, tokenizing, and limiting the vocabulary size.

**2. Verify Preprocessed Data**
After running the script, the preprocessed data will be available in the `data/wikitext-2` directory:
- `train.txt`
- `valid.txt`
- `test.txt`

You can inspect the preprocessed files:
```bash
head -n 10 'data/wikitext-2/train.txt'
```
---
### Training the Model
**1. Train the Model**
Run the `train.sh` script to train the language model:
```bash
./scripts/train.sh
```
This script will:
- Train the model on the preprocessed WikiText-2 dataset.
- Save the trained model checkpoints in the `models/` directory.
- Log the training and validation loss to a file in the `logs/` directory.

**2. Training Options**
You can customize the training process by modifying the `train.sh` script or passing arguments directly to the `main.py` script:

```python
    --data data/wikitext-2 \
    --epochs 40 \
    --emsize 200 \
    --nhid 200 \
    --dropout 0.5 \
    --tied \
    --save model.pt\
    --log-file logs/training_log.txt
```
---
### Evaluating the Model
**1. Run Evaluation**
After training, you can evaluate the model on the test set:
```python
    --data data/wikitext-2 \
    --checkpoint [model.pt](http://_vscodecontentref_/7) \
    --evaluate
```
**2. Output**
The script will output the test loss and perplexity:

```markdown
| End of training | test loss 5.43 | test ppl 229.12
````

