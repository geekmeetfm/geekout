class GridPlot
	attr_accessor :x, :y, :x_complex, :y_complex, :bigger, :smaller, :steps

	def initialize(x, y, x_complex,y_complex)
		@x = x
		@y = y
		@x_complex = x_complex
		@y_complex = y_complex
		bigger_smaller(@x_complex, @y_complex)
		@steps = steps_to_ea(@bigger, @smaller)
	end

	def bigger_smaller(x_complex, y_complex)
		if ((x_complex.real**2)+(x_complex.imag**2))>((y_complex.real**2)+(y_complex.imag**2))
			@bigger = @x_complex
			@smaller = @y_complex
		elsif ((x_complex.real**2)+(x_complex.imag**2))<((y_complex.real**2)+(y_complex.imag**2))
			@bigger = @y_complex
			@smaller = @x_complex
		elsif x_complex.real > y_complex.real
			@bigger = @x_complex
			@smaller = @y_complex
		elsif x_complex.real < y_complex.real
			@bigger = @y_complex
			@smaller = @x_complex
		elsif x_complex.imag > y_complex.imag
			@bigger = @x_complex
			@smaller = @y_complex
		else x_complex.imag < y_complex.imag
			@bigger = @y_complex
			@smaller = @x_complex
		end
	end

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

	def steps_to_ea(complex_1, complex_2)
		count=0
		remainder=nil
		while remainder != 0
			#puts "%%%%%%%%%%%%%%%"
			#puts "Iteration number is " + (count+1).to_s
			#puts "Current remainder (first iteration it should be nil)" + remainder.to_s
			#puts "Current first number is " + complex_1.to_s
			#puts "Current second number is " + complex_2.to_s
			#puts "all math/assignment for this iteration will now happen"
			#puts "$$$$$$$$$$$$$$$$"
			divided = complex_divide(complex_1, complex_2)
			remainder = complex_1 - (string_to_rounded_complex_number(complex_to_string(divided)))*complex_2
			#puts divided.real.to_i
			#puts divided.imag.to_i
			#puts Complex(divided.real, divided.imag)
			#remainder = complex_1 - Complex((divided.real).to_i, (divided.imag).to_i)*complex_2
			complex_1=complex_2
			complex_2=remainder
			count+=1
		end
		count
	end

end

class Grid

	attr_accessor :sequence, :all_points

	def initialize(sequence)
		@sequence = sequence
		@all_points = []
		create_plots()
	end

	def create_plots()
		@x=1
		@sequence.each do |number|		
			@y=1
			@sequence.each do |second|
				@all_points << GridPlot.new(@x,@y,number,second)
				@y+=1
			end
			@x+=1
		end
		@all_points
	end

	def print_plots()
		f = File.new("data.csv", "w+")
		@all_points.each do |point|
			print "x: #{point.x} y: #{point.y} bigger: #{point.bigger} smaller: #{point.smaller} steps: #{point.steps}"
			puts

			#CSV.open("data.csv", "wb") do |csv|
			#	csv << [point.y, point.y, point.x_complex, point.y_complex, point.bigger, point.smaller, point.steps]
			#end
		end
	end

end




def make_basic_sequence(number)
	complex_arr = []
	for i in 0..number-1
		complex_arr << Complex(i+1, i+1)
	end
	complex_arr
end

#print make_basic_sequence(100)

#x=GridPlot.new(0,1,3,4)

grid_one = Grid.new(make_basic_sequence(100))
grid_one.print_plots

