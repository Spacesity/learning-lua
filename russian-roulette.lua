--[[
Russian Roulette in Lua
by Spacesity
]]--

player = {
	name = "",
	alive = true
}

game = {
	bullet_chamber = nil,
	chambers_chosen = {}
}

function not_in_list(value)
	for _, v in ipairs(game.chambers_chosen) do
		if v == value then
			table.insert(game.chambers_chosen, value)
			return false
		end
	end
	return true
end

io.write("Enter your name: ")
player.name = io.read()
print(player.name .. " welcome to Russian Roulette!")
math.randomseed(os.time())
game.bullet_chamber = math.random(6)

while player.alive do
	length = #game.chambers_chosen
	if length == 5 then
		print("You win!")
		player.alive = false
	end
	
	io.write("Pick a chamber (between 1-6):")
    choice = io.read()
	number = tonumber(choice)
	if number then
		choice = tonumber(choice)
		if choice == game.bullet_chamber then
			print("You got shot, ouch!")
			player.alive = false	
		elseif choice > 0 and choice <= 7 then
			if not_in_list(choice, game.chambers_chosen) then
				print("You survived!")
			end
		else
			print("Invalid input")
		end
	else
		print("Invalid input")
	end
end
