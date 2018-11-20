--Aliases:
minetest.register_alias("lottores:blue_gem_ore", "lottother:blue_gem_ore")
minetest.register_alias("lottores:red_gem_ore", "lottother:red_gem_ore")
minetest.register_alias("lottores:white_gem_ore", "lottother:white_gem_ore")

minetest.register_alias("lottores:blue_gem", "lottother:blue_gem")
minetest.register_alias("lottores:red_gem", "lottother:red_gem")
minetest.register_alias("lottores:white_gem", "lottother:white_gem")

minetest.register_alias("lottother:blue_am_ring", "lottother:blue_rr_ring")
minetest.register_alias("lottother:red_am_ring", "lottother:red_rr_ring")
minetest.register_alias("lottother:white_am_ring", "lottother:white_rr_ring")

minetest.register_alias("lottother:purple_gem_mithril_ring", "lottother:purple_am_ring")
minetest.register_alias("lottother:ringsilver_lump", "lottother:ringsilver")
minetest.register_alias("lottother:ringsilver_ingot", "lottother:ringsilver")



-- Effects function, taken from mobs/api.lua

function effect(pos, amount, texture, max_size, radius)

	radius = radius or 2

	minetest.add_particlespawner({
		amount = amount,
		--time = 0.25,
		time = 1,
		minpos = pos,
		maxpos = pos,
		minvel = {x = -radius, y = -radius, z = -radius},
		maxvel = {x = radius, y = radius, z = radius},
		minacc = {x = -radius, y = -radius, z = -radius},
		maxacc = {x = radius, y = radius, z = radius},
		minexptime = 0.1,
		maxexptime = 1,
		--minsize = 0.5,
		minsize = 1,
		maxsize = (max_size or 1),
		texture = texture,
	})
end











--------------------------------------------------------

-- THE ONE RING (tool in hand)
-- Grants invisibility for 10s
-- TODO: Elaborate crafting? For now it's a rare drop from Shelob's Brood. It's trying to get back to its master...

-- Particle effects from other rings turned off while you are invisible, see playereffects/init and walkinglight/init
-- No nametag and no collision box

minetest.register_craftitem("lottother:one_ring", {
	description = minetest.colorize("black", "The One Ring") ..
		minetest.get_background_escape_sequence("lightgoldenrodyellow"),
	inventory_image = "one_ring.png",
	wield_image = "lottother_ring.png",
	groups = {forbidden = 1, immortal=1},
    wear = 0,

    on_use = function(itemstack, user, pointed_thing)
    	
    	local player = user:get_player_name()
    	
    	if mana.subtract(player, 200) then
        	playereffects.apply_effect_type("invisible", 15 , user)
        	
        	local pos = user:getpos()
        	effect({x = pos.x, y = pos.y + 1, z = pos.z}, 80, "hyruletools_yellowstar.png", 4, 6)
        end
		
    end,
})




--------------------------------------------------------

-- VILYA (tool in hand)
-- Grants 60s of flight, fast movement, higher jump

minetest.register_craftitem("lottother:vilya", {
	description = minetest.colorize("skyblue", "Vilya\nElven Ring of Flight and Movement") ..
		minetest.get_background_escape_sequence("lightgoldenrodyellow"),
	inventory_image = "lottother_vilya_inv.png",
	wield_image = "lottother_vilya.png",
	groups = {forbidden = 1, immortal=1},
    wear = 0,

    on_use = function(itemstack, user, pointed_thing)
    	
    	local player = user:get_player_name()
    	
    	if mana.subtract(player, 20) then
    		
    		--[[
		    playereffects.apply_effect_type("fly", 60, user)
		    playereffects.apply_effect_type("high_speed", 120, user)
		    playereffects.apply_effect_type("highjump", 120, user)
		    ]]--
		    
		    playereffects.apply_effect_type("vilya", 60, user)
		    
		    
		    local pos = user:getpos()
		    --effect({x = pos.x, y = pos.y + 1, z = pos.z}, 80, "feather.png", 4, 6)
		    effect({x = pos.x, y = pos.y + 1, z = pos.z}, 80, "hyruletools_ice_effect.png", 4, 6)
		end
    end,
})

-------------------------------------------------------

-- NARYA (wearable in armor slot)
-- Mithril armor (+80)
-- Permanent light source
-- Mana regen

minetest.register_tool("lottother:narya", {
	description = minetest.colorize("crimson", "Narya\nElven Ring of Armor and Light") ..
		minetest.get_background_escape_sequence("lightgoldenrodyellow"),
	inventory_image = "lottother_narya_inv.png",
	groups = {armor_torso=80, forbidden=1, immortal=1},
	wear = 0,
})

--------------------------------------------------------

-- NENYA (wearable in shield slot)
-- Adds +20 armor for a total of 100 (max possible)
-- Heals and feeds you when you take damage

minetest.register_tool("lottother:nenya", {
	description = minetest.colorize("silver", "Nenya\nElven Ring of Long Life and Health") ..
		minetest.get_background_escape_sequence("lightgoldenrodyellow"),
	inventory_image = "lottother_nenya_inv.png",
	groups = {forbidden=1, armor_heal=10, armor_shield=20, immortal=1},
	wear = 0,
})

--------------------------------------------------------

-- DWARF
-- Digs like a mithril pick, chops wood like a mithril axe, digs like a mithril shovel
-- Hits monsters like an Elvish sword!
-- Never wears out!
-- Also makes DOUBLE most ores - even mithril!  Craft with ring and lumps.  Does not include mese.

