--Poudlard by Perlipop , code from moreblcoks/stairs+ by Calinou
--Alliases compatibility ======= RENOMMAGE POUDLARD ==========
-- Compatibility aliases de moreblocks/stairsplus vers poudlard pour les items de chaque fonction  et
-- pour poudstone + poudwood

minetest.register_alias("moreblocks:poudwood", "poudlard:poudwood")
minetest.register_alias("default:poudstone", "poudlard:poudstone")
minetest.register_alias("poudwood", "poudlard:poudwood")
minetest.register_alias("poudstone", "poudlard:poudstone")
minetest.register_alias("redblock", "poudlard:redblock")
minetest.register_alias("blackblock", "poudlard:blackblock")


--RENAMING MOREBLOCKS ET STAIRS+ VERS POUDLARD


local function register_poudlard_alias(modname, origname, newname)
	minetest.register_alias(modname.. ":slab_" ..origname, "poudlard:slab_" ..newname)
	minetest.register_alias(modname.. ":slab_" ..origname.. "_inverted", "poudlard:slab_" ..newname.. "_inverted")
	minetest.register_alias(modname.. ":slab_" ..origname.. "_wall", "poudlard:slab_" ..newname.. "_wall")
	minetest.register_alias(modname.. ":slab_" ..origname.. "_quarter", "poudlard:slab_" ..newname.. "_quarter")
	minetest.register_alias(modname.. ":slab_" ..origname.. "_quarter_inverted", "poudlard:slab_" ..newname.. "_quarter_inverted")
	minetest.register_alias(modname.. ":slab_" ..origname.. "_quarter_wall", "poudlard:slab_" ..newname.. "_quarter_wall")
	minetest.register_alias(modname.. ":slab_" ..origname.. "_three_quarter", "poudlard:slab_" ..newname.. "_three_quarter")
	minetest.register_alias(modname.. ":slab_" ..origname.. "_three_quarter_inverted", "poudlard:slab_" ..newname.. "_three_quarter_inverted")
	minetest.register_alias(modname.. ":slab_" ..origname.. "_three_quarter_wall", "poudlard:slab_" ..newname.. "_three_quarter_wall")
	minetest.register_alias(modname.. ":stair_" ..origname, "poudlard:stair_" ..newname)
	minetest.register_alias(modname.. ":stair_" ..origname.. "_inverted", "poudlard:stair_" ..newname.. "_inverted")
	minetest.register_alias(modname.. ":stair_" ..origname.. "_wall", "poudlard:stair_" ..newname.. "_wall")
	minetest.register_alias(modname.. ":stair_" ..origname.. "_wall_half", "poudlard:stair_" ..newname.. "_wall_half")
	minetest.register_alias(modname.. ":stair_" ..origname.. "_wall_half_inverted", "poudlard:stair_" ..newname.. "_wall_half_inverted")
	minetest.register_alias(modname.. ":stair_" ..origname.. "_half", "poudlard:stair_" ..newname.. "_half")
	minetest.register_alias(modname.. ":stair_" ..origname.. "_half_inverted", "poudlard:stair_" ..newname.. "_half_inverted")
	minetest.register_alias(modname.. ":stair_" ..origname.. "_right_half", "poudlard:stair_" ..newname.. "_right_half")
	minetest.register_alias(modname.. ":stair_" ..origname.. "_right_half_inverted", "poudlard:stair_" ..newname.. "_right_half_inverted")
	minetest.register_alias(modname.. ":stair_" ..origname.. "_wall_half", "poudlard:stair_" ..newname.. "_wall_half")
	minetest.register_alias(modname.. ":stair_" ..origname.. "_wall_half_inverted", "poudlard:stair_" ..newname.. "_wall_half_inverted")
	minetest.register_alias(modname.. ":stair_" ..origname.. "_inner", "poudlard:stair_" ..newname.. "_inner")
	minetest.register_alias(modname.. ":stair_" ..origname.. "_inner_inverted", "poudlard:stair_" ..newname.. "_inner_inverted")
	minetest.register_alias(modname.. ":stair_" ..origname.. "_outer", "poudlard:stair_" ..newname.. "_outer")
	minetest.register_alias(modname.. ":stair_" ..origname.. "_outer_inverted", "poudlard:stair_" ..newname.. "_outer_inverted")
	minetest.register_alias(modname.. ":panel_" ..origname.. "_bottom", "poudlard:panel_" ..newname.. "_bottom")
	minetest.register_alias(modname.. ":panel_" ..origname.. "_top", "poudlard:panel_" ..newname.. "_top")
	minetest.register_alias(modname.. ":panel_" ..origname.. "_vertical", "poudlard:panel_" ..newname.. "_vertical")
	minetest.register_alias(modname.. ":micro_" ..origname.. "_bottom", "poudlard:micro_" ..newname.. "_bottom")
	minetest.register_alias(modname.. ":micro_" ..origname.. "_top", "poudlard:micro_" ..newname.. "_top")
