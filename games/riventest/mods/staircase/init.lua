--[[ staircase mod for Riventest mod
this mod adds catwalks to the Riventest mod
Staircase and Riventest are mods for Minetest
This mod has been tested with Minetest 0.4.5
]]

staircase = {}

-- Node will be called staircase:stair_<subname>
function staircase.register_railings(subname, groups, images, desc, sounds)
	minetest.register_node("staircase:railing_" .. subname, {
		description = desc..' railing',--description,description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = groups,
		sounds = sounds,
		sunlight_propagates = true,
		node_box = {
			type = "fixed",
			fixed = {
--				{-0.5, -0.5, 0.4, 0.5, 0.1, 0.5},

				{-0.5, 0.2, 0.35, 0.5, 0.3, 0.5},
				{-0.5, -0.5, 0.4, -0.45, 0.2, 0.5},
				{0.5, -0.5, 0.4, 0.45, 0.2, 0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, 0.35, 0.5, 0.3, 0.5},

			},
		},
	})
	minetest.register_node("staircase:urailing_" .. subname, {
		description = desc..' railing (support piece)',--description,description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = groups,
		sounds = sounds,
		sunlight_propagates = true,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, 0.3, 0.4, 0.5, 0.5, 0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, 0.3, 0.4, 0.5, 0.5, 0.5},
			},
		},		
	})
	minetest.register_node("staircase:crailing_" .. subname, {
		description = desc..' railing (corner piece)',--description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = groups,
		sounds = sounds,
		sunlight_propagates = true,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, 0.2, 0.35, 0.5, 0.3, 0.5},
				{-0.5, 0.2, -0.5, -0.35, 0.3, 0.35},
				{-0.5, -0.5, 0.4, -0.4, 0.2, 0.5},
				{0.5, -0.5, 0.4, 0.45, 0.2, 0.5},
				{-0.5, -0.5, -0.5, -0.4, 0.2, -0.45},												
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, 0.35, 0.5, 0.3, 0.5},
				{-0.5, -0.5, -0.5, -0.35, 0.3, 0.35},
			},
		},
	})
	minetest.register_node("staircase:ucrailing_" .. subname, {
		description = desc..' railing (corner support piece)',--description,description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = groups,
		sounds = sounds,
		sunlight_propagates = true,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, 0.3, 0.4, 0.5, 0.5, 0.5},
				{-0.5, 0.3, -0.5, -0.4, 0.5, 0.4},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, 0.3, 0.4, 0.5, 0.5, 0.5},
				{-0.5, 0.3, -0.5, -0.4, 0.5, 0.4},

			},
		},
	})
	minetest.register_node("staircase:hrailing_" .. subname, {
		description = desc..' railing (dead-end piece)',--description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, 0.2, 0.35, 0.5, 0.3, 0.5},
				{-0.5, 0.2, -0.5, -0.35, 0.3, 0.35},
				{0.5, 0.2, -0.5, 0.35, 0.3, 0.35},				

				{-0.5, -0.5, 0.4, -0.4, 0.2, 0.5},
				{0.5, -0.5, 0.4, 0.4, 0.2, 0.5},
				{-0.5, -0.5, -0.5, -0.4, 0.2, -0.45},
				{0.5, -0.5, -0.5, 0.4, 0.2, -0.45},																												
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, 0.2, 0.35, 0.5, 0.3, 0.5},
				{-0.5, 0.2, -0.5, -0.35, 0.3, 0.35},
				{0.5, 0.2, -0.5, 0.35, 0.3, 0.35},				

				{-0.5, -0.5, 0.4, -0.4, 0.2, 0.5},
				{0.5, -0.5, 0.4, 0.4, 0.2, 0.5},
				{-0.5, -0.5, -0.5, -0.4, 0.2, -0.45},
				{0.5, -0.5, -0.5, 0.4, 0.2, -0.45},		
			},
		},
	})
	minetest.register_node("staircase:uhrailing_" .. subname, {
		description = desc..' railing (dead-end support piece)',--description,description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = groups,
		sounds = sounds,
		sunlight_propagates = true,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, 0.3, 0.4, 0.5, 0.5, 0.5},
				{-0.5, 0.3, -0.5, -0.4, 0.5, 0.4},
				{0.5, 0.3, -0.5, 0.4, 0.5, 0.4},				
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, 0.3, 0.4, 0.5, 0.5, 0.5},
				{-0.5, 0.3, -0.5, -0.4, 0.5, 0.4},
				{0.5, 0.3, -0.5, 0.4, 0.5, 0.4},		

			},
		},
	})	
	
	-- CRAFTS
	local rail = 'riventest:stick_'..subname
	
	minetest.register_craft({
		output = 'staircase:railing_'..subname,
		recipe = {
			{rail,rail,rail},
		}
	})
	minetest.register_craft({
		output = 'staircase:crailing_'..subname,
		recipe = {
			{rail,rail,rail},
			{rail,  '',  ''},
			{rail,  '',  ''},
		}
	})
	minetest.register_craft({
		output = 'staircase:crailing_'..subname,
		recipe = {
			{rail,rail,rail},
			{  '',  '',rail},
			{  '',  '',rail},
		}
	})
	minetest.register_craft({
		output = 'staircase:hrailing_'..subname,
		recipe = {
			{rail,rail,rail},
			{rail,  '',rail},
			{rail,  '',rail},
		}
	})

	minetest.register_craft({
		output = 'staircase:urailing_'..subname,
		recipe = {{'staircase:railing_'..subname}},
	})
	minetest.register_craft({
		output = 'staircase:uhrailing_'..subname,
		recipe = {{'staircase:hrailing_'..subname}},
	})
	minetest.register_craft({
		output = 'staircase:ucrailing_'..subname,
		recipe = {{'staircase:crailing_'..subname}},
	})
	
