/* ==  ==  ==  ==  ==  ==  ==  ==     Change the font to "Times New Roman" with a size of 10 for a good readability     ==  ==  ==  ==  ==  ==  == */

#define PLUGIN	"Server Messages"
#define AUTHOR	"Leon McVeran"
#define VERSION	"v1.5"
#define PDATE	"24th October 2009"

/* ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

Content of Server Messages

	This plugin is not really a new idea. You can download similar plugins on https://forums.alliedmods.net or on www.amxmodx.org.
	This plugin shows important messages, informations or rules on clients. You can add a messages in different languages into a
	file (server_messages.txt). The using of a consecutive numbers is required. You can also send a custom messages to a specific client or group. 

	Special thanks to the members of "Alliedmods - Forum" for some suggestions, solutions and translations.

 ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

Commands

	Valid values for @group (with case ignoring)
	   - for all players: 		@A or @ALL
	   - for all CTs: 		@C, @CT or @COUNTER
	   - for all Ts: 		@T, @TE, @TERROR or @TERRORIST

	amx_print_custom <authid, nick, @group or #userid> <your message> [optional: <mode> <style>]
	     - shows a custom message (defaults: mode - 4, style - 0)
		e.g. "amx_print_msg @T "You are a terrorist" " will shown "You are a terrorist" to all terrorists

	amx_print_msg <authid, nick, @group or #userid> <msg number> [optional: <mode> <style>]
	     - shows a specific message from the server_messages.txt (defaults depends on sm_msg_mode and sm_msg_style)
		e.g. "amx_print_msg @ALL 1" will shown SERVER_MSG_1 to all clients

	amx_print_rule <authid, nick, @group or #userid> <rule number> [optional: <mode> <style>]
	     - shows a specific rule from the server_messages.txt (defaults depends on sm_rule_mode and sm_rule_style)
		e.g. "amx_print_rule @CT 2" will shown SERVER_RULE_2 to all counter terrorists

	amx_print_info <authid, nick, @group or #userid> <info number> [optional: <mode> <style>]
	     - shows a specific information from the server_messages.txt (defaults depends on sm_info_mode and sm_info_style)
		e.g. "amx_print_info Leon 3" will shown SERVER_INFO_3 to me (Leon)

	amx_list_msg
	     - lists all messages from the server_messages.txt into the console

	amx_list_rule
	     - lists all rules from the server_messages.txt into the console

	amx_list_info
	     - lists all informations from the server_messages.txt into the console

 ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

CVARs

	sm_msg_mode "3"
	     - print location of the messages (0 - console, 1 - chat, 2 - center, 3 - hud)

	sm_rule_mode "2"
	     - print location of the rules

	sm_info_mode "2"
	     - print location of the informations

	sm_msg_show "1"
	     - display automatically the messages from the server_messages.txt

	sm_rule_show "1"
	     - display automatically the rules from the server_messages.txt

	sm_info_show "1"
	     - display automatically the informations from the server_messages.txt

	sm_min_activity "4320"
	     - clients who are longer played than the specified minutes, will not receive the automatically messages. Set sm_min_activity to 0 to disable this feature.

	sm_show_frequency "15"
	     - time in seconds between 2 automatically messages

	sm_show_skip "2"
	     - skip a group of clients who shouldn't receive an automatically message (0 - skip no players, 1 - skip dead players, 2 or higher - skip live players)

	sm_show_time "8"
	     - duration in seconds of a hud messages

 ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

Changelog

	v1.0alpha	9.Apr.2009	Start of this project
	v1.0beta	22.Apr.2009	Added
				     - messages in tutor-style (imported function from Condition Zero)
	v1.0	24.Apr.2009	Added
				     - a function to shown random messages to dead players
				Improved
				     - check if exists a messages (If we reached the second language the check will be aborted.)
	v1.1	27.Apr.2009	Bugfixed
				     - a small fault in the "cmd_server_list"-function
				Added
				     - a new CVAR "server_rule_prefix" to add a prefix on server rules
				     - now you can set a different mode and style in the commands amx_server_... instead of using the default settings
				     - using of the nvault database to determine player who visit the server first time. for this players will be replaced 
				       the tutor messages (mode 4) with hud messages (mode 3). set the CVAR "server_restart_msg" to 1 to show a 
				       message on affected players after they joined a team.
				Improved
				     - using of MSG_ONE_UNREALIBLE instead of MSG_ONE (Thanks xPaw)
	v1.2	5.May.2009	Bugfixed
				     - If you used one of the "amx_list_..." commands you got a channel overflow
				Improved
				     - the automatically messages will be shown randomly
				     - some other functions to improve the cpu performance
	v1.3	12.Jun.2009	Added
				     - some placeholders, which you can use in the server_messages.txt (#hostname#, #playername#, #nextmap#, #currentmap#, #time#, #timeleft#, #playtime#)
				     - a new CVAR "server_force_playback" to force playback of the sounds from tutor
	v1.3a	25.Jun.2009	Removed
				     - an additional admin-rights check caused of some problems with the cmd_access.ini
	v1.4	22.Sep.2009	Completely revising of the project to increase the performance. In addition some CVAR's and commands 
				have been renamed because their functions were changed. You will find some remarks to the new CVAR's
				and commands in the sections "CVARs" and "Commands".
	v1.4a	23.Oct.2009	Bugfixed
				     - Added a check on the Remove_TutorMsg-function to solve an fatal error.
	v1.5	24.Oct.2009	Removed
				     - Tutor and all other stuff (Distribution are not allowed!?!? I think so)

 ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==

ToDo

	- nothing ;-)

 ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==
	
FAQ

	Q: Can I add more messages/rules/informations?
	A: Yes of course, open the server_messages.txt (../cstrike/addons/amxmodx/data/lang) and add your message/rule/information.
	     Three things are very important, if you ignore them it could result in an error.
	     1. You must use a consecutive numbering. If you would like to add a new rule and it is exists SERVER_RULE_1,
	         SERVER_RULE_2 and SERVER_RULE_3, you must begin your new rule with SERVER_RULE_4.
	         Example: SERVER_RULE_4 = Bugusing are not allowed.
	     2. You can use maximal 256 chars, for chat and tutor messages maximal 180 chars.
	     3. You must add this rule to every language key

	Q: How I can add the mapname, playername or servername to the messages?
	A: You can use in the messages one of the following placeholders. All placeholders without quotes.
		"#hostname#" - Name of the server
		"#playername#" - Name of the player who got the message
		"#nextmap#" - Name of the next map (required nextmap.amxx)
		"#currentmap#" - Name of the current map (required nextmap.amxx)
		"#time#" - Current date and time
		"#timeleft#" - Left time until mapchange
		"#playtime#" - Session time of the player who got the message

	Q: I want to use russian, chinese or an other language which are not displayed. What can I do?
	A: One of these post can help you.
	      http://forums.alliedmods.net/showpost.php?p=814283&postcount=30
	      http://forums.alliedmods.net/showpost.php?p=815821&postcount=37

 ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  ==  =*/

