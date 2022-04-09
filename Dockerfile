FROM cm2network/steamcmd:root

ENV STEAMAPPID 1964150
ENV STEAMAPP perfectheist2 
ENV STEAMAPPDIR "${HOMEDIR}/${STEAMAPP}-dedicated"

#Game Settings
ENV MAPNAME "NewYorkCity"
ENV SERVERNAME "Dedicated Server"
ENV PWENABLED "false"
ENV PASSWORD "none"

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
