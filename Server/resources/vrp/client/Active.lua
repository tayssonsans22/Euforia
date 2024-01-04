-----------------------------------------------------------------------------------------------------------------------------------------
-- ACTIVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vRP:Active")
AddEventHandler("vRP:Active", function(Passport, Name)
	SetDiscordAppId(1173033637390848110)
	SetDiscordRichPresenceAsset("euforia")
	SetRichPresence("#"..Passport.." "..Name)
	SetDiscordRichPresenceAssetSmall("euforia")
	SetDiscordRichPresenceAssetText("Euforia Roleplay - [BETA]")
	SetDiscordRichPresenceAssetSmallText("Euforia Roleplay")
	SetDiscordRichPresenceAction(0, "Jogue agora", "https://tinyurl.com/3dywvs42")
	SetDiscordRichPresenceAction(1, "Nosso Discord", "https://discord.gg/euforiagg")
end)