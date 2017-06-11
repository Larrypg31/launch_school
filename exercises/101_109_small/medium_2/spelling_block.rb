BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(word)
  BLOCKS.none? {|block| word.upcase.count(block) >= 2}
end


p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
