Utils = {}

function Utils.parseInt(Value,Force)
	local Number = tonumber(Value) or 0

	if Force and Number <= 0 then
		Number = 1
	end

	if Number and Number > 0 then
		Number = math.floor(Number)
	end

	return Number
end