#include <amxmodx>
#include <amxmisc>
#include <vault>

new const g_szFileName[] = "server_messages.txt"

#define ACCESS_PRINT_MSG 	ADMIN_CHAT
#define ACCESS_LIST_MSG 		ADMIN_ALL

#define TASK_SHOW_MESSAGE 		8000

// Don't modify any defines under this line, otherwise it could lead to an error
#define SM_MESSAGES 	(1<<0)
#define SM_RULES 		(1<<1)
#define SM_INFOS 		(1<<2)

#define SKIP_NOTHING 	0
#define SKIP_DEAD 	(1<<0)
#define SKIP_ALIVE 	(1<<1)
#define SKIP_BOTS 	(1<<2)
#define SKIP_REAL 	(1<<3)

new bool:g_bMsgEnabled[33]
new g_iActivity[33]
new g_iMsgCount
new g_iRuleCount
new g_iInfoCount
new g_szFilePath[64]
new g_szLastMsg[3][16]

new CVAR_msg_mode
new CVAR_msg_show
new CVAR_rule_mode
new CVAR_rule_show
new CVAR_rule_prefix
new CVAR_info_mode
new CVAR_info_show
new CVAR_min_activity
new CVAR_show_frequency
new CVAR_show_skip
new CVAR_show_time