minetest.register_craftitem("lottother:dwarf_ring", {
	description = minetest.colorize("darkviolet", "Dwarvern Ring of Creation and Destruction") ..
		minetest.get_background_escape_sequence("lightgoldenrodyellow"),
	
	inventory_image = "lottother_dwarf_ring_wield.png",
	wield_image = "mastersword_sword.png",
	wield_scale = {x = 2, y = 2, z = 1},
	
	groups = {forbidden=1, immortal=1},
	
	tool_capabilities = {
		full_punch_interval = 0.5,
		--max_drop_level=3,
		range = 6.0, --spear is 7, warhammer is 2, dagger 3
		wear = 0,
		
		-- Commented values are default for mithril stuff, using as reference
		
		groupcaps={
			cracky = {times={[1]=2.0, [2]=1.0, [3]=0.40}, uses=30, maxlevel=3},
			--cracky = {times={[1]=1.5, [2]=0.8, [3]=0.40}, uses=60, maxlevel=3},
			
			very_hard = {times={[1]=2.0, [2]=1.5, [3]=0.90}, uses=50, maxlevel=3},
			--very_hard = {times={[1]=3.5, [2]=1.5, [3]=0.90}, uses=50, maxlevel=3},
			
			choppy={times={[1]=2.0, [2]=1.0, [3]=0.50}, uses=30, maxlevel=3},
			--choppy={times={[1]=1.80, [2]=0.60, [3]=0.30}, uses=60, maxlevel=3},
			
			crumbly = {times={[1]=0.90, [2]=0.60, [3]=0.40}, uses=60, maxlevel=3},
			--crumbly = {times={[1]=0.90, [2]=0.40, [3]=0.20}, uses=60, maxlevel=3},
			
			snappy={times={[1]=0.70, [2]=0.80, [3]=0.25}, uses=80, maxlevel=3},
			--snappy={times={[1]=0.70, [2]=0.80, [3]=0.25}, uses=80, maxlevel=3},
		},
		damage_groups = {fleshy=9},
	},
})

--Dwarf ring crafts...
minetest.register_craft({
	type = "shapeless",
	output = "lottores:silver_ingot 2",
	recipe = {"lottores:silver_lump", "lottother:dwarf_ring"},
	replacements = {{ "lottother:dwarf_ring", "lottother:dwarf_ring"}},
})

minetest.register_craft({
	type = "shapeless",
	output = "lottores:tin_ingot 2",
	recipe = {"lottores:tin_lump", "lottother:dwarf_ring"},
	replacements = {{ "lottother:dwarf_ring", "lottother:dwarf_ring"}},
})

minetest.register_craft({
	type = "shapeless",
	output = "lottores:lead_ingot 2",
	recipe = {"lottores:lead_lump", "lottother:dwarf_ring"},
	replacements = {{ "lottother:dwarf_ring", "lottother:dwarf_ring"}},
})

minetest.register_craft({
	type = "shapeless",
	output = "default:steel_ingot 2",
	recipe = {"default:iron_lump", "lottother:dwarf_ring"},
	replacements = {{ "lottother:dwarf_ring", "lottother:dwarf_ring"}},
})

minetest.register_craft({
	type = "shapeless",
	output = "default:copper_ingot 2",
	recipe = {"default:copper_lump", "lottother:dwarf_ring"},
	replacements = {{ "lottother:dwarf_ring", "lottother:dwarf_ring"}},
})

minetest.register_craft({
	type = "shapeless",
	output = "default:gold_ingot 2",
	recipe = {"default:gold_lump", "lottother:dwarf_ring"},
	replacements = {{ "lottother:dwarf_ring", "lottother:dwarf_ring"}},
})

minetest.register_craft({
	type = "shapeless",
	output = "lottores:mithril_ingot 2",
	recipe = {"lottores:mithril_lump", "lottother:dwarf_ring"},
	replacements = {{ "lottother:dwarf_ring", "lottother:dwarf_ring"}},
})

--------------------------------------------------------




-- GIMLI AXE
-- Axe with nice damage and 5% chance of vorpal hit (cleave orc-necks!)
-- Code for this in mobs/API

minetest.register_tool("lottother:gimli_axe", {
	description = minetest.colorize("brown", "Gimli Axe") ..
		minetest.get_background_escape_sequence("lightgoldenrodyellow"),
	--inventory_image = "dwarf_warhammer.png",
	inventory_image = "gimli_axe.png",
	
	wield_scale = {x = 1.5, y = 2, z = 1.5},
	
	tool_capabilities = {
		full_punch_interval = 1,
		range = 4,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.50, [2]=1.50, [3]=.90}, uses=2500, maxlevel=2},
			snappy={times={[1]=2.50, [2]=1.50, [3]=0.85}, uses=3500, maxlevel=2},
		},
		damage_groups = {fleshy=6},
		wear = 0,
	},
	
	groups = {immortal = 1, forbidden = 1},
	
})



-- GLAMDRING
-- Shoots slow-moving magic

minetest.register_tool("lottother:glamdring", {
	description = minetest.colorize("darkviolet", "Glamdring") ..
		minetest.get_background_escape_sequence("lightgoldenrodyellow"),
	inventory_image = "hyruletools_goddess_white_sword.png",
	--inventory_image = "glamdring.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 1,
		--max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=6},
		wear = 0,
	},
	
	groups = {immortal=1, forbidden = 1},
	
	on_use = function(itemstack, placer, pointed_thing)
		local player = placer:get_player_name()
		if mana.subtract(player, 30) then
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			local obj = minetest.env:add_entity({x=playerpos.x+dir.x*1.5,y=playerpos.y+1.5+dir.y,z=playerpos.z+dir.z*1.5}, "lottother:blue")
			local vec = {x=dir.x*4,y=dir.y*4,z=dir.z*4}
			obj:setvelocity(vec)
			minetest.sound_play("flamearrow", {pos = playerpos, gain = 0.5, max_hear_distance = 10})
		end
		return itemstack
	end,
})





-- WIZARD STAFF
-- Staff of "light pine cones on fire in different colors and burn wargs" kind of thing.

minetest.register_tool("lottother:staff", {
	description = minetest.colorize("darkviolet", "Wizard Staff") ..
		minetest.get_background_escape_sequence("lightgoldenrodyellow"),
	inventory_image = "staff.png",
	wield_scale = {x = 1.5, y = 2, z = 1},
	tool_capabilities = {
		full_punch_interval = 1,
		wear = 0,
	},
	
	groups = {immortal=1, forbidden = 1},
	
	on_use = function(itemstack, user, pointed_thing)
		
		if user:get_player_control().sneak then
			
			if mana.subtract(user:get_player_name(), 120) then
				
				local heal_self_1 = minetest.after(1, function()
					user:set_hp(user:get_hp() + 4)
				end)
				local heal_self_2 = minetest.after(2, function()
					user:set_hp(user:get_hp() + 4)
				end)
				
				
				local pos = user:get_pos()
				local node1def = minetest.get_node(pos)
				local n = node1def.name
				
				
				for dx=-3,3 do
					for dy=-3,3 do
						for dz=-1,2 do
							local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
							local node2def = minetest.get_node(p)
							local n2 = node2def.name
							
							local firetype = ""
							local rand = math.random(4)
							
							if rand == 1 then
								firetype = "lottother:blue_flame"
							elseif rand == 2 then
								firetype = "lottother:purple_flame"
							elseif rand == 3 then
								firetype = "lottother:green_flame"
							elseif rand == 4 then
								firetype = "lottother:red_flame"
							end
							
							
							
							if n2 == "air" then
								
								minetest.set_node(p, {name=firetype})
								
							end
							
						end
					end
				end
				
				
				
			end
		
		
		else
		
			local player = user:get_player_name()
			if mana.subtract(player, 40) then
				local dir = user:get_look_dir();
				local playerpos = user:getpos();
				local obj = minetest.env:add_entity({x=playerpos.x+dir.x,y=playerpos.y+1+dir.y,z=playerpos.z+dir.z}, "lottother:white")
				local vec = {x=dir.x*26,y=dir.y*26,z=dir.z*26}
				obj:setvelocity(vec)
				minetest.sound_play("flamearrow", {pos = playerpos, gain = 0.5, max_hear_distance = 15})
			end
			return itemstack
		end
		
		
	end,
	
})


