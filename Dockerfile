FROM bitnami/minideb:buster

RUN apt-get update -qq \
  && apt-get install -y --no-install-recommends \
  lib32gcc1 \
  wget \
  ca-certificates \
  && rm -rf /var/lib/apt/lists/*

RUN useradd -m steam
WORKDIR /home/steam
USER steam

# Install steamcd and cs 1.6
RUN wget -nv https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && \
    tar -xvzf steamcmd_linux.tar.gz

#RUN /home/steam/steamcmd.sh +login anonymous +force_install_dir /home/steam/cs16 +app_update 90 validate +quit
RUN /home/steam/steamcmd.sh +login anonymous +force_install_dir /home/steam/cs16 +app_update 70 validate +quit || :
RUN /home/steam/steamcmd.sh +login anonymous +force_install_dir /home/steam/cs16 +app_update 10 validate +quit || :
RUN /home/steam/steamcmd.sh +login anonymous +force_install_dir /home/steam/cs16 +app_update 90 validate +quit

RUN mkdir -p ~/.steam && ln -s ~/linux32 ~/.steam/sdk32

WORKDIR /home/steam/cs16

# Make dirs
RUN mkdir -p cstrike/addons/metamod/dlls && mkdir -p cstrike/addons/dproto && mkdir -p cstrike/addons/amxmodx


# Add metamod
COPY --chown=steam:steam metamod_i386.so cstrike/addons/metamod/dlls/
COPY --chown=steam:steam metamod.so cstrike/addons/metamod/dlls/
COPY --chown=steam:steam plugins.ini cstrike/addons/metamod/plugins.ini

# Add dproto
COPY --chown=steam:steam dproto/bin/Linux/dproto_i386.so cstrike/addons/dproto/dproto_i386.so
COPY --chown=steam:steam dproto/dproto.cfg cstrike/dproto.cfg

# Add AMX_MODX and CSDM
COPY --chown=steam:steam amxmodx/addons/amxmodx cstrike/addons/amxmodx

# Add bots
COPY --chown=steam:steam podbot cstrike/addons/podbot
COPY --chown=steam:steam liblist.gam cstrike/

RUN mkdir cstrike/addons/plugins
COPY --chown=steam:steam podbot30/podbotmenu cstrike/addons/plugins

# Copy ESL configs  
COPY --chown=steam:steam *.cfg cstrike/

# Copy Map rotation settings
COPY --chown=steam:steam *.txt cstrike/

# Install aim maps
COPY --chown=steam:steam AimMapCs1.6/cstrike cstrike/

EXPOSE 27015/tcp
EXPOSE 27015/udp

CMD ./hlds_run  -game cstrike -strictportbind -autoupdate -ip 0.0.0.0 +sv_lan 0 +map cs_estate -maxplayers 32 +log on +mp_logecho 1
