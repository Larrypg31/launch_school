def swap(string)
  swapped = string.split(' ').map do |word|
    word_arr = word.chars
    first_char = word_arr.shift
    last_char = word_arr.pop
    word_arr.push(first_char)
    word_arr.unshift(last_char)
    word_arr.join
  end
  swapped.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
