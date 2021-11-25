### XASECO
XASECO stands for Xymph's ASECO and is a controller for TrackMania servers. It used to be known as ASECO/RASP for classic TMN until the release of TM Forever. ASECO is an abbreviation of "Automatic SErver COntrol", while RASP is a sizable set of plugins for ASECO that defacto became a standard part of the distribution.  Beyond RASP the system comes with a sizable number of optional plugins, which are typically enabled on most servers as well. The overall goal remains to stick to 'core functionality' as much as possible, rather than include any of the wide variety of 'niche' plugins that exist out there, while still providing a complete and integrated solution for server control.

### THIS PROJECT
The code and also the requirements to run XASECO are outdated. This may cause security risks for the server used. PHP and also MySQL have evolved, also the operating systems are no longer at the level of 2013. The goal is to release versions for PHP7 / PHP8 and MySQL / MariaDB. The name will be kept out of respect to the original authors and because of the Trackmania community.

### AUTHORS
2006 - 2007 Florian Schnell  
2007 - 2013 Frans P. de Vries  
Since 2021 Andreas Schlaupitz

### FEATURES
##### Introduction:
XASECO is a server controller for TMF (both Nations and United) and TMN written in PHP using a MySQL database. It should also still support TMO and TMS but I'm unable to test that. The main XASECO program aseco.php is merely a framework to handle communication with the dedicated server, handle events, provide logging, and offer support functionality. All user features and commands are provided by plugins.
##### Plugins:
XASECO runs fine with an empty plugins.xml list, it just won't do very much. To provide user functionality, add files from plugins/ directory to the list. Some plugins are essential, such as plugin.localdatabase.php for communication with the database, while many others are optional. However, some plugins depend on others being present (sometimes in the correct order in plugins.xml), so it's best to preserve as much of the default plugins.xml list as needed.
##### Configs:
Configuration files consist of .XML files in the main directory, as well as some of the .PHP files in the includes/ directory. The most important one is config.xml, containing many of the basic settings, messages, and server and admin definitions. Other config files are typically related to one specific plugin or set of plugins (like RASP with rasp.xml and rasp.settings.php).
##### Database:
Using the MySQL database requires the plugin.localdatabase.php plugin configured via localdatabase.xml. It stores information about tracks, players, local records, all finishes, karma (or old style) votes, player ranks, and more.
##### Help:
The main /help command provided by chat.help.php lists all available chat commands in a chat message, while /helpall generates a window that includes descriptions. Other plugins sometimes include a help command (/helpdedi for Dedimania, /helpvote for chat-based votes) and some commands include a help option (e.g. /admin helpall, /list help, etc).
##### Players:
Player connects and disconnects are handled by the main aseco.php program and relayed to plugins via the onPlayerConnect and onPlayerDisconnect events. The /players command is provided by the chat.players.php plugin, while chat.players2.php provides a couple of related commands.
##### Local Records:
Local records are determined and stored by the plugin.localdatabase.php plugin, and can be displayed by the /recs command from the chat.records.php plugin. Additional record rankings and listings are provided by the chat.records2.php plugin, while chat.recrels.php offers record relation commands. The maximum number of records per track is defined in rasp.settings.php.
##### Dedimania Records:
Dedimania records are determined and stored on the central Dedimania site by the plugin.dedimania.php plugin, and can be displayed by the /dedirecs command from the chat.dedimania.php plugin. Additional record rankings and listings, as well as record relations, are provided by the same plugin. All related configuration options and messages are provided in dedimania.xml (the maximum number of records per track should be kept at 30).
##### Checkpoints:
Players can keep track of their relative performance at each checkpoint with the /cps command, provided by the plugin.checkpoints.php plugin. Normally it uses the player's own (or any other) local record as reference, if checkpoints are available for that record, and shows whether each crossing is faster or slower in the CPS panel above the main racing time (TMF) or in a brief pop-up window (TMN). If the Dedimania system is enabled, the /dedicps command can be used to compare the times with the player's own (or any other) Dedimania record instead. Both settings are stored for all players, and reloaded upon every visit.
##### Anti-cheat checks:
When the plugin.checkpoints.php plugin is active, it also checks checkpoints and finish times in several ways to reduce the chances of cheated races resulting in local and Dedimania records.
##### Rounds:
When the plugin.rounds.php plugin is active in Rounds, Team and Cup (TMF) mode, a report with each player's finish time is shown after each run. It serves no purpose in TimeAttack, Laps and Stunts mode.
##### Track Lists & Jukebox:
The plugin.rasp_jukebox.php plugin provides the /list command to list, search for and select from the available tracks with a wide variety of options. Players can pick any track from the list that hasn't been played recently, and add it to a jukebox of tracks that's given precedence over tracks from the regular server rotation. This is controlled by a number of configuration settings in rasp.settings.php.
##### TMX
Specific tracks can be downloaded and added directly from TMX with the /add command (in plugin.rasp_jukebox.php) and /admin add command (in chat.admin.php). Searching on TMX can be done with /xlist, while the plugin.tmxinfo.php plugin offers commands to display track information.
##### Karma:
Karma votes are an easy way for players to indicate via /++ or /-- commands whether they like or don't like a track, provided by the plugin.rasp_karma.php plugin and configured by settings in rasp.settings.php.
##### Ranks:
A player obtains a server rank by racing a minimum number (default 3, configured in rasp.settings.php) of local ("ranked") records. The average of a player's records over all server tracks determines the ranking, managed by the plugin.rasp.php plugin with plugin.rasp_nextrank.php providing a related command.
##### Stats:
Player stats are displayed by the /stats command from the chat.stats.php plugin, while server information is provided by /server, /xaseco and /plugins from chat.server.php. Related plugins chat.laston.php, chat.songmod.php, chat.wins.php and plugin.track.php offer associated commands.
##### Tiered Admins:
The tiered admin system defines three ability levels: MasterAdmins (specified in config.xml) who can run any admin command, and Admins and Operators for whom the logins and abilities are specified in adminops.xml. Typically, Operators are allowed to use the fewest admin commands, and the abilities list extends beyond the /admin command to special admin features of user commands (such as jukeboxing tracks that were played too recently). Admins and operators can be added and removed dynamically, or their abilities updated, and adminops.xml will be automatically kept in sync. See this table for the default list of abilities.
##### Chat-based Votes:
Chat-based votes allow players to vote on actions that regular CallVotes don't support, such as ending a round or replaying a track. When enabled in rasp.settings.php, the plugin.rasp_votes.php plugin disables CallVotes completely and offers several voting commands that can be voted on with the /y command (there is no /n counterpart), and on TMF also via the vote panel provided by plugin.panels.php. Vote configuration is done in votes.config.php.
##### Public/Private Messages:
The plugin.rasp_chat.php and chat.me.php plugins offer a wide variety of commands to quickly shout out a message to other players. Players' regular chat lines are logged and displayed by the plugin.chatlog.php plugin. Private messages from one player to another can be send with the /pm command, from an admin to a player (Cc-ing all other admins) with /pma, and from one admin to all other admins with /admin pm.
##### Muting/Ignoring:
Muting (the TMN term) or ignoring (TMF) implies that chat messages from a specified player are suppressed and aren't readable for other players in the chat window. Admins can maintain a global list of muted/ignored players, which on TMF uses the built-in Ignore features and on TMN a simulated suppression system. The latter system is also used when an individual player mutes another player using the commands provided in the plugin.muting.php plugin.
##### Ban, Black- & Guestlist:
A number of /admin commands from chat.admin.php can be used to warn (with a pop-up message) or kick players, and to punish repeat offenders with a ban or blacklist. Bans work by IP address and are tracked only by the dedicated server, and therefore get purged by a server restart. Blacklists work by login and are stored in the blacklist.txt file, and therefore persist across server restarts. Logins on the guestlist can enter the server even when the maximum number of players or spectators is reached or when the server is passworded, and are preserved in the guestlist.txt file. In addition to these built-in mechanisms, XASECO provides a list of banned IP addresses in the bannedips.xml file that also transcends server restarts.
##### Player access:
Besides the above local server mechanisms, player access can also be managed with the global blacklist, and with access control by nation (TMN) or zone (TMF). See the v1.09 release notes for details. Lastly, the full Jfreu plugin (below) allows player limiting by rank.
##### Admin Commands:
Other /admin commands control the game flow (ending a round, skipping to the next or previous track, restarting or replaying a track), affect the server settings (player/spectator limits, TMF panels, etc), manage tracks and the jukebox, and much more. Security of the admin commands and features against unauthorized use can be warranted with a lock password and by specifying authorized IP addresses for each admin login.
##### Idlekick:
Inactive players and, optionally, spectators can be kicked automatically at the end of each track after a specified number of tracks by the mistral.idlekick.php plugin. Configuration settings are included in the plugin itself.
##### Auto TimeLimit:
With the plugin.autotime.php plugin enabled in TimeAttack mode, the timelimit for each track is defined dynamically, based on the track's author time and settings in autotime.xml.
##### Jfreu:
The Jfreu plugins jfreu.plugin.php and jfreu.chat.php provide a variety of features, including player connect/disconnect messages, informational messages, rank limiting (with VIP exceptions), bad word filtering, and more. The first two features are also available separately in the jfreu.lite.php plugin in case the rest isn't needed. They are configured via jfreu.config.php and changed options are automatically stored in the jfreu/jfreu.config.xml file.
##### TMF Music:
The plugin.musicserver.php plugin offers support for playing server controlled music instead of the default game music and, optionally, even overriding a track's own song. The /music command includes a simple jukebox feature as well as admin options, and .OGG comments (ID3 tags) can also be displayed. Configuration is done in musicserver.xml.
##### TMF Custom Rounds Points:
With the plugin.rpoints.php plugin enabled, admins can select alternative points systems in Rounds mode instead of the standard 10,6,4,3,2,1. Various common systems (like Formula 1 GP and MotoGP) are included, and completely custom systems can be defined as well.
##### TMF Styles & Panels:
The main output window can be dynamically customized with a large number of style templates from the styles/ subdirectory, managed by the plugin.style.php plugin. The plugin.panels.php plugin provides four panels: the admin panel to easily activate a handful of the most commonly used admin commands; the donate panel to easily initiate a donation with a variety of copper amounts; the records panel to display a track's relevant records; and a temporary vote panel to easily respond to chat-based votes. Each panel can be dynamically customized with a number of templates from the panels/ subdirectory. All players' style and panel preferences are stored, and reloaded upon every visit.
##### TMF Stats Panels:
Instead of the rank chat messages at the end of each track, on TMF a personal stats panel can be displayed for each player during the scoreboard. The stats are: server rank, record average, records total, wins total, session play time, and donation total (on TMUF servers).
##### TMF Message Window:
When enabled via plugin.msglog.php, the system message window near the top of the screen can be used to temporarily display a wide variety of global messages that normally flood the chat window. These include new/improved/equalled records, record reports before and after each track, rounds reports, Jfreu Info messages and several more, all individually configured in their pertaining config files.
##### TMUF Coppers:
Copper transactions are managed by the plugin.donate.php plugin, allowing players to donate coppers to the server, and admins (with the appropriate ability) to pay coppers to any other login (including another server).
