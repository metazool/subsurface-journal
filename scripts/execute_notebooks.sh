for filename in `find ./submissions -name requirements.txt`
do
  echo $filename
  conda install --file $filename
done

# At this stage print out the environment for debugging purposes
set

for filename in `find ./submissions -name "*.ipynb"`
do
  cd $(dirname "$filename")
  notebook=$(basename "$filename")
  bash -c "jupyter nbconvert --to notebook --execute $notebook"
  $notebook="${notebook%.*}.nbconvert.ipynb"
  py.test --nbval $notebook
done

