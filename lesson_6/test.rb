


def build_hand(hand)
  hand[0] = {name:"2",suit: "heart", value:10, view: 'down'}

end

player_details = {
  status: "turn", #can be 21,bust,
  hand:[
    {name:"ace",suit: "heart", value:1},
    {name:"ace",suit: "heart", value:1},
    {name:"ace",suit: "heart", value:1}
  ],
  total_value: 3
}

build_hand(player_details[:hand])

p player_details
