
-- Test


local chaircolors = {
	{ "black", "Black" },
	{ "yellow", "Yellow" },
	{ "red", "Red" },
	{ "violet", "Violet" },
	{ "blue", "Blue" },
	{ "dark_green", "Dark Green" },
}

for i in ipairs(chaircolors) do
	color = chaircolors[i][1]
	name = chaircolors[i][2]
	minetest.register_node("poudlard:armchair_"..color, {
	    description = "Armchair ("..name..")",
	    tiles = {
		"forniture_armchair_top_"..color..".png",
		"forniture_armchair_top_"..color..".png",
		"forniture_armchair_lat1_"..color..".png",
		"forniture_armchair_lat1_"..color..".png",
		"forniture_armchair_lat2_"..color..".png",
		"forniture_armchair_lat2_"..color..".png",
	    },
	    drawtype = "nodebox",
	    sunlight_propagates = true,
	    paramtype = "light",
	    paramtype2 = "facedir",
	    node_box = {
		type = "fixed",
		fixed = {
		    { -0.50, -0.50, -0.45, -0.30,  0.05,  0.30 },
		    { -0.45, -0.50, -0.50, -0.35,  0.05, -0.45 },
		    { -0.45,  0.05, -0.45, -0.35,  0.10,  0.15 },
		    {  0.30, -0.50, -0.45,  0.50,  0.05,  0.30 },
		    {  0.35, -0.50, -0.50,  0.45,  0.05, -0.45 },
		    {  0.35,  0.05, -0.45,  0.45,  0.10,  0.15 },
		    { -0.50, -0.50,  0.30,  0.50,  0.45,  0.50 },
		    { -0.45,  0.45,  0.35,  0.45,  0.50,  0.45 },
		    { -0.30, -0.45, -0.35,  0.30, -0.10,  0.30 },
		    { -0.30, -0.45, -0.40,  0.30, -0.15, -0.35 },
		    { -0.50,  0.05,  0.15, -0.30,  0.45,  0.30 },
		    { -0.45,  0.10,  0.10, -0.35,  0.45,  0.15 },
		    { -0.45,  0.45,  0.15, -0.35,  0.50,  0.35 },
		    {  0.30,  0.05,  0.15,  0.50,  0.45,  0.30 },
		    {  0.35,  0.10,  0.10,  0.45,  0.45,  0.15 },
		    {  0.35,  0.45,  0.15,  0.45,  0.50,  0.35 },
		},
	    },
	    groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
	})

	minetest.register_craft({
	    output = "poudlard:armchair_"..color.." 2",
	    recipe = {
		{ "wool:"..color,""},
		{ "default:wood","default:wood" },
		{ "wool:"..color,"wool:"..color },
	    },
	})

end


-- Aliases 

minetest.register_alias("poudecor:armchair", "poudecor:armchair_black")
minetest.register_alias('armchair', 'poudlard:armchair')

-- Aliases for 3homedecor.

minetest.register_alias("homedecor:armchair_black", "poudecor:armchair_black")
minetest.register_alias("homedecor:armchair_yellow", "poudecor:armchair_yellow")
minetest.register_alias("homedecor:armchair_violet", "poudecor:armchair_violet")
minetest.register_alias("homedecor:armchair_red", "poudecor:armchair_red")
minetest.register_alias("homedecor:armchair_dark_green", "poudecor:armchair_dark_green")
minetest.register_alias("homedecor:armchair_blue", "poudecor:armchair_blue")

-- Aliases for poudlard
minetest.register_alias("poudecor:armchair_black", "poudlard:armchair_black")
minetest.register_alias("poudecor:armchair_yellow", "poudlard:armchair_yellow")
minetest.register_alias("poudecor:armchair_violet", "poudlard:armchair_violet")
minetest.register_alias("poudecor:armchair_red", "poudlard:armchair_red")
minetest.register_alias("poudecor:armchair_dark_green", "poudlard:armchair_dark_green")
minetest.register_alias("poudecor:armchair_blue", "poudlard:armchair_blue")



