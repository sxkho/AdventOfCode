defmodule M do
	
	def part1 do
		
		{:ok, sample} = File.read("input.txt")
		String.split(sample, "\n", trim: true)
		|> Enum.map(fn(x) -> String.to_charlist(x) end)
		|> Enum.map(fn(x) -> 
			Enum.split(x, div(length(x), 2)) end)
		|> Enum.map(fn({comp1, comp2}) -> 
			m1 = MapSet.new(comp1)
			m2 = MapSet.new(comp2)
			MapSet.intersection(m1, m2) end)
		|> Enum.map(fn(x) -> MapSet.to_list(x) end)
		|> List.to_charlist()
		|> priorities()
		|> Enum.sum()

	end

	def part2 do
		
		{:ok, sample} = File.read("input.txt")
		String.split(sample, "\n", trim: true)
		|> Enum.map(fn(x) -> String.to_charlist(x) end)
		|> Enum.map(fn(x) -> MapSet.new(x) end)
		|> Enum.chunk_every(3)
		|> Enum.map(fn(chunk) -> Enum.reduce(chunk, fn(x, y) -> MapSet.intersection(x, y) end) end)
		|> Enum.map(fn(x) -> MapSet.to_list(x) end)
		|> List.to_charlist()
		|> priorities()
		|> Enum.sum()
	end


	def priorities([]) do [] end
	def priorities([char | tail]) do
		cond do
			
			char <= 90 -> [char - 65 + 27 | priorities(tail)]
			char >= 97 -> [char - 97 + 1 | priorities(tail)]
		end
		
	end

	def test do
		"vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw"
	end
end