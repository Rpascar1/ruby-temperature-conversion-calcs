# frozen_string_literal: true

def convert_temp1(temp, input_scale:, output_scale: 'celsius')
  return temp if input_scale == output_scale

  case input_scale
  when 'kelvin'
    temp -= 273.15
  when 'fahrenheit'
    temp = (temp - 32) * (5.0 / 9.0)
  end

  case output_scale
  when 'celsius'
    temp
  when 'fahrenheit'
    temp * (9.0 / 5.0) + 32
  when 'kelvin'
    temp + 273.15
  end
end

def convert_temp2(temp, input_scale:, output_scale: 'celsius')
  if input_scale == 'celsius' && output_scale == 'kelvin'
    temp += 273.15
  elsif input_scale == 'fahrenheit' && output_scale == 'celsius'
    (temp - 32.0) * (5.0 / 9.0)
  elsif input_scale == 'kelvin' && output_scale == 'fahrenheit'
    temp * 1.8 - 459.67
  elsif input_scale == 'kelvin' && output_scale == 'celsius'
    temp -= 273.15
  elsif input_scale == 'celsius' && output_scale == 'fahrenheit'
    (1.8 * temp) + 32.0
  elsif input_scale == 'fahrenheit' && output_scale == 'kelvin'
    (temp + 459.67) / 1.8
  else
    temp
  end
end

# def convert_temp(input_temp, input_scale:, output_scale: 'celcius')
#   case input_scale
#   when 'kelvin'
#     # binding.pry
#     if output_scale == 'celcius'
#       input_temp -= 273.15
#     else
#       # scale[:input_scale] == "kelvin" && scale[:output_scale] == "fahrenheit"
#       input_temp * 1.8 - 459.67
#     end
#   when 'celcius'
#     if output_scale == 'fahrenheit'
#       (1.8 * input_temp) + 32.0
#     else
#       # when scale[:input_scale] == "celcius" && scale[:output_scale] == "kelvin"
#       input_temp += 273.15
#     end
#   when 'fahrenheit'
#     if output_scale == 'celcius'
#       (input_temp - 32.0) * (5.0 / 9.0)
#     else
#       # when scale[:input_scale] == "fahrenheit" && scale[:output_scale] == "kelvin"
#       (input_temp + 459.67) / 1.8
#     end
#   else
#     'error'
#   end
#   puts input_temp
# end
