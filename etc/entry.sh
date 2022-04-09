#!/bin/bash
CONFIGFILE=${STEAMAPPDIR}/PerfectHeist2/Saved/Config/LinuxServer/Game.ini

if [ ! -f "$CONFIGFILE" ]; then
  mkdir -p ${STEAMAPPDIR}/PerfectHeist2/Saved/Config/LinuxServer/
  echo -e "[Server]\n" \
       "Name=${SERVERNAME}\n" \
       "bots=0\n" \
       "pw=${PWENABLED}\n" \
       "pws=${PASSWORD}" > $CONFIGFILE
  chown -R "${USER}:${USER}" $CONFIGFILE
fi

${STEAMAPPDIR}/PerfectHeist2/Binaries/Linux/PerfectHeist2Server ${MAPNAME} -Port=${SERVER_PORT} -QueryPort=${QUERY_PORT}
