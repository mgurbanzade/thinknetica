i = 2
fibonacci = [0, 1]

while fibonacci.last < 100 do
  fibonacci[i] = fibonacci[i - 1] + fibonacci[i - 2]
  i += 1
end

fibonacci.pop

puts fibonacci
