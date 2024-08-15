--[[
Object Oriented Programming
]]--

map = {}

print () 

function blank_map()
	for i = 1, 8 do
		map[i] = {}
		for j =  1, 8 do
			map[i][j] = 0
		end
	end
end

function display_map(person)
	for i = 1, 8 do
		for j = 1, 8 do
			if j == person.x and i == person.y then
				io.write("1 ")
			else 
				io.write(map[i][j] .. " ")
			end
		end
		print()
	end
end

blank_map()

print()

person = {}
person.__index = person

function person:new(name, x, y)
	local object = {}
	setmetatable(object, person)
	object.name = name
	object.x = x
	object.y = y
	return object
end

function person:info()
	values = {self.name, self.x, self.y}
	print(table.concat(values, ' '))
end

function movement(person, direction, magnitude)
    if direction == 'w' then
        person.y = math.max(0, person.y - magnitude)
    elseif direction == 's' then
        person.y = math.min(7, person.y + magnitude)
    elseif direction == 'a' then
        person.x = math.max(0, person.x - magnitude)
    elseif direction == 'd' then
        person.x = math.min(7, person.x + magnitude)
    end
end

function loop()
	while true do
		io.write("Continue or Quit (q)")
		inputted = io.read()
		if inputted == 'q' then
			break
		end
		io.write('Enter direction: ')
		local direction = io.read()
		io.write('Enter magnitude: ')
		local magnitude = io.read('*n')
		movement(person1, direction, magnitude)
		display_map(person1)
	end
end

person1 = person:new('lucas', 6, 6) 
person1:info()
loop()