new gMsgSayText

public plugin_init(){
	register_plugin(PLUGIN, VERSION, AUTHOR)
	register_dictionary(g_szFileName)

	if (is_running("czero") || is_running("cstrike")){
		register_event("HLTV", "event_freezetime_start", "a", "1=0", "2=0")

		register_concmd("amx_print_custom", "cmd_custom_print", ACCESS_PRINT_MSG, "<authid, nick, @group or #userid> <your message> [optional: <mode>]")
		register_concmd("amx_print_msg", "cmd_server_print", ACCESS_PRINT_MSG, "<authid, nick, @group or #userid> <msg number> [optional: <mode>]")
		register_concmd("amx_print_rule", "cmd_server_print", ACCESS_PRINT_MSG, "<authid, nick, @group or #userid> <rule number> [optional: <mode>]")
		register_concmd("amx_print_info", "cmd_server_print", ACCESS_PRINT_MSG, "<authid, nick, @group or #userid> <info number> [optional: <mode>]")
		register_concmd("amx_list_msg", "cmd_server_list", ACCESS_LIST_MSG, "- shows a list of all server messages")
		register_concmd("amx_list_rule", "cmd_server_list", ACCESS_LIST_MSG, "- shows a list of all server rules")
		register_concmd("amx_list_info", "cmd_server_list", ACCESS_LIST_MSG, "- shows a list of all server informations")

		CVAR_msg_mode = register_cvar("sm_msg_mode", "3")
		CVAR_msg_show = register_cvar("sm_msg_show", "1")

		CVAR_rule_mode = register_cvar("sm_rule_mode", "2")
		CVAR_rule_show = register_cvar("sm_rule_show", "1")
		CVAR_rule_prefix = register_cvar("sm_rule_prefix", "1")

		CVAR_info_mode = register_cvar("sm_info_mode", "2")
		CVAR_info_show = register_cvar("sm_info_show", "1")

		CVAR_min_activity = register_cvar("sm_min_activity", "4320")
		CVAR_show_frequency = register_cvar("sm_show_frequency", "15")
		CVAR_show_skip = register_cvar("sm_show_skip", "2")
		CVAR_show_time = register_cvar("sm_show_time", "8")
	}
	else{
		new ErrMsg[256]
		format(ErrMsg, 255, "[AMXX] Failed to load %s (only for Counter Strike or Condition Zero)", PLUGIN)
		set_fail_state(ErrMsg)
	}
}

public plugin_cfg(){
	gMsgSayText = get_user_msgid("SayText")

	// Store the path to our used txt-file
	get_datadir(g_szFilePath, 63)
	format(g_szFilePath, 63, "%s/lang/%s", g_szFilePath, g_szFileName)

	new iLanguages
	if (file_exists(g_szFilePath)){
		new szMsg[32], szBuffer[128], szLastMsg[32], fp=fopen(g_szFilePath, "r")
		while (!feof(fp) && iLanguages < 2){
			szBuffer[0]='^0'
			fgets(fp, szBuffer, 127)
			parse(szBuffer, szMsg, 31)
			if (!equali(szMsg, szLastMsg)){

				// Saves the current message for blocking duplicative messages
				copy(szLastMsg, 31, szMsg)

				if (equali(szMsg, "SERVER_MSG_", 11)){
					g_iMsgCount+=1
				}
				else if (equali(szMsg, "SERVER_RULE_", 12)){
					g_iRuleCount+=1
				}
				else if (equali(szMsg, "SERVER_INFO_", 12)){
					g_iInfoCount+=1
				}

				// Stop loop if we reached the second language
				else if (szMsg[0] == '[' && szMsg[3] == ']'){
					iLanguages+=1
				}
			}
		}
		fclose(fp)
	}
	else{
		server_print("%L", LANG_SERVER, "SM_ERROR_FILE")
	}
}

/* == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==
	EVENTS
 == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==*/

public client_authorized(id){
	if (!is_user_bot(id)){
		LoadData(id)
	}
}