minetest.register_craft({
	output = 'lottother:gimli_axe',
	recipe = {
		{'lottother:purple_gem', 'lottinventory:master_book', 'lottother:purple_gem'},
		{"lottother:purple_gem", "lottweapons:mithril_battleaxe", "lottother:purple_gem"},
		{'lottores:galvorn_block', 'lottores:galvorn_block', 'lottores:galvorn_block'},
	}
})


minetest.register_craft({
	output = 'lottother:staff',
	recipe = {
		{'lottores:mithril_block', 'lottores:mithril_block', 'lottores:mithril_block'},
		{"lottthrowing:bow_elvish", "lottinventory:master_book", "lottother:glamdring"},
		{'lottores:tilkal', 'lottores:tilkal', 'lottores:tilkal'},
	}
})

minetest.register_craft({
	output = 'lottother:glamdring',
	recipe = {
		{'lottother:blue_gem', 'lottinventory:master_book', 'lottother:red_gem'},
		{'lottother:purple_gem', "lottweapons:elven_sword", 'lottother:white_gem'},
		{'lottores:tilkal', 'lottores:tilkal', 'lottores:tilkal'},
	}
})



minetest.register_entity("lottother:white", {
	textures = {"hyruletools_swdbeam_light.png"},
	collisionbox = {0, 0, 0, 0, 0, 0},
	
	physical = false,
	timer=0,
	lastpos={},
	
	on_step = function(self, dtime, obj, pos)
		
		self.timer = self.timer + dtime
		
		local remove = minetest.after(3.0, function() 
			self.object:remove()
		end)
		
		
		local dmg = 0
		
		local pos = self.object:getpos()
		local node = minetest.get_node(pos)
		
		if pos and dmg == 0 and self.timer > 0.1 then
		
			local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 1.5)	
			for k, obj in pairs(objs) do
				if obj:get_luaentity() ~= nil then
					if obj:get_luaentity().name ~= "lottother:white"
					and obj:get_luaentity().name ~= "__builtin:item" then
						
						-- Mob
					
						obj:punch(self.object, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=24},
						}, nil)
						self.object:remove()
						dmg = 1
					end
				else
					
					-- Player
					
					obj:punch(self.object, 1.0, {
						full_punch_interval=1.0,
						damage_groups={fleshy=12},
					}, nil)
					self.object:remove()
					dmg = 1
				end
			end
			
		end
		
		
		local firetype = ""
		local rand = math.random(4)
		
		if rand == 1 then
			firetype = "lottother:blue_flame"
		elseif rand == 2 then
			firetype = "lottother:purple_flame"
		elseif rand == 3 then
			firetype = "lottother:green_flame"
		elseif rand == 4 then
			firetype = "lottother:red_flame"
		end
		
		
		if self.lastpos.x ~= nil then
			if node.name ~= "air" and node.name ~= "lottthrowing:light" then
				minetest.set_node(self.lastpos, {name=firetype})
				self.object:remove()
			end
			
			if math.floor(self.lastpos.x+0.5) ~= math.floor(pos.x+0.5) 
			or math.floor(self.lastpos.y+0.5) ~= math.floor(pos.y+0.5) 
			or math.floor(self.lastpos.z+0.5) ~= math.floor(pos.z+0.5) 
			then
			
				if minetest.get_node(self.lastpos).name == "lottthrowing:light" then
					minetest.remove_node(self.lastpos)
				end
				
				if minetest.get_node(pos).name == "air" then
					minetest.set_node(pos, {name="lottthrowing:light"})
				end
				
			end
		end
		
		self.lastpos={x=pos.x, y=pos.y, z=pos.z}
		
		
			
	end
})

minetest.register_entity("lottother:blue", {
	textures = {"hyruletools_swdbeam.png"},
	collisionbox = {0, 0, 0, 0, 0, 0},
	
	physical = false,
	timer=0,
	
	on_step = function(self, dtime, obj, pos)
		
		self.timer = self.timer + dtime
		
		local remove = minetest.after(1.4, function() 
			self.object:remove()
		end)
		
		
		local dmg = 0
		
		local pos = self.object:getpos()
		
		if pos and dmg == 0 and self.timer > 0.3 then
		
			local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 1.5)	
			for k, obj in pairs(objs) do
				if obj:get_luaentity() ~= nil then
					if obj:get_luaentity().name ~= "lottother:blue"
					and obj:get_luaentity().name ~= "__builtin:item" then
						
						-- Mob
					
						obj:punch(self.object, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=10},
						}, nil)
						self.object:remove()
						dmg = 1
					end
				else
					
					-- Player
					
					obj:punch(self.object, 1.0, {
						full_punch_interval=1.0,
						damage_groups={fleshy=6},
					}, nil)
					self.object:remove()
					dmg = 1
				end
			end
			
		end
			
	end
})





-- GROND

minetest.register_craft({
	output = 'lottother:grond',
	recipe = {
		{'lottores:galvorn_block', 'lottinventory:master_book', 'lottores:galvorn_block'},
		{'lottother:purple_gem', "lottweapons:mithril_warhammer", 'lottother:purple_gem'},
		{'lottores:tilkal', 'lottores:tilkal', 'lottores:tilkal'},
	}
})

