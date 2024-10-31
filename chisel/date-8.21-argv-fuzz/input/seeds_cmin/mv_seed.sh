rm -rf ../afl_seed/*
ls input_* | grep -o [0-9]* > input_ids
new_id=0
for id in `shuf input_ids`
do
  target_dir=../afl_seed/input_$new_id
  mkdir $target_dir
  cp input_$id $target_dir/input
  ((new_id++))
done