public client_disconnect(id){
	if (!is_user_bot(id)){
		SaveData(id)
	}
}

public event_freezetime_start(){
	// Without this event, we can not change the frequency or duration of messages
	remove_task(TASK_SHOW_MESSAGE)
	set_task(get_pcvar_num(CVAR_show_frequency) < get_pcvar_num(CVAR_show_time) ? get_pcvar_float(CVAR_show_time) + 1.0 : get_pcvar_float(CVAR_show_frequency), "func_show_message", TASK_SHOW_MESSAGE, _, _, "b")
}

/* == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==
	COMMANDS
 == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==*/

public cmd_custom_print(id, level, cid){
	if (!cmd_access(id, level, cid, 3)){
		return PLUGIN_HANDLED
	}
	new szTarget[32], szMsg[256], szMode[4], szAdminName[32], szTargetName[32]
	read_argv(1, szTarget, 31)
	read_argv(2, szMsg, 255)
	read_argv(3, szMode, 3)
	get_user_name(id, szAdminName, 31)

	// Check if the third parameter a number or not
	if (strlen(szMode)){
		if (!is_str_num(szMode)){
			client_print(id, print_console, "%L", LANG_PLAYER, "SM_CUSTOM_USAGE")
			return PLUGIN_HANDLED
		}
	}

	// Define mode and style of the message (defaults: mode 2)
	new iMode = strlen(szMode) ? str_to_num(szMode) : 2

	// Let's go, print the messages on clients
	if (szTarget[0] == '@'){
		new iPlayers[32], pNum
		if (get_cmd_targets(id, szTarget, iPlayers, pNum, szTargetName, SKIP_BOTS)){
			for (new p = 0; p < pNum; p++){
				func_print_message(iPlayers[p], szMsg, iMode)
			}
		}
	}
	else{
		new iPlayer = cmd_target(id, szTarget, 8)
		if (!iPlayer) return PLUGIN_HANDLED
		get_user_name(iPlayer, szTargetName, 31)

		func_print_message(iPlayer, szMsg, iMode)
	}

	if (strlen(szTargetName)){
		log_amx("%L", LANG_SERVER, "SM_PRINT_LOG", szAdminName, szTargetName, szMsg, iMode)
	}
	return PLUGIN_HANDLED
}

public cmd_server_print(id, level, cid){
	if (!cmd_access(id, level, cid, 3)){
		return PLUGIN_HANDLED
	}
	new szCommand[32], szTarget[32], szNumber[4], szMode[4], szAdminName[32], szTargetName[32]
	read_argv(0, szCommand, 31)
	read_argv(1, szTarget, 31)
	read_argv(2, szNumber, 3)
	read_argv(3, szMode, 3)
	get_user_name(id, szAdminName, 31)

	// Define which type of message are used
	new szSearchedMsg[20], iMode, bool:bPrefix
	if (equal(szCommand, "amx_print_msg")){
		copy(szSearchedMsg, 19, "SERVER_MSG_")
		iMode = strlen(szMode) ? str_to_num(szMode) : get_pcvar_num(CVAR_msg_mode)
	}
	else if (equal(szCommand, "amx_print_rule")){
		copy(szSearchedMsg, 19, "SERVER_RULE_")
		iMode = strlen(szMode) ? str_to_num(szMode) : get_pcvar_num(CVAR_rule_mode)
		bPrefix = get_pcvar_num(CVAR_rule_prefix) ? true : false
	}
	else if (equal(szCommand, "amx_print_info")){
		copy(szSearchedMsg, 19, "SERVER_INFO_")
		iMode = strlen(szMode) ? str_to_num(szMode) : get_pcvar_num(CVAR_info_mode)
	}

	// Technically we should never get here
	if (!strlen(szSearchedMsg)){
		client_print(id, print_console, "%L", LANG_PLAYER, "SM_ERROR_SEARCH")
		return PLUGIN_HANDLED
	}

	// Check if the second parameter a number or not
	if (!is_str_num(szNumber)){
		client_print(id, print_console, "%L", LANG_PLAYER, "SM_ERROR_NUMBER")
		return PLUGIN_HANDLED
	}

	// Merge the different parameters to define and check the message.
	add(szSearchedMsg, 19, szNumber)
	if (!is_msg_valid(szSearchedMsg)){
		client_print(id, print_console, "%L", LANG_PLAYER, "SM_ERROR_MESSAGE")
		return PLUGIN_HANDLED
	}

	// Let's go, print the messages on clients
	if (szTarget[0] == '@'){
		new iPlayers[32], pNum
		if (get_cmd_targets(id, szTarget, iPlayers, pNum, szTargetName, SKIP_BOTS)){
			for (new p = 0; p < pNum; p++){
				new szMsg[256]
				if (bPrefix){
					format(szMsg, 255, "%L^n%L", iPlayers[p], "SM_RULE_PREFIX", str_to_num(szSearchedMsg[12]), iPlayers[p], szSearchedMsg)
				}
				else{
					format(szMsg, 255, "%L", iPlayers[p], szSearchedMsg)
				}
				func_print_message(iPlayers[p], szMsg, iMode)
			}
		}
	}
	else{
		new iPlayer = cmd_target(id, szTarget, 8)
		if (!iPlayer) return PLUGIN_HANDLED
		get_user_name(iPlayer, szTargetName, 31)

		new szMsg[256]
		if (bPrefix){
			format(szMsg, 255, "%L^n%L", iPlayer, "SM_RULE_PREFIX", str_to_num(szSearchedMsg[12]), iPlayer, szSearchedMsg)
		}
		else{
			format(szMsg, 255, "%L", iPlayer, szSearchedMsg)
		}
		func_print_message(iPlayer, szMsg, iMode)
	}

	if (strlen(szTargetName)){
		log_amx("%L", LANG_SERVER, "SM_PRINT_LOG", szAdminName, szTargetName, szSearchedMsg, iMode)
	}
	return PLUGIN_HANDLED
}

