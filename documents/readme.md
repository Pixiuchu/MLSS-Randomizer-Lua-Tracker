# MLSS-Randomizer-Lua-Tracker
This is a tracker for the MLSS Randomizer through Bizhawk's Lua Console.

To use it, simply either download the latest official version or the source code, and in Bizhawk's Lua Console, click on Script -> Open Script... and open "main.lua".

Alternatively, you can just drag and drop the lua file into Bizhawk.

This works on both the Standalone version as well as the Archipelago version.

# To edit options
Open options.lua in a text file and edit the options. Below you can find a brief explanation for each option:

## Tracker settings
- `refresh_rate` = sets the refresh rate of the tracker in frames. It is recommended to keep it at 120 or higher. Set this number higher if you experience lag!
- `item_tracker` = enables the item tracking
- `location_tracker` = enables the location tracking
- `show_available` = shows how many locations you can do with your current items
- `show_remaining` = shows how many locations are remaining in total

## Logic settings for locations
- Note: setting the below settings to true means yes, it's included! Be mindful that it is different from standalone/Archipelago settings.
- `difficult_logic` = logically don't require Thunderhand + Green Pearl Bean for rolling spikes
- `coin_blocks` = includes coin blocks
- `visible_digspots` = includes visible digspots, setting this to false sets hidden digspots to false too by default
- `hidden_digspots` = includes hidden digspots
- `minecart` = includes Minecart minigame digspot
- `harhalls_pants` = includes Harhall's Pants reward
- `surfing` = includes surfing minigame
- `bowsers_castle` = includes all of Bowser's Castle
- `randomize_enemies` = makes it so everything past Hoohooros requires Hammers
- `speedrun_rules` = false -- sets the above logic settings (except randomize_enemies) to the ones we use in the speedruns, set this to true if you're doing a speedrun


# Other lua scripts
There are some other lua scripts in the lua_extras folder, which are just lua scripts I use for dev stuff. There are currently two lua scripts:
- Flag Finder: this logs what flag just got set and sends it to the lua console
- Hidden Digspot Displayer: this shows the hidden digspots as a box displayed on the emulator.