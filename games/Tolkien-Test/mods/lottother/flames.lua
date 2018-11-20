
local flame_dps = 4



minetest.register_node("lottother:blue_flame", {
	description = "Blue Flame",
	drawtype = "firelike",
	tiles = {{
		name="lottother_flame_blue_animated.png",
		animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=1},
	}},
	inventory_image = "lottother_blue_flame.png",
	light_source = 14,
	
	
	--groups = {igniterblue=2,dig_immediate=3,hot=3},
	groups = {hot=3},
	
	drop = '',
	walkable = false,
	buildable_to = true,
	damage_per_second = flame_dps,

	after_place_node = function(pos, placer)
		fire.on_flame_add_at(pos)
	end,

	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		fire.on_flame_remove_at(pos)
	end,
})

minetest.register_node("lottother:purple_flame", {
	description = "Purple Flame",
	drawtype = "firelike",
	tiles = {{
		name="lottother_flame_purple_animated.png",
		animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=1},
	}},
	inventory_image = "lottother_blue_flame.png",
	light_source = 14,
	
	
	--groups = {igniterblue=2,dig_immediate=3,hot=3},
	groups = {hot=3},
	
	drop = '',
	walkable = false,
	buildable_to = true,
	damage_per_second = flame_dps,

	after_place_node = function(pos, placer)
		fire.on_flame_add_at(pos)
	end,

	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		fire.on_flame_remove_at(pos)
	end,
})

minetest.register_node("lottother:green_flame", {
	description = "Green Flame",
	drawtype = "firelike",
	tiles = {{
		name="lottother_flame_green_animated.png",
		animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=1},
	}},
	inventory_image = "lottother_blue_flame.png",
	light_source = 14,
	
	
	--groups = {igniterblue=2,dig_immediate=3,hot=3},
	groups = {hot=3},
	
	drop = '',
	walkable = false,
	buildable_to = true,
	damage_per_second = flame_dps,

	after_place_node = function(pos, placer)
		fire.on_flame_add_at(pos)
	end,

	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		fire.on_flame_remove_at(pos)
	end,
})

minetest.register_node("lottother:red_flame", {
	description = "Red Flame",
	drawtype = "firelike",
	tiles = {{
		name="lottother_flame_red_animated.png",
		animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=1},
	}},
	inventory_image = "lottother_blue_flame.png",
	light_source = 14,
	
	
	--groups = {igniterblue=2,dig_immediate=3,hot=3},
	groups = {hot=3},
	
	drop = '',
	walkable = false,
	buildable_to = true,
	damage_per_second = flame_dps,

	after_place_node = function(pos, placer)
		fire.on_flame_add_at(pos)
	end,

	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		fire.on_flame_remove_at(pos)
	end,
})









lottother = {}
lottother.D = 6
lottother.sounds = {}

function lottother.get_area_p0p1(pos)
	local p0 = {
		x=math.floor(pos.x/lottother.D)*lottother.D,
		y=math.floor(pos.y/lottother.D)*lottother.D,
		z=math.floor(pos.z/lottother.D)*lottother.D,
	}
	local p1 = {
		x=p0.x+lottother.D-1,
		y=p0.y+lottother.D-1,
		z=p0.z+lottother.D-1
	}
	return p0, p1
end

function lottother.update_sounds_around(pos)
	local p0, p1 = lottother.get_area_p0p1(pos)
	local cp = {x=(p0.x+p1.x)/2, y=(p0.y+p1.y)/2, z=(p0.z+p1.z)/2}
	local flames_p = minetest.find_nodes_in_area(p0, p1, {"lottother:blue_flame", "lottother:red_flame", "lottother:green_flame", "lottother:purple_flame"})
	local should_have_sound = (#flames_p > 0)
	local wanted_sound = nil
	if #flames_p >= 9 then
		wanted_sound = {name="fire_large", gain=1}
	elseif #flames_p > 0 then
		wanted_sound = {name="fire_small", gain=1}
	end
	local p0_hash = minetest.hash_node_position(p0)
	local sound = lottother.sounds[p0_hash]
	if not sound then
		if should_have_sound then
			lottother.sounds[p0_hash] = {
				handle = minetest.sound_play(wanted_sound, {pos=cp, loop=true}),
				name = wanted_sound.name,
			}
		end
	else
		if not wanted_sound then
			minetest.sound_stop(sound.handle)
			lottother.sounds[p0_hash] = nil
		elseif sound.name ~= wanted_sound.name then
			minetest.sound_stop(sound.handle)
			lottother.sounds[p0_hash] = {
				handle = minetest.sound_play(wanted_sound, {pos=cp, loop=true}),
				name = wanted_sound.name,
			}
		end
	end
end

function lottother.on_flame_add_at(pos)
	lottother.update_sounds_around(pos)
end

function lottother.on_flame_remove_at(pos)
	lottother.update_sounds_around(pos)
end

function lottother.find_pos_for_flame_around(pos)
	return minetest.find_node_near(pos, 1, {"air"})
end

function lottother.flame_should_extinguish(pos)
	if minetest.setting_getbool("disable_fire") then return true end
	local p0 = {x=pos.x-2, y=pos.y, z=pos.z-2}
	local p1 = {x=pos.x+2, y=pos.y, z=pos.z+2}
	local ps = minetest.find_nodes_in_area(p0, p1, {"group:puts_out_lottother"})
	return (#ps ~= 0)
end




minetest.register_abm({
	nodenames = {"lottother:blue_flame", "lottother:red_flame", "lottother:green_flame", "lottother:purple_flame"},
	interval = 1,
	chance = 3,
	action = function(p0, node, _, _)
		if lottother.flame_should_extinguish(p0) then
			minetest.remove_node(p0)
			lottother.on_flame_remove_at(p0)
			return
		end
		if math.random(1,3) == 1 then
			return
		end
		if not minetest.find_node_near(p0, 1, nodenames) then
			minetest.remove_node(p0)
			lottother.on_flame_remove_at(p0)
			return
		end
	end,
})













-- We do not need colored fire setting stuff on fire

--[[

minetest.register_abm({
	nodenames = {"group:flammablecolors"},
	neighbors = {"group:ignitercolors"},
	interval = 1,
	chance = 2,
	action = function(p0, node, _, _)
		if lottother.flame_should_extinguish(p0) then
			return
		end
		local p = lottother.find_pos_for_flame_around(p0)
		if p then
			minetest.set_node(p, {name="lottother:blue_flame"})
			lottother.on_flame_add_at(p)
		end
	end,
})

minetest.register_abm({
	nodenames = {"group:igniterblue"},
	neighbors = {"air"},
	interval = 2,
	chance = 10,
	action = function(p0, node, _, _)
		local reg = minetest.registered_nodes[node.name]
		if not reg or not reg.groups.igniterblue or reg.groups.igniterblue < 2 then
			return
		end
		local d = reg.groups.igniterblue
		local p = minetest.find_node_near(p0, d, {"group:flammableblue"})
		if p then
			if lottother.flame_should_extinguish(p) then
				return
			end
			local p2 = lottother.find_pos_for_flame_around(p)
			if p2 then
				minetest.set_node(p2, {name="lottother:blue_flame"})
				lottother.on_flame_add_at(p2)
			end
		end
	end,
})

]]--