public cmd_server_list(id, level, cid){
	if (!cmd_access(id, level, cid, 1)){
		return PLUGIN_HANDLED
	}
	new szCommand[32]
	read_argv(0, szCommand, 31)

	new iType, iTotalMsg
	if (equal(szCommand, "amx_list_msg")){
		iType = SM_MESSAGES
		iTotalMsg = g_iMsgCount
	}
	else if (equal(szCommand, "amx_list_rule")){
		iType = SM_RULES
		iTotalMsg = g_iRuleCount
	}
	else if (equal(szCommand, "amx_list_info")){
		iType = SM_INFOS
		iTotalMsg = g_iInfoCount
	}

	// Technically we should never get here
	if (!iType){
		client_print(id, print_console, "%L", LANG_PLAYER, "SM_ERROR_SEARCH")
		return PLUGIN_HANDLED
	}

	new param[5]
	param[0] = id				//player id
	param[1] = iType				//msg type
	param[2] = iTotalMsg			//total msg
	param[3] = 0				//current msg
	param[4] = 0				//printed msg
	func_list_messages(param)

	return PLUGIN_HANDLED
}

/* == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==
	FUNCTIONS
 == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==*/

public func_print_message(id, szMsg[], iMode){
	if (is_user_connected(id) && g_bMsgEnabled[id]){
		// Store Messages into a Buffer to replace all placeholders
		new szBuffer[384]
		copy(szBuffer, 383, szMsg)

		// Replace all \n with ^n because it is difficult to type "^" in the console. So you can use \n for a word wrap.
		replace_all(szBuffer, 383, "\n", "^n")

		// Replace placeholders with their expressions
		new szReplacement[64], iSeconds, iMinutes, iHours
		get_cvar_string("hostname", szReplacement, 63)
		replace(szBuffer, 383, "#hostname#", szReplacement)

		get_user_name(id, szReplacement, 63)
		replace(szBuffer, 383, "#playername#", szReplacement)

		get_cvar_string("amx_nextmap", szReplacement, 63)
		replace(szBuffer, 383, "#nextmap#", szReplacement)

		get_mapname(szReplacement, 63)
		replace(szBuffer, 383, "#currentmap#", szReplacement)

		get_time("%m/%d/%Y - %H:%M:%S", szReplacement, 63)
		replace(szBuffer, 383, "#time#", szReplacement)

		iSeconds = get_timeleft()
		format(szReplacement, 63, "%d:%02d", (iSeconds / 60), (iSeconds % 60))
		replace(szBuffer, 383, "#timeleft#", szReplacement)

		iSeconds = get_user_time(id)
		iHours = iSeconds / 3600
		iMinutes = (iSeconds - (iHours * 3600)) / 60
		iSeconds -= ((iHours * 3600) + (iMinutes * 60))
		format(szReplacement, 63, "%d:%02d:%02d", iHours, iMinutes, iSeconds)
		replace(szBuffer, 383, "#playtime#", szReplacement)

		// Create messages and cut all chars over 256
		copy(szMsg, 255, szBuffer)

		switch(iMode){
			case 1: {
				replace_all(szMsg, 255, "^n", " ")
				Create_ChatMsg(id, szMsg)
			}
			case 2: {
				replace_all(szMsg, 255, "^n", " ")
				client_print(id, print_center, szMsg)
			}
			case 3: {
				set_hudmessage(0, 200, 0, 0.05, 0.35, 2, 0.1, get_pcvar_num(CVAR_show_time) < 5 ? 5.0 : get_pcvar_float(CVAR_show_time), 0.02, 0.02, 8)
				show_hudmessage(id, szMsg)
			}
			default: client_print(id, print_console, szMsg)
		}
	}
}

