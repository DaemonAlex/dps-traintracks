<p align="center"><img src=".github/dps-logo.svg" alt="DelPerroSands" width="360"></p>

# dps-traintracks

Extra train track for FiveM. Track data only, no scripts.

## What it is for

The game has 12 train tracks and a train can only run where there is track. To
run a train somewhere new, the game first has to be told the new track exists.
This resource does that. A train script can then put trains on it.

## What it does

- **Adds one track.** `traintracks.xml` declares one track, `trains14.dat`
  (335 nodes). The game adds it after its own 12 tracks (0 to 11), so it is
  track 12.
- **Sets how trains behave on it.** The track is a ping-pong track: a train
  runs to the end and comes back. Trains stop at stations. Speed is 20.1.
- **Names a carriage set.** The track entry names the set that runs on it
  (`trainConfigName`). The set must exist in the train stock resource.

Two more track files are in the folder, `trains1.dat` and `trains4.dat`. The
XML does not declare them, so the game does not load them.
`traintracks.xml.pre-roxbench` is an older version of the XML, kept for
reference. It is not loaded.

**State on DelPerroSands.** This track was the Roxwood passenger line. Roxwood
left the server, and dps-trains took track 12 out of its list on 29 October
2026. No train runs on the track now. The XML still names the set
`rox_passenger_config01`, which is no longer in dps-trains-stock. Change
`trainConfigName` before you run trains on this track again.

## On its own, and with other scripts

**On its own.** The game knows the track. Nothing runs on it. This resource has
no scripts, so it cannot spawn or move a train.

**With dps-trains.** dps-trains runs trains on a track when the track number is
in `config.usedTracks` (`configs/general.lua`) and a start location points at
it. `/trackprobe` in dps-trains prints the tracks the game has loaded. Use it
to check this track arrived.

**With dps-trains-stock, and a paid train pack (BigDaddy Trains Overhauled).**
dps-trains-stock holds the carriage sets, built from that pack's models. The
track entry here names one of those sets. This resource only names it. It reads
nothing from the pack, so a pack update does not break the track.

**With a paid map (Roxwood, `amb-roxwood-trains`).** The track was written the
same way as that map's own track file and followed its rail line. The map is
no longer on the server.

**With dps-traintools and dps-transitapp.** No direct link. Players board with
dps-traintools and read arrival times in dps-transitapp, on whatever track
dps-trains runs.

## Requirements

