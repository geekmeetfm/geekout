require "csv"

class GridPlot
	attr_accessor :x, :y, :x_complex, :y_complex, :bigger, :smaller, :steps, :biggest

	def initialize(x, y, x_complex,y_complex, x_index, y_index, biggest)
		@x = x
		@y = y
		@biggest = biggest
		@x_complex = x_complex
		@y_complex = y_complex
		@x_index = x_index
		@y_index = y_index
		bigger_smaller()
		@steps = steps_to_ea(@bigger, @smaller)
		print_plots()
	end

	def bigger_smaller()
		if @x_index > @y_index
			@bigger = @x_complex
			@smaller = @y_complex
		else
			@bigger = @y_complex
			@smaller = @x_complex
		end
	end

	def complex_divide(complex_1, complex_2)
		return (complex_1/complex_2)
	end


	def steps_to_ea(complex_1, complex_2)
		if @x_index <= @y_index
			count=0
			remainder=nil
			while remainder != 0
				# puts "%%%%%%%%%%%%%%%"
				# puts "Iteration number is " + (count+1).to_s
				# puts "Current remainder (first iteration it should be nil)" + remainder.to_s
				# puts "Current first number is " + complex_1.to_s
				# puts "Current second number is " + complex_2.to_s
				# puts "all math/assignment for this iteration will now happen"
				# puts "$$$$$$$$$$$$$$$$"
				divided = complex_divide(complex_1, complex_2)
				remainder = complex_1 - Complex((divided.real).to_f.round.to_i, (divided.imag).to_f.round.to_i)*complex_2
				complex_1=complex_2
				complex_2=remainder
				count+=1
			end
		elsif complex_1 = complex_2
			return 1
		end
		count
	end

	def print_plots()

		#if (@steps > @biggest)
		#if (@y!=1 && @x!=1)
			CSV.open("data.csv", "a+") do |csv|
				csv << [@x, @y, @bigger, @smaller, "here: ", @steps]
			end
			@biggest = @steps
		#end
	end

end

class Grid

	attr_accessor :sequence, :all_points

	def initialize(sequence)
		@sequence = sequence
		@all_points = []
		f = File.new("data.csv", "w+")
		create_plots()
	end

	def create_plots()
		@x=1
		biggest = 0
		@sequence.each do |number|		
			@y=1			
			@sequence.each do |second|
					if @sequence.index(number) <= @sequence.index(second)
						fart = GridPlot.new(@x,@y,number,second,@sequence.index(number),@sequence.index(second), biggest)
						if fart.biggest > biggest
							biggest = fart.biggest
						end
					# 	# puts "----------------------------"
					# 	# puts "X: #{@x}"
					# 	# puts "Y: #{@y}"
					# 	# puts @sequence.index(number)
					# 	# puts @sequence.index(second)
					# 	# puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
					end
					p "#{@x} and #{@y}"
				@y+=1
			end
			@x+=1
		end
		@all_points
	end
end




def make_basic_sequence(number)
	complex_arr = []
	for i in 0..number-1
		complex_arr << Complex(i+1, i+1)
	end

	complex_arr
end

def crazy_numbers()
	numbers = []
	count=0
	CSV.foreach('../NormTermOrder10000.csv') do |row|
		
  			numbers << Complex(row[0], row[1])
  			count +=1
  			if count > 100
  				break
  			end

	end

	numbers
end

grid_one = Grid.new(crazy_numbers())
#grid_one.print_plots