public func_list_messages(param[]){
	new id = param[0]
	if (param[3] < param[2]){

		new szPrint[20], iLen
		if (param[1] == SM_MESSAGES){
			iLen += format(szPrint, 19, "SERVER_MSG_")
		}
		else if (param[1] == SM_RULES){
			iLen += format(szPrint, 19, "SERVER_RULE_")
		}
		else if (param[1] == SM_INFOS){
			iLen += format(szPrint, 19, "SERVER_INFO_")
		}

		for(new i=param[3];i<=param[2];i++){
			new szArg[4]
			num_to_str(i, szArg, 3)
			format(szPrint[iLen], 19 - iLen, szArg)
			if (is_msg_valid(szPrint)){
				if (param[4] == 0){
					if (param[1] == SM_MESSAGES){
						client_print(id, print_console, "^n%L", LANG_PLAYER, "SM_START_MSG_LISTING")
					}
					else if (param[1] == SM_RULES){
						client_print(id, print_console, "^n%L", LANG_PLAYER, "SM_START_RULE_LISTING")
					}
					else if (param[1] == SM_INFOS){
						client_print(id, print_console, "^n%L", LANG_PLAYER, "SM_START_INFO_LISTING")
					}
				}
				param[4]+=1

				new szMsg[256]
				format(szMsg, 255, "%L", id, szPrint)
				replace_all(szMsg, 255, "\n", i > 9 ? "^n      " : "^n    ")
				client_print(id, print_console, "%i: %s", i, szMsg)

				if (param[4] % 10 == 0){
					param[3]+=1
					break
				}
			}
			param[3]+=1
		}
		set_task(0.1, "func_list_messages", id, param, 5)
	}
	else{
		console_print(id,"^n   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+^n")
	}
}