minetest.register_tool("lottother:grond", {
	description = minetest.colorize("darkviolet", "Grond") ..
		minetest.get_background_escape_sequence("lightgoldenrodyellow"),
	inventory_image = "lottweapons_grond.png",
	wield_scale = {x = 3, y = 2, z = 1},
	
	groups = {immortal = 1, forbidden = 1},
	
	on_use = function(itemstack, user, pointed_thing)
	
	if user:get_player_control().sneak then
			
			if mana.subtract(user:get_player_name(), 80) then
				
				if playereffects.has_effect_type(user:get_player_name(), "troll_polymorph") then
					
					
					-- REMOVE NAZGUL
					
					invisibility[user:get_player_name()] = false
					
					
					playereffects.cancel_effect_type("troll_polymorph", cancel_all, user:get_player_name())
					
					user:set_physics_override(1,1,nil)
					
					user:set_nametag_attributes({color = {a = 255, r = 255, g = 255, b = 255}})
					
					user:set_properties{makes_footstep_sound = true}
					
					user:set_properties({
						mesh = "lottarmor_character.b3d",
						visual_size = {x=1, y=1}
					})
					
					multiskin:update_player_visuals(user)
				else
					
					
					-- NAZGUL
					
					playereffects.apply_effect_type("troll_polymorph", 3600, user)
					
					effect(pos, 60, "mobs_fairy_spark_black.png", 4, 6)
					
				end
				
			end
			
		else
	
			if pointed_thing.type == "nothing" then
				
				local dir = user:get_look_dir()
				local pos = user:get_pos()
				local new_pos = {
					x = pos.x + (dir.x * 10),
					y = pos.y + (dir.y * 10),
					z = pos.z + (dir.z * 10),
				}
				
				if mana.subtract(user:get_player_name(), 100) then
					default.explode_weapon(new_pos, 1, 2, 20) --code in default/functions
				end
				
				
			elseif pointed_thing.type == "node" or pointed_thing.type == "object" then
			
				local pos = minetest.get_pointed_thing_position(pointed_thing)
				
				if mana.subtract(user:get_player_name(), 100) then
					default.explode_weapon(pos, 1, 2, 20)
				end
			end
		end
	end,
	
	tool_capabilities = {
		full_punch_interval = 0.25,
		--max_drop_level=2,
		groupcaps={
			snappy={times={[1]=1.60, [2]=1.30, [3]=0.90}, uses=50, maxlevel=3},
		},
		damage_groups = {fleshy=5},
		wear = 0,
	}
})







-- STING
-- Teleports, deals damage along path
-- Detects nearby monsters/orcs

-- Two copies for texture change - only way to do this AFAIK

-- Proximity code in playereffects/init
-- Explode code in default/functions

minetest.register_craft({
	output = 'lottother:sting',
    groups = {forbidden=1, immortal=1},
	recipe = {
		{'lottother:blue_gem', 'lottinventory:master_book', 'lottother:red_gem'},
		{'lottother:purple_gem', "lottweapons:mithril_dagger", 'lottother:white_gem'},
		{'lottores:tilkal', 'lottores:tilkal', 'lottores:tilkal'},
	}
})

minetest.register_tool("lottother:sting", {
	description = minetest.colorize("darkviolet", "Sting") ..
		minetest.get_background_escape_sequence("lightgoldenrodyellow"),
	
	inventory_image = "lottweapons_sting.png",
	wield_image = "lottweapons_sting.png",
	wield_scale = {x = 1, y = 1, z = 1},
	
	groups = {immortal = 1, forbidden = 1},
	
	tool_capabilities = {
		full_punch_interval = 1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=6},
		wear = 0,
	},
	
	on_use = function(itemstack, user, pointed_thing)
		
		
		if user:get_player_control().sneak then
			
			if mana.subtract(user:get_player_name(), 80) then
				
				if playereffects.has_effect_type(user:get_player_name(), "rat_polymorph") then
					
					-- REMOVE RAT
					
					
					playereffects.cancel_effect_type("rat_polymorph", cancel_all, user:get_player_name())
					
					user:set_physics_override(1,1,nil)
					
					user:set_nametag_attributes({color = {a = 255, r = 255, g = 255, b = 255}})
					
					user:set_properties{makes_footstep_sound = true}
					
					user:set_properties({
						mesh = "lottarmor_character.b3d",
						visual_size = {x=1, y=1}
					})
					
					multiskin:update_player_visuals(user)
				else
					
					
					-- RAT
					
					playereffects.apply_effect_type("rat_polymorph", 3600, user)
					
					effect(pos, 60, "mobs_fairy_spark_black.png", 4, 6)
					
				end
				
			end
		
		
		else
			
			local dir = user:get_look_dir()
			local pos = user:get_pos()
			
			local teleported = false
			local damaged = false
			
			local tele_dist = 30
			
			local check_pos = {}
			
			-- Check for empty space starting 30 units away from user
			-- Might go through walls?
			
			for i = 1, 30 do
				
				if teleported == false then
				
					check_pos = {
						x = pos.x + (dir.x * tele_dist),
						y = pos.y + (dir.y * tele_dist),
						z = pos.z + (dir.z * tele_dist),
					}
					
					if minetest.get_node({x = check_pos.x, y = check_pos.y + 1, z = check_pos.z}).name == "air"
						and minetest.get_node({x = check_pos.x, y = check_pos.y + 2, z = check_pos.z}).name == "air"
						and areas:canInteract(check_pos, user:get_player_name())
						then
						
						-- Safe to teleport
						
						if mana.subtract(user:get_player_name(), 60) then
							
							user:setpos({x = check_pos.x, y = check_pos.y + 1, z = check_pos.z})
						
							effect({x = check_pos.x, y = check_pos.y + 1, z = check_pos.z}, 10, "hyruletools_yellowstar.png", 1, 1)
								minetest.sound_play("throwing_teleport_arrow", {gain = .25, check_pos, to_player = user:get_player_name()
							})
						
							teleported = true
						end
						
						
					end
					
				elseif damaged == false then
					
					-- Have teleported, now damage all the nodes in a line from pos to check_pos, using tele_dist
					
					for i = 1, tele_dist - 2 do
						
						--This protects user from self damage once he arrives :)
						
						check_pos = {
							x = pos.x + (dir.x * i),
							y = pos.y + (dir.y * i),
							z = pos.z + (dir.z * i),
						}
						
						-- From default/functions.lua
						default.explode_sting(check_pos, 1, 2, 6)
						
						damaged = true
					end
				end
			
				tele_dist = tele_dist - 1
				
			end
		end
	end,
})