- Nothing to start. There are no scripts and no dependencies.
- A train script to run trains on the track, such as
  [dps-trains](https://github.com/DaemonAlex/dps-trains).
- A carriage set with the name given in `traintracks.xml`.

## Install

1. Put the folder in your resources. Keep the name `dps-traintracks`. The XML
   points at `resources:/dps-traintracks/trains14.dat`, so a renamed folder
   breaks the path.
2. Add `ensure dps-traintracks` to `server.cfg`.
3. Restart the server and have players rejoin. The game reads track data when
   a player joins. Restarting only this resource does not reload it.

## Configuration

`traintracks.xml`, one `<train_track>` entry per track:

| Setting | Meaning |
|---|---|
| `filename` | The track file. Use a `resources:/dps-traintracks/...` path. |
| `trainConfigName` | The carriage set that runs on the track. |
| `isPingPongTrack` | `true`: the train runs to the end and comes back. `false`: the track is a loop. |
| `stopsAtStations`, `MPstopsAtStations` | Trains stop at the stations on the track. |
| `speed` | Line speed. |
| `brakingDist` | Braking distance before a stop. |

Two things to know before you edit:

- Declare only your own tracks. An earlier version also listed the 12 game
  tracks with `common:/` paths. FiveM cannot resolve those. The game rejected
  the whole file and loaded none of it.
- In `fxmanifest.lua` the data file type is `TRAINTRACK_FILE`, with no S
  before `_FILE`. With the wrong name the file is ignored and nothing is
  logged.

## Recent changes

- **12 November 2026.** README: what it is for, how it works alone and with paid scripts, other DPS scripts.
- **25 October 2026.** First commit: the resource as it runs on DelPerroSands.
- **21 September 2026.** `traintracks.xml` rewritten to declare only our own
  track. Data file type corrected to `TRAINTRACK_FILE`. Before this the game
  loaded none of the file.

## Author

Made by [DaemonAlex](https://github.com/DaemonAlex) for DelPerroSands.

The manifest credits 2Trains2Tracks for the track data, adapted for
DelPerroSands.

## Other DPS scripts

All of these are made for DelPerroSands and run together on one Qbox server. Each one works on
its own. The ones marked "pairs with" do more when both are running.

| Script | What it does |
|---|---|
| [dps-inventory](https://github.com/DaemonAlex/dps-inventory) | The inventory: ox_inventory with equipment slots, backpacks, armour plates and a self status panel, in the DelPerroSands colours. |
| [dps-medical](https://github.com/DaemonAlex/dps-medical) | Patient records, illness and diagnostic tests. A companion to wasabi_ambulance. Pairs with dps-inventory: symptoms and diagnoses show on the status panel. |
| [dps-insurance](https://github.com/DaemonAlex/dps-insurance) | Ties m-Insurance into the MDT, impound, hospital and medical chart, and raises premiums for incidents other scripts report. Pairs with dps-medical and dps-fuel. |
| [dps-studio](https://github.com/DaemonAlex/dps-studio) | Build rooms, doors and portals in game from one panel (`/studio`), with owners and managers so staff do not have to support them. |
| [dps-shops](https://github.com/DaemonAlex/dps-shops) | Shop clerks who greet, react to robberies, talk back through dps-ainpcs and remember trouble, plus player-owned stores with delivery runs. Pairs with dps-ainpcs. |
| [dps-fleet](https://github.com/DaemonAlex/dps-fleet) | Vehicle browser and workshop on one panel: extras, liveries and mods for emergency vehicles. |
| [dps-parking](https://github.com/DaemonAlex/dps-parking) | Parking with valet, impound, violations and reserved spots. |
| [dps-vehiclepersistence](https://github.com/DaemonAlex/dps-vehiclepersistence) | Vehicles stay where they were parked. Pairs with dps-parking. |
| [dps-towjob](https://github.com/DaemonAlex/dps-towjob) | Queue-based tow job with jg-mechanic integration. |
| [dps-services](https://github.com/DaemonAlex/dps-services) | Request a tow and follow it live on the lb-phone and lb-tablet. Pairs with dps-towjob. |
| [dps-autoshops](https://github.com/DaemonAlex/dps-autoshops) | Self-service repair shops when no mechanic is on duty. |
| [dps-cityworker](https://github.com/DaemonAlex/dps-cityworker) | City infrastructure job and career. |
| [dps-ainpcs](https://github.com/DaemonAlex/dps-ainpcs) | NPCs you can talk to, with trust, quests and intel. Other scripts can make their own NPCs talk (dps-shops clerks). |
| [dps-badpeds](https://github.com/DaemonAlex/dps-badpeds) | Police interaction with NPCs: stops, arrests, intel and jail records. |
| [dps-gangwars](https://github.com/DaemonAlex/dps-gangwars) | Ambient gang NPCs, territory population and war reinforcements. |
| [dps-rotations](https://github.com/DaemonAlex/dps-rotations) | Moves dealers, harvests and other spots on a fixed schedule. |
| [dps-trains](https://github.com/DaemonAlex/dps-trains) | The train system. Pairs with dps-trains-stock, dps-traintools and dps-transitapp. |
| [dps-transitapp](https://github.com/DaemonAlex/dps-transitapp) | Live train arrival boards on the lb-phone. |
| [dps-faceplant](https://github.com/DaemonAlex/dps-faceplant) | City help, reports and staff tools on the lb-phone and lb-tablet. |
| [dps-chat](https://github.com/DaemonAlex/dps-chat) | A command box for voice-only servers. No chat feed. |
| [dps-filmmode](https://github.com/DaemonAlex/dps-filmmode) | One key hides every HUD layer and gives a smooth free camera for recording. |
| [dps-fuel](https://github.com/DaemonAlex/dps-fuel) | Gas station drive-offs for the ox_fuel nozzle: ripped hose, pump fire, station camera and a police call, by odds. Pairs with dps-insurance. |
| [dps-voice](https://github.com/DaemonAlex/dps-voice) | Spoken lines for NPCs, station announcements, dispatch and shops, from local voice models first. Pairs with dps-ainpcs. |
| [dps-bags](https://github.com/DaemonAlex/dps-bags) | Real bags for ox_inventory: the bag you carry shows on your character. |
| [dps-items](https://github.com/DaemonAlex/dps-items) | Item rules for ox_inventory: locked items, glovebox seats and an exploit watch. |
| [dps-furniture](https://github.com/DaemonAlex/dps-furniture) | Puts streamed furniture packs into the qs-housing furniture shop. |
| [dps-shellbrowser](https://github.com/DaemonAlex/dps-shellbrowser) | Staff tool to look at every qs-housing shell and set its door. |
| [dps-signs](https://github.com/DaemonAlex/dps-signs) | Rotates city messages across the SmartSigns road boards. |
| [dps-stationclear](https://github.com/DaemonAlex/dps-stationclear) | Hides map props that are in the way and keeps stray game peds off chosen spots. |
| [dps-citymap](https://github.com/DaemonAlex/dps-citymap) | A ready-made map of the whole city, cut into tiles for in-game screens. |
| [dps-cayo](https://github.com/DaemonAlex/dps-cayo) | Switches on the game's own Cayo Perico island, and nothing else. |
| [dps-aviation](https://github.com/DaemonAlex/dps-aviation) | Flight behaviour: aircraft idle instead of cutting out, sane taxi speed, a real start sequence. |
| [dps-airlines](https://github.com/DaemonAlex/dps-airlines) | Airlines job: passenger flights, cargo, charters, flight school and maintenance. |
| [dps-traintools](https://github.com/DaemonAlex/dps-traintools) | Rider tools for trains: board, sit, get off at a stop, ambient passengers. Pairs with dps-trains. |
| [dps-trains-stock](https://github.com/DaemonAlex/dps-trains-stock) | Train models and carriage sets for the train system. No scripts. Pairs with dps-trains. |
| [dps-crossings](https://github.com/DaemonAlex/dps-crossings) | Level crossings that close when a train comes. Pairs with dps-trains. |
| [dps-transit](https://github.com/DaemonAlex/dps-transit) | Passenger rail planning and scheduling (older system; dps-trains runs today). |
| [dps-maritime](https://github.com/DaemonAlex/dps-maritime) | Dock work and boat deliveries with progression. |
| [dps-maritime-maps](https://github.com/DaemonAlex/dps-maritime-maps) | Map files for the Jetsam docks, the map half of dps-maritime. |
| [dps-proracing](https://github.com/DaemonAlex/dps-proracing) | Circuit racing with lobbies, an AI practice grid and lap times. |
| [dps-carmenu](https://github.com/DaemonAlex/dps-carmenu) | Staff vehicle browser and spawner over the live Qbox vehicle list. |
| [dps-clothingbrowser](https://github.com/DaemonAlex/dps-clothingbrowser) | Staff tool to browse, identify and export clothing and uniforms. |
| [dps-lootpeds](https://github.com/DaemonAlex/dps-lootpeds) | Loot dead NPCs, with loot tables per model. |
| [dps-hookers](https://github.com/DaemonAlex/dps-hookers) | Adults-only RP (18+), adapted from MH Hookers by MaDHouSe. |
| [dps-weatherbridge](https://github.com/DaemonAlex/dps-weatherbridge) | Lets qb-weathersync and Renewed-Weathersync scripts work with night_natural_disasters. |
| [dps-fixes](https://github.com/DaemonAlex/dps-fixes) | Small server fixes kept in one resource. |
| [dps-bucketfix](https://github.com/DaemonAlex/dps-bucketfix) | Puts players back in the main world after spawning. |
| [dps-unfocus](https://github.com/DaemonAlex/dps-unfocus) | One key that frees a player stuck in a menu. |
| [dps-welcomecam](https://github.com/DaemonAlex/dps-welcomecam) | Aims the first camera a new player sees. |
| [dps-handlingdump](https://github.com/DaemonAlex/dps-handlingdump) | Developer tool: saves the stock handling of every vanilla vehicle. |
| [dps-weaponsounds](https://github.com/DaemonAlex/dps-weaponsounds) | Custom weapon sounds (planning; no code yet). |
| [dps-events](https://github.com/DaemonAlex/dps-events) | Playtime reward events (planning; no code yet). |