end
function staircase.register_catwalk(subname, groups, images, description, sounds)
		minetest.register_node("staircase:supcatwalk_" .. subname, {
		description = description..' catwalk side piece',--description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.1, -0.5, 0.5, 0.1, -0.45, -0.1},
				{-0.1, -0.45, -0.1, 0.1, 0.5, 0.1},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.1, -0.5, 0.5, 0.1, -0.45, -0.1},
				{-0.1, -0.45, -0.1, 0.1, 0.5, 0.1},
			},
		},
	})

		minetest.register_node("staircase:catwalk_" .. subname, {
		description = description..' catwalk',
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, -0.45, 0.5},

				{-0.5, 0.2, -0.5, -0.4, 0.3, 0.5},
				{0.5, 0.2, -0.5, 0.4, 0.3, 0.5},
				{-0.5, -0.45, 0.45, -0.45, 0.2, 0.5},

				{0.5, -0.45, 0.45, 0.45, 0.2, 0.5},
				{-0.5, -0.45, -0.5, -0.45, 0.2, -0.45},
				{0.5, -0.45, -0.5, 0.45, 0.2, -0.45},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {{-0.5, -0.5, -0.5, 0.5, 0.3, 0.5}},
		},
	})
		minetest.register_node("staircase:leftcatwalk_" .. subname, {
		description = description..' catwalk (left turn)',
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = groups,
		sonuds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, -0.45, 0.5},

				{-0.5, 0.2, -0.5, 0.5, 0.3, -0.4},
				{-0.5, 0.2, 0.5, -0.4, 0.3, -0.5},
				{0.5, 0.2, 0.5, 0.4, 0.3, 0.4},

				{-0.5, -0.45, 0.45, -0.45, 0.2, 0.5},
				{0.5, -0.45, 0.45, 0.45, 0.2, 0.5},
				{-0.5, -0.45, -0.5, -0.45, 0.2, -0.45},
				{0.5, -0.45, -0.5, 0.45, 0.2, -0.45},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {{-0.5, -0.5, -0.5, 0.5, 0.3, 0.5}},
		},
	})	
		minetest.register_node("staircase:rightcatwalk_" .. subname, {
		description = description..' catwalk (right turn)',--description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, -0.45, 0.5},

				{-0.5, 0.2, -0.5, 0.5, 0.3, -0.4},
				{0.5, 0.2, 0.5, 0.4, 0.3, -0.5},
				{-0.5, 0.2, 0.5, -0.4, 0.3, 0.4},

				{-0.5, -0.45, 0.45, -0.45, 0.2, 0.5},
				{0.5, -0.45, 0.45, 0.45, 0.2, 0.5},
				{-0.5, -0.45, -0.5, -0.45, 0.2, -0.45},
				{0.5, -0.45, -0.5, 0.45, 0.2, -0.45},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {{-0.5, -0.5, -0.5, 0.5, 0.3, 0.5}},
		},
	})	
		minetest.register_node("staircase:tjuncatwalk_" .. subname, {
		description = description..' catwalk (T junction)',--description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, -0.45, 0.5},

				{-0.5, 0.2, -0.5, 0.5, 0.3, -0.4},
				{-0.5, 0.2, 0.5, -0.4, 0.3, 0.4},
				{0.5, 0.2, 0.5, 0.4, 0.3, 0.4},

				{-0.5, -0.45, 0.45, -0.45, 0.2, 0.5},
				{0.5, -0.45, 0.45, 0.45, 0.2, 0.5},
				{-0.5, -0.45, -0.5, -0.45, 0.2, -0.45},
				{0.5, -0.45, -0.5, 0.45, 0.2, -0.45},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {{-0.5, -0.5, -0.5, 0.5, 0.3, 0.5}},
		},
	})	
	minetest.register_node("staircase:crosscatwalk_" .. subname, {
		description = description..' catwalk (crossing)',--description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, -0.45, 0.5},

				{-0.5, 0.2, -0.5, -0.4, 0.3, -0.4},
				{-0.5, 0.2, 0.5, -0.4, 0.3, 0.4},
				{0.5, 0.2, -0.5, 0.4, 0.3, -0.4},				
				{0.5, 0.2, 0.5, 0.4, 0.3, 0.4},
								
				{-0.5, -0.45, 0.45, -0.45, 0.2, 0.5},
				{0.5, -0.45, 0.45, 0.45, 0.2, 0.5},
				{-0.5, -0.45, -0.5, -0.45, 0.2, -0.45},
				{0.5, -0.45, -0.5, 0.45, 0.2, -0.45},																												
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {{-0.5, -0.5, -0.5, 0.5, 0.3, 0.5}},
		},
	})

	minetest.register_node("staircase:deadcatwalk_" .. subname, {
		description = description..' catwalk (dead end)',
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, -0.45, 0.5},

				{-0.5, 0.2, 0.40, 0.5, 0.3, 0.5},
				{-0.5, 0.2, -0.5, -0.40, 0.3, 0.40},
				{0.5, 0.2, -0.5, 0.40, 0.3, 0.40},				

				{-0.5, -0.45, 0.45, -0.45, 0.2, 0.5},
				{0.5, -0.45, 0.45, 0.45, 0.2, 0.5},
				{-0.5, -0.45, -0.5, -0.4, 0.2, -0.45},
				{0.5, -0.45, -0.5, 0.4, 0.2, -0.45},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {{-0.5, -0.5, -0.5, 0.5, 0.3, 0.5}},
		},
	})


	-- CRAFTS
	local rail = 'riventest:stick_'..subname
	local floor = 'staircase:slab_'..subname

	minetest.register_craft({
		output = 'staircase:catwalk_'..subname..' 3',
		recipe = {
			{ rail,floor, rail},
			{ rail,floor, rail},
			{ rail,floor, rail},
		},
	})
	minetest.register_craft({
		output = 'staircase:catwalk_'..subname..' 3',
		recipe = {
			{ rail, rail, rail},
			{floor,floor,floor},
			{ rail, rail, rail},
		},
	})

	minetest.register_craft({
		output = 'staircase:tjuncatwalk_'..subname..' 3',
		recipe = {
			{ rail,floor, rail},
			{floor,floor,floor},
			{ rail, rail, rail},
		},
	})
	minetest.register_craft({
		output = 'staircase:tjuncatwalk_'..subname..' 3',
		recipe = {
			{ rail,floor, rail},
			{ rail,floor,floor},
			{ rail,floor, rail},
		},
	})
	minetest.register_craft({
		output = 'staircase:tjuncatwalk_'..subname..' 3',
		recipe = {
			{ rail, rail, rail},
			{floor,floor,floor},
			{ rail,floor, rail},
		},
	})
	minetest.register_craft({
		output = 'staircase:tjuncatwalk_'..subname..' 3',
		recipe = {
			{ rail,floor, rail},
			{floor,floor, rail},
			{ rail,floor, rail},
		},
	})

	minetest.register_craft({
		output = 'staircase:crosscatwalk_'..subname..' 3',
		recipe = {
			{ rail,floor, rail},
			{floor,floor,floor},
			{ rail,floor, rail},
		}
	})

	minetest.register_craft({
		output = 'staircase:rightcatwalk_'..subname..' 3',
		recipe = {
			{ rail, rail, rail},
			{ rail,floor,floor},
			{ rail,floor, rail},
		},
	})
	minetest.register_craft({
		output = 'staircase:leftcatwalk_'..subname..' 3',
		recipe = {
			{ rail, rail, rail},
			{floor,floor, rail},
			{ rail,floor, rail},
		},
	})
	minetest.register_craft({
		output = 'staircase:deadcatwalk_'..subname..' 2',
		recipe = {
			{ rail, rail, rail},
			{ rail,floor, rail},
			{ rail,floor, rail},
		},
	})

	-- These two recipes allow the player to easily turn the rightcatwalk to the leftcatwalk and vice versa, because they are both identical in a logical sense, but not in a technical sense
	minetest.register_craft({
		output = 'staircase:rightcatwalk_'..subname..' 1',
		recipe = {{'staircase:leftcatwalk_'..subname}},
	})
	minetest.register_craft({
		output = 'staircase:leftcatwalk_'..subname..' 1',
		recipe = {{'staircase:rightcatwalk_'..subname}},
	})
	
	minetest.register_craft({
		output = 'staircase:supcatwalk_'..subname..' 1',
		recipe = {
			{rail,  ''},
			{rail,  ''},
			{rail,rail},
		}
	})