minetest.register_tool("lottother:sting_blue", {
	description = minetest.colorize("darkviolet", "Sting") ..
		minetest.get_background_escape_sequence("lightgoldenrodyellow"),
	
	inventory_image = "lottweapons_sting.png",
	wield_image = "lottweapons_sting_glow.png",
	wield_scale = {x = 1, y = 1, z = 1},
	
	groups = {immortal = 1, not_in_creative_inventory=1},
	
	tool_capabilities = {
		full_punch_interval = 1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=6},
		wear = 0,
	},
	
	on_use = function(itemstack, user, pointed_thing)
		
		if user:get_player_control().sneak then
			
			if mana.subtract(user:get_player_name(), 80) then
				
				if playereffects.has_effect_type(user:get_player_name(), "rat_polymorph") then
					
					-- REMOVE RAT
					
					
					playereffects.cancel_effect_type("rat_polymorph", cancel_all, user:get_player_name())
					
					user:set_physics_override(1,1,nil)
					
					user:set_nametag_attributes({color = {a = 255, r = 255, g = 255, b = 255}})
					
					user:set_properties{makes_footstep_sound = true}
					
					user:set_properties({
						mesh = "lottarmor_character.b3d",
						visual_size = {x=1, y=1}
					})
					
					multiskin:update_player_visuals(user)
					
				else
					
					
					-- RAT
					
					playereffects.apply_effect_type("rat_polymorph", 3600, user)
					
					effect(pos, 60, "mobs_fairy_spark_black.png", 4, 6)
					
				end
				
			end
		
		
		else
			
			local dir = user:get_look_dir()
			local pos = user:get_pos()
			
			local teleported = false
			local damaged = false
			
			local tele_dist = 30
			
			local check_pos = {}
			
			-- Check for empty space starting 30 units away from user
			-- Goes through walls!
			
			for i = 1, 30 do
				
				if teleported == false then
				
					check_pos = {
						x = pos.x + (dir.x * tele_dist),
						y = pos.y + (dir.y * tele_dist),
						z = pos.z + (dir.z * tele_dist),
					}
					
					if minetest.get_node({x = check_pos.x, y = check_pos.y + 1, z = check_pos.z}).name == "air"
						and minetest.get_node({x = check_pos.x, y = check_pos.y + 2, z = check_pos.z}).name == "air"
						and areas:canInteract(check_pos, user:get_player_name())
						then
						
						-- Safe to teleport
						
						if mana.subtract(user:get_player_name(), 60) then
							
							user:setpos({x = check_pos.x, y = check_pos.y + 1, z = check_pos.z})
						
							effect({x = check_pos.x, y = check_pos.y + 1, z = check_pos.z}, 10, "hyruletools_yellowstar.png", 1, 1)
								minetest.sound_play("throwing_teleport_arrow", {gain = .25, check_pos, to_player = user:get_player_name()
							})
						
							teleported = true
						end
						
						
					end
					
				elseif damaged == false then
					
					-- Have teleported, now damage all the nodes in a line from pos to check_pos, using tele_dist
					
					for i = 1, tele_dist - 2 do
						
						check_pos = {
							x = pos.x + (dir.x * i),
							y = pos.y + (dir.y * i),
							z = pos.z + (dir.z * i),
						}
						
						-- From default/functions.lua
						default.explode_sting(check_pos, 1, 2, 6)
						
						damaged = true
					end
				end
			
				tele_dist = tele_dist - 1
				
			end
		end
		
	end,
})




-- RODS

--TODO: Magical rods aren't really in LOTR lore... fit them in somehow?
-- Sort of did this, rods are basis for Silmarillion.




-- ROD OF DEFENSE

-- Mob code in lottmobs/guardians
-- Summon code in lottmobs/functions
-- Descriptions in Rod Guide


minetest.register_craftitem("lottother:rod_of_defense", {
	description = minetest.colorize("blue", "Rod of Defense") ..
		minetest.get_background_escape_sequence("lightgoldenrodyellow"),
	inventory_image = "rod_of_defense.png",
	
	groups = {immortal = 1, forbidden = 1},
	
	
	on_use = function(itemstack, placer, pointed_thing)
		
		if mana.subtract(placer:get_player_name(), 60) then
			
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			
			minetest.add_particlespawner(
				10, --amount
				0.1, --time
				{x=playerpos.x-1, y=playerpos.y+1, z=playerpos.z-1}, --minpos
				{x=playerpos.x+1, y=playerpos.y+1, z=playerpos.z+1}, --maxpos
				{x=-0, y=-0, z=-0}, --minvel
				{x=0, y=0, z=0}, --maxvel
				{x=-0.5,y=4,z=-0.5}, --minacc
				{x=0.5,y=4,z=0.5}, --maxacc
				0.5, --minexptime
				1, --maxexptime
				1, --minsize
				2, --maxsize
				false, --collisiondetection
				"hyruletools_crest.png" --texture
			)
			
			local rand = math.random(4)
			local display_name = ""
			local entity = ""
			
			local playerpos = placer:getpos();
			local position = {x=playerpos.x+2+dir.x,y=playerpos.y+2+dir.y,z=playerpos.z+2+dir.z}
			
			local owner = placer:get_player_name()
			local player = owner
			
			if rand == 1 then
				display_name = owner .. "'s Elf Guardian"
				entity = "lottmobs:elf_guard"
			elseif rand == 2 then
				display_name = owner .. "'s Wolf Guardian"
				entity = "lottmobs:wolf_guard"
			elseif rand == 3 then
				display_name = owner .. "'s Dwarf Guardian"
				entity = "lottmobs:dwarf_guard"
			elseif rand == 4 then
				display_name = owner .. "'s Soldier of Rohan"
				entity = "lottmobs:rohan_guardian"
			end
			
			lottmobs.new_minion(player, display_name, entity, position)
			
		end
	end
})



-- ROD OF POLYMORPH

-- Turns you into a speedy rabbit or flying bat!
-- Instructions in Rod Guide

-- Effects in playereffects/examples

