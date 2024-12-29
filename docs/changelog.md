Changelog:
v0.6.1
- Added shop locations and newly added locations in latest randomizer version
- Changed when the tracker refreshes images for much improved speeds
- As a result of the above, lowered refresh rate down to 60
- Fixed bug where rewinding can only be done at less than 40 fps
- Prevented the following from happening:
	- Room 0x04D (Hoohoo Mountain Base Room 1) temporarily sets the Peasley's Rose location
	- Room 0x09E temporarily sets the Winkle Minigame location
	- Room 0x095 temporarily sets the three Chuckola Fruits locations


v0.6.0
- Added options.lua where you can edit some logic and tracker options
	- Change your refresh rate, default is 120. Set higher if you experience lag!
	- Change whether available / remaining locations show
	- Choose whether you want item tracking, location tracking or both
	- Speedrun option: set this to true to automatically set logic options we use in the speedrun
	
	- Logic options:
		- Difficult logic
		- Coin blocks
		- Visible/Hidden digspots
		- Minecart
		- Harhall's Pants
		- Surfing
		- Bowser's Castle
		- Randomize enemies (makes it so past Hoohooros needs Hammers)
		- Speedrun rules (sets the above options besides randomizing enemies to the speedrun rules)
	
- Changed Beanstar Piece image behaviour
- Fixed a logic bug in Joke's End
- Fixed a bug with Beanstar logic
- Fixed a bug with Firebrand and Thunderhand disappearing
- Fixed a bug with Red Pearl Bean and Green Pearl Bean disappearing
- Doing checks out of logic now correctly decreases remaining location number

v0.5.0
- Added a "TOTAL" that sums everything
- Changed the number system so it shows how many checks you've got available and the total for each area
- Changed the order of Neon Egg to be the same as the game's on the Yoshi Theater board
- Fixed a logic bug in Hoohoo Mountain
- Fixed a bug where handing over the Chuckola Fruits would make the tracker think you can't hand over the Chuckola Fruits
- Fixed a bug where handing over the Neon Eggs made the tracker think you can't hand over the Neon Eggs
- Fixed a bug where assembling the Beanstar made the tracker think you can't assemble the Beanstar
- Fixed a bug where reaching Birdo made the tracker think you can't reach Birdo

v0.4.0
- Major changes to the lua structures for easier organizing, you now load "main.lua" instead of "Tracker.lua"!
- Added first iteration of location tracker
- Item Tracker instantly refreshes when you load state now
- You no longer appear to lose your Chuckola Fruits after giving Chuckleroot the fruits

v0.3.0
- Added the Beanstar
- Increased default refresh rate to 180 from 120
- Changed lua file formatting again
- Made it so the tracker won't track unless you're in-game

v0.2.0
- Fixed GreenPearlBeanGreenPearlBean.png typo causing the tracker to break when you find Green Pearl Bean
- Changed formatting so its easier for me to sort and organize
- Added a refreshrate, items are only checked once every x frames (default 120) to prevent lag, easily changeable in the first line of the lua script (set to 1 for items to instantly show up)
- Added coffee gear

v0.1.0
- First release. Currently only tracks progressive items with no options. Only available for Bizhawk.