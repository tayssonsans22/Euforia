-- CLIENT CONFIGURATION
config_cl = {
    joinProximity = 25,                 -- Proximity to draw 3D text and join race
    joinKeybind = 38,                   -- Keybind to join race ("E" by default)
    joinDuration = 30000,               -- Duration in ms to allow players to join the race
    freezeDuration = 5000,              -- Duration in ms to freeze players and countdown start (set to 0 to disable)
    checkpointProximity = 25.0,         -- Proximity to trigger checkpoint in meters
    checkpointRadius = 25.0,            -- Radius of 3D checkpoints in meters (set to 0 to disable cylinder checkpoints)
    checkpointHeight = 10.0,            -- Height of 3D checkpoints in meters
    checkpointBlipColor = 3,            -- Color of checkpoint map blips and navigation (see SetBlipColour native reference)
    hudEnabled = true,                  -- Enable racing HUD with time and checkpoints
    hudPosition = vec(0.015,0.625),     -- Screen position to draw racing HUD
    vehCollision = false,               -- Set true to leave vehicles with collision during the race and false to leave without collision
    vehAlpha = true,                    -- Set true to make the vehicle apha (transparent) when collision-free mode is activated or false to make the vehicle without alpha mode (no transparency)
    alphaValue = 200                    -- Put the transparency value you want to make the vehicle, if the alpha vehicle mode is activated, change it between 0 and 255
}

-- SERVER CONFIGURATION
config_sv = {
    finishTimeout = 180000,             -- Timeout in ms for removing a race after winner finishes
    notifyOfWinner = true,              -- Notify all players of the winner (false will only notify the winner)
    framework = "creative_network",
    command = "races",
    perm = "Admin"
}