minetest.register_craftitem("lottother:rod_of_polymorph", {
	description = minetest.colorize("red", "Rod of Polymorph") ..
		minetest.get_background_escape_sequence("lightgoldenrodyellow"),
	
	inventory_image = "rod_of_polymorph.png",
	groups = {immortal = 1, forbidden = 1},
	
	on_use = function(itemstack, user, pointed_thing)
		
		local pos = user:getpos()
		
		if user:get_player_control().sneak then
			
			if mana.subtract(user:get_player_name(), 160) then
				
				-- BUTTERFLY
				
				playereffects.apply_effect_type("butterfly_polymorph", 15, user)
				
				effect(pos, 60, "mobs_fairy_spark.png", 4, 6)
				
			end
		
		else
			if mana.subtract(user:get_player_name(), 160) then
				
				-- WABBIT
				
				playereffects.apply_effect_type("bunny_polymorph", 15, user)
				
				effect(pos, 60, "mobs_fairy_spark.png", 4, 6)
				
			end
		end
	end,
})








-- ROD OF DOOM

-- Emits a beam that blinds or paralyzes over a short distance
-- Probably won't work on a player too close
-- Massive damage to mobs!
-- Takes a lot of mana to operate, no spamming

minetest.register_craftitem("lottother:rod_of_doom", {
	description = minetest.colorize("darkviolet", "Rod of Doom") ..
		minetest.get_background_escape_sequence("lightgoldenrodyellow"),
	
	inventory_image = "rod_of_doom.png",
	groups = {immortal = 1, forbidden = 1},
	
	on_use = function(itemstack, user, pointed_thing)
		
		if user:get_player_control().sneak then
		
			if mana.subtract(user:get_player_name(), 80) then
				
				-- GHOST
				
				playereffects.apply_effect_type("ghost_polymorph", 30, user)
				
				effect(pos, 60, "mobs_fairy_spark_black.png", 4, 6)
				
			end
		
		
		else
		
		
			local dir = user:get_look_dir()
			local pos = user:get_pos()
			
			local check_pos = {}
			
			local dist = 10
			
			if mana.subtract(user:get_player_name(), 180) then
				
				minetest.sound_play("rod_of_doom", {pos = pos, gain = 0.6, max_hear_distance = 30})
				
				for i = 2, dist do
							
					check_pos = {
						x = pos.x + (dir.x * i),
						y = pos.y + (dir.y * i),
						z = pos.z + (dir.z * i),
					}
					
					-- From default/functions.lua
					-- pos, TTL, radius, duration
					default.doom_beam(check_pos, 0, 1.5, 5, 100)
					
				end
			end
		end
		
	end
})



-- ROD OF HEALING

-- Emits a beam that heals self for a bit, and another player for double
-- Probably won't work on a player too close
-- Does nothing to mobs!
-- Takes a lot of mana to operate, no spamming

minetest.register_craftitem("lottother:rod_of_healing", {
	description = minetest.colorize("goldenrodyellow", "Rod of Healing") ..
		minetest.get_background_escape_sequence("lightgoldenrodyellow"),
	
	inventory_image = "rod_of_healing.png",
	groups = {immortal = 1, forbidden = 1},
	
	on_use = function(itemstack, user, pointed_thing)
		
		
		if user:get_player_control().sneak then
		
			if mana.subtract(user:get_player_name(), 80) then
				
				-- Blaze
				-- Not LOTR friendly, just cute.  Sort of an easter egg :)  Hyrule based IIRC.
				
				playereffects.apply_effect_type("blaze_polymorph", 30, user)
				
				effect(pos, 60, "mobs_fairy_spark.png", 4, 6)
				
			end
		
		
		else
		
			local dir = user:get_look_dir()
			local pos = user:get_pos()
			
			local check_pos = {}
			local dist = 20
			
			local radius = 1.5
			local amount = 4
			
			local healed_players = {}
			
			
			if mana.subtract(user:get_player_name(), 60) then
				
				user:set_hp(user:get_hp() + 6)
				
				minetest.sound_play("rod_of_healing", {pos = pos, gain = 0.4, max_hear_distance = 15})

				for i = 2, dist do
					
					check_pos = {
						x = pos.x + (dir.x * i),
						y = pos.y + (dir.y * i),
						z = pos.z + (dir.z * i),
					}
					
					local objects = minetest.get_objects_inside_radius(check_pos, radius)
	
					for _,obj in ipairs(objects) do
						
						if obj:is_player() then
							
							local name = obj:get_player_name()
							
							local already_healed = 0
							
							for _,v in ipairs(healed_players) do
								
								if v == name then
									already_healed = 1
								end
							end
							
							if already_healed == 0 then
							
								obj:set_hp(obj:get_hp() + amount)
								table.insert(healed_players, name)
								
								
								if not playereffects.has_effect_type(name, "rat_polymorph")
								and not playereffects.has_effect_type(name, "blaze_polymorph")
								and not playereffects.has_effect_type(name, "dragon_polymorph")
								and not playereffects.has_effect_type(name, "bat_polymorph")
								and not playereffects.has_effect_type(name, "invisible")
								and not playereffects.has_effect_type(name, "ghost_polymorph")
								and not playereffects.has_effect_type(name, "bunny_polymorph")
								and not playereffects.has_effect_type(name, "butterfly_polymorph")
								and not playereffects.has_effect_type(name, "troll_polymorph")
								then
									
									local obj_pos = obj:get_pos()
									
									obj_pos = { 
										x = obj_pos.x,
										y = obj_pos.y + 1.5,
										z = obj_pos.z
									}
									
									effect( obj_pos, 80, "rod_heal.png", 1, 2)
									
								end
							end
							
						end
					end
					
					
					--[[
					minetest.add_particlespawner(
						2, --amount
						2, --time
						{x=check_pos.x-1, y=check_pos.y-1, z=check_pos.z-1}, --minpos
						{x=check_pos.x+1, y=check_pos.y+1, z=check_pos.z+1}, --maxpos
						{x=0, y=0, z=0}, --minvel
						{x=0, y=0, z=0}, --maxvel
						{x=0,y=0,z=0}, --minacc
						{x=0,y=0,z=0}, --maxacc
						1, --minexptime
						2, --maxexptime
						1, --minsize
						2, --maxsize
						false, --collisiondetection
						"rod_heal.png" --texture
					)
					]]--
					
					minetest.add_particlespawner(
						4,
						0.1,
						{x=check_pos.x, y=check_pos.y+1, z=check_pos.z},
						{x=check_pos.x, y=check_pos.y+1, z=check_pos.z},
						{x=-0, y=-0, z=-0},
						{x=0, y=0, z=0},
						{x=-0.5,y=0.5,z=-0.5},
						{x=0.5,y=0.5,z=0.5},
						0.1,
						1,
						1,
						2,
						false,
						"rod_heal.png"
					)
					
				end
				
			end
		end
		
	end
})












