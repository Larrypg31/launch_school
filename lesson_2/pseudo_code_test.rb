def conc_arr(arr)
  string=""
  arr.each_with_index do |s,i|
    string << s
    if i!=arr.length
      string << " "
    end
  end
  string
end


puts conc_arr(['my','dumb','string','dumb'])


def every_other(array)
  new_array=[]
  array.each_with_index do |v,i|
    if (i%2==0)
      new_array << v
    end
  end
  new_array
end



puts every_other([0,1,2,3,4,5,6,7,8])
