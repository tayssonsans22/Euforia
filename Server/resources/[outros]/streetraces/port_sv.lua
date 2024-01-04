-----------------------------------------------------------------------------------------------------------------------------------------
-- FRAMEWORK
-----------------------------------------------------------------------------------------------------------------------------------------
Framework = {
	["creative_network"] =  {
		Passport = function(source)
			return vRP.Passport(source)
		end,

        Name = function(source)
			return GetPlayerName(source)
		end,

        HasGroup = function(Passport,perm)
            return vRP.HasGroup(Passport,perm)
        end,

        GetPayment = function(Passport,Value)
            return vRP.TakeItem(Passport,"dollars",Value,true)
        end,

        SetPayment = function(Passport,Value)
            return vRP.GenerateItem(Passport,"dollars",Value,true)
        end,

        Notify = function(source,Type,Message,Time,Title)
            return TriggerClientEvent("Notify",source,Type,Message,Time,Title)
        end
	},
	["creative_v5"] =  {
		Passport = function(source)
			return vRP.getUserId(source)
		end,

        Name = function(source)
			return GetPlayerName(source)
		end,

        HasGroup = function(Passport,perm)
            return vRP.hasGroup(Passport,perm)
        end,

        GetPayment = function(Passport,Value)
            return vRP.tryGetInventoryItem(Passport,"dollars",Value,true)
        end,

        SetPayment = function(Passport,Value)
            return vRP.generateItem(Passport,"dollars",Value,true)
        end,

        Notify = function(source,Type,Message,Time,Title)
            return TriggerClientEvent("Notify",source,Type,Message,Time,Title)
        end
	},
	["vrpex"] =  {
		Passport = function(source)
			return vRP.getUserId(source)
		end,

        Name = function(source)
			return GetPlayerName(source)
		end,

        HasGroup = function(Passport,perm)
            return vRP.hasPermission(Passport,perm)
        end,

        GetPayment = function(Passport,Value)
            return vRP.tryGetInventoryItem(Passport,"dollars",Value)
        end,

        SetPayment = function(Passport,Value)
            return vRP.giveInventoryItem(Passport,"dollars",Value)
        end,

        Notify = function(source,Type,Message,Time,Title)
            return TriggerClientEvent("Notify",source,Type,Message,Time,Title)
        end
	}
}