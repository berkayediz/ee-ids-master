local showPlayerIds = false

-- Toggle the visibility of player IDs when the 'ids' command is executed.
RegisterCommand('ids', function()
    showPlayerIds = not showPlayerIds
    --TriggerEvent('cc-rpchat:addMessage', {
    --    color = {255, 0, 0},
    --    multiline = true,
    --    args = {'[Server]', 'Player IDs are now ' .. (showPlayerIds and 'visible' or 'hidden')}
    --})
end)

-- Main loop to draw player IDs above characters.
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        if showPlayerIds then
            for _, player in ipairs(GetActivePlayers()) do
                local ped = GetPlayerPed(player)

                if DoesEntityExist(ped) then
                    local distance = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(ped))

                    if distance < 100 then -- The value '100' determines the maximum distance for ID visibility
                        local playerCoords = GetEntityCoords(ped) + vector3(0, 0, 1)

                        DrawText3D(playerCoords, '[IDs: ' .. GetPlayerServerId(player) .. ' - ' .. GetPlayerName(player) .. ']')
                    end
                end
            end
        end
    end
end)

-- Function to draw text in 3D world space.
function DrawText3D(coords, text)
    local onScreen, x, y = World3dToScreen2d(coords.x, coords.y, coords.z)

    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextCentre(1)

        SetDrawOrigin(coords, 0)
        BeginTextCommandDisplayText('STRING')
        AddTextComponentSubstringPlayerName(text)
        EndTextCommandDisplayText(0, 0)
        ClearDrawOrigin()
    end
end

-- Thread to hide player IDs after every 5 seconds.
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000) -- Wait for 5000 milliseconds (5 seconds)
        showPlayerIds = false -- Hide player IDs
    end
end)