end
register_poudlard_alias("stairsplus", "poudwood","poudwood")
register_poudlard_alias("stairsplus", "poudstone","poudstone")
register_poudlard_alias("stairsplus", "redblock","redblock")
register_poudlard_alias("stairsplus", "blackblock","blackblock")
register_poudlard_alias("stairsplus", "stone", "stone")
register_poudlard_alias("stairsplus", "wood", "wood")
register_poudlard_alias("stairsplus", "cobble", "cobble")
register_poudlard_alias("stairsplus", "brick", "brick")
register_poudlard_alias("stairsplus", "sandstone", "sandstone")
register_poudlard_alias("stairsplus", "glass", "glass")
register_poudlard_alias("stairsplus", "tree", "tree")
register_poudlard_alias("stairsplus", "jungletree", "jungletree")
register_poudlard_alias("stairsplus", "desert_stone", "desert_stone")
register_poudlard_alias("stairsplus", "steelblock", "steelblock")
register_poudlard_alias("stairsplus", "mossycobble", "mossycobble")

register_poudlard_alias("moreblocks", "poudwood","poudwood")
register_poudlard_alias("moreblocks", "poudstone","poudstone")
register_poudlard_alias("moreblocks", "redblock","redblock")
register_poudlard_alias("moreblocks", "blackblock","blackblock")
register_poudlard_alias("moreblocks", "plankstone", "plankstone")
register_poudlard_alias("moreblocks", "coalstone", "coalstone")
register_poudlard_alias("moreblocks", "junglewood", "junglewood")
register_poudlard_alias("moreblocks", "stonebrick", "stonebrick")
register_poudlard_alias("moreblocks", "circlestonebrick", "circlestonebricks")
register_poudlard_alias("moreblocks", "ironstone", "ironstone")
register_poudlard_alias("moreblocks", "coalglass", "coalglass")
register_poudlard_alias("moreblocks", "ironglass", "ironglass")
register_poudlard_alias("moreblocks", "glowglass", "glowglass")
register_poudlard_alias("moreblocks", "superglowglass", "superglowglass")
register_poudlard_alias("moreblocks", "coalchecker", "coalchecker")
register_poudlard_alias("moreblocks", "ironchecker", "ironchecker")
register_poudlard_alias("moreblocks", "cactuschecker", "cactuschecker")
register_poudlard_alias("moreblocks", "ironstonebrick", "ironstonebricks")
register_poudlard_alias("moreblocks", "stonesquare", "stone_tile")
register_poudlard_alias("moreblocks", "splitstonesquare", "split_stone_tile")
register_poudlard_alias("moreblocks", "woodtile", "wood_tile")
register_poudlard_alias("moreblocks", "woodtile_centered", "wood_tile_centered")
register_poudlard_alias("moreblocks", "woodtile_full", "wood_tile_full")

-- 

minetest.register_alias("moreblocks:stone_bricks", "default:stonebrick")
minetest.register_alias("moreblocks:stonebrick", "default:stonebrick")

minetest.register_alias("stonebrick", "default:stonebrick")
minetest.register_alias("stonebricks", "default:stonebrick")
minetest.register_alias("stone_brick", "default:stonebrick")
minetest.register_alias("stone_bricks", "default:stonebrick")

minetest.register_alias("stonesquare", "poudlard:stone_tile")
minetest.register_alias("moreblocks:stonesquare", "poudlard:stone_tile")

minetest.register_alias("stonesquares", "poudlard:stone_tile")
minetest.register_alias("stone_square", "poudlard:stone_tile")
minetest.register_alias("stone_squares", "poudlard:stone_tile")

minetest.register_alias("splitstonesquare", "poudlard:split_stone_tile")
minetest.register_alias("moreblocks:splitstonesquare", "poudlard:split_stone_tile")
minetest.register_alias("splitstonesquares", "poudlard:split_stone_tile")
minetest.register_alias("split_stone_square", "poudlard:split_stone_tile")
minetest.register_alias("split_stone_squares", "poudlard:split_stone_tile")
minetest.register_alias("split_stonesquare", "poudlard:split_stone_tile")
minetest.register_alias("split_stonesquares", "poudlard:split_stone_tile")

minetest.register_alias("moreblocks:circlestonebrick", "poudlard:circlestonebricks")


