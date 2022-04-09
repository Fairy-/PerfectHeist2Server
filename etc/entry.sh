#!/bin/bash
CONFIGFILE=${STEAMAPPDIR}/PerfectHeist2/Saved/Config/LinuxServer/Game.ini

if [ ! -f "$CONFIGFILE" ]; then
  mkdir -p ${STEAMAPPDIR}/PerfectHeist2/Saved/Config/LinuxServer/
  
echo -e "[Server]\n" \
        "Name=${SERVERNAME}\n" \
        "bots=0\n" \
        "pw=${PWENABLED}\n" \
        "pws=${PASSWORD}\n" \
	"[Advanced]\n" \
	"infiniteCopRespawns=${INFINITE_COP_RESPAWNS}\n" \
	"minimumStolenAmount=${MINIMUM_STOLEN_AMOUNT}\n" \
	"copPercentage=${COP_PERCENTAGE}\n" \
	"ignoreTeamLimits=${IGNORE_TEAM_LIMITS}\n" \
	"combatfireProtected=${COMBAT_FIRE_PROTECTED}\n" \
	"noRandomKills=${NO_RANDOM_KILLS}\n" \
	"copRespawnAfterNpcKill=${COP_RESPAWN_NPC_KILL}\n" \
	"CopNpcsKillReward=${COP_NPC_KILL_REWARD}\n" \
	"overtime=${OVERTIME}\n" \
	"overtimeduration=${OVERTIME_DURATION}\n" \
	"roundtime=${ROUNDTIME}\n" \
	"RobberRespawns=${ROBBER_RESPAWNS}\n" \
	"copsCantBeFired=${COPS_CANTBE_FIRED}\n" \
	"SteamTickets=${STEAM_TICKETS}\n" \
	"allowTP=${ALLOW_TP}\n" \
	"sprintingStamina=${SPRINTING_STAMINA}\n" \
	"noSprinting=${NO_SPRINTING}" > $CONFIGFILE

  chown -R "${USER}:${USER}" $CONFIGFILE
fi
bash ${HOME}/steamcmd/steamcmd.sh +force_install_dir ${STEAMAPPDIR} +login anonymous +app_update 1964150 +quit
${STEAMAPPDIR}/PerfectHeist2/Binaries/Linux/PerfectHeist2Server ${MAPNAME} -Port=${SERVER_PORT} -QueryPort=${QUERY_PORT}
