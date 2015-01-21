
def split_string(string)
	string.split(/(\+|\-)/).reject{ |c| c.empty? }
end

def first_number(arr)
	if arr[0] == "-"
		#DO THIS LATER
	else
		(arr[0][0].to_f / arr[0][2].to_f).round.to_i
	end
end

def second_number(arr)
	if arr[0] == "+"
		return (arr[1][0].to_f / arr[1][2].to_f).round.to_i
	else
		return ((arr[1][0].to_f / arr[1][2].to_f)*(-1.0)).round.to_i
	end
end

def string_to_rounded_complex_number(string_to_change)
	string_array = split_string(string_to_change)
	first = first_number(string_array[0..-2])
	second = second_number(string_array[-2..-1])
	return Complex(first,second)
end

def round_fraction(sign, number)

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
	remainder=1
	while remainder != 0
		puts "%%%%%%%%%%%%%%%"
		puts "Iteration number is " + (count+1).to_s
		puts "Current remainder is (first one is not right) " + remainder.to_s
		puts "Current first number is " + complex_1.to_s
		puts "Current second number is " + complex_2.to_s
		puts "$$$$$$$$$$$$$$$$"
		divided = complex_divide(complex_1, complex_2)
		remainder = complex_1 - (string_to_rounded_complex_number(complex_to_string(divided)))*complex_2
		complex_1=complex_2
		complex_2=remainder
		count+=1
	end
	count
end




#puts string_to_rounded_complex_number(complex_to_string(complex_divide(Complex(3,-2), Complex(2,1))))

steps_to_ea(Complex(3,-2),Complex(2,1))



