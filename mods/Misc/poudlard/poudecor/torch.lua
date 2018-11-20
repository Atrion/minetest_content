
-- Load translation library if intllib is installed

local S
if (minetest.get_modpath("intllib")) then
	dofile(minetest.get_modpath("intllib").."/intllib.lua")
	S = intllib.Getter(minetest.get_current_modname())
	else
	S = function ( s ) return s end
end



minetest.register_node("poudlard:torch_wall", {
    description = S("Wall Torch"),
    drawtype = "nodebox",
    tiles = {
        "forniture_torch_wall_s.png",
        "forniture_torch_wall_i.png",
        {
            name="forniture_torch_wall_anim.png",
            animation={
                type="vertical_frames",
                aspect_w=40,
                aspect_h=40,
                length=1.0,
            },
        },
    },
    inventory_image="3dforniture_inv_torch_wall.png",
    paramtype = "light",
    paramtype2 = "facedir",
    node_box = {
        type = "fixed",
        fixed = {
            { -0.05, -0.45,  0.45,  0.05, -0.35,  0.50, },
            { -0.05, -0.35,  0.40,  0.05, -0.25,  0.50, },
            { -0.05, -0.25,  0.35,  0.05, -0.15,  0.45, },
            { -0.05, -0.15,  0.30,  0.05, -0.05,  0.40, },
            { -0.05, -0.05,  0.25,  0.05,  0.00,  0.35, },
            { -0.10,  0.00,  0.20,  0.10,  0.05,  0.40, },
            { -0.15,  0.05,  0.15,  0.15,  0.15,  0.45, },
            { -0.10,  0.15,  0.20,  0.10,  0.25,  0.40, },
            { -0.05,  0.25,  0.25,  0.05,  0.35,  0.35, },
        },
    },
    sunlight_propagates = true,
    walkable = false,
    light_source = 14,
    selection_box = {
        type = "fixed",
        fixed = { -0.15, -0.45, 0.15, 0.15,0.35, 0.5 },
    },
    groups = {cracky=2},
})


minetest.register_alias("homedecor:torch_wall", "poudecor:torch_wall")

minetest.register_alias("poudecor:torch_wall", "poudlard:torch_wall")

