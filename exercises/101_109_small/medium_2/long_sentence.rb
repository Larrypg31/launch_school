text = File.read('speech.txt')

def long_sentence(text)
  sentences = text.split(/\.|\?|!/)
  largest_sentence = sentences.max_by { |sentence| sentence.split.size }
  largest_sentence = largest_sentence.strip
  number_of_words = largest_sentence.split.size
  puts largest_sentence.to_s
  puts "Containing #{number_of_words} words"
end

long_sentence(text)