-- Recipes for rods


lottblocks.crafting.add_craft("lottother:rod_of_polymorph", {
	recipe = {"lottother:rod_base", "lottother:red_gem"},
	type = "dualfurn",
	time = 60,
})

lottblocks.crafting.add_craft("lottother:rod_of_doom", {
	recipe = {"lottother:rod_base", "lottother:purple_gem"},
	type = "dualfurn",
	time = 60,
})

lottblocks.crafting.add_craft("lottother:rod_of_defense", {
	recipe = {"lottother:rod_base", "lottother:blue_gem"},
	type = "dualfurn",
	time = 60,
})

lottblocks.crafting.add_craft("lottother:rod_of_healing", {
	recipe = {"lottother:rod_base", "lottother:white_gem"},
	type = "dualfurn",
	time = 60,
})


minetest.register_craft({
	output = "lottother:rod_base",
	recipe = {
		{"lottores:mithril_ingot", "lottores:mithril_ingot", "lottores:mithril_ingot"},
		{"lottores:mithril_ingot", "group:stick", "lottores:mithril_ingot"},
		{"lottores:mithril_ingot", "lottores:silver_ingot", "lottores:mithril_ingot"}
	}
})

minetest.register_craftitem("lottother:rod_base", {
	description = "Rod Base",
	inventory_image = "rod_base.png",
    groups = {forbidden=1},
})









-- SILMARILS
-- Only making two of these, and there are three in the lore.  I'm a bad person :(
-- Must be cooked with Silmaril base, which takes a ton of adamant


-- SILVER SILMARIL OF TELPERION
-- Combines function of red & blue rods, but more powerful!
-- Summons are a bit... dark for a silver gem of light, but I made them first

minetest.register_craftitem("lottother:silver_silmaril", {
	description = minetest.colorize("Silver", "Silmaril of Telperion") ..
		minetest.get_background_escape_sequence("lightgoldenrodyellow"),
	
	inventory_image = "silmaril_silver.png",
	groups = {immortal = 1, forbidden = 1},
	
	on_use = function(itemstack, user, pointed_thing)
		
		
		if user:get_player_control().sneak then
			
			
			if mana.subtract(user:get_player_name(), 100) then
				
				local dir = user:get_look_dir();
				local playerpos = user:getpos();
				
				minetest.add_particlespawner(
					10, --amount
					0.1, --time
					{x=playerpos.x-1, y=playerpos.y+1, z=playerpos.z-1}, --minpos
					{x=playerpos.x+1, y=playerpos.y+1, z=playerpos.z+1}, --maxpos
					{x=-0, y=-0, z=-0}, --minvel
					{x=0, y=0, z=0}, --maxvel
					{x=-0.5,y=4,z=-0.5}, --minacc
					{x=0.5,y=4,z=0.5}, --maxacc
					0.5, --minexptime
					1, --maxexptime
					1, --minsize
					2, --maxsize
					false, --collisiondetection
					"hyruletools_blackcrest.png" --texture
				)
				
				local rand = math.random(2)
				local display_name = ""
				local entity = ""
				
				local position = {x=playerpos.x+2+dir.x,y=playerpos.y+2+dir.y,z=playerpos.z+2+dir.z}
				
				local owner = user:get_player_name()
				local player = owner
				
				if rand == 1 then
					display_name = owner .. "'s Spider Guardian"
					entity = "lottmobs:spider_guard"
				elseif rand == 2 then
					display_name = owner .. "'s Nazgul Guardian"
					entity = "lottmobs:nazgul_guard"
				end
				
				lottmobs.new_minion(player, display_name, entity, position)
				
			end
			
			
		else
		
		
			if mana.subtract(user:get_player_name(), 200) then
				
				-- BATGUY
				-- Fast like bunny, grants flight
				
				playereffects.apply_effect_type("bat_polymorph", 30, user)
				
				effect(pos, 60, "mobs_fairy_spark_black.png", 4, 6)
				
			end

			
		end
		
		
	end
})

minetest.register_craft({
	output = "lottother:silver_silmaril_incomplete",
	recipe = {
		{"lottores:mithril_block", "lottores:mithril_block", "lottores:mithril_block"},
		{"lottother:rod_of_polymorph", "lottplants:yavannamirefruit", "lottother:rod_of_defense"},
		{"lottores:silver_block", "lottores:silver_block", "lottores:silver_block"}
	}
})

minetest.register_craftitem("lottother:silver_silmaril_incomplete", {
	description = "Essense of Telperion",
	inventory_image = "silmaril_silver_incomplete.png",
    groups = {forbidden=1},
})









-- GOLD SILMARIL OF LAURELIN
-- Combines function of healing & doom rods, but more powerful!

