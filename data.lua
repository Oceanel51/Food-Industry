require "prototypes.functions.fi-global-variables"

-- main data and foods
require("prototypes.item")
require("prototypes.fluids")
require("prototypes.recipe")
require("prototypes.foods-item-recipe")
require("prototypes.composting-recipe")
require("prototypes.composting-auto-recipe")
require("prototypes.entity")
require("prototypes.technology")
require("prototypes.category")
require("prototypes.achievements")
require("prototypes.plants-item-recipe")
require("prototypes.plants-entity")
require("prototypes.plants") -- all plants are collects here

-- equipment
require("prototypes.equipment")

-- fishes
require("prototypes.fish.fish")
require("prototypes.fish.fish-meat-item")
require("prototypes.fish.fish-meat-recipe")
require("prototypes.fish.fishing-inserter")
require("prototypes.fish.fishing-boat")
require("prototypes.fish.fish-spawner")
require("prototypes.fish.sturgeon-spawner")
require("prototypes.fish.water-tile")

-- cattles
require("prototypes.cattle.cattle-grabber")
require("prototypes.cattle.cattle")
require("prototypes.cattle.cattle-wood-fence")

-- decor
require("prototypes.decor.tables-entity")
require("prototypes.decor.tables-recipe")
require("prototypes.decor.tables-item")
require("prototypes.decor.tables-category")

-- storages
require("prototypes.storages.storage-entity")
require("prototypes.storages.storage-recipe")
require("prototypes.storages.storage-item")

-- drinks
require("prototypes.drinks.drinks-item")
require("prototypes.pure-water.fluid")
require("prototypes.pure-water.pure-water-recipe")
require("prototypes.drinks.drinks-item-recipe")
require("prototypes.drinks.drinks-recipe")
require("prototypes.drinks.drinks-fluid")
-- drinks tara
--require("prototypes.packages.paper-packaging-item-recipe")
--require("prototypes.packages.paper-packaging-technology")

-- substances
require("prototypes.substances.substances-item")
require("prototypes.substances.substances-recipe")

-- trees
require("prototypes.trees.trees-entity")
require("prototypes.trees.food-picker")
require("prototypes.trees.tree-greenhouse")
require("prototypes.trees.hydroponics-building")
require("prototypes.trees.fruit-scissors")

-- other
require("prototypes.styles.fi-style-gui")
require("prototypes.styles.fi-font-gui")
require("prototypes.styles.fi-sprites")
require("prototypes.sounds")

require("changes")

-- TODO add requirements for normal game mode
if not data.is_demo then

end

-- IR compatibility
if mods["IndustrialRevolution"] then
    require("compatibilities.ir-compatibility-recipes")
    -- TODO also redo technologies
end