end

function staircase.register_railings_and_catwalk_crafts(subname)
	local rail  = 'riventest:stick_'..subname
	local floor = 'staircase:slab_'..subname
	minetest.register_craft({
		output = 'staircase:deadcatwalk_'..subname..' 2',
		recipe = {
			{ 'staircase:hrailing_'..subname },
			{ floor },
			{ floor },
		},
	})
	minetest.register_craft({
		output = 'staircase:leftcatwalk_'..subname..' 3',
		recipe = {
			{ 'staircase:crailing_'..subname, '', '' },
			{ '', floor, floor },
			{ '', floor, rail },
		},
	})
	minetest.register_craft({
		output = 'staircase:rightcatwalk_'..subname..' 3',
		recipe = {
			{ '', '', 'staircase:crailing_'..subname },
			{ floor, floor, '' },
			{ rail, floor, ''},
		},
	})
	minetest.register_craft({
		output = 'staircase:leftcatwalk_'..subname..' 3',
		recipe = {
			{ rail, floor, ''},
			{ floor, floor, '' },
			{ '', '', 'staircase:crailing_'..subname },
		},
	})
	minetest.register_craft({
		output = 'staircase:rightcatwalk_'..subname..' 3',
		recipe = {
			{ '', floor, rail },
			{ '', floor, floor },
			{ 'staircase:crailing_'..subname, '', '' },
		},
	})


	minetest.register_craft({
		output = 'staircase:catwalk_'..subname..' 3',
		recipe = {
			{ '', floor, '' },
			{ 'staircase:railing_'..subname , floor, 'staircase:railing_'..subname },
			{ '', floor, '' },
		},
	})
	minetest.register_craft({
		output = 'staircase:catwalk_'..subname..' 3',
		recipe = {
			{ '', 'staircase:railing_'..subname, ''},
			{ floor, floor, floor },
			{ '', 'staircase:railing_'..subname, ''},
		}
	})

	minetest.register_craft({
		output = 'staircase:tjuncatwalk_'..subname..' 3',
		recipe = {
			{ '', 'staircase:railing_'..subname, ''},
			{ floor, floor, floor },
			{ rail, floor, rail},
		}
	})
	minetest.register_craft({
		output = 'staircase:tjuncatwalk_'..subname..' 3',
		recipe = {
			{ rail, floor, rail },
			{ floor, floor, floor },
			{ '', 'staircase:railing_'..subname, ''},
		}
	})
	minetest.register_craft({
		output = 'staircase:tjuncatwalk_'..subname..' 3',
		recipe = {
			{ '', floor, rail },
			{ 'staircase:railing_'..subname, floor, floor },
			{ '', floor, rail },
		}
	})
	minetest.register_craft({
		output = 'staircase:tjuncatwalk_'..subname..' 3',
		recipe = {
			{ rail, floor, '' },
			{ floor, floor,  'staircase:railing_'..subname },
			{ rail, floor, '' },
		}
	})