minetest.register_craftitem("lottother:gold_silmaril", {
	description = minetest.colorize("Gold", "Silmaril of Laurelin") ..
		minetest.get_background_escape_sequence("lightgoldenrodyellow"),
	
	inventory_image = "silmaril_gold.png",
	groups = {immortal = 1, forbidden = 1},
	
	on_use = function(itemstack, user, pointed_thing)
		
		
		if user:get_player_control().sneak then
			
			-- More powerful version of blind/paralyze
			
			local dir = user:get_look_dir()
			local pos = user:get_pos()
			
			local check_pos = {}
			
			local dist = 10
			
			if mana.subtract(user:get_player_name(), 180) then
				
				minetest.sound_play("rod_of_doom", {pos = pos, gain = 0.6, max_hear_distance = 30})
				
				for i = 2, dist do
							
					check_pos = {
						x = pos.x + (dir.x * i),
						y = pos.y + (dir.y * i),
						z = pos.z + (dir.z * i),
					}
					
					-- From default/functions.lua
					-- pos, TTL, radius, duration, damage
					
					default.doom_beam(check_pos, 0, 1.5, 6, 200)
					
				end
			end
			
		else
		
			local dir = user:get_look_dir()
			local pos = user:get_pos()
			
			local check_pos = {}
			local dist = 20
			
			local radius = 1.5
			local amount = 12
			
			local healed_players = {}
			
			
			if mana.subtract(user:get_player_name(), 60) then
				
				user:set_hp(user:get_hp() + 10)
				
				minetest.sound_play("rod_of_healing", {pos = pos, gain = 0.4, max_hear_distance = 15})

				for i = 2, dist do
					
					check_pos = {
						x = pos.x + (dir.x * i),
						y = pos.y + (dir.y * i),
						z = pos.z + (dir.z * i),
					}
					
					local objects = minetest.get_objects_inside_radius(check_pos, radius)
	
					for _,obj in ipairs(objects) do
						
						if obj:is_player() then
							
							local name = obj:get_player_name()
							
							local already_healed = 0
							
							for _,v in ipairs(healed_players) do
								
								if v == name then
									already_healed = 1
								end
							end
							
							if already_healed == 0 then
							
								obj:set_hp(obj:get_hp() + amount)
								table.insert(healed_players, name)
								
								minetest.chat_send_player(user:get_player_name(), "*** " .. name .. " was healed!")
								
								
								if not playereffects.has_effect_type(name, "rat_polymorph")
								and not playereffects.has_effect_type(name, "blaze_polymorph")
								and not playereffects.has_effect_type(name, "dragon_polymorph")
								and not playereffects.has_effect_type(name, "bat_polymorph")
								and not playereffects.has_effect_type(name, "invisible")
								and not playereffects.has_effect_type(name, "ghost_polymorph")
								and not playereffects.has_effect_type(name, "bunny_polymorph")
								and not playereffects.has_effect_type(name, "butterfly_polymorph")
								and not playereffects.has_effect_type(name, "troll_polymorph")
								then
									
									
									local obj_pos = obj:get_pos()
									
									obj_pos = { 
										x = obj_pos.x,
										y = obj_pos.y + 1.5,
										z = obj_pos.z
									}
									
									effect( obj_pos, 80, "silmaril_heal.png", 1, 2)
									
									
								end
							end
							
						end
					end
					
					
					--[[
					minetest.add_particlespawner(
						2, --amount
						2, --time
						{x=check_pos.x-1, y=check_pos.y-1, z=check_pos.z-1}, --minpos
						{x=check_pos.x+1, y=check_pos.y+1, z=check_pos.z+1}, --maxpos
						{x=0, y=0, z=0}, --minvel
						{x=0, y=0, z=0}, --maxvel
						{x=0,y=0,z=0}, --minacc
						{x=0,y=0,z=0}, --maxacc
						1, --minexptime
						2, --maxexptime
						1, --minsize
						2, --maxsize
						false, --collisiondetection
						"silmaril_heal.png" --texture
					)
					]]--
					
					minetest.add_particlespawner(
						4,
						0.1,
						{x=check_pos.x, y=check_pos.y+1, z=check_pos.z},
						{x=check_pos.x, y=check_pos.y+1, z=check_pos.z},
						{x=-0, y=-0, z=-0},
						{x=0, y=0, z=0},
						{x=-0.5,y=0.5,z=-0.5},
						{x=0.5,y=0.5,z=0.5},
						0.1,
						1,
						1,
						2,
						false,
						"silmaril_heal.png"
					)
					
				end
				
			end
		end
		
	end
})

minetest.register_craft({
	output = "lottother:gold_silmaril_incomplete",
	recipe = {
		{"lottores:mithril_block", "lottores:mithril_block", "lottores:mithril_block"},
		{"lottother:rod_of_healing", "lottplants:yavannamirefruit", "lottother:rod_of_doom"},
		{"lottores:silver_block", "lottores:silver_block", "lottores:silver_block"}
	}
})

minetest.register_craftitem("lottother:gold_silmaril_incomplete", {
	description = "Essense of Laurelin",
	inventory_image = "silmaril_gold_incomplete.png",
    groups = {forbidden=1},
})











lottblocks.crafting.add_craft("lottother:silver_silmaril", {
	recipe = {"lottother:silmaril_base", "lottother:silver_silmaril_incomplete"},
	type = "dualfurn",
	time = 240,
})

lottblocks.crafting.add_craft("lottother:gold_silmaril", {
	recipe = {"lottother:silmaril_base", "lottother:gold_silmaril_incomplete"},
	type = "dualfurn",
	time = 240,
})




minetest.register_craft({
	output = "lottother:silmaril_base",
	recipe = {
		{"default:mese", "lottother:white_gem", "default:mese"},
		{"lottother:white_gem", "default:mese", "lottother:white_gem"},
		{"default:mese", "lottother:white_gem", "default:mese"}
	}
})

minetest.register_craftitem("lottother:silmaril_base", {
	description = "Silima",
	inventory_image = "silmaril_base.png",
    groups = {forbidden=1},
})








-- ELFSTONE

-- Textures from Hyrule (again)
-- Teleports you home, sneak + use to set home location
-- Uses 200 mana so you can't get out of really sticky situations with it

minetest.register_craftitem("lottother:elfstone", {
	description = minetest.colorize("lightgreen", "Elfstone") ..
		minetest.get_background_escape_sequence("lightgoldenrodyellow"),
	inventory_image = "elfstone.png",
	wield_image = "elfstone.png",
	groups = {forbidden = 1, immortal=1},
    wear = 0,

    on_use = function(itemstack, user, pointed_thing)
    	
    	local name = user:get_player_name()
    	local pos = user:getpos()
    	
    	if user:get_player_control().sneak then
			
			if mana.subtract(name, 200) then
				
				sethome.set(name, user:getpos())
				
				minetest.chat_send_player(name, minetest.colorize("lightgreen", "*** Home location set!"))
				
			end
		
		else
			
			if mana.subtract(name, 200) then
				
				effect({x = pos.x, y = pos.y + 1, z = pos.z}, 80, "hyruletools_yellowstar.png", 4, 6)
				
				sethome.go(name)
				
				minetest.chat_send_player(user:get_player_name(), minetest.colorize("lightgreen", "*** The Elfstone takes you home!"))
				
			end
			
		end
    end,
})


minetest.register_craft({
	output = "lottother:elfstone",
	recipe = {
		{"lottweapons:elven_sword", "lottthrowing:bow_elvish", "lottweapons:elven_sword"},
		{"lottother:blue_gem", "default:goldblock", "lottother:blue_gem"},
		{"lottblocks:mallorn_pillar", "lottblocks:mallorn_pillar", "lottblocks:mallorn_pillar"}
	}
})
