/*
 * Bibliography
 * 'simplebhop.smx' by ProdigySim
 */
#include <sourcemod>
#include <sdktools>
#define JOCKEY 5

public OnPluginStart()
{	
}

public Action:OnPlayerRunCmd(client, &buttons, &impulse, Float:vel[3], Float:angles[3], &weapon)
{
	new zombieClass = GetEntProp(client, Prop_Send, "m_zombieClass");
	if(zombieClass == JOCKEY)
	{
		new flags = GetEntityFlags(client);
		if(!(flags & FL_ONGROUND))
		{
			buttons &= ~IN_JUMP;
		}
	}
	return Plugin_Continue;
}
