local handler = require("event_handler")

handler.add_lib(require("prototypes.scripts.fish.fish_spawners_script"))
handler.add_lib(require("prototypes.scripts.fish.fishing_inserters_script"))
handler.add_lib(require("prototypes.scripts.cattle.cattle_grabbers_script"))
handler.add_lib(require("prototypes.scripts.cattle.cattle_feeders_script"))

handler.add_lib(require("calculate"))
