# Perfect Heist 2 Docker Image
This is a rough docker image to set up a Perfect Heist 2 Dedicated Server.

[Here is the Steam Link to the game.](https://store.steampowered.com/app/1521580/Perfect_Heist_2/)

## Configuration
To configure the server use the environment variables which will create a server config.
Note: These are **not** the game defaults, just ones which I think make the session interesting.

| Variable             |  Defaults         | Description
|----------------------|-------------------|------------
|SERVER_PORT           | 7777              | connection port, this is udp
|QUERY_PORT            | 27030             | query port so listing in browser works, this is udp
|MAPNAME               |"NewYorkCity"      | Map to load on server startup
|SERVERNAME            |"Dedicated Server" | Servername in the server list
|PWENABLED             |"false"            | true or false, password protect the server
|PASSWORD              | "none"            | Password to connect to the server
|INFINITE_COP_RESPAWNS | "false"           | infinite respawns for cops
|MINIMUM_STOLEN_AMOUNT | 50000             | minimum amount of cash robbers need to steal
|COP_PERCENTAGE        | 40                | percentage of players forced into the cop team as long as "ignoreTeamLimits" is false
|IGNORE_TEAM_LIMITS    |"false"            | if true, players can join any team they want no matter how many players are already in there
|COMBAT_FIRE_PROTECTED | "true"            | if true, cops cant be fired if they hit NPCs while in a firefight against a robber
|NO_RANDOM_KILLS       | "false"           | if true, cops are only allowed to kill robbers that already performed suspicous actions
|COP_RESPAWN_NPC_KILL  | "true"            | if true, cops only die and no longer get fired after killing NPCs
|COP_NPC_KILL_REWARD   | 0                 | amount of saved money robbers gain when a cop kills an NPC
|OVERTIME              | "true"            | enable overtime, true or false
|OVERTIME_DURATION     | 60                | duration of overtime in seconds
|ROUNDTIME             | 500               | duration of round time in seconds
|ROBBER_RESPAWNS       | 2                 | number of respawns for robbers
|COPS_CANTBE_FIRED     | "false"           | if true, cops can kill NPCs without consequences
|STEAM_TICKETS         | "false"           | if true, steam users with bans are blocked, but it might lead to connection issues of innocent players if Steam servers are down
|ALLOW_TP              | "false"           | allow third person
|SPRINTING_STAMINA     | "true"            | if true, sprinting costs stamina
|NO_SPRINTING          | "false"           | if true, noone can sprint
