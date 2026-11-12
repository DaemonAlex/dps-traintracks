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
| [dps-insurance](https://github.com/DaemonAlex/dps-insurance) | Ties m-Insurance into the MDT, impound, hospital and medical chart. Pairs with dps-medical. |
| [dps-studio](https://github.com/DaemonAlex/dps-studio) | Build rooms, doors and portals in game from one panel (`/studio`), with owners and managers so staff do not have to support them. |
| [dps-shops](https://github.com/DaemonAlex/dps-shops) | Shop clerks who greet and react to a robbery, then player-owned shops. |
| [dps-fleet](https://github.com/DaemonAlex/dps-fleet) | Vehicle browser and workshop on one panel: extras, liveries and mods for emergency vehicles. |
| [dps-parking](https://github.com/DaemonAlex/dps-parking) | Parking with valet, impound, violations and reserved spots. |
| [dps-vehiclepersistence](https://github.com/DaemonAlex/dps-vehiclepersistence) | Vehicles stay where they were parked. Pairs with dps-parking. |
| [dps-towjob](https://github.com/DaemonAlex/dps-towjob) | Queue-based tow job with jg-mechanic integration. |
| [dps-services](https://github.com/DaemonAlex/dps-services) | Request a tow and follow it live on the lb-phone and lb-tablet. Pairs with dps-towjob. |
| [dps-autoshops](https://github.com/DaemonAlex/dps-autoshops) | Self-service repair shops when no mechanic is on duty. |
| [dps-cityworker](https://github.com/DaemonAlex/dps-cityworker) | City infrastructure job and career. |
| [dps-ainpcs](https://github.com/DaemonAlex/dps-ainpcs) | NPCs you can talk to, with trust, quests and intel. |
| [dps-badpeds](https://github.com/DaemonAlex/dps-badpeds) | Police interaction with NPCs: stops, arrests, intel and jail records. |
| [dps-gangwars](https://github.com/DaemonAlex/dps-gangwars) | Ambient gang NPCs, territory population and war reinforcements. |
| [dps-rotations](https://github.com/DaemonAlex/dps-rotations) | Moves dealers, harvests and other spots on a fixed schedule. |
| [dps-trains](https://github.com/DaemonAlex/dps-trains) | The train system. Pairs with dps-trains-stock, dps-traintools and dps-transitapp. |
| [dps-transitapp](https://github.com/DaemonAlex/dps-transitapp) | Live train arrival boards on the lb-phone. |
| [dps-faceplant](https://github.com/DaemonAlex/dps-faceplant) | City help, reports and staff tools on the lb-phone and lb-tablet. |
| [dps-chat](https://github.com/DaemonAlex/dps-chat) | A command box for voice-only servers. No chat feed. |
| [dps-filmmode](https://github.com/DaemonAlex/dps-filmmode) | One key hides every HUD layer and gives a smooth free camera for recording. |
