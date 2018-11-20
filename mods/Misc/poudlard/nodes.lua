--Poudlard mod by Perlipop
--Code imported from moreblocks by Calinou


-- Blocks
minetest.register_node("poudlard:poudstone", {
	description = "Poudstone",
	tiles = {"poudlard_poudstone.png"},
	is_ground_content = true,
	groups = {cracky=3, stone=2},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("poudlard:poudwood", {
	description = "Poudlard Wooden Planks",
	tiles = {"poudlard_poudwood.png"},
	is_ground_content = true,
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("poudlard:redblock", {
	description = "Red block",
	tiles = {"poudlard_redblock.png"},
	is_ground_content = true,
	groups = {cracky=3, stone=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("poudlard:blackblock", {
	description = "black block",
	tiles = {"poudlard_blackblock.png"},
	is_ground_content = true,
	groups = {cracky=3, stone=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("poudlard:junglewood", {
	description = "Jungle Wooden Planks",
	tiles = {"poudlard_junglewood.png"},
	paramtype2 = "facedir",
	is_ground_content = true,
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("poudlard:stonebrick", {
	description = "Stone Bricks",
	tiles = {"poudlard_stonebrick.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("poudlard:circlestonebricks", {
	description = "Circle Stone Bricks",
	tiles = {"poudlard_circlestonebrick.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("poudlard:ironstonebricks", {
	description = "Iron Stone Bricks",
	tiles = {"poudlard_ironstonebrick.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("poudlard:stone_tile", {
	description = "Stonesquare",
	tiles = {"poudlard_stonesquare.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("poudlard:split_stone_tile", {
	description = "Split Stonesquare",
	tiles = {"poudlard_splitstonesquare_top.png", "poudlard_splitstonesquare.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("poudlard:plankstone", {
	description = "Plankstone",
	tiles = {
		"poudlard_plankstone.png",
		"poudlard_plankstone.png",
		"poudlard_plankstone.png",
		"poudlard_plankstone.png",
		"poudlard_plankstone_2.png",
		"poudlard_plankstone_2.png",
	},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("poudlard:ironglass", {
	description = "Iron Glass",
	drawtype = "glasslike",
	tiles = {"poudlard_ironglass.png"},
	inventory_image = minetest.inventorycube("poudlard_ironglass.png"),
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("poudlard:coalglass", {
	description = "Coal Glass",
	drawtype = "glasslike",
	tiles = {"poudlard_coalglass.png"},
	inventory_image = minetest.inventorycube("poudlard_coalglass.png"),
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("poudlard:cleanglass", {
	description = "Clean Glass",
	drawtype = "glasslike",
	tiles = {"poudlard_cleanglass.png"},
	inventory_image = minetest.inventorycube("poudlard_cleanglass.png"),
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})


minetest.register_node("poudlard:cactuschecker", {
	description = "Cactus Checker",
	tiles = {
		"poudlard_cactuschecker.png",
		"poudlard_cactuschecker.png",
		"poudlard_cactuschecker.png",
		"poudlard_cactuschecker.png",
		"poudlard_cactuschecker_2.png",
		"poudlard_cactuschecker_2.png",
	},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("poudlard:emptybookshelf", {
	description = "Empty Bookshelf",
	tiles = {"default_wood.png", "default_wood.png", "poudlard_emptybookshelf.png"},
	is_ground_content = true,
	groups = {snappy=2,choppy=3,oddly_breakable_by_hand=2,flammable=3},
	sounds = default.node_sound_wood_defaults(),
})


minetest.register_node("poudlard:coalstone", {
	description = "Coal Stone",
	tiles = {"poudlard_coalstone.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("poudlard:ironstone", {
	description = "Iron Stone",
	tiles = {"poudlard_ironstone.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("poudlard:coalchecker", {
	description = "Coal Checker",
	tiles = {
		"poudlard_coalchecker.png",
		"poudlard_coalchecker.png",
		"poudlard_coalchecker.png",
		"poudlard_coalchecker.png",
		"poudlard_coalchecker_2.png",
		"poudlard_coalchecker_2.png",
	},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("poudlard:ironchecker", {
	description = "Iron Checker",
	tiles = {
		"poudlard_ironchecker.png",
		"poudlard_ironchecker.png",
		"poudlard_ironchecker.png",
		"poudlard_ironchecker.png",
		"poudlard_ironchecker_2.png",
		"poudlard_ironchecker_2.png",
	},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("poudlard:trapstone", {
	description = "Trapstone",
	tiles = {"poudlard_trapstone.png"},
	walkable = false,
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("poudlard:trapglass", {
	description = "Trapglass",
	drawtype = "glasslike",
	tiles = {"poudlard_trapglass.png"},
	inventory_image = minetest.inventorycube("poudlard_trapglass.png"),
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = true,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("poudlard:fence_junglewood", {
	description = "Jungle Wood Fence",
	drawtype = "fencelike",
	tiles = {"poudlard_junglewood.png"},
	inventory_image = "poudlard_junglewood_fence.png",
	wield_image = "poudlard_junglewood_fence.png",
	paramtype = "light",
	is_ground_content = true,
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=2},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("poudlard:horizontaltree", {
	description = "Horizontal Tree",
	tiles = {"default_tree.png", "default_tree.png", "poudlard_horizontaltree.png",
		"poudlard_horizontaltree.png", "default_tree_top.png", "default_tree_top.png"},
	paramtype2 = "facedir",
	groups = {tree=1,snappy=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
	sounds = default.node_sound_wood_defaults(),
	furnace_burntime = 30,
})


minetest.register_node("poudlard:allfacestree", {
	description = "All-faces Tree",
	tiles = {"default_tree_top.png"},
	groups = {tree=1,snappy=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
	sounds = default.node_sound_wood_defaults(),
	furnace_burntime = 30,
})

minetest.register_node("poudlard:alltree", {
	description = "All-faces Tree",
	tiles = {"default_tree.png"},
	groups = {tree=1,snappy=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
	sounds = default.node_sound_wood_defaults(),
	furnace_burntime = 30,
})

minetest.register_node("poudlard:superglowglass", {
	description = "Super Glowglass",
	drawtype = "glasslike",
	tiles = {"poudlard_glowglass.png"},
	inventory_image = minetest.inventorycube("poudlard_glowglass.png"),
	paramtype = "light",
	sunlight_propagates = true,
	light_source = 15,
	is_ground_content = true,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("poudlard:rope", {
	description = "Rope",
	drawtype = "signlike",
	tiles = {"poudlard_rope.png"},
	inventory_image = "poudlard_rope.png",
	wield_image = "poudlard_rope.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	is_ground_content = true,
	walkable = false,
	climbable = true,
	selection_box = {
		type = "wallmounted",
	},
	groups = {snappy=3,flammable=2},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("poudlard:wood_tile", {
	description = "Wooden Tile",
	tiles = {"poudlard_wood_tile.png", "poudlard_wood_tile.png", "poudlard_wood_tile.png", "poudlard_wood_tile.png", "poudlard_wood_tile.png^[transformR90", "poudlard_wood_tile.png^[transformR90"},
	inventory_image = {"poudlard_wood_tile.png", "poudlard_wood_tile.png"},
	paramtype2 = "facedir",
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("poudlard:wood_tile_full", {
	description = "Full Wooden Tile",
	tiles = {"poudlard_wood_tile_full.png", "poudlard_wood_tile_full.png", "poudlard_wood_tile_full.png",
	"poudlard_wood_tile_full.png", "poudlard_wood_tile_full.png^[transformR90", "poudlard_wood_tile_full.png^[transformR90"},
	inventory_image = {"poudlard_wood_tile_full.png", "poudlard_wood_tile_full.png"},
	paramtype2 = "facedir",
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("poudlard:wood_tile_center", {
	description = "Centered Wooden Tile",
	tiles = {"poudlard_wood_tile_center.png", "poudlard_wood_tile_center.png", "poudlard_wood_tile_center.png", "poudlard_wood_tile_center.png", "poudlard_wood_tile_center.png^[transformR90", "poudlard_wood_tile_center.png^[transformR90"},
	inventory_image = {"poudlard_wood_tile_center.png", "poudlard_wood_tile_center.png"},
	paramtype2 = "facedir",
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("poudlard:secretbookshelf", {
	description = "Secret_bookshelf",
	tiles = {"default_wood.png", "default_wood.png","poudlard_secretbookshelf.png"},
	walkable = false,
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

-- Items

minetest.register_craftitem("poudlard:sweeper", {
	description = "Sweeper",
	inventory_image = "poudlard_sweeper.png",
})

minetest.register_craftitem("poudlard:junglestick", {
	description = "Jungle Stick",
	inventory_image = "poudlard_junglestick.png",
})
