
def split_string(string)
	string.split(/(\+|\-)/).reject{ |c| c.empty? }
end

def first_number(arr)	
	if arr[0] == "-"
		number = arr[1].split(/\//)
		divided = number[0].to_f
		divider = number[-1].to_f
		return ((divided / divider)*(-1.0)).round.to_i
	else
		number = arr[0].split(/\//)
		divided = number[0].to_f
		divider = number[-1].to_f
		return (divided / divider).round.to_i
	end
end

def second_number(arr)
	number = arr[1].split(/\//)
	divided = number[0].to_f
	divider = number[-1].to_f
	if arr[0] == "+"
		return (divided/divider).round.to_i
	else
		return ((divided/divider)*(-1.0)).round.to_i
	end
end

def string_to_rounded_complex_number(string_to_change)
	string_array = split_string(string_to_change)
	first = first_number(string_array[0..-2])
	second = second_number(string_array[-2..-1])
	return Complex(first,second)
end

def complex_divide(complex_1, complex_2)
	return (complex_1/complex_2)
end

def complex_to_string(complex_num)
	return complex_num.to_s
end

def complex_remainder(complex_1, complex_2)
	return 0
end


#main
def steps_to_ea(complex_1, complex_2)
	count=0
	remainder=nil
	while remainder != 0
		puts "%%%%%%%%%%%%%%%"
		puts "Iteration number is " + (count+1).to_s
		puts "Current remainder (first iteration it should be nil)" + remainder.to_s
		puts "Current first number is " + complex_1.to_s
		puts "Current second number is " + complex_2.to_s
		puts "all math/assignment for this iteration will now happen"
		puts "$$$$$$$$$$$$$$$$"
		divided = complex_divide(complex_1, complex_2)
		remainder = complex_1 - (string_to_rounded_complex_number(complex_to_string(divided)))*complex_2
		puts divided.real.to_i
		puts divided.imag.to_i
		puts Complex(divided.real, divided.imag)
		#remainder = complex_1 - Complex((divided.real).to_i, (divided.imag).to_i)*complex_2
		complex_1=complex_2
		complex_2=remainder
		count+=1
	end

	puts "the method has identified the remainder as zero. The number of steps is:"
	count
end




#puts string_to_rounded_complex_number(complex_to_string(complex_divide(Complex(3,-2), Complex(2,1))))

puts steps_to_ea(Complex(3,-2),Complex(2,1))
# puts steps_to_ea(Complex(135,-14),Complex(155,34))
# puts steps_to_ea(Complex(-155,34),Complex(135,-14))
#puts split_string(complex_to_string(complex_divide(Complex(-155,34),Complex(135,-14))))

#puts complex_divide(Complex(3,-2),Complex(2,1))
#puts Complex(3,-2) - Complex(3,-1)

#puts string_to_rounded_complex_number("4/5-7/5i")



