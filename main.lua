local backpackStartIndex = 10

local inventory = {
	[1] = false,
	[2] = 'Thisthat',
	[3] = 'Diamond',
	[4] = 'Dirt',
	[5] = 'This',
	[6] = 'That',
	[7] = false,
	[8] = false,
	[9] = false,
	[10] = false,
	[11] = 'Diamond',
	[12] = false,
	[13] = false,
	[14] = 'terry davis',
	[15] = false,
	[16] = false,
	[17] = 'kaan',
	[18] = false,
	[19] = 'PickAxe',
	[20] = false,
	[21] = 'yuh',
	[22] = 'hello',
	[23] = 'wrld',
	[24] = false,
	[25] = false
}

local function replaceItems(index1, index2)
	-- item2 isnt strict as item1 can be replaced to an empty index
	-- item1 is strict as it needs to be replaced
	local item1 = inventory[index1]
	local item2 = inventory[index2]
	
	if item1 then
		inventory[index1] = false
		
		inventory[index2] = item1
	else
		print('item1 not found while replacing items!')
		
		return
	end
	
	if item2 then
		inventory[index1] = item2
	end
end

local function getPlaceableIndex()
	local index = backpackStartIndex

	while index <= #inventory do
		local item = inventory[index]

		if not item then
			return index -- empty index found, push there
		end

		if not (index == #inventory) then
			index = index + 1
		else
			return index + 1 -- next index is empty in backpack, push there
		end
	end
end

local function reOrderInventory() -- collets empty indexes, Reorders the inventory
	local index = backpackStartIndex
	local lastFalse = false

	while index <= #inventory do
		local item = inventory[index]

		if not item then
			if not lastFalse then
				lastFalse = index

				index = index + 1
			else
				inventory[index] = nil

				index = index + 1
			end
		else
			if lastFalse then
				inventory[lastFalse] = item
				inventory[index] = nil

				index = lastFalse + 1
				lastFalse = false
			else
				index = index + 1
			end
		end
	end
end