end

function staircase.register_stair(subname, recipeitem, groups, images, description, sounds, style)
	local node_and_selection_box
	if (style==nil) then style = "classic" end
	if(style=="slim") then
		node_and_selection_box = 
		{
			type = "fixed",
			fixed = {
				{-0.5, -0.1, -0.5, 0.5, 0, 0},
				{-0.1, -0.5, -0.5, 0.1, -0.1, 0.5},

				{-0.5, 0.4, 0, 0.5, 0.5, 0.5},
				{-0.1, -0.1, 0, 0.1, 0.4, 0.5},
			},
		}
	elseif(style=="classic") then
		node_and_selection_box =
		{
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0,   0.5},
				{-0.5,  0,    0,   0.5, 0.5, 0.5},
			},
		}
	end

	minetest.register_node("staircase:" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = groups,
		node_box = node_and_selection_box,
		selection_box = node_and_selection_box,
		sounds = sounds,
	})

	if(style=="slim") then
		minetest.register_node("staircase:support_" .. subname, {
			description = description.." support",
			drawtype = "nodebox",
			tiles = images,
			paramtype = "light",
			paramtype2 = "facedir",
			is_ground_content = true,
			groups = groups,
			node_box = {
				type = "fixed",
				fixed = {
	
					{0.1, 0.5, 0, -0.1, 0, -0.5},
--					{-0.1, -0.5, 0, 0.1, 0.5, -0.5},
				},
			},
		})
	end

	minetest.register_craft({
		output = 'staircase:' .. subname .. ' 4',
		recipe = {
			{recipeitem, "", ""},
			{recipeitem, recipeitem, ""},
			{recipeitem, recipeitem, recipeitem},
		},
	})

	-- Flipped recipe for the silly minecrafters
	minetest.register_craft({
		output = 'staircase:' .. subname .. ' 4',
		recipe = {
			{"", "", recipeitem},
			{"", recipeitem, recipeitem},
			{recipeitem, recipeitem, recipeitem},
		},
	})
