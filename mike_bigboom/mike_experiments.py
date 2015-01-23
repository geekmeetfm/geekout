#! /usr/bin/env/python3

#import cmath
#import csv

#figure out process for setting comp1 & 2 from csv values

#THESE VALUES TOOK WAAAAAAAAAAAY TOO LONG TO COMPUTE, EVEN COMMENTING OUT THE PRINT STATEMENTS 
#Think about printing the text of activity that isn't a result to a log file instead, it'll clog the console
#if it writes to it every time
#complex_1 = complex(155, 34)
#complex_2 = complex(135, -14)

#simpler test values
complex_1 = complex(4, 4)
complex_2 = complex(2, 2)


def steps_to_ea(complex_1, complex_2):
	count = 0
	remainder = None

	while remainder != 0:
		print("%%%%%%%%%%%%%%")
		print("Iteration number is " + str(int(count + 1)))
		print("Current remainder (first iteration it should be nil)" + str(remainder))
		print("Current 1st number is " + str(complex_1))
		print("Current 2nd number is " + str(complex_2))
		print("All math/assignment for this iteration will now happen")
		print("$$$$$$$$$$$$$$$$")

		divided = complex_1 / complex_2
		remainder = complex_1 - complex(int(divided.real),int(divided.imag)) * complex_2

		complex_1=complex_2
		complex_2=remainder

		count+=1

	print("The method has identified the remainder as 0. The number of steps is:" + str(count))


print(steps_to_ea(complex_1,complex_2))


#comes to (135 - 34i)/(144 + 14i) = 1.11 + 0.37i (approximately)
#a1 = complex(155 + 34i) #will be complex_1
#a2 = complex(135 - 14i) #will be complex_2
#is_remainder = bool #needed?


#PROCESS:
#define complex 1 & 2 -> read row from csv into complex 1,2?  a function?
#define var for division result and perform division to it

#round real element of result
#round imaginary element of result

#use these to extract the parts of a complex number
#z.real
#z.imag


####################
#ALERT!!
#I was using this to round, but it doesn't handle complex/float well,
#and it was starting to get dirty
#round(x[, n])	
#definition: x rounded to n digits, rounding ties away from zero. If n is omitted, it defaults to 0.

