#! /bin/bash

scripts=$(dirname "$0")
base=$(realpath $scripts/..)

models=$base/models
data=$base/data
tools=$base/tools
logs=$base/logs

mkdir -p $models

num_threads=4
device=""

dropout_values=(0 0.2 0.4 0.6 0.8)

SECONDS=0

for dropout in "${dropout_values[@]}"; do
    log_file="$logs/perplexity_dropout_${dropout}.txt"
    echo -e "Epoch\tTrain Perplexity\tValidation Perplexity" > "$log_file"

    (cd $tools/pytorch-examples/word_language_model &&
        CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python main.py --data $data/wikitext-2/cleaned \
            --epochs 40 \
            --log-interval 100 \
            --emsize 200 --nhid 200 --dropout $dropout --tied \
            --save $models/model_dropout_${dropout}.pt \
            --log-file "$log_file" \
            --mps
    )
done

echo "time taken:"
echo "$SECONDS seconds"

