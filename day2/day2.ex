defmodule M do
	
	def part1 do

		mapping = part1Map()
		{:ok, sample} = File.read("input.txt")
		sample = String.split(sample, "\n", trim: true)

		Enum.sum(Enum.map(sample, fn(x) -> Map.get(mapping, x) end))
	end

	def part2 do
		mapping = part2Map()
		{:ok, sample} = File.read("input.txt")
		sample = String.split(sample, "\n", trim: true)

		Enum.sum(Enum.map(sample, fn(x) -> Map.get(mapping, x) end))
	end

	def part1Map do
		
		%{"A Y" => 8, "A X" => 4, "A Z" => 3,
		  "B Y" => 5, "B X" => 1, "B Z" => 9,
		  "C Y" => 2, "C X" => 7, "C Z" => 6}
	end

	def part2Map do
		%{"A Y" => 4, "A X" => 3, "A Z" => 8, 
		  "B Y" => 5, "B X" => 1, "B Z" => 9, 
		  "C Y" => 6, "C X" => 2, "C Z" => 7}
	end

end