defmodule M do
	
	def main do
		# First store input in contents variable
		# Simplify, List in a list structure
		# Convert strings to integers

		{:ok, contents} = File.read("Input.txt")
		contents = String.split(contents, "\n\n", trim: true)
		    |> Enum.map(fn(x) -> String.split(x, "\n", trim: true) end)
            |> Enum.map(fn(x) -> 
            	Enum.map(x, fn(y) -> 
            		String.to_integer(y) end
            		) end
            	)

		# Sum the values in the lists, and find the highest value

		Enum.max(Enum.map(contents, fn(x) -> Enum.sum(x) end))

	end

	def main2 do
		
		{:ok, contents} = File.read("Input.txt")
		contents = String.split(contents, "\n\n", trim: true)
		    |> Enum.map(fn(x) -> String.split(x, "\n", trim: true) end)
            |> Enum.map(fn(x) -> 
            	Enum.map(x, fn(y) -> 
            		String.to_integer(y) end
            		) end
            	)

		# Sum the values in the lists, and find the highest value


		contents = Enum.sort(Enum.map(contents, fn(x) -> Enum.sum(x) end))
		Enum.take(contents, -3)
		    |> Enum.sum()

	end
end