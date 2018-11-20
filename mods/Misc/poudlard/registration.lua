

-- Nodes will be called <modname>:{stair,slab,panel,micro}_<subname>
function poudlard.register_stair_and_slab_and_panel_and_micro(modname, subname, recipeitem, groups, images, desc_stair, desc_slab, desc_panel, desc_micro, drop)
	poudlard.register_stair(modname, subname, recipeitem, groups, images, desc_stair, drop)
	poudlard.register_slab(modname, subname, recipeitem, groups, images, desc_slab, drop)
	poudlard.register_panel(modname, subname, recipeitem, groups, images, desc_panel, drop)
	poudlard.register_micro(modname, subname, recipeitem, groups, images, desc_micro, drop)
end


poudlard.register_stair_and_slab_and_panel_and_micro("poudlard", "poudstone", "poudlard:poudstone",
		{snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3, not_in_creative_inventory=0},
		{"poudlard_poudstone.png"},
		"Poudlard stone Stairs",
		"Poudlard stone Slab",
		"Poudlard stone Panel",
		"Poudlard stone Microblock",
		"poudstone")

poudlard.register_stair_and_slab_and_panel_and_micro("poudlard", "poudwood", "poudlard:poudwood",
		{snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3, not_in_creative_inventory=0},
		{"poudlard_poudwood.png"},
		"Poudlard Wood Stairs",
		"Poudlard Wood Slab",
		"POudlard Wood Panel",
		"Poudlard Wood Microblock",
		"poudwood")


poudlard.register_stair_and_slab_and_panel_and_micro("poudlard", "redblock", "poudlard:redblock",
		{snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3, not_in_creative_inventory=0},
		{"poudlard_redblock.png"},
		"redblock Stairs",
		"redblock Slab",
		"redblock Panel",
		"redblock Microblock",
		"redblock")

poudlard.register_stair_and_slab_and_panel_and_micro("poudlard", "blackblock", "poudlard:blackblock",
		{snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3, not_in_creative_inventory=0},
		{"poudlard_blackblock.png"},
		"blackblock Stairs",
		"blackblock Slab",
		"blackblock Panel",
		"blackblock Microblock",
		"blackblock")


poudlard.register_stair_and_slab_and_panel_and_micro("poudlard", "wood", "default:wood",
		{snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"default_wood.png"},
		"Wooden Stairs",
		"Wooden Slab",
		"Wooden Panel",
		"Wooden Microblock",
		"wood",
		"facedir")

poudlard.register_stair_and_slab_and_panel_and_micro("poudlard", "stone", "default:stone",
		{cracky=3},
		{"default_stone.png"},
		"Stone Stairs",
		"Stone Slab",
		"Stone Panel",
		"Stone Microblock",
		"cobble",
		"none")

poudlard.register_stair_and_slab_and_panel_and_micro("poudlard", "cobble", "default:cobble",
		{cracky=3},
		{"default_cobble.png"},
		"Cobblestone Stairs",
		"Cobblestone Slab",
		"Cobblestone Panel",
		"Cobblestone Microblock",
		"cobble",
		"none")
		
poudlard.register_stair_and_slab_and_panel_and_micro("poudlard", "mossycobble", "default:mossycobble",
		{cracky=3},
		{"default_mossycobble.png"},
		"Mossy Cobblestone Stairs",
		"Mossy Cobblestone Slab",
		"Mossy Cobblestone Panel",
		"Mossy Cobblestone Microblock",
		"mossycobble",
		"none")


poudlard.register_stair_and_slab_and_panel_and_micro("poudlard", "sandstone", "default:sandstone",
		{crumbly=2,cracky=2},
		{"default_sandstone.png"},
		"Sandstone Stairs",
		"Sandstone Slab",
		"Sandstone Panel",
		"Sandstone Microblock",
		"sandstone",
		"none")
		
poudlard.register_stair_and_slab_and_panel_and_micro("poudlard", "steelblock", "default:steelblock",
		{snappy=1,bendy=2,cracky=1,melty=2,level=2},
		{"default_steel_block.png"},
		"Steel Block Stairs",
		"Steel Block Slab",
		"Steel Block Panel",
		"Steel Microblock",
		"steelblock",
		"none")
		
poudlard.register_stair_and_slab_and_panel_and_micro("poudlard", "desert_stone", "default:desert_stone",
		{cracky=3},
		{"default_desert_stone.png"},
		"Desert Stone Stairs",
		"Desert Stone Slab",
		"Desert Stone Panel",
		"Desert Stone Microblock",
		"desert_stone",
		"none")
		
