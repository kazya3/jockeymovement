/*
 * Bibliography
 * 'simplebhop.smx' by ProdigySim
 */
#pragma semicolon 1
#define JOCKEY 5

#include <sourcemod>
#include <sdktools>

new Handle:hCvarAirAccelerate;

public OnPluginStart() {	
	hCvarAirAccelerate = FindConVar("sv_airaccelerate");
}

public OnPluginEnd() {
	ResetConVar(hCvarAirAccelerate);
}
public Action:OnPlayerRunCmd(client, &buttons, &impulse, Float:vel[3], Float:angles[3], &weapon) {
	new zombieClass = GetEntProp(client, Prop_Send, "m_zombieClass");
	if(zombieClass == JOCKEY) {		
		// Auto bhops
		new flags = GetEntityFlags(client);
		if(!(flags & FL_ONGROUND))
		{
			buttons &= ~IN_JUMP;
		}
		
		// High air acceleration
		new cvarFlags = GetConVarFlags(hCvarAirAccelerate);
		SetConVarFlags(hCvarAirAccelerate, cvarFlags & ~FCVAR_NOTIFY);
		SetConVarInt(hCvarAirAccelerate, 100);
		SetConVarFlags(hCvarAirAccelerate, cvarFlags & FCVAR_NOTIFY);
	} 
	
	else {
		ResetConVar(hCvarAirAccelerate);	
	}
	return Plugin_Continue;
}
