defmodule M do

	def part1 do
		
		{:ok, contents} = File.read("Input.txt")
		String.split(contents, "\n", trim: true)
		|> Enum.map(fn(x) -> String.split(x, ",", trim: true) end)
		|> Enum.map(fn(x) -> Enum.map(x, fn(y) -> 
			[first, last] = String.split(y, "-", trim: true)
			MapSet.new(String.to_integer(first) .. String.to_integer(last)) 
			end) end)
		|> Enum.map(fn([x, y]) -> 
			MapSet.subset?(x, y) or MapSet.subset?(y, x) 
		end)
		|> Enum.count(fn(x) -> x == true end)

	end

	def part2 do
		
		{:ok, contents} = File.read("Input.txt")
		String.split(contents, "\n", trim: true)
		|> Enum.map(fn(x) -> String.split(x, ",", trim: true) end)
		|> Enum.map(fn(x) -> Enum.map(x, fn(y) -> 
			[first, last] = String.split(y, "-", trim: true)
			MapSet.new(String.to_integer(first) .. String.to_integer(last))
		end) end)
		|> Enum.map(fn([x, y]) -> 
			case MapSet.to_list(MapSet.intersection(x, y)) do
				[] -> false
				_ -> true
				end
			end)
		|> Enum.count(fn(x) -> x == true end)
	end





	def test() do
		"2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8"
	end
end