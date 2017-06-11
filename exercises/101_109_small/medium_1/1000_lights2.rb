NUMBER_OF_LIGHTS = 1000

def toggle?(bool)
  bool ? false : true
end

def update_bank(round, bank)
  count = 0
  loop do
    count += 1
    light = round * count
    break if light > NUMBER_OF_LIGHTS
    bank[light] = toggle?(bank[light])
  end
  bank
end

def lights(rounds)
  bank = {}
  rounds.times do |i|
    round = i + 1
    update_bank(round, bank)
  end
  bank
end

def on_lights(lights)
  lights.keys.select { |key| lights[key] }
end

p on_lights(lights(1000))