public func_show_message(taskid){

	// Define the next message
	new iTypes, iTotalMsg
	if (get_pcvar_num(CVAR_msg_show)){
		iTypes += SM_MESSAGES
		iTotalMsg += g_iMsgCount
	}
	if (get_pcvar_num(CVAR_rule_show)){
		iTypes += SM_RULES
		iTotalMsg += g_iRuleCount
	}
	if (get_pcvar_num(CVAR_info_show)){
		iTypes += SM_INFOS
		iTotalMsg += g_iInfoCount
	}
	if (!iTypes || !iTotalMsg){
		return PLUGIN_HANDLED
	}

	new bool:bFound, iTryFind
	while (!bFound && iTryFind < 3){
		iTryFind+=1

		new szNextMsg[16], iNextMsg = random_num(1, iTotalMsg)
		switch(iTypes){
			case SM_MESSAGES + SM_RULES + SM_INFOS: {
				if (iNextMsg <= g_iMsgCount){
					format(szNextMsg, 15, "SERVER_MSG_%i", iNextMsg)
				}
				else if (iNextMsg <= g_iMsgCount + g_iRuleCount){
					format(szNextMsg, 15, "SERVER_RULE_%i", iNextMsg - g_iMsgCount)
				}
				else{
					format(szNextMsg, 15, "SERVER_INFO_%i", iNextMsg - g_iMsgCount - g_iRuleCount)
				}
			}
			case SM_MESSAGES + SM_RULES: {
				if (iNextMsg <= g_iMsgCount){
					format(szNextMsg, 15, "SERVER_MSG_%i", iNextMsg)
				}
				else{
					format(szNextMsg, 15, "SERVER_RULE_%i", iNextMsg - g_iMsgCount)
				}
			}
			case SM_MESSAGES + SM_INFOS: {
				if (iNextMsg <= g_iMsgCount){
					format(szNextMsg, 15, "SERVER_MSG_%i", iNextMsg)
				}
				else{
					format(szNextMsg, 15, "SERVER_INFO_%i", iNextMsg - g_iMsgCount)
				}
			}
			case SM_RULES + SM_INFOS: {
				if (iNextMsg <= g_iRuleCount){
					format(szNextMsg, 15, "SERVER_RULE_%i", iNextMsg)
				}
				else{
					format(szNextMsg, 15, "SERVER_INFO_%i", iNextMsg - g_iRuleCount)
				}
			}
			case SM_MESSAGES: {
				format(szNextMsg, 15, "SERVER_MSG_%i", iNextMsg)
			}
			case SM_RULES: {
				format(szNextMsg, 15, "SERVER_RULE_%i", iNextMsg)
			}
			case SM_INFOS: {
				format(szNextMsg, 15, "SERVER_INFO_%i", iNextMsg)
			}
		}

		if ((!equali(g_szLastMsg[0], szNextMsg) && !equali(g_szLastMsg[1], szNextMsg) && !equali(g_szLastMsg[2], szNextMsg)) || iTryFind == 3){
			if (is_msg_valid(szNextMsg)){
				bFound = true

				// Store the last messages to minimize the chance of duplicate messages
				if (iTotalMsg > 3) copy(g_szLastMsg[2], 15, g_szLastMsg[1])
				if (iTotalMsg > 2) copy(g_szLastMsg[1], 15, g_szLastMsg[0])
				if (iTotalMsg > 1) copy(g_szLastMsg[0], 15, szNextMsg)

				new iMode, bool:bPrefix
				if (equal(szNextMsg, "SERVER_MSG_", 11)){
					iMode = get_pcvar_num(CVAR_msg_mode)
				}
				else if (equal(szNextMsg, "SERVER_RULE_", 12)){
					iMode = get_pcvar_num(CVAR_rule_mode)
					bPrefix = get_pcvar_num(CVAR_rule_prefix) ? true : false
				}
				else if (equal(szNextMsg, "SERVER_INFO_", 12)){
					iMode = get_pcvar_num(CVAR_info_mode)
				}

				new szFlags[6], iPlayers[32], pNum, iSkip = get_pcvar_num(CVAR_show_skip)
				if (iSkip) add(szFlags, 5, iSkip == 1 ? "a" : "b")
				add(szFlags, 5, "c")
				get_players(iPlayers, pNum, szFlags)
				for (new p = 0; p < pNum; p++){
					new szMsg[256]
					if (bPrefix){
						format(szMsg, 255, "%L^n%L", iPlayers[p], "SM_RULE_PREFIX", str_to_num(szNextMsg[12]), iPlayers[p], szNextMsg)
					}
					else{
						format(szMsg, 255, "%L", iPlayers[p], szNextMsg)
					}
					func_print_message(iPlayers[p], szMsg, iMode)
				}
			}
		}
	}

	return PLUGIN_CONTINUE
}

/* == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==
	STOCKS
 == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==*/

