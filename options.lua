--speedrun_rules = true

	-- Tracker settings
item_tracker = true
--show_recently_obtained_items = true

	-- Location Tracker settings
location_tracker = true
show_available = true
show_remaining = true

	-- Logic settings for locations
difficult_logic = true 
--coin_blocks = true
--visible_digspots = true
--hidden_digspots = true

--skip_minecart = true
--disable_harhalls_pants = false
--disable_surf = false
--bowsers_castle_skip = false
--randomize_enemies = false



--[[
Information about the randomizer itself:

This randomizer was made by Pixiuchu
with the primary intent of automatically tracking items.
A dedicated map tracker will not be added,
but you're free to suggest features!

To report bugs, you can DM Pixiuchu, but
she will see the messages faster if you just
ping her in the Randomizer Discord Server.


Future options that may be implemented:
	separate_windows = true --This separates the item and location tracker into their own windows (I tried but failed so putting this on the back burner)
	location_tracker_side = "bottom" --"bottom" and "right" are available options (Haven't tried yet)
	highlight_areas_with_progression = false --Banned for speedruns; definitely will be added

Any setting at the top that has a double dash "--" means it's not implemented yet.


Other ideas I have:
- hidden digspot displayer (shows where the hidden digspots are in the game itself)
- seed logger that logs the order you grabbed locations and what items were inside, found in the seeds folder
- automatically load your seed settings
- automatic timer that doesn't need livesplit
- "speedrun mode" option
- "generate spoiler log" option; this would give you a list of every item.

- if the project gets too big, it'd be better to move the project separate from bizhawk,
  which will probably be a v2.0 version, but it would still require a lua script through bizhawk.
  This is the long term plan.
]]--