end

-- Node will be called staircase:slab_<subname>
function staircase.register_slab(subname, recipeitem, groups, images, description, sounds)
	minetest.register_node("staircase:slab_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		is_ground_content = true,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			-- If it's being placed on an another similar one, replace it with
			-- a full block
			local slabpos = nil
			local slabnode = nil
			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local n0 = minetest.env:get_node(p0)
			local n1 = minetest.env:get_node(p1)
			if n0.name == "staircase:slab_" .. subname then
				slabpos = p0
				slabnode = n0
			elseif n1.name == "staircase:slab_" .. subname then
				slabpos = p1
				slabnode = n1
			end
			if slabpos then
				-- Remove the slab at slabpos
				minetest.env:remove_node(slabpos)
				-- Make a fake stack of a single item and try to place it
				local fakestack = ItemStack(recipeitem)
				pointed_thing.above = slabpos
				fakestack = minetest.item_place(fakestack, placer, pointed_thing)
				-- If the item was taken from the fake stack, decrement original
				if not fakestack or fakestack:is_empty() then
					itemstack:take_item(1)
				-- Else put old node back
				else
					minetest.env:set_node(slabpos, slabnode)
				end
				return itemstack
			end
			
			-- Otherwise place regularly
			return minetest.item_place(itemstack, placer, pointed_thing)
		end,
	})

	-- 3 nodes to 6 slabs
	minetest.register_craft({
		output = 'staircase:slab_' .. subname .. ' 6',
		recipe = {
			{recipeitem, recipeitem, recipeitem},
		},
	})

	-- 2 slabs to 1 node
	minetest.register_craft({
		output = 'riventest:'..subname,
		recipe = {
			{'staircase:slab_'..subname},
			{'staircase:slab_'..subname},
		}
	})
end

-- Nodes will be called staircase:{stair,slab}_<subname>
function staircase.register_stair_and_slab(subname, recipeitem, groups, images, desc_stair, desc_slab, sounds, style)
	staircase.register_stair(subname, recipeitem, groups, images, desc_stair, sounds, style)
	staircase.register_slab(subname, recipeitem, groups, images, desc_slab, sounds)
end


staircase.register_stair_and_slab("wood", "riventest:wood",
	{snappy=2,choppy=2,flammable=2,oddly_breakable_by_hand=2},
	{"riventest_wood.png"},
	"wooden stair",
	"wooden slab",
	riventest.node_sound_wood_defaults(),
	"slim"
)

staircase.register_stair_and_slab("woodblue", "riventest:woodblue",
	{snappy=2,choppy=2,flammable=2,oddly_breakable_by_hand=2},
	{"riventest_woodblue.png"},
	"bluewood stair",
	"bluewood slab",
	riventest.node_sound_wood_defaults(),
	"slim"
)
	
