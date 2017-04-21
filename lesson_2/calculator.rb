# ask the user for two number
# ask the user for an operation to perform
# perform the operon on two numbers
# output the result

#answer = Kernel.gets()
#Kernel.puts(answer)

Kernel.puts("Welcom to Calculator!")

Kernel.puts("What's the first Number")
number1=Kernel.gets().chomp()

Kernel.puts("What's the second Number")
number2=Kernel.gets().chomp()

Kernel.puts("What operation would you like to perform? 1) add 2) subtract 3) multiply 4)divide")
operator=Kernel.gets().chomp()

if operator=='1'
  result = number1.to_i() + number2.to_i()
elsif operator=='2'
  result = number1.to_i() - number2.to_i()
elsif operator=='3'
  result = number1.to_i() * number2.to_i()
else
  result = number1.to_f() / number2.to_f()
end

Kernel.puts("the result is #{result}")
