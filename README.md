# Counter Strike 1.6 server on Docker

Works on both client 47 and 48



## Currently running plugins:

Metamod v1.20  2013-02-16

 [  1] dproto_EF, v0.9.582, 2017-09-22, by Crock
 
 [  2] AMX Mod X, v1.8.2, Feb 14 2013, by AMX Mod X Dev Team, see http://www.amxmodx.org
 
 [  3] POD-Bot mm, vV3B22, May 10 2012, by Count Floyd & Bots United, see http://www.bots-united.com
 
 [  4] MySQL, v1.8.2, Feb 14 2013, by AMX Mod X Dev Team, see http://www.amxmodx.org/
 
 [  5] Fun, v1.8.2, Feb 14 2013, by AMX Mod X Dev Team, see http://www.amxmodx.org
 
 [  6] CStrike, v1.8.2, Feb 14 2013, by AMX Mod X Dev Team, see http://www.amxmodx.org
 
 [  7] CSX, v1.8.2, Feb 14 2013, by AMX Mod X Dev Team, see http://www.amxmodx.org/
 
 [  8] FakeMeta, v1.8.2, Feb 14 2013, by AMX Mod X Dev Team, see http://www.amxmodx.org
 
 [  9] CSDM2, v2.1.3c-KWo, Jun  2 2013, by CSDM Team, see http://www.bailopan.net/
 

## Example
```
docker run -d -p 27015:27015 -p 27015:27015/udp --name cs16-server -v your_cs16_server.cfg:/home/steam/cs16/cstrike/server.cfg coquinone/counterstrike-1.6
```
