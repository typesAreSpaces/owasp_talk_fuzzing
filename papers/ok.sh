echo "1 + 2" > sample-1
echo "(124 % 7) ^ 1*2" > sample-2
echo "sqrt((1 + length(10^4)) * 5)" > sample-3
bc sample-* < /dev/null

while true
do
  radamsa -o fuzz-%n -n 100 sample-*
  bc fuzz-* < /dev/null
  test $? -gt 127 && break
done
