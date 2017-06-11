HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR


def hours_mins_split(time)
  time.split(':').map(&:to_i)
end

def after_midnight(time)
  hour, mins = hours_mins_split(time)
  hour = 0 if hour == HOURS_PER_DAY
  hour * MINUTES_PER_HOUR  + mins
end

def before_midnight(time)
  delta_minutes = MINUTES_PER_DAY - after_midnight(time)
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
  delta_minutes
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
