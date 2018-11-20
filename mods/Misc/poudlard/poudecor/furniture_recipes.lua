
minetest.register_craft({
    type = "fuel",
    recipe = "poudlard:armchair",
    burntime = 30,
})


minetest.register_craft({
    output = "poudlard:torch_wall 10",
    recipe = {
        { "default:coal_lump" },
        { "default:steel_ingot" },
    },
})