staircase.register_stair_and_slab("goldstone2", "riventest:goldstone2",
	{cracky=3},
	{"riventest_goldstone2.png"},
	"goldstone stair",
	"goldstone slab",
	riventest.node_sound_stone_defaults(),
	"classic"
)

staircase.register_stair_and_slab("stoneblue", "riventest:stoneblue",
	{cracky=3},
	{"riventest_stoneblue.png"},
	"bluestone stair",
	"bluestone slab",
	riventest.node_sound_stone_defaults(),
	"classic"
)

staircase.register_stair_and_slab("stone1", "riventest:stone1",
	{cracky=3},
	{"riventest_stone1.png"},
	"brownstone stair",
	"brownstone slab",
	riventest.node_sound_stone_defaults(),
	"classic"
)

staircase.register_stair_and_slab("stone2", "riventest:stone2",
	{cracky=3},
	{"riventest_stone2.png"},
	"graystone stair",
	"graystone slab",
	riventest.node_sound_stone_defaults(),
	"classic"
)

staircase.register_stair_and_slab("goldstone1", "riventest:goldstone1",
	{cracky=3},
	{"riventest_goldstone1.png"},
	"brightstone stair",
	"brightstone slab",
	riventest.node_sound_stone_defaults(),
	"classic"
)

staircase.register_stair_and_slab("rt8", "riventest:rt8",
	{cracky=3},
	{"riventest_rt8.png"},
	"bright cobblestone stair",
	"bright cobblestone slab",
	riventest.node_sound_stone_defaults(),
	"classic"
)

staircase.register_stair_and_slab("rt5", "riventest:rt5",
	{bendy=2,cracky=1,melty=2},
	{"riventest_rt5.png"},
	"golden stair",
	"golden slab",
	riventest.node_sound_metal_defaults(),
	"slim"
)

staircase.register_stair_and_slab("rt4", "riventest:rt4",
	{bendy=2,cracky=1,melty=2},
	{"riventest_rt4.png"},
	"metal stair",
	"metal slab",
	riventest.node_sound_metal_defaults(),
	"slim"
)

staircase.register_stair_and_slab("rt10", "riventest:rt10",
	{bendy=2,cracky=1,melty=2},
	{"riventest_rt10.png"},
	"rusted metal stair",
	"rusted metal slab",
	riventest.node_sound_metal_defaults(),
	"slim"
)

staircase.register_stair_and_slab("metal", "riventest:metal",
	{bendy=2,cracky=1,melty=2},
	{"riventest_metal.png"},
	"black metal stair",
	"black metal slab",
	riventest.node_sound_metal_defaults(),
	"slim"
)

staircase.register_railings("metal", {snappy=1,bendy=2,cracky=1,melty=2}, {"riventest_metal.png"}, "black metal", riventest.node_sound_metal_defaults())
staircase.register_catwalk("metal", {bendy=2,cracky=1,melty=2}, {"riventest_metal.png"}, "black metal", riventest.node_sound_metal_defaults())
staircase.register_railings_and_catwalk_crafts("metal")

minetest.register_craft({
	type="fuel",
	recipe="staircase:wood",
	burntime=20,
})
minetest.register_craft({
	type="fuel",
	recipe="staircase:slab_wood",
	burntime=15,
})
minetest.register_craft({
	type="fuel",
	recipe="staircase:support_wood",
	burntime=3
})

minetest.register_craft({
	type="fuel",
	recipe="staircase:bluewood",
	burntime=21,
})
minetest.register_craft({
	type="fuel",
	recipe="staircase:slab_bluewood",
	burntime=16,
})
minetest.register_craft({
	type="fuel",
	recipe="staircase_support_bluewood",
	burntime=4,
})

--[[
LEGACY ALIASES
]]
-- bluewood -> woodblue
minetest.register_alias("staircase:bluewood","staircase:woodblue")
minetest.register_alias("staircase:bluewood_support","staircase:woodblue_support")
minetest.register_alias("staircase:bluewood_slab","staircase:woodblue_slab")

-- gold -> stoneblue
minetest.register_alias("staircase:gold","staircase:stoneblue")
minetest.register_alias("staircase:gold_support","staircase:stoneblue_support")
minetest.register_alias("staircase:gold_slab","staircase:stoneblue_slab")

-- rt4
-- no aliases, because it would collide.
