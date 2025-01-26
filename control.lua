-- script.on_configuration_changed(function()
--     if debug_mode then
--         log(DT .. "initialized storage")
--         log(serpent.block(storage))
--     end
--     if storage == nil then 
--         storage = {
--             ---@type table<int, LuaEntity>
--             nav_beacons = {}, -- beacon [unit_number] = LuaEntity (nav-beacon)
--             ---@type table<int, LuaSpacePlatform>
--             beacon_platforms = {}, -- beacon [unit_number] = LuaSpacePlatform
--             ---@type table<int, LuaEntity>
--             platform_beacons = {}, -- platform [index] = LuaEntity (nav-beacon)
--             ---@type table<int, LuaSpaceLocationPrototype>
--             nav_surfaces = {}, -- beacon [unit_number] = LuaSpaceLocationPrototype
--             ---@type table<int, LuaEntity>
--             beacon_electric_interfaces = {}, -- beacon [unit_number] = LuaEntity (nav-beacon-electric-interface)
--         }
--     end
-- end)




--_G.maraxsis = require "scripts.constants"
--muluna={}
--require("lib.control-stage")
require("scripts.project-seadragon")
require("scripts.nav-beacon")
--muluna.finalize_events()

-- script.on_nth_tick(60,function(event)
--     local map_gen_settings = game.planets.muluna.surface.map_gen_settings
--     --map_gen_settings.autoplace_settings.entity.settings["anorthite-chunk"] == nil
--     if map_gen_settings.autoplace_settings.entity.settings["anorthite-chunk"] == nil then
--       map_gen_settings.autoplace_controls["anorthite-chunk"] = {}
--       map_gen_settings.autoplace_settings.entity.settings["anorthite-chunk"] = {}
--       game.planets.muluna.surface.map_gen_settings = map_gen_settings
--       game.planets.muluna.surface.regenerate_entity("anorthite-chunk")
--     end
-- end) 







if script.active_mods["gvv"] then require("__gvv__.gvv")() end