poudlard.register_stair_and_slab_and_panel_and_micro("poudlard", "glass", "default:glass",
		{snappy=2,cracky=3,oddly_breakable_by_hand=3},
		{"default_glass.png"},
		"Glass Stairs",
		"Glass Slab",
		"Glass Panel",
		"Glass Microblock",
		"glass",
		"none")
		
poudlard.register_stair_and_slab_and_panel_and_micro("poudlard", "tree", "default:tree",
		{tree=1,snappy=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
		{"default_tree.png"},
		"Tree Stairs",
		"Tree Slab",
		"Tree Panel",
		"Tree Microblock",
		"tree",
		"none")
		
poudlard.register_stair_and_slab_and_panel_and_micro("poudlard", "jungletree", "default:jungletree",
		{tree=1,snappy=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
		{"default_jungletree_top.png", "default_jungletree_top.png", "default_jungletree.png"},
		"Jungle Tree Stairs",
		"Jungle Tree Slab",
		"Jungle Tree Panel",
		"Jungle Tree Microblock",
		"jungletree",
		"none")

poudlard.register_stair_and_slab_and_panel_and_micro("poudlard", "stonebrick", "default:stonebrick",
		{cracky=3, not_in_creative_inventory=1},
		{"default_stone_brick.png"},
		"Stone Bricks Stairs",
		"Stone Bricks Slab",
		"Stone Bricks Panel",
		"Stone Bricks Microblock",
		"stonebrick")
		
poudlard.register_stair_and_slab_and_panel_and_micro("poudlard", "ironstonebricks", "poudlard:ironstonebricks",
		{cracky=3, not_in_creative_inventory=0},
		{"poudlard_ironstonebrick.png"},
		"Iron Stone Bricks Stairs",
		"Iron Stone Bricks Slab",
		"Iron Stone Bricks Panel",
		"Iron Stone Bricks Microblock",
		"ironstonebricks")
	
poudlard.register_stair_and_slab_and_panel_and_micro("poudlard", "stone_tile", "poudlard:stone_tile",
		{cracky=3, not_in_creative_inventory=0},
		{"poudlard_stonesquare.png"},
		"Stonesquare Stairs",
		"Stonesquare Slab",
		"Stonesquare Panel",
		"Stonesquare Microblock",
		"stone_tile")

poudlard.register_stair_and_slab_and_panel_and_micro("poudlard", "split_stone_tile", "poudlard:split_stone_tile",
		{cracky=3},
		{"poudlard_splitstonesquare_top.png", "poudlard_splitstonesquare.png"},
		"Split Stonesquare Stairs",
		"Split Stonesquare Slab",
		"Split Stonesquare Panel",
		"Split Stonesquare Microblock",
		"split_stone_tile")

poudlard.register_stair_and_slab_and_panel_and_micro("poudlard", "junglewood", "poudlard:junglewood",
		{snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3, not_in_creative_inventory01},
		{"poudlard_junglewood.png"},
		"Jungle Wood Stairs",
		"Jungle Wood Slab",
		"Jungle Wood Panel",
		"Jungle Wood Microblock",
		"junglewood")
		
poudlard.register_stair_and_slab_and_panel_and_micro("poudlard", "circlestonebricks", "poudlard:circlestonebricks",
		{cracky=3, not_in_creative_inventory=0},
		{"poudlard_circlestonebrick.png"},
		"Circle Stone Brick Stairs",
		"Circle Stone Brick Slab",
		"Cricle Stone Brick Panel",
		"Circle Stone Brick Microblock",
		"circlestonebricks")

poudlard.register_stair_and_slab_and_panel_and_micro("poudlard", "plankstone", "poudlard:plankstone",
		{cracky=3, not_in_creative_inventory=0},
		{"poudlard_plankstone.png"},
		"Plankstone Stairs",
		"Plankstone Slab",
		"Plankstone Panel",
		"Plankstone Microblock",
		"plankstone")
		

		
poudlard.register_stair_and_slab_and_panel_and_micro("poudlard", "ironstone", "poudlard:ironstone",
		{cracky=3, not_in_creative_inventory=0},
		{"poudlard_ironstone.png"},
		"Iron Stone Stairs",
		"Iron Stone Slab",
		"Iron Stone Panel",
		"Iron Stone Microblock",
		"ironstone")


