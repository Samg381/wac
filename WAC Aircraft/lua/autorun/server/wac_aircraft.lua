
include "wac/aircraft.lua"

AddCSLuaFile("autorun/client/wac_aircraft.lua");
AddCSLuaFile("autorun/client/wac_aircraft_dev.lua");


wac.aircraft.cvars = {
	startSpeed = CreateConVar("wac_air_startspeed", 1, {FCVAR_ARCHIVE}),
	doubleTick = CreateConVar("wac_air_doubletick", 0, {FCVAR_ARCHIVE}),
}

wac.hook("SetPlayerAnimation", "wac_cl_heliseat_animation", function(pl, anim)
	 if pl:InVehicle() then
	 local v = pl:GetVehicle()
		if string.find(v:GetModel(), "models/nova/airboat_seat") and v:GetNWEntity("wac_aircraft"):IsValid() then 
			local seq = pl:LookupSequence("sit")	
			pl:SetPlaybackRate(1.0)
			pl:ResetSequence(seq)
			pl:SetCycle(0)
			return true
		end
	end
end)

