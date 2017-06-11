NUMBER_OF_LIGHTS = 1000
def all_lights_on
  bank = {}
  NUMBER_OF_LIGHTS.times do |i|
    bank[i + 1] = true
  end
  bank
end

def toggle(bool)
  bool ? false : true
end

def lights(rounds)
  bank = {all_lights_on}
  rounds.times do |i|
    round = i + 1
    count = 0
    next unless round > 1
    loop do
      count += 1
      light = round * count
      break if light > NUMBER_OF_LIGHTS
      bank[light] = toggle(bank[light])
    end
  end
   bank
end

def on_lights(lights)
  lights.keys.select { |key| lights[key] }
end

p on_lights(lights(1000))
