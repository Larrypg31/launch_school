def swap_name(string)
  string.split.rotate.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