// Diese Funktion ermittelt alle Zielpersonen (iPlayers), an denen ein Befehl ausgeführt werden soll.
// Dazu kann auch in der Variablen iSkip angegeben werden, welche Personen übersprungen werden sollen.
// Des Weiteren gibt die Funktion den Namen der Zielgruppe in der Variablen szTargetName zurück.
stock get_cmd_targets(id, szArg[], iPlayers[32], &pNum, szTargetName[32], iSkip = SKIP_NOTHING){
	new szFlags[6]
	if (iSkip & SKIP_DEAD) add(szFlags, 5, "a")
	if (iSkip & SKIP_ALIVE) add(szFlags, 5, "b")
	if (iSkip & SKIP_BOTS) add(szFlags, 5, "c")
	if (iSkip & SKIP_REAL) add(szFlags, 5, "d")

	if (equali(szArg[1], "A") || equali(szArg[1], "ALL")){
		copy(szTargetName, 31, "everyone")
		get_players(iPlayers, pNum, szFlags)
	}
	else if (equali(szArg[1], "C") || equali(szArg[1], "CT") || equali(szArg[1], "COUNTER")){
		copy(szTargetName, 31, "all Counter-Terrorists")
		add(szFlags, 5, "e")
		get_players(iPlayers, pNum, szFlags, "CT")
	}
	else if (equali(szArg[1], "T") || equali(szArg[1], "TE") || equali(szArg[1], "TERROR") || equali(szArg[1], "TERRORIST")){
		copy(szTargetName, 31, "all Terrorists")
		add(szFlags, 5, "e")
		get_players(iPlayers, pNum, szFlags, "TERRORIST")
	}

	if (pNum == 0){
		client_print(id, print_console, "[AMXX] %L", LANG_PLAYER, "SM_NO_CLIENT")
		return 0
	}

	return 1
}

stock bool:is_msg_valid(szSearchedMsg[]){
	new bool:bFound, iLanguages
	if (file_exists(g_szFilePath)){
		new szMsg[32], szBuffer[128], szLastMsg[32], fp=fopen(g_szFilePath, "r")
		while (!feof(fp) && !bFound && iLanguages < 2){
			szBuffer[0]='^0'
			fgets(fp, szBuffer, 127)
			parse(szBuffer, szMsg, 31)
			if (!equali(szMsg, szLastMsg)){

				// Saves the current message for blocking duplicative messages
				copy(szLastMsg, 31, szMsg)

				if (equali(szMsg, szSearchedMsg, strlen(szSearchedMsg))){
					bFound = true
				}

				// Stop loop if we reached the second language
				else if (szMsg[0] == '[' && szMsg[3] == ']'){
					iLanguages += 1
				}
			}
		}
		fclose(fp)
	}

	// Message or File not exists
	if (!bFound){
		return false
	}
	return true
}

stock SaveData(id){
	new szAuthid[32], szKey[64], szData[16]

	get_user_authid(id, szAuthid, 31)
	format(szKey, 63, "SERV_MSG_%s", szAuthid)

	new iMinutes = g_iActivity[id] + (get_user_time(id) / 60)
	num_to_str(iMinutes, szData, 15)

	set_vaultdata(szKey, szData)
}

stock LoadData(id){
	new szAuthid[32], szKey[64], szData[16]

	get_user_authid(id, szAuthid, 31)
	format(szKey, 63, "SERV_MSG_%s", szAuthid)

	if (vaultdata_exists(szKey)){
		get_vaultdata(szKey, szData, 15)
		g_iActivity[id] = strlen(szData) ? str_to_num(szData) : 0
		g_bMsgEnabled[id] = (g_iActivity[id] < get_pcvar_num(CVAR_min_activity) || !get_pcvar_num(CVAR_min_activity)) ? true : false
	}
	else{
		g_iActivity[id] = 0
		g_bMsgEnabled[id] = true
	}
}

/* == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==
	CREATES (Messages and Effects)
 == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==*/

stock Create_ChatMsg(id, szMsg[]){
	format(szMsg, 255, "^x04%s", szMsg)

	// A user message must be smaller than 192 Bytes, otherwise the server crashs.
	szMsg[182]='^0'

	message_begin(MSG_ONE_UNRELIABLE , gMsgSayText, {0, 0, 0}, id)
	write_byte(id)
	write_string(szMsg)
	message_end()
}
