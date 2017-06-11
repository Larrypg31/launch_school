def buy_fruit(fruit)
  basket = []
  fruit.each do |type|
    type[1].times do
      basket << type[0]
    end
  end
  basket
end

p buy_fruit([['apples', 3], ['orange', 1], ['bananas', 2]]) ==
  %w(apples apples apples orange bananas bananas)
