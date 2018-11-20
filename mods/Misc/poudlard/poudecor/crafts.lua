-- Crafting for homedecor mod (includes folding) by Vanessa Ezekowitz
-- 2012-06-12
--
-- Mostly my own code; overall template borrowed from game default
--
-- License: GPL
--

-- Load translation library if intllib is installed

local S
if (minetest.get_modpath("intllib")) then
	dofile(minetest.get_modpath("intllib").."/intllib.lua")
	S = intllib.Getter(minetest.get_current_modname())
	else
	S = function ( s ) return s end
end




-- Nightstand -----------------------------

minetest.register_craft( {
        output = "poudlard:nightstand_1",
        recipe = {
                { "moreblocks:emptybookshelf" },
                { "moreblocks:emptybookshelf" },
                { "default:wood" },
        },
})


minetest.register_craft({
        type = "fuel",
        recipe = "poudlard:nightstand_1",
        burntime = 30,
})


minetest.register_craft( {
	type = "shapeless",
        output = "poudlard:nightstand_2",
        recipe = {
                "moreblocks:emptybookshelf",
                "moreblocks:emptybookshelf",
		"default:junglewood",
        },
})

minetest.register_craft({
        type = "fuel",
        recipe = "poudlard:nightstand_2",
        burntime = 30,
})
--




-- Curtains ---------------------------------

local curtaincolors = {
	"red",
	"orange",
	"green",
	"dark_green",
	"yellow",
	"blue",
	"white",
	"dark_grey",
	"black",
	"violet"
}

for c in ipairs(curtaincolors) do
	local color = curtaincolors[c]
	minetest.register_craft( {
		output = "poudlard:curtain_"..color.." 3",
	      		recipe = {
			{ "wool:"..color, "", ""},
			{ "wool:"..color, "", ""},
			{ "wool:"..color, "", ""},
		},
	})
end


--

--

-- 
-- 
-- 

-- 

--



