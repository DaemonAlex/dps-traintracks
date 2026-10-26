fx_version "cerulean"
game "gta5"
author "Del Perro Sands"
description "Custom train tracks: 2nd LS line + Davis Quartz quarry local (2Trains2Tracks, adapted). Configs resolve to dps-trains-stock consists."
version "1.0.0"

files {
    "traintracks.xml",
    "trains1.dat",
    "trains4.dat",
    "trains14.dat",
}

-- The game's own level meta (gta5.meta) calls this type TRAINTRACK_FILE, singular:
--   <filename>commoncrc:/data/levels/gta5/traintracks.xml</filename>
--   <fileType>TRAINTRACK_FILE</fileType>
-- We had registered "TRAINTRACKS_FILE", which is not a type, so the file was
-- silently ignored and the client only ever had the 12 vanilla tracks
-- (proven with /trackprobe, 2026-09-21).
data_file "TRAINTRACK_FILE" "traintracks.xml"