minetest.register_alias("coalstone", "poudlard:coalstone")
minetest.register_alias("ironstone", "poudlard:ironstonebricks")
minetest.register_alias("coalglass", "poudlard:coalglass")
minetest.register_alias("ironglass", "poudlard:ironglass")
minetest.register_alias("superglowglass", "poudlard:superglowglass")
minetest.register_alias("plankstone", "poudlard:plankstone")
minetest.register_alias("cactuschecker", "poudlard:cactuschecker")
minetest.register_alias("coalchecker", "poudlard:coalchecker")
minetest.register_alias("ironchecker", "poudlard:ironchecker")



minetest.register_alias("moreblocks:junglewood","poudlard:junglewood")

minetest.register_alias("moreblocks:circle_stone_bricks","poudlard:circlestonebricks")

minetest.register_alias("moreblocks:plankstone","poudlard:plankstone")

minetest.register_alias("moreblocks:ironglass","poudlard:ironglass")

minetest.register_alias("moreblocks:coalglass","poudlard:coalglass")

minetest.register_alias("moreblocks:cleanglass","poudlard:cleanglass")

minetest.register_alias("moreblocks:cactuschecker","poudlard:cactuschecker")

minetest.register_alias("moreblocks:emptybookshelf","poudlard:emptybookshelf")

minetest.register_alias("moreblocks:coalstone","poudlard:coalstone")

minetest.register_alias("moreblocks:ironstone","poudlard:ironstone")

minetest.register_alias("moreblocks:ironstonebrick","poudlard:ironstonebricks")

minetest.register_alias("moreblocks:coalchecker","poudlard:coalchecker")

minetest.register_alias("moreblocks:ironchecker","poudlard:ironchecker")

minetest.register_alias("moreblocks:trapstone","poudlard:trapstone")

minetest.register_alias("moreblocks:trapglass","poudlard:trapglass")

minetest.register_alias("moreblocks:fence_junglewood","poudlard:fence_junglewood")

minetest.register_alias("moreblocks:horizontaltree","poudlard:horizontaltree")

minetest.register_alias("moreblocks:allfacestree","poudlard:allfacestree")

minetest.register_alias("moreblocks:superglowglass","poudlard:superglowglass")

minetest.register_alias("moreblocks:rope","poudlard:rope")

minetest.register_alias("moreblocks:wood_tile","poudlard:wood_tile")

minetest.register_alias("moreblocks:wood_tile_full","poudlard:wood_tile_full")

minetest.register_alias("moreblocks:wood_tile_center","poudlard:wood_tile_center")

-- Items

minetest.register_alias("moreblocks:sweeper","poudlard:sweeper")
minetest.register_alias("moreblocks:junglestick","poudlard:junglestick")

-- Additional default aliases

minetest.register_alias("woodpick", "default:pick_wood")
minetest.register_alias("woodenpick", "default:pick_wood")
minetest.register_alias("stonepick", "default:pick_stone")
minetest.register_alias("steelpick", "default:pick_steel")
minetest.register_alias("ironpick", "default:pick_steel")
minetest.register_alias("mesepick", "default:pick_mese")

minetest.register_alias("woodaxe", "default:axe_wood")
minetest.register_alias("woodenaxe", "default:axe_wood")
minetest.register_alias("stoneaxe", "default:axe_stone")
minetest.register_alias("steelaxe", "default:axe_steel")
minetest.register_alias("ironaxe", "default:axe_steel")

minetest.register_alias("woodshovel", "default:shovel_wood")
minetest.register_alias("woodenshovel", "default:shovel_wood")
minetest.register_alias("stoneshovel", "default:shovel_stone")
minetest.register_alias("steelshovel", "default:shovel_steel")
minetest.register_alias("ironshovel", "default:shovel_steel")

minetest.register_alias("woodsword", "default:sword_wood")
minetest.register_alias("woodensword", "default:sword_wood")
minetest.register_alias("stonesword", "default:sword_stone")
minetest.register_alias("steelsword", "default:sword_steel")
minetest.register_alias("ironsword", "default:sword_steel")

minetest.register_alias("grass", "default:dirt_with_grass")
minetest.register_alias("grassblock", "default:dirt_with_grass")
minetest.register_alias("grass_block", "default:dirt_with_grass")

minetest.register_alias("grassfootsteps", "default:dirt_with_grass_footsteps")
minetest.register_alias("grass_footsteps", "default:dirt_with_grass_footsteps")

minetest.register_alias("stick", "default:stick")
minetest.register_alias("sign", "default:sign_wall")
minetest.register_alias("fence", "default:fence_wood")
minetest.register_alias("coal", "default:coal_lump")
minetest.register_alias("iron", "default:iron_lump")
minetest.register_alias("clay", "default:clay_lump")
minetest.register_alias("steel", "default:steel_ingot")
minetest.register_alias("steel_block", "default:steelblock")




