-- This file supplies nightstands
-- Load translation library if intllib is installed

local S
if (minetest.get_modpath("intllib")) then
	dofile(minetest.get_modpath("intllib").."/intllib.lua")
	S = intllib.Getter(minetest.get_current_modname())
	else
	S = function ( s ) return s end
end


-- OAK NIGHTSTAND

minetest.register_node('poudlard:nightstand_1', {
	drawtype = "nodebox",
	description = S("Oak Nightstand with Two Drawers"),
	tiles = { 'homedecor_nightstand_oak_top.png',
			'homedecor_nightstand_oak_bottom.png',
			'homedecor_nightstand_oak_right.png',
			'homedecor_nightstand_oak_left.png',
			'homedecor_nightstand_oak_back.png',
			'homedecor_nightstand_oak_2_drawer_front.png'},
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
        selection_box = {
                type = "fixed",
                fixed = { -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 }
        },
        node_box = {
                type = "fixed",
		fixed = {
			{ -8/16, -8/16, -30/64,  8/16,  8/16,   8/16 },	-- main body
			{ -7/16,  1/16, -32/64,  7/16,  7/16, -29/64 },	-- top drawer face
			{ -7/16, -7/16, -32/64,  7/16, -1/16, -29/64 },	-- bottom drawer face

		}
        },
	groups = { snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",
				"size[8,7]"..
				"list[current_name;main;0,0;8,2;]"..
				"list[current_player;main;0,3;8,4;]")
		meta:set_string("infotext", S("Two-drawer Nightstand"))
		local inv = meta:get_inventory()
		inv:set_size("main", 16)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", S("%s moves stuff in nightstand at %s"):format(
		    player:get_player_name(),
		    minetest.pos_to_string(pos)
		))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", S("%s moves stuff to nightstand at %s"):format(
		    player:get_player_name(),
		    minetest.pos_to_string(pos)
		))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", S("%s takes stuff from nightstand at %s"):format(
		    player:get_player_name(),
		    minetest.pos_to_string(pos)
		))
	end,
})


--MAHOGANY NIGHSTAND -----------------------

minetest.register_node('poudlard:nightstand_2', {
	drawtype = "nodebox",
	description = S("Mahogany Nightstand with Two Drawers"),
	tiles = { 'homedecor_nightstand_mahogany_top.png',
			'homedecor_nightstand_mahogany_bottom.png',
			'homedecor_nightstand_mahogany_right.png',
			'homedecor_nightstand_mahogany_left.png',
			'homedecor_nightstand_mahogany_back.png',
			'homedecor_nightstand_mahogany_2_drawer_front.png'},
	sunlight_propagates = false,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
        selection_box = {
                type = "fixed",
                fixed = { -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 }
        },
        node_box = {
                type = "fixed",
		fixed = {
			{ -8/16, -8/16, -30/64,  8/16,  8/16,   8/16 },	-- main body
			{ -7/16,  1/16, -32/64,  7/16,  7/16, -29/64 },	-- top drawer face
			{ -7/16, -7/16, -32/64,  7/16, -1/16, -29/64 },	-- bottom drawer face

		}
        },
	groups = { snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",
				"size[8,7]"..
				"list[current_name;main;0,0;8,2;]"..
				"list[current_player;main;0,3;8,4;]")
		meta:set_string("infotext", S("Two-drawer Nightstand"))
		local inv = meta:get_inventory()
		inv:set_size("main", 16)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", S("%s moves stuff in nightstand at %s"):format(
		    player:get_player_name(),
		    minetest.pos_to_string(pos)
		))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", S("%s moves stuff to nightstand at %s"):format(
		    player:get_player_name(),
		    minetest.pos_to_string(pos)
		))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", S("%s takes stuff from nightstand at %s"):format(
		    player:get_player_name(),
		    minetest.pos_to_string(pos)
		))
	end,
})



-------Alias for homedecor
minetest.register_alias("homedecor:nightstand_oak_two_drawers", "poudecor:nightstand_1")
minetest.register_alias("homedecor:nightstand_mahogany_two_drawerst", "poudecor:nightstand_2")


-------Alias for Poudlard
minetest.register_alias("poudecor:nightstand_1", "poudlard:nightstand_1")
minetest.register_alias("poudecor:nightstand_2", "poudlard:nightstand_2")

