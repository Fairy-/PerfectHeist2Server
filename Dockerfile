FROM cm2network/steamcmd:root

ENV STEAMAPPID 1964150
ENV STEAMAPP perfectheist2 
ENV STEAMAPPDIR "${HOMEDIR}/${STEAMAPP}-dedicated"

#Game Settings
ENV MAPNAME "NewYorkCity"
ENV SERVERNAME "Dedicated Server"
ENV PWENABLED "false"
ENV PASSWORD "none"

#Advanced settings
ENV INFINITE_COP_RESPAWNS "false"
ENV MINIMUM_STOLEN_AMOUNT 50000
ENV COP_PERCENTAGE 40
ENV IGNORE_TEAM_LIMITS "false"
ENV COMBAT_FIRE_PROTECTED "true"
ENV NO_RANDOM_KILLS "false"
ENV COP_RESPAWN_NPC_KILL "true"
ENV COP_NPC_KILL_REWARD 0
ENV OVERTIME "true"
ENV OVERTIME_DURATION 60
ENV ROUNDTIME 500
ENV ROBBER_RESPAWNS 2
ENV COPS_CANTBE_FIRED "false"
ENV STEAM_TICKETS "false"
ENV ALLOW_TP "false"
ENV SPRINTING_STAMINA "true"
ENV NO_SPRINTING "false"

#Server Settings
ENV SERVER_PORT 7777
ENV QUERY_PORT 27030

ADD etc/entry.sh "${HOMEDIR}/entry.sh"

RUN mkdir ${STEAMAPPDIR} && \
    chown -R "${USER}:${USER}" "${HOMEDIR}/entry.sh" "${STEAMAPPDIR}" && \
    chmod +x "${HOMEDIR}/entry.sh" && \
    ./steamcmd.sh +force_install_dir ${STEAMAPPDIR} +login anonymous +app_update 1964150 +quit && \
    chown -R "${USER}:${USER}" "${STEAMAPPDIR}" 

USER ${USER}

# Switch to workdir
WORKDIR ${HOMEDIR}

CMD ["bash", "entry.sh"] 

# Expose ports
EXPOSE 27030/udp 
EXPOSE	7777/udp
