#! /bin/bash

scripts=$(dirname "$0")
base=$scripts/..

data=$base/data

mkdir -p $data

tools=$base/tools

# link default training data for easier access

mkdir -p $data/wikitext-2

for corpus in train valid test; do
    absolute_path=$(realpath $tools/pytorch-examples/word_language_model/data/wikitext-2/$corpus.txt)
    ln -snf $absolute_path $data/wikitext-2/$corpus.txt
done

# Preprocess WikiText-2 data
for corpus in train valid test; do
    # Clean the raw data
    cat $data/wikitext-2/$corpus.txt | python $base/scripts/preprocess_raw.py > $data/wikitext-2/$corpus.cleaned.txt

    # Tokenize and limit vocabulary size
    cat $data/wikitext-2/$corpus.cleaned.txt | python $base/scripts/preprocess.py --vocab-size 5000 --tokenize --lang "en" --sent-tokenize > \
        $data/wikitext-2/$corpus.preprocessed.txt
done

# Replace the original files with preprocessed versions (optional)
for corpus in train valid test; do
    mv $data/wikitext-2/$corpus.preprocessed.txt $data/wikitext-2/$corpus.txt
done
