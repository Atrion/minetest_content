-- Various misc. nodes

-- Load translation library if intllib is installed

local S
if (minetest.get_modpath("intllib")) then
	dofile(minetest.get_modpath("intllib").."/intllib.lua")
	S = intllib.Getter(minetest.get_current_modname())
	else
	S = function ( s ) return s end
end

--

local curtaincolors = {
	"red",
	"green",
	"blue",
	"white",
	"orange",
	"dark_green",
	"yellow",
	"dark_grey",
	"black",
	"violet"

}

for c in ipairs(curtaincolors) do
	local color = curtaincolors[c]
	local color_d = S(curtaincolors[c])

	minetest.register_node("poudlard:curtain_"..color, {
		description = S("Curtains (%s)"):format(color_d),
		tiles = { "homedecor_curtain_"..color..".png" },
		inventory_image = "homedecor_curtain_"..color..".png",
		wield_image = "homedecor_curtain_"..color..".png",
		drawtype = 'signlike',
		sunlight_propagates = true,
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = false,
		groups = { snappy = 3 },
		sounds = default.node_sound_leaves_defaults(),
		paramtype2 = 'wallmounted',
		selection_box = {
			type = "wallmounted",
			--wall_side = = <default>
		},
	})
	if color_d ~= color then
		minetest.register_alias("poudlard:curtain_"..color_d, "poudlard:curtain_"..color)
	end
end


-------------- Alias for homedecor

minetest.register_alias("homedecor:curtain_yellow", "poudecor:curtain_yellow")
minetest.register_alias("homedecor:curtain_violet", "poudecor:curtain_violet")
minetest.register_alias("homedecor:curtain_red", "poudecor:curtain_red")
minetest.register_alias("homedecor:curtain_dark_green", "poudecor:curtain_dark_green")
minetest.register_alias("homedecor:curtain_green", "poudecor:curtain_green")
minetest.register_alias("homedecor:curtain_blue", "poudecor:curtain_blue")
minetest.register_alias("homedecor:curtain_white", "poudecor:curtain_white")
minetest.register_alias("homedecor:curtain_orange", "poudecor:curtain_orange")
minetest.register_alias("homedecor:curtain_dark_grey", "poudecor:curtain_dark_grey")
minetest.register_alias("homedecor:curtain_black", "poudecor:curtain_black")

-------------- Alias for poudecort

minetest.register_alias("poudecor:curtain_yellow", "poudlard:curtain_yellow")
minetest.register_alias("poudecor:curtain_violet", "poudlard:curtain_violet")
minetest.register_alias("poudecor:curtain_red", "poudlard:curtain_red")
minetest.register_alias("poudecor:curtain_dark_green", "poudlard:curtain_dark_green")
minetest.register_alias("poudecor:curtain_green", "poudlard:curtain_green")
minetest.register_alias("poudecor:curtain_blue", "poudlard:curtain_blue")
minetest.register_alias("poudecor:curtain_white", "poudlard:curtain_white")
minetest.register_alias("poudecor:curtain_orange", "poudlard:curtain_orange")
minetest.register_alias("poudecor:curtain_dark_grey", "poudlard:curtain_dark_grey")
minetest.register_alias("poudecor:curtain_black", "poudlard:curtain_black")
