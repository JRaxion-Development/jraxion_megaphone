if GetResourceState('ox_inventory') == 'started' then
    -- if there is ox_inventory, then we need to register the item in the inventory
else
    local jraxionlib = exports.jraxion_lib:Core()

    jraxionlib.Inventory.RegisterUsableItem('megaphone', function(source)
        TriggerClientEvent('jraxion_megaphone:use', source)
    end)
end

-- rate-limit + type-check: applies the submix broadcast per sender so a
-- modified client can't spam toggles at every player
local lastSubmix = {}

RegisterNetEvent('jraxion_megaphone:applySubmix', function(bool)
    local src = source
    if type(bool) ~= 'boolean' then return end
    local now = GetGameTimer()
    if lastSubmix[src] and now - lastSubmix[src] < 250 then return end
    lastSubmix[src] = now
    TriggerClientEvent('jraxion_megaphone:updateSubmixStatus', -1, bool, src)
end)

AddEventHandler('playerDropped', function()
    lastSubmix[source] = nil
end)
