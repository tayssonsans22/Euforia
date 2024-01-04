-----------------------------------------------------------------------------------------------------------------------------------------
-- FRAMEWORK
-----------------------------------------------------------------------------------------------------------------------------------------
Framework = {
	["creative_network"] =  {
		Passport = function(source)
			return vRP.Passport(source)
		end,

        Query = function(Prepare,Query)
			return vRP.Query(Prepare,Query)
		end,

		Execute = function(Prepare,Query)
            return vRP.Query(Prepare,Query)
        end,

        HasGroup = function(Passport,perm)
            return vRP.HasGroup(Passport,perm)
        end,

        Source = function(Passport)
            return vRP.Source(Passport)
        end,

        Identity = function(Passport)
            return vRP.Identity(Passport)
        end,

        Request = function(source,Message)
            return vRP.Request(source,Message)
        end,

        Payment = function(Passport,Price)
            return vRP.PaymentGems(Passport,Price)
        end,

        Notify = function(source,Type,Message,Time,Title)
            return TriggerClientEvent("Notify",source,Type,Message,Time,Title)
        end,

        NotifyC = function(Type,Message,Time,Title)
            return TriggerEvent("Notify",Type,Message,Time,Title)
        end,

        HudControl = function(Bool)
            return TriggerEvent("hud:Active",Bool)
        end
	},
	["creative_v5"] =  {
		Passport = function(source)
			return vRP.getUserId(source)
		end,

        Query = function(Prepare,Query)
			return vRP.query(Prepare,Query)
		end,

		Execute = function(Prepare,Query)
            return vRP.execute(Prepare,Query)
        end,

        HasGroup = function(Passport,perm)
            return vRP.hasGroup(Passport,perm)
        end,

        Source = function(Passport)
            return vRP.userSource(Passport)
        end,

        Identity = function(Passport)
            return vRP.userIdentity(Passport)
        end,

        Request = function(source,Message)
            return vRP.request(source,Message)
        end,

        Payment = function(Passport,Price)
            return vRP.paymentGems(Passport,Price)
        end,

        Notify = function(source,Type,Message,Time,Title)
            return TriggerClientEvent("Notify",source,Type,Message,Time,Title)
        end,

        NotifyC = function(Type,Message,Time,Title)
            return TriggerEvent("Notify",Type,Message,Time,Title)
        end,

        HudControl = function(Bool)
            return TriggerEvent("hud:Active",Bool)
        end
	},
	["vrpex"] =  {
		Passport = function(source)
			return vRP.getUserId(source)
		end,

        Query = function(Prepare,Query)
			return vRP.query(Prepare,Query)
		end,

		Execute = function(Prepare,Query)
            return vRP.execute(Prepare,Query)
        end,

        HasGroup = function(Passport,perm)
            return vRP.hasPermission(Passport,perm)
        end,

        Source = function(Passport)
            return vRP.getUserSource(Passport)
        end,

        Identity = function(Passport)
            return vRP.getUserIdentity(Passport)
        end,

        Request = function(source,Message)
            return vRP.request(source,Message)
        end,

        Payment = function(Passport,Price)
            return vRP.tryFullPayment(Passport,Price)
        end,

        Notify = function(source,Type,Message,Time,Title)
            return TriggerClientEvent("Notify",source,Type,Message,Time,Title)
        end,

        NotifyC = function(Type,Message,Time,Title)
            return TriggerEvent("Notify",Type,Message,Time,Title)
        end,

        HudControl = function(Bool)
            return TriggerEvent("hud:Active",Bool)
        end
	}
}