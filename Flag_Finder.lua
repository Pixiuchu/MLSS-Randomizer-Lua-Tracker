console.clear()
local dictOld = {}
local dict = {}

function equals(o1, o2, ignore_mt)
    if o1 == o2 then return true end
    local o1Type = type(o1)
    local o2Type = type(o2)
    if o1Type ~= o2Type then return false end
    if o1Type ~= 'table' then return false end

    if not ignore_mt then
        local mt1 = getmetatable(o1)
        if mt1 and mt1.__eq then
            --compare using built in method
            return o1 == o2
        end
    end

    local keySet = {}

    for key1, value1 in pairs(o1) do
        local value2 = o2[key1]
        if value2 == nil or equals(value1, value2, ignore_mt) == false then
			if value1 == nil then
				value1 = 0
			end
			if value2 == nil then
				value2 = 0
			end
			local keyaddress = string.format("0x%X", key1)
			local value1hex = string.format("0x%02X", value1)
			local value2hex = string.format("0x%02X", value2)
			local preresult = value1hex - value2hex
			if preresult <0 then preresult = preresult*-1 end
			local bitchange = 0
			if preresult == 0x01 then bitchange = 0 
			elseif preresult == 0x02 then bitchange = 1 
			elseif preresult == 0x04 then bitchange = 2 
			elseif preresult == 0x08 then bitchange = 3 
			elseif preresult == 0x10 then bitchange = 4 
			elseif preresult == 0x20 then bitchange = 5 
			elseif preresult == 0x40 then bitchange = 6 
			elseif preresult == 0x80 then bitchange = 7
			else bitchange = 255 end
			
			local finalprint = nil
			
			if bitchange ~= 255 then 
				-- example: BlockStardustFields1 = {1, 0x4564, "EWRAM", 0}, -- Stardust Fields Room 1 Block 1
				-- finalprint = print("block_" .. keyaddress .. "_" .. bitchange .. " = {1, " .. keyaddress .. ", \"EWRAM\", " .. bitchange .. "},") -- value2hex .. " -> " .. value1hex .. " (bit: " .. bitchange ..")")
				finalprint = print(keyaddress .. "\t" .. bitchange)
			else
				finalprint = print(keyaddress .. ": " .. value2hex .. " -> " .. value1hex .. " (multiple bits)")
			end
			
            return finalprint
        end
        keySet[key1] = true
    end

    for key2, _ in pairs(o2) do
        if not keySet[key2] then return false end
    end
    return true
end

while true do
    dictOld = dict
    dict = memory.read_bytes_as_dict(0x4560, 100, "EWRAM")
    
	equals(dict, dictOld, false)
	
	
    -- if string_d ~= string_do then
    --     console.clear()
    --     print(dict)
    --     print(dictOld)
    -- else
    --     console.clear()
    --     print("Equal!")
    --     print(string_do)
    --     print(string_d)
    -- end
    emu.frameadvance();
end  