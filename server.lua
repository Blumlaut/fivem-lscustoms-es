useES = true


local tbl = {
        [1] = {locked = false, player = -1},
        [2] = {locked = false, player = -1},
        [3] = {locked = false, player = -1},
        [4] = {locked = false, player = -1},
        [5] = {locked = false, player = -1},
        [6] = {locked = false, player = -1},
        [7] = {locked = false, player = -1},
        [8] = {locked = false, player = -1},
        [9] = {locked = false, player = -1},
        [10] = {locked = false, player = -1},
		[11] = {locked = false, player = -1},
      }

	  
	  
Citizen.CreateThread(function()
	  
RegisterServerEvent('fx_customs:LockGarage')
AddEventHandler('fx_customs:LockGarage', function(b,garage,player)
	tbl[tonumber(garage)].locked = b
	tbl[tonumber(garage)].player = player
	TriggerClientEvent('LockGarage',-1,tbl)
end)


function openGarage()
	for theId,theValues in pairs(tbl) do
		if tbl[theId].locked == true and tbl[theId].player ~= -1 and not GetPlayerName(tbl[theId].player) then
			local pl = GetPlayerName(tbl[theId].player)
			tbl[theId].locked = false
			TriggerClientEvent('LockGarage',-1,tbl)
			Citizen.Trace("garage closed but player not found, opening..")
		end
	end
	SetTimeout(20000, openGarage)
end
SetTimeout(20000, openGarage)




RegisterServerEvent("fx_customs:payPart")
AddEventHandler('fx_customs:payPart', function(price)

if useES then
	TriggerEvent('es:getPlayerFromId', source, function(ourUser) 
		if ourUser and ourUser.getMoney() >= price then
			ourUser.removeMoney(price)
		end
	end)
end

end)


end)
