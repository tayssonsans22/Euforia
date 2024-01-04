-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Hensa = {}
Tunnel.bindInterface("painel", Hensa)
vCLIENT = Tunnel.getInterface("painel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Panel = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PREMIUM
-----------------------------------------------------------------------------------------------------------------------------------------
function Premium(Org)
	local Infos = vRP.Query("panel/GetInformations",{ name = tostring(Org) })[1]

	if Infos["premium"] > 0 then
		local Premium = Infos["premium"] - os.time()
		
		local Days = math.floor(Premium / 86400)

		if Infos["buff"] == true and Days < 1 then
			vRP.Query("panel/UpdateBuff",{ buff = false, name = tostring(Org) })
			vRP.Query("chests/DowngradeChests",{ Name = tostring(Org) })
			vRP.Query("panel/SetPremium",{ premium = 0, name = tostring(Org) })

			local Entitys = vRP.DataGroups(Panel[Passport])
			for Number,v in pairs(Entitys) do
				local Number = parseInt(Number)
				TriggerEvent("Salary:Remove", tostring(Number), "Buff")
			end
		end

		return Days
	else
		return 0
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAINEL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("painel", function(source, Message)
	local Passport = vRP.Passport(source)
	if Passport and Message[1] and Message[1] ~= "Premium" then
		if vRP.HasGroup(Passport, Message[1], 1 or 2 or 3) then
			Panel[Passport] = Message[1]

			local Members = {}
			local Sources = vRP.Players()
			local Entitys = vRP.DataGroups(Panel[Passport])
			local Hierarchy = vRP.Hierarchy(Panel[Passport])
			for Number,v in pairs(Entitys) do
				local Number = parseInt(Number)
				local Identity = vRP.Identity(Number)
				if Identity then
					if vRP.HasPermission(Number, Panel[Passport], 1) then
						Members[#Members + 1] = {
							["name"] = vRP.FullName(Number),
							["phone"] = Identity["Phone"],
							["online"] = Sources[Number],
							["id"] = Number,
							["role"] = Hierarchy[1] or Hierarchy,
							["role_id"] = 1
						}
					else
						Members[#Members + 1] = {
							["name"] = vRP.FullName(Number),
							["phone"] = Identity["Phone"],
							["online"] = Sources[Number],
							["id"] = Number,
							["role"] = Hierarchy[v] or Hierarchy
						}
					end
				end
			end

			local Data = {
				groupName = Panel[Passport],
				members = Members,
				client_role = Entitys[tostring(Passport)]
			}

			vCLIENT.Open(source, Data, Premium(Panel[Passport]), Price)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DIMISS
-----------------------------------------------------------------------------------------------------------------------------------------
function Hensa.Dismiss(Number)
	local source = source
	local Number = parseInt(Number)
	local Passport = vRP.Passport(source)
	if Passport and Panel[Passport] and Number > 1 and Passport ~= Number then
		if vRP.HasPermission(Passport, Panel[Passport], 1) then
			vRP.RemovePermission(Number, Panel[Passport])

			TriggerClientEvent("Notify", source, "verde", "Passaporte removido.", "Sucesso", 5000)

			local Members = {}
			local Sources = vRP.Players()
			local Entitys = vRP.DataGroups(Panel[Passport])
			local Hierarchy = vRP.Hierarchy(Panel[Passport])
			for Number,v in pairs(Entitys) do
				local Number = parseInt(Number)
				local Identity = vRP.Identity(Number)
				if Identity then
					if vRP.HasPermission(Number, Panel[Passport], 1) then
						Members[#Members + 1] = {
							["name"] = vRP.FullName(Number),
							["phone"] = Identity["Phone"],
							["online"] = Sources[Number],
							["id"] = Number,
							["role"] = Hierarchy[1] or Hierarchy,
							["role_id"] = 1
						}
					else
						Members[#Members + 1] = {
							["name"] = vRP.FullName(Number),
							["phone"] = Identity["Phone"],
							["online"] = Sources[Number],
							["id"] = Number,
							["role"] = Hierarchy[v] or Hierarchy
						}
					end
				end
			end

			return Members
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVITE
-----------------------------------------------------------------------------------------------------------------------------------------
function Hensa.Invite(Number)
	local source = source
	local Number = parseInt(Number)
	local Passport = vRP.Passport(source)
	local Identity = vRP.Identity(Passport)
	if Passport and Panel[Passport] and Number > 1 and Passport ~= Number and vRP.Identity(Number) then
		if vRP.HasPermission(Passport, Panel[Passport], 1) then
			if not vRP.HasPermission(Number, Panel[Passport]) then
				vRP.SetPermission(Number, Panel[Passport])

				local Sources = vRP.Players()
				local Entitys = vRP.DataGroups(Panel[Passport])
				local Identity = vRP.Identity(Number)

				return {
					["name"] = vRP.FullName(Number),
					["phone"] = Identity["Phone"],
					["online"] = Sources[Number],
					["id"] = Number,
					["role"] = vRP.Hierarchy(Panel[Passport])[Entitys[tostring(Number)]]
				}
			else
				TriggerClientEvent("Notify", source, "amarelo", "Passaporte <b>"..parseInt(Number).."</b> já pertence ao grupo.", "Atenção", 5000)
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- HIERARCHY
-----------------------------------------------------------------------------------------------------------------------------------------
function Hensa.Hierarchy(OtherPassport, Mode)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Panel[Passport] and OtherPassport > 1 and Passport ~= OtherPassport and vRP.Identity(OtherPassport) then
		if vRP.HasPermission(Passport, Panel[Passport], 1) then
			if (not vRP.HasPermission(OtherPassport, Panel[Passport], 1) and not vRP.HasPermission(OtherPassport, Panel[Passport], 2)) or (Mode == "Demote" and not vRP.HasPermission(OtherPassport, Panel[Passport], 1)) then
				vRP.SetPermission(OtherPassport, Panel[Passport], nil, Mode)

				local Entitys = vRP.DataGroups(Panel[Passport])
				return { vRP.Hierarchy(Panel[Passport])[Entitys[tostring(OtherPassport)]] }
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRANSACTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
function Hensa.Transactions()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Panel[Passport] then
		local Infos = vRP.Query("panel/GetInformations",{ name = Panel[Passport] })
		local Bank = 0

		if Infos and Infos[1] then
			Bank = Infos[1]["bank"] or 0
		end

		local Transactions = vRP.Query("panel/GetTransactions",{ name = Panel[Passport] }) or {}
		return {
			["Balance"] = Bank,
			["Transactions"] = Transactions
		}
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- WITHDRAW
-----------------------------------------------------------------------------------------------------------------------------------------
function Hensa.Withdraw(Value)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Panel[Passport] and (vRP.HasPermission(Passport, Panel[Passport], 1) or vRP.HasPermission(Passport, Panel[Passport], 2)) then
		local Value = tonumber(Value)
		local Result = vRP.Query("panel/GetInformations",{ name = Panel[Passport] })[1]["bank"]
		if Value <= Result and Value > 0 then
			vRP.Query("panel/InsertTransaction",{ name = Panel[Passport], Type = "exit", Value = Value })
			vRP.Query("panel/DowngradeBank",{ name = Panel[Passport], Value = Value })

			vRP.GenerateItem(Passport, "dollars", Value, true)

			local Bank = vRP.Query("panel/GetInformations",{ name = Panel[Passport] })[1]["bank"]
			local Transactions = vRP.Query("panel/GetTransactions",{ name = Panel[Passport] })
			return {
				["Balance"] = Bank,
				["Transactions"] = Transactions
			}
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEPOSIT
-----------------------------------------------------------------------------------------------------------------------------------------
function Hensa.Deposit(Value)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Panel[Passport] and (vRP.HasPermission(Passport, Panel[Passport], 1) or vRP.HasPermission(Passport, Panel[Passport], 2)) then
		local Value = tonumber(Value)
		local Inventory = vRP.ItemAmount(Passport, "dollars")
		if Value <= Inventory then
			if vRP.PaymentFull(Passport, parseInt(Value)) then
				vRP.Query("panel/InsertTransaction",{ name = Panel[Passport], Type = "entry", Value = Value })
				vRP.Query("panel/UpgradeBank",{ name = Panel[Passport], Value = Value })

				local Bank = vRP.Query("panel/GetInformations",{ name = Panel[Passport] })[1]["bank"]
				local Transactions = vRP.Query("panel/GetTransactions",{ name = Panel[Passport] })
				return {
					["Balance"] = Bank,
					["Transactions"] = Transactions
				}
			end
		else
			TriggerClientEvent("Notify", source, "vermelho", "<b>"..itemName("dollars").."</b> insuficientes.", "Aviso", 5000)
			return
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUY
-----------------------------------------------------------------------------------------------------------------------------------------
function Hensa.Buy()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Panel[Passport] and (vRP.HasPermission(Passport, Panel[Passport], 1) or vRP.HasPermission(Passport, Panel[Passport], 2)) then
		if vRP.PaymentFull(Passport, parseInt(Price)) then
			local Seconds = os.time() + (86400 * 30)

			vRP.Query("panel/UpdateBuff",{ buff = true, name = Panel[Passport] })
			vRP.Query("chests/DowngradeChests",{ Name = Panel[Passport] })
			vRP.Query("panel/SetPremium",{ premium = Seconds, name = Panel[Passport] })

			local Entitys = vRP.DataGroups(Panel[Passport])
			for Number, v in pairs(Entitys) do
				local Number = parseInt(Number)
				TriggerEvent("Salary:Add", tostring(Number), "Buff")
			end
		end
	end

	return Premium(Panel[Passport])
end