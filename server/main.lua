local QBCore = exports[Config.Core]:GetCoreObject()

local function RelieveStress(src, amount)
    local Player = QBCore.Functions.GetPlayer(src)
    local Stress = Player.PlayerData.metadata['stress']
    if not Stress then
        Player.PlayerData.metadata['stress'] = 0
        Stress = Player.PlayerData.metadata['stress']
    end

    if Stress - amount < 0 then
        Stress = 0
    else
        Stress = Player.PlayerData.metadata['stress'] - amount
    end

    Player.Functions.SetMetaData('stress', Stress)
    TriggerClientEvent('hud:client:UpdateStress', src, Stress)
    triggerNotify(src, 'You feel more relaxed', 'success')
end

RegisterServerEvent('brave-Hookers:startBlowjob', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Cash = Player.PlayerData.money.cash
    local Price = Config.BlowJobPrice

    if Cash >= Price then
        Player.Functions.RemoveMoney('cash', Price)
        TriggerClientEvent('brave-Hookers:startBlowjobAnim', source)
        RelieveStress(src, math.random(10, 30))
    else
        triggerNotify(src, 'You do not have enough money', 'error')
        TriggerClientEvent('brave-Hookers:noMoney', src)
    end
end)

RegisterServerEvent('brave-Hookers:startSex', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Cash = Player.PlayerData.money.cash
    local Price = Config.SexPrice

    if Cash >= Price then
        Player.Functions.RemoveMoney('cash', Price)
        TriggerClientEvent('brave-Hookers:startSexAnim', source)
        RelieveStress(src, math.random(20, 50))
    else
        triggerNotify(src, 'You do not have enough money', 'error')
        TriggerClientEvent('brave-Hookers:noMoney', src)
    end
end)

print("^2Hooker Script by ^1MARFY^7")
