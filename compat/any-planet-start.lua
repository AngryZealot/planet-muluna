local rro = require("lib.remove-replace-object")


local function delete_tech(deleted_tech,new_tech)
    for _,effect in pairs(data.raw["technology"][deleted_tech].effects) do
        if effect.type == "unlock-recipe" then
            if new_tech then
                rro.soft_insert(data.raw["technology"][new_tech].effects, 
                {
                    type = "unlock-recipe",
                    recipe = data.raw["recipe"][effect.recipe].name,
                }
            )
            else
                data.raw["recipe"][effect.recipe].enabled = true
            end
        end
    end
    data.raw["technology"][deleted_tech] = nil
    
    for _,technology in pairs(data.raw["technology"]) do
        rro.remove(technology.prerequisites,deleted_tech)
    end
end


if settings.startup["aps-planet"] and settings.startup["aps-planet"].value == "muluna" then
    data.raw["technology"]["electronics"].research_trigger.item="aluminum-plate"
    rro.replace_name(data.raw["recipe"]["automation-science-pack"].ingredients,"copper-plate","aluminum-plate")
    --rro.replace_name(data.raw["recipe"]["electric-furnace"].ingredients,"advanced-circuit","electronic-circuit")
    --data.raw["recipe"]["electric-furnace"].enabled = true
    --data.raw["recipe"]["electric-mining-drill"].enabled = true
    --data.raw["recipe"]["steel"].enabled = true
    delete_tech("electric-mining-drill")
    delete_tech("advanced-material-processing-2","muluna-advanced-boiler")
    delete_tech("advanced-material-processing","muluna-advanced-boiler")
    delete_tech("steel-processing")
    delete_tech("advanced-circuit","electronics")
    delete_tech("oil-processing","oil-gathering")
    delete_tech("fluid-handling")
    rro.remove(data.raw["technology"]["wood-gas-processing-to-crude-oil"].unit.ingredients,{"production-science-pack",1})
    rro.remove(data.raw["technology"]["wood-gas-processing-to-crude-oil"].unit.ingredients,{"chemical-science-pack",1})
    rro.remove(data.raw["technology"]["rocket-silo"].prerequisites,"logistic-robotics")
    rro.remove(data.raw["technology"]["rocket-silo"].prerequisites,"cargo-planes")
    rro.remove(data.raw["technology"]["space-platform-thruster"].prerequisites,"afterburner")
    data.raw["technology"]["rocket-silo"].research_trigger.item =  "rocket-fuel"
    delete_tech("advanced-wood-gas-processing","advanced-oil-processing")
    data.raw["research-achievement"]["eco-unfriendly"] = nil
    rro.remove(data.raw["technology"]["wood-gas-processing"].prerequisites,"oil-processing")
    
    --delete_tech("processing-unit","electronics")
    -- data.raw["recipe"]["advanced-circuit"].enabled = false
    -- rro.soft_insert(data.raw["technology"]["electronics"].effects,
    -- {
    --     type = "unlock-recipe",
    --     recipe = "advanced-circuit",
    -- })
    rro.soft_insert(data.raw["technology"]["wood-gas-processing"].effects,
    {
        type = "unlock-recipe",
        recipe = "chemical-plant",
    })
    rro.soft_insert(data.raw["technology"]["muluna-advanced-boiler"].effects,
    {
        type = "unlock-recipe",
        recipe = "thruster-oxidizer",
    })
    -- rro.remove(data.raw["technology"]["muluna-silicon-processing"].unit.ingredients,{"production-science-pack",  1})
    -- rro.remove(data.raw["technology"]["muluna-silicon-processing"].unit.ingredients,{"chemical-science-pack",  1})
    rro.soft_insert(data.raw["technology"]["solar-energy"].prerequisites,"muluna-anorthite-processing")
    -- rro.remove(data.raw["technology"]["muluna-silicon-processing"].prerequisites,"production-science-pack")

    delete_tech("muluna-silicon-processing","solar-energy")
    delete_tech("electric-energy-distribution-1")
    delete_tech("sulfur-processing","wood-gas-processing")
    delete_tech("engine","steam-power") 
  end