riventest = {}

local WALLMX = 3
local WALLMZ = 5
local WALLPX = 2
local WALLPZ = 4

local WATER_ALPHA = 160
local WATER_VISC = 1
local LIGHT_MAX = 14

local round = function( n )
	if n >= 0 then
		return math.floor( n + 0.5 )
	else
		return math.ceil( n - 0.5 )
	end
end

minetest.register_alias('stickdoor', 'riventest:door1')
minetest.register_alias('uldoor', 'riventest:door2')
minetest.register_alias('kldoor', 'riventest:door3')

--[[
PLAIN 'STICK' DOOR
]]

minetest.register_node( 'riventest:door1', {
	description         = 'plain stick door',
	drawtype            = 'signlike',
	tiles         = { 'rivendoor.png' },
	inventory_image     = 'rivendoor.png',
	wield_image         = 'rivendoor.png',
	paramtype2          = "wallmounted",
	selection_box       = { type = "wallmounted" },
	node_box            = { type = "wallmounted" },
	groups              = { choppy=2, dig_immediate=2,flammable=2 },
})
minetest.register_node( 'riventest:door1_a_c', {
	description         = 'closed plain stick door top',
	drawtype            = 'signlike',
	tiles         = { 'rivendoor_a.png' },
	inventory_image     = 'rivendoor_a.png',
	paramtype           = 'light',
	paramtype2          = "wallmounted",
	walkable            = true,
	selection_box       = { type = "wallmounted", },
	node_box            = { type = "wallmounted", },
	groups              = { choppy=2, dig_immediate=2,flammable=2,not_in_creative_inventory=1 },
	legacy_wallmounted  = true,
	drop                = 'riventest:door1',
})

minetest.register_node( 'riventest:door1_b_c', {
	description         = 'closed plain stick door bottom',
	drawtype            = 'signlike',
	tiles         = { 'rivendoor_b.png' },
	inventory_image     = 'rivendoor_b.png',
	paramtype           = 'light',
	paramtype2          = "wallmounted",
	walkable            = true,
	selection_box       = { type = "wallmounted", },
	node_box            = { type = "wallmounted", },
	groups              = { choppy=2, dig_immediate=2, flammable=2, not_in_creative_inventory=1 },
	legacy_wallmounted  = true,
	drop                = 'riventest:door1',
})

minetest.register_node( 'riventest:door1_a_o', {
	description         = 'open plain stick door top',
	drawtype            = 'signlike',
	tiles         = { 'rivendoor_a_r.png' },
	inventory_image     = 'rivendoor_a_r.png',
	paramtype           = 'light',
	paramtype2          = "wallmounted",
	walkable            = false,
	selection_box       = { type = "wallmounted", },
	node_box            = { type = "wallmounted", },
	groups              = { choppy=2, dig_immediate=2, flammable=2, not_in_creative_inventory=1 },
	legacy_wallmounted  = true,
	drop                = 'riventest:door1',
})

minetest.register_node( 'riventest:door1_b_o', {
	description         = 'open plain stick door bottom',
	drawtype            = 'signlike',
	tiles         = { 'rivendoor_b_r.png' },
	inventory_image     = 'rivendoor_b_r.png',
	paramtype           = 'light',
	paramtype2          = "wallmounted",
	walkable            = false,
	selection_box       = { type = "wallmounted", },
	node_box            = { type = "wallmounted", },
	groups              = { choppy=2, dig_immediate=2, flammable=2, not_in_creative_inventory=1 },
	legacy_wallmounted  = true,
	drop                = 'riventest:door1',
})

local on_door1_placed = function( pos, node, placer )
	if node.name ~= 'riventest:door1' then return end

	upos = { x = pos.x, y = pos.y - 1, z = pos.z }
	apos = { x = pos.x, y = pos.y + 1, z = pos.z }
	und = minetest.env:get_node( upos )
	abv = minetest.env:get_node( apos )

	dir = placer:get_look_dir()

	if round( dir.x ) == 1  then
		newparam = WALLMX
	elseif round( dir.x ) == -1 then
		newparam = WALLPX
	elseif round( dir.z ) == 1  then
		newparam = WALLMZ
	elseif round( dir.z ) == -1 then
		newparam = WALLPZ
	end

	if und.name == 'air' then
		minetest.env:add_node( pos,  { name = 'riventest:door1_a_c', param2 = newparam } )
		minetest.env:add_node( upos, { name = 'riventest:door1_b_c', param2 = newparam } )
	elseif abv.name == 'air' then
		minetest.env:add_node( pos,  { name = 'riventest:door1_b_c', param2 = newparam } )
		minetest.env:add_node( apos, { name = 'riventest:door1_a_c', param2 = newparam } )
	else
		minetest.env:remove_node( pos )
		placer:get_inventory():add_item( "main", 'riventest:door1' )
		minetest.chat_send_player( placer:get_player_name(), 'not enough space' )
	end
end
local on_door1_punched = function( pos, node, puncher )
	if string.find( node.name, 'riventest:door1' ) == nil then return end

	upos = { x = pos.x, y = pos.y - 1, z = pos.z }
	apos = { x = pos.x, y = pos.y + 1, z = pos.z }

	if string.find( node.name, '_c', -2 ) ~= nil then
		if node.param2 == WALLPX then
			newparam = WALLMZ
		elseif node.param2 == WALLMZ then
			newparam = WALLMX
		elseif node.param2 == WALLMX then
			newparam = WALLPZ
		elseif node.param2 == WALLPZ then
			newparam = WALLPX
		end
	elseif string.find( node.name, '_o', -2 ) ~= nil then
		if node.param2 == WALLMZ then
			newparam = WALLPX
		elseif node.param2 == WALLMX then
			newparam = WALLMZ
		elseif node.param2 == WALLPZ then
			newparam = WALLMX
		elseif node.param2 == WALLPX then
			newparam = WALLPZ
		end
	end

	if ( node.name == 'riventest:door1_a_c' ) then
		minetest.env:add_node( pos,  { name = 'riventest:door1_a_o', param2 = newparam } )
		minetest.env:add_node( upos, { name = 'riventest:door1_b_o', param2 = newparam } )

	elseif ( node.name == 'riventest:door1_b_c' ) then
		minetest.env:add_node( pos,  { name = 'riventest:door1_b_o', param2 = newparam } )
		minetest.env:add_node( apos, { name = 'riventest:door1_a_o', param2 = newparam } )

	elseif ( node.name == 'riventest:door1_a_o' ) then
		minetest.env:add_node( pos,  { name = 'riventest:door1_a_c', param2 = newparam } )
		minetest.env:add_node( upos, { name = 'riventest:door1_b_c', param2 = newparam } )

	elseif ( node.name == 'riventest:door1_b_o' ) then
		minetest.env:add_node( pos,  { name = 'riventest:door1_b_c', param2 = newparam } )
		minetest.env:add_node( apos, { name = 'riventest:door1_a_c', param2 = newparam } )

	end
	minetest.sound_play({name='woodengate', gain=1.5}, {pos=pos, loop=false})
end

local on_door1_digged = function( pos, node, digger )
	upos = { x = pos.x, y = pos.y - 1, z = pos.z }
	apos = { x = pos.x, y = pos.y + 1, z = pos.z }

	if ( node.name == 'riventest:door1_a_c' ) or ( node.name == 'riventest:door1_a_o' ) then
		minetest.env:remove_node( upos )
	elseif ( node.name == 'riventest:door1_b_c' ) or ( node.name == 'riventest:door1_b_o' ) then
		minetest.env:remove_node( apos )
	end
end

minetest.register_on_placenode( on_door1_placed )
minetest.register_on_punchnode( on_door1_punched )
minetest.register_on_dignode( on_door1_digged )

--[[
USER-LOCK DOOR
]]
local function has_door2_privilege(meta, player)
	if meta:get_string("owner") == '' then
		meta:set_string("owner", player:get_player_name())
	elseif meta:get_string("owner") ~= player:get_player_name() then
		return false
	end
	return true
end

minetest.register_node( 'riventest:door2', {
	description         = 'user-locked door',
	drawtype            = 'signlike',
	tiles         = { 'rivendoor2.png' },
	inventory_image     = 'rivendoor2.png',
	wield_image         = 'rivendoor2.png',
	paramtype2          = "wallmounted",
	selection_box       = { type = "wallmounted" },
	node_box            = { type = "wallmounted" },
	groups              = { snappy=1,bendy=3,cracky=1,melty=2, dig_immediate=2 },
})

minetest.register_node( 'riventest:door2_a_c', {
	description         = 'closed user-locked door top',
	drawtype            = 'signlike',
	tiles         = { 'rivendoor2_a.png' },
	inventory_image     = 'rivendoor2_a.png',
	paramtype           = 'light',
	paramtype2          = "wallmounted",
	walkable            = true,
	selection_box       = { type = "wallmounted", },
	node_box            = { type = "wallmounted" },
	groups              = { snappy=1,bendy=3,cracky=1,melty=2, dig_immediate=2, not_in_creative_inventory=1 },
	legacy_wallmounted  = true,
	drop                = 'riventest:door2',
	can_dig = function(pos,player)
		meta = minetest.env:get_meta(pos)
		return has_door2_privilege(meta, player)
	end,	
})

minetest.register_node( 'riventest:door2_b_c', {
	description         = 'closed user-locked door bottom',
	drawtype            = 'signlike',
	tiles         = { 'rivendoor2_b.png' },
	inventory_image     = 'rivendoor2_b.png',
	paramtype           = 'light',
	paramtype2          = "wallmounted",
	walkable            = true,
	selection_box       = { type = "wallmounted", },
	node_box            = { type = "wallmounted" },
	groups              = { snappy=1,bendy=3,cracky=1,melty=2, dig_immediate=2, not_in_creative_inventory=1 },
	legacy_wallmounted  = true,
	drop                = 'riventest:door2',
	can_dig = function(pos,player)
		meta = minetest.env:get_meta(pos)
		return has_door2_privilege(meta, player)
	end,	
})

minetest.register_node( 'riventest:door2_a_o', {
	description         = 'open user-locked door top',
	drawtype            = 'signlike',
	tiles         = { 'rivendoor2_a_r.png' },
	inventory_image     = 'rivendoor2_a_r.png',
	paramtype           = 'light',
	paramtype2          = "wallmounted",
	walkable            = false,
	selection_box       = { type = "wallmounted", },
	node_box            = { type = "wallmounted" },
	groups              = { snappy=1, bendy=3, cracky=1, melty=2, dig_immediate=2, not_in_creative_inventory=1 },
	legacy_wallmounted  = true,
	drop                = 'riventest:door2',
	can_dig = function(pos,player)
		meta = minetest.env:get_meta(pos)
		return has_door2_privilege(meta, player)
	end,	
})

minetest.register_node( 'riventest:door2_b_o', {
	description         = 'open user-locked door bottom',
	drawtype            = 'signlike',
	tiles         = { 'rivendoor2_b_r.png' },
	inventory_image     = 'rivendoor2_b_r.png',
	paramtype           = 'light',
	paramtype2          = "wallmounted",
	walkable            = false,
	selection_box       = { type = "wallmounted", },
	node_box            = { type = "wallmounted" },
	groups              = { snappy=1, bendy=3, cracky=1, melty=2, dig_immediate=2, not_in_creative_inventory=1 },
	legacy_wallmounted  = true,
	drop                = 'riventest:door2',
	can_dig = function(pos,player)
		meta = minetest.env:get_meta(pos)
		return has_door2_privilege(meta, player)
	end,	
})

local on_door2_placed = function( pos, node, placer )
	if node.name ~= 'riventest:door2' then return end

	upos = { x = pos.x, y = pos.y - 1, z = pos.z }
	apos = { x = pos.x, y = pos.y + 1, z = pos.z }
	und = minetest.env:get_node( upos )
	abv = minetest.env:get_node( apos )

	dir = placer:get_look_dir()

	if     round( dir.x ) == 1  then
		newparam = WALLMX
	elseif round( dir.x ) == -1 then
		newparam = WALLPX
	elseif round( dir.z ) == 1  then
		newparam = WALLMZ
	elseif round( dir.z ) == -1 then
		newparam = WALLPZ
	end

	if und.name == 'air' then
		minetest.env:add_node( pos,  { name = 'riventest:door2_a_c', param2 = newparam } )
		local meta = minetest.env:get_meta(pos)
		meta:set_string("owner", placer:get_player_name() or "")
		minetest.env:add_node( upos, { name = 'riventest:door2_b_c', param2 = newparam } )
		local meta = minetest.env:get_meta(upos)
		meta:set_string("owner",  placer:get_player_name() or "")

	elseif abv.name == 'air' then
		minetest.env:add_node( pos,  { name = 'riventest:door2_b_c', param2 = newparam } )
		local meta = minetest.env:get_meta(pos)
		meta:set_string("owner",  placer:get_player_name() or "")
		minetest.env:add_node( apos, { name = 'riventest:door2_a_c', param2 = newparam } )
		local meta = minetest.env:get_meta(apos)
		meta:set_string("owner",  placer:get_player_name() or "")

	else
		minetest.env:remove_node( pos )
		placer:get_inventory():add_item( "main", 'riventest:door2' )
		minetest.chat_send_player( placer:get_player_name(), 'not enough space' )
	end
end
local on_door2_punched = function( pos, node, puncher )
	if string.find( node.name, 'riventest:door2' ) == nil then 	return end

	local meta = minetest.env:get_meta(pos)
	if not has_door2_privilege(meta, puncher) then minetest.chat_send_player(puncher:get_player_name(), "door is locked") return end

	upos = { x = pos.x, y = pos.y - 1, z = pos.z }
	apos = { x = pos.x, y = pos.y + 1, z = pos.z }

	if string.find( node.name, '_c', -2 ) ~= nil then
		if     node.param2 == WALLPX then
			newparam = WALLMZ
		elseif node.param2 == WALLMZ then
			newparam = WALLMX
		elseif node.param2 == WALLMX then
			newparam = WALLPZ
		elseif node.param2 == WALLPZ then
			newparam = WALLPX
		end
	elseif string.find( node.name, '_o', -2 ) ~= nil then
		if     node.param2 == WALLMZ then
			newparam = WALLPX
		elseif node.param2 == WALLMX then
			newparam = WALLMZ
		elseif node.param2 == WALLPZ then
			newparam = WALLMX
		elseif node.param2 == WALLPX then
			newparam = WALLPZ
		end
	end

	if ( node.name == 'riventest:door2_a_c' ) then
		minetest.env:add_node( pos,  { name = 'riventest:door2_a_o', param2 = newparam } )
		local meta = minetest.env:get_meta(pos)
		meta:set_string("owner",  puncher:get_player_name() or "")

		minetest.env:add_node( upos, { name = 'riventest:door2_b_o', param2 = newparam } )
		local meta = minetest.env:get_meta(upos)
		meta:set_string("owner",  puncher:get_player_name() or "")

	elseif ( node.name == 'riventest:door2_b_c' ) then
		minetest.env:add_node( pos,  { name = 'riventest:door2_b_o', param2 = newparam } )
		local meta = minetest.env:get_meta(pos)
		meta:set_string("owner",  puncher:get_player_name() or "")

		minetest.env:add_node( apos, { name = 'riventest:door2_a_o', param2 = newparam } )
		local meta = minetest.env:get_meta(apos)
		meta:set_string("owner",  puncher:get_player_name() or "")

	elseif ( node.name == 'riventest:door2_a_o' ) then
		minetest.env:add_node( pos,  { name = 'riventest:door2_a_c', param2 = newparam } )
		local meta = minetest.env:get_meta(pos)
		meta:set_string("owner",  puncher:get_player_name() or "")

		minetest.env:add_node( upos, { name = 'riventest:door2_b_c', param2 = newparam } )
		local meta = minetest.env:get_meta(upos)
		meta:set_string("owner",  puncher:get_player_name() or "")

	elseif ( node.name == 'riventest:door2_b_o' ) then
		minetest.env:add_node( pos,  { name = 'riventest:door2_b_c', param2 = newparam } )
		local meta = minetest.env:get_meta(pos)
		meta:set_string("owner",  puncher:get_player_name() or "")

		minetest.env:add_node( apos, { name = 'riventest:door2_a_c', param2 = newparam } )
		local meta = minetest.env:get_meta(apos)
		meta:set_string("owner",  puncher:get_player_name() or "")

	end
	minetest.sound_play({name='metalgate', gain=1.5}, {pos=pos, loop=false})
end

local on_door2_digged = function( pos, node, digger )
	upos = { x = pos.x, y = pos.y - 1, z = pos.z }
	apos = { x = pos.x, y = pos.y + 1, z = pos.z }

	if ( node.name == 'riventest:door2_a_c' ) or ( node.name == 'riventest:door2_a_o' ) then
		minetest.env:remove_node( upos )
	elseif ( node.name == 'riventest:door2_b_c' ) or ( node.name == 'riventest:door2_b_o' ) then
		minetest.env:remove_node( apos )
	end
end

minetest.register_on_placenode( on_door2_placed )
minetest.register_on_punchnode( on_door2_punched )
minetest.register_on_dignode( on_door2_digged )


--[[
PASSWORD-LOCKED DOOR
]]

local function has_door3_privilege(meta, player)
	if meta:get_string("owner") == '' then
		meta:set_string("owner", player:get_player_name())
	elseif meta:get_string("owner") ~= player:get_player_name() then
		return false
	end
	return true
end

minetest.register_node( 'riventest:door3', {
	description         = 'keycode-locked door',
	drawtype            = 'signlike',
	tiles         = { 'rivendoor3.png' },
	inventory_image     = 'rivendoor3.png',
	wield_image         = 'rivendoor3.png',
	paramtype2          = "wallmounted",
	selection_box       = { type = "wallmounted" },
	node_box            = { type = "wallmounted" },
	groups              = { snappy=1, bendy=3, cracky=1, melty=2, dig_immediate=2 },

})
minetest.register_node( 'riventest:door3_a_c', {
	description         = 'closed keycode-locked door top',
	drawtype            = 'signlike',
	tiles         = { 'rivendoor3_a.png' },
	inventory_image     = 'rivendoor3_a.png',
	paramtype           = 'light',
	paramtype2          = "wallmounted",
	walkable            = true,
	selection_box       = { type = "wallmounted", },
	node_box            = { type = "wallmounted" },
	groups              = { snappy=1, bendy=3, cracky=1, melty=2, dig_immediate=2, not_in_creative_inventory=1 },
	legacy_wallmounted  = true,
	drop                = 'riventest:door3',
	can_dig = function(pos,player)
		meta = minetest.env:get_meta(pos)
		return has_door3_privilege(meta, player)
	end,	
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec", "size[6,2;]"..
			"field[0.256,0.5;6,1;keycode;Key code:;]"..
			"button_exit[2.3,1.5;2,1;button;Proceed]")
		meta:set_string("owner", "")
		meta:set_string("form", "yes")
	end,	
	on_receive_fields = function(pos, formname, fields, sender)
		local meta = minetest.env:get_meta(pos)
		local sender_name = sender:get_player_name()

		if not has_door3_privilege(meta, sender) then
			if fields.keycode == meta:get_string("keycode") then minetest.chat_send_player(sender_name, "pass")
				on_door3_punched( pos, minetest.env:get_node(pos), sender, true )
			else minetest.chat_send_player(sender_name, "you shall not pass") end
		return end
		meta:set_string("keycode", fields.keycode)
		local bometa = minetest.env:get_meta({x=pos.x,y=pos.y-1,z=pos.z})
		bometa:set_string("keycode", fields.keycode)
	end,	
})

minetest.register_node( 'riventest:door3_b_c', {
	description         = 'closed keycode-locked door bottom',
	drawtype            = 'signlike',
	tiles         = { 'rivendoor3_b.png' },
	inventory_image     = 'rivendoor3_b.png',
	paramtype           = 'light',
	paramtype2          = "wallmounted",
	walkable            = true,
	selection_box       = { type = "wallmounted", },
	node_box            = { type = "wallmounted" },
	groups              = { snappy=1, bendy=3, cracky=1, melty=2, dig_immediate=2, not_in_creative_inventory=1 },
	legacy_wallmounted  = true,
	drop                = 'riventest:door3',
	can_dig = function(pos,player)
		meta = minetest.env:get_meta(pos)
		return has_door3_privilege(meta, player)
	end,	
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec", "size[6,2;]"..
			"field[0.256,0.5;6,1;keycode;Key code:;]"..
			"button_exit[2.3,1.5;2,1;button;Proceed]")
		meta:set_string("owner", "")
		meta:set_string("form", "yes")
	end,	
	on_receive_fields = function(pos, formname, fields, sender)
		local meta = minetest.env:get_meta(pos)
		local sender_name = sender:get_player_name()

		if not has_door3_privilege(meta, sender) then
			if fields.keycode == meta:get_string("keycode") then minetest.chat_send_player(sender_name, "pass")
				on_door3_punched( pos, minetest.env:get_node(pos), sender, true )
			else minetest.chat_send_player(sender_name, "you shall not pass") end
		return end
		meta:set_string("keycode", fields.keycode)
		local bometa = minetest.env:get_meta({x=pos.x,y=pos.y+1,z=pos.z})
		bometa:set_string("keycode", fields.keycode)

	end,	
})

minetest.register_node( 'riventest:door3_a_o', {
	description         = 'open keycode-locked door top',
	drawtype            = 'signlike',
	tiles         = { 'rivendoor3_a_r.png' },
	inventory_image     = 'rivendoor3_a_r.png',
	paramtype           = 'light',
	paramtype2          = "wallmounted",
	walkable            = false,
	selection_box       = { type = "wallmounted", },
	node_box            = { type = "wallmounted" },
	groups              = { snappy=1, bendy=2, cracky=1, melty=2, dig_immediate=2, not_in_creative_inventory=1 },
	legacy_wallmounted  = true,
	drop                = 'riventest:door3',
	can_dig = function(pos,player)
		meta = minetest.env:get_meta(pos)
		return has_door3_privilege(meta, player)
	end,	
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec", "size[6,2;]"..
			"field[0.256,0.5;6,1;keycode;Key code:;]"..
			"button_exit[2.3,1.5;2,1;button;Proceed]")
		meta:set_string("owner", "")
		meta:set_string("form", "yes")
	end,	
	on_receive_fields = function(pos, formname, fields, sender)
		local meta = minetest.env:get_meta(pos)
		local sender_name = sender:get_player_name()

		if not has_door3_privilege(meta, sender) then
			if fields.keycode == meta:get_string("keycode") then minetest.chat_send_player(sender_name, "pass")
				on_door3_punched( pos, minetest.env:get_node(pos), sender, true )
			else minetest.chat_send_player(sender_name, "you shall not pass") end
		return end
		meta:set_string("keycode", fields.keycode)
		local bometa = minetest.env:get_meta({x=pos.x,y=pos.y-1,z=pos.z})
		bometa:set_string("keycode", fields.keycode)
		
	end,	
})

minetest.register_node( 'riventest:door3_b_o', {
	description         = 'open keycode-locked door bottom',
	drawtype            = 'signlike',
	tiles         = { 'rivendoor3_b_r.png' },
	inventory_image     = 'rivendoor3_b_r.png',
	paramtype           = 'light',
	paramtype2          = "wallmounted",
	walkable            = false,
	selection_box       = { type = "wallmounted", },
	node_box            = { type = "wallmounted" },
	groups              = { snappy=1, bendy=3, cracky=1, melty=2, dig_immediate=2, not_in_creative_inventory=1 },
	legacy_wallmounted  = true,
	drop                = 'riventest:door3',
	can_dig = function(pos,player)
		meta = minetest.env:get_meta(pos)
		return has_door3_privilege(meta, player)
	end,	
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec", "size[6,2;]"..
			"field[0.256,0.5;6,1;keycode;Key code:;]"..
			"button_exit[2.3,1.5;2,1;button;Proceed]")
		meta:set_string("owner", "")
		meta:set_string("form", "yes")
	end,	
	on_receive_fields = function(pos, formname, fields, sender)
		local meta = minetest.env:get_meta(pos)
		local sender_name = sender:get_player_name()

		if not has_door3_privilege(meta, sender) then
			if fields.keycode == meta:get_string("keycode") then minetest.chat_send_player(sender_name, "pass")
				on_door3_punched( pos, minetest.env:get_node(pos), sender, true )
			else minetest.chat_send_player(sender_name, "you shall not pass") end
		return end
		meta:set_string("keycode", fields.keycode)
		local bometa = minetest.env:get_meta({x=pos.x,y=pos.y+1,z=pos.z})
		bometa:set_string("keycode", fields.keycode)

	end,		
})

local on_door3_placed = function( pos, node, placer )
	if node.name ~= 'riventest:door3' then return end

	upos = { x = pos.x, y = pos.y - 1, z = pos.z }
	apos = { x = pos.x, y = pos.y + 1, z = pos.z }
	und = minetest.env:get_node( upos )
	abv = minetest.env:get_node( apos )

	dir = placer:get_look_dir()

	if     round( dir.x ) == 1  then
		newparam = WALLMX
	elseif round( dir.x ) == -1 then
		newparam = WALLPX
	elseif round( dir.z ) == 1  then
		newparam = WALLMZ
	elseif round( dir.z ) == -1 then
		newparam = WALLPZ
	end

	if und.name == 'air' then
		minetest.env:add_node( pos,  { name = 'riventest:door3_a_c', param2 = newparam } )
		local meta = minetest.env:get_meta(pos)
		meta:set_string("owner", placer:get_player_name() or "")
		minetest.env:add_node( upos, { name = 'riventest:door3_b_c', param2 = newparam } )
		local meta = minetest.env:get_meta(upos)
		meta:set_string("owner",  placer:get_player_name() or "")

	elseif abv.name == 'air' then
		minetest.env:add_node( pos,  { name = 'riventest:door3_b_c', param2 = newparam } )
		local meta = minetest.env:get_meta(pos)
		meta:set_string("owner",  placer:get_player_name() or "")
		minetest.env:add_node( apos, { name = 'riventest:door3_a_c', param2 = newparam } )
		local meta = minetest.env:get_meta(apos)
		meta:set_string("owner",  placer:get_player_name() or "")

	else
		minetest.env:remove_node( pos )
		placer:get_inventory():add_item( "main", 'riventest:door3' )
		minetest.chat_send_player( placer:get_player_name(), 'not enough space' )
	end
end
on_door3_punched = function( pos, node, puncher,skip )
	if string.find( node.name, 'riventest:door3' ) == nil then 	return end

	local meta = minetest.env:get_meta(pos)
	local keycode = meta:get_string('keycode')
	local owner = meta:get_string('owner')

	if skip ~= true then 
		if not has_door3_privilege(meta, puncher) then 
			minetest.chat_send_player(puncher:get_player_name(), "door is locked") return end 	
	end

	upos = { x = pos.x, y = pos.y - 1, z = pos.z }
	apos = { x = pos.x, y = pos.y + 1, z = pos.z }

	if string.find( node.name, '_c', -2 ) ~= nil then
		if     node.param2 == WALLPX then
			newparam = WALLMZ
		elseif node.param2 == WALLMZ then
			newparam = WALLMX
		elseif node.param2 == WALLMX then
			newparam = WALLPZ
		elseif node.param2 == WALLPZ then
			newparam = WALLPX
		end
	elseif string.find( node.name, '_o', -2 ) ~= nil then
		if     node.param2 == WALLMZ then
			newparam = WALLPX
		elseif node.param2 == WALLMX then
			newparam = WALLMZ
		elseif node.param2 == WALLPZ then
			newparam = WALLMX
		elseif node.param2 == WALLPX then
			newparam = WALLPZ
		end
	end

	if ( node.name == 'riventest:door3_a_c' ) then
		minetest.env:add_node( pos,  { name = 'riventest:door3_a_o', param2 = newparam } )
		local meta = minetest.env:get_meta(pos)
		meta:set_string("owner",  owner)
		meta:set_string("keycode",  keycode)

		minetest.env:add_node( upos, { name = 'riventest:door3_b_o', param2 = newparam } )
		local meta = minetest.env:get_meta(upos)
		meta:set_string("owner",  owner)
		meta:set_string("keycode",  keycode)

	elseif ( node.name == 'riventest:door3_b_c' ) then
		minetest.env:add_node( pos,  { name = 'riventest:door3_b_o', param2 = newparam } )
		local meta = minetest.env:get_meta(pos)
		meta:set_string("owner",  owner)
		meta:set_string("keycode",  keycode)

		minetest.env:add_node( apos, { name = 'riventest:door3_a_o', param2 = newparam } )
		local meta = minetest.env:get_meta(apos)
		meta:set_string("owner",  owner)
		meta:set_string("keycode",  keycode)

	elseif ( node.name == 'riventest:door3_a_o' ) then
		minetest.env:add_node( pos,  { name = 'riventest:door3_a_c', param2 = newparam } )
		local meta = minetest.env:get_meta(pos)
		meta:set_string("owner",  owner)
		meta:set_string("keycode",  keycode)

		minetest.env:add_node( upos, { name = 'riventest:door3_b_c', param2 = newparam } )
		local meta = minetest.env:get_meta(upos)
		meta:set_string("owner",  owner)
		meta:set_string("keycode",  keycode)

	elseif ( node.name == 'riventest:door3_b_o' ) then
		minetest.env:add_node( pos,  { name = 'riventest:door3_b_c', param2 = newparam } )
		local meta = minetest.env:get_meta(pos)
		meta:set_string("owner",  owner)
		meta:set_string("keycode",  keycode)

		minetest.env:add_node( apos, { name = 'riventest:door3_a_c', param2 = newparam } )
		local meta = minetest.env:get_meta(apos)
		meta:set_string("owner",  owner)
		meta:set_string("keycode",  keycode)
	end
	minetest.sound_play({name='metalgate', gain=1.5}, {pos=pos, loop=false})
end

local on_door3_digged = function( pos, node, digger )
	upos = { x = pos.x, y = pos.y - 1, z = pos.z }
	apos = { x = pos.x, y = pos.y + 1, z = pos.z }

	if ( node.name == 'riventest:door3_a_c' ) or ( node.name == 'riventest:door3_a_o' ) then
		minetest.env:remove_node( upos )
	elseif ( node.name == 'riventest:door3_b_c' ) or ( node.name == 'riventest:door3_b_o' ) then
		minetest.env:remove_node( apos )
	end
end

minetest.register_on_placenode( on_door3_placed )
minetest.register_on_punchnode( on_door3_punched )
minetest.register_on_dignode( on_door3_digged )

--[[
SOUNDS
]]
-- default
function riventest.node_sound_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
		{name="", gain=1.0}
	table.dug = table.dug or
		{name="riventest_dug_node", gain=1.0}
	return table
end

-- metal
function riventest.node_sound_metal_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
		{name="riventest_metal_footstep", gain=1.0}
	table.dig = table.dig or
		{name="riventest_metal_dig", gain=0.5}
	table.dug = table.dug or
		{name="riventest_metal_dug", gain=0.5}
	return table
end

-- stone
function riventest.node_sound_stone_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
		{name="riventest_hard_footstep", gain=1.0}
	table.dug = table.dug or
		{name="riventest_dug_node", gain=1.0}
	riventest.node_sound_defaults(table)
	return table
end

-- wood
function riventest.node_sound_wood_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
		{name="riventest_wood_footstep", gain=1.0}
	table.dug = table.dug or
		{name="riventest_dug_node", gain=1.0}
	riventest.node_sound_defaults(table)
	return table
end

-- glass
riventest.node_sound_glass_defaults = riventest.node_sound_defaults

-- leaves
riventest.node_sound_leaves_defaults = riventest.node_sound_defaults

--[[
LINKING BOOKS
]]
local linkingbook = {}
linkingbook.sounds = {}
linkingbook_sound = function(p)
	local wanted_sound = {name="linkingbook", gain=1.5}
		linkingbook.sounds[minetest.hash_node_position(p)] = {
			handle = minetest.sound_play(wanted_sound, {pos=p, loop=false}),
			name = wanted_sound.name,
		}

end
local function has_linkingbook_privilege(meta, player)
	if meta:get_string("owner") == '' then
		meta:set_string("owner", player:get_player_name())
	elseif meta:get_string("owner") ~= player:get_player_name() then
		return false
	end
	return true
end

minetest.register_node("riventest:blinkingbook", {
	description = "blank linking book",
	drawtype = "nodebox",
	tiles = {"riventest_blinkingbook.png",'riventest_bookunder.png',"riventest_bookside.png"},
	inventory_image = "riventest_blinkingbook.png",
	paramtype = "light",
	paramtype2 = "facedir",	
	node_box = {
		type = "fixed",
		fixed = {{-0.45, -0.5, -0.3, 0.45, -0.4, 0.3}},
	},
	selection_box = {
		type = "fixed",
		fixed = {{-0.45, -0.5, -0.3, 0.45, -0.4, 0.3}},
	},	
	groups = {choppy=2,dig_immediate=2,flammable=3},
	sounds = riventest.node_sound_defaults(),
--[[
	on_punch = function(pos,node,puncher)
		local player = puncher:get_player_name()-- or ""
		local meta = minetest.env:get_meta(pos)
		local stringpos = meta:get_string("location")
		local p = {}
		p.x, p.y, p.z = string.match(stringpos, "^([%d.-]+)[, ] *([%d.-]+)[, ] *([%d.-]+)$")
		if p.x and p.y and p.z then

			teleporiventeste = minetest.env:get_player_by_name(player)
			linkingbook_sound(pos)
			teleporiventeste:setpos(p)
			linkingbook_sound(p)
		end
	end,
]]
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec", "size[8,3;]"..
			"field[0.256,0.5;8,1;bookname;Book name;]"..
			"field[0.256,1.3;8,1;location;Destination coordinates (X,Y,Z);]"..
			"field[0.256,2.1;8,1;private;Private? (y/n);n]"..
			"button_exit[3.3,2.5;2,1;okay_button;Write]")
		meta:set_string("infotext", "Blank Linking Book")
		meta:set_string("owner", "")
		meta:set_string("form", "yes")
	end,	
	on_receive_fields = function(pos, formname, fields, sender)
		if fields.okay_button ~= nil then
			local sender_name = sender:get_player_name()
			local light = minetest.env:get_node_light(pos)
			local facedir = minetest.dir_to_facedir(sender:get_look_dir())
			local meta = minetest.env:get_meta(pos)
			if not has_linkingbook_privilege(meta, sender) then
				minetest.chat_send_player(sender_name, "You cannot edit other people's books.")
				return
			end
	
			-- check if coordinates are in a valid format
			local coords = {}
			coords.x, coords.y, coords.z = string.match(fields.location, "^([%d.-]+)[, ] *([%d.-]+)[, ] *([%d.-]+)$")
			coords.x=tonumber(coords.x)
			coords.y=tonumber(coords.y)
			coords.z=tonumber(coords.z)
			if not (coords.x and coords.y and coords.z) then
				-- fail on illegal input of coordinates
				minetest.chat_send_player(sender_name, 'You failed to provide correct coordinates for the linking book. Please enter the X, Y, and Z coordinates of the desired destination in a comma seperated list. Example: The input "10,20,30" means the destination at the coordinates X=10, Y=20 and Z=30.')
				return
			end
			if(coords.x>30927 or coords.x<-30912 or coords.y>30927 or coords.y<-30912 or coords.z>30927 or coords.z<-30912) then
				minetest.chat_send_player(sender_name, 'The coordinates of your linking book do not exist in our coordinate system. Correct coordinates range from -30912 to 30927 in all axes.')
				return
			end
	
			local private = fields.private
			if(private=="n") then
				-- replace the blank book with a public linking book
				minetest.env:remove_node(pos)
				minetest.env:add_node(pos, { name = "riventest:linkingbook", param1=light, param2=facedir })
				meta:set_string("infotext", fields.bookname)
			elseif(private=="y") then
				-- replace the blank book with a private linking book
				minetest.env:remove_node(pos)
				minetest.env:add_node(pos, { name = "riventest:plinkingbook", param1=light, param2=facedir })
				meta:set_string("infotext", fields.bookname.." (property of "..sender_name..")")
			else
				-- Fail on illegal input
				minetest.chat_send_player(sender_name, 'You failed to write a linking book. (Illegal input)') 
				return
			end

			meta:set_string("location", fields.location)
			meta:set_string("owner", sender_name or "")
		end
	end,	
--[[	
	after_place_node = function(pos, placer)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("owner", placer:get_player_name() or "")
	end,
]]
})


minetest.register_node("riventest:linkingbook", {
	description = "linking book",
	drawtype = "nodebox",
	tiles = {"riventest_linkingbook.png",'riventest_bookunder.png',"riventest_bookside.png"},
	inventory_image = "riventest_linkingbook.png",
	paramtype = "light",
	paramtype2 = "facedir",	
	node_box = {
		type = "fixed",
		fixed = {{-0.45, -0.5, -0.3, 0.45, -0.4, 0.3}},
	},
	selection_box = {
		type = "fixed",
		fixed = {{-0.45, -0.5, -0.3, 0.45, -0.4, 0.3}},
	},	
	groups = {choppy=2,dig_immediate=2,flammable=3,not_in_creative_inventory=1},
	sounds = riventest.node_sound_defaults(),
	on_punch = function(pos,node,puncher)
		-- teleport only if player punched with his hand
		local item = puncher:get_wielded_item():get_name()
		if(item=="") then
			local player = puncher:get_player_name()-- or ""
			local meta = minetest.env:get_meta(pos)
			local stringpos = meta:get_string("location")
			local p = {}
			p.x, p.y, p.z = string.match(stringpos, "^([%d.-]+)[, ] *([%d.-]+)[, ] *([%d.-]+)$")
			if p.x and p.y and p.z then
	
				teleporiventeste = minetest.env:get_player_by_name(player)
				linkingbook_sound(pos)
				teleporiventeste:setpos(p)
				linkingbook_sound(p)
			end
		end
	end,
	
	can_dig = function(pos,player)
		meta = minetest.env:get_meta(pos)
		return has_linkingbook_privilege(meta, player)
	end,
	drop = '',	
})

minetest.register_node("riventest:plinkingbook", {
	description = "private linking book",
	drawtype = 'nodebox',
	tiles = {"riventest_plinkingbook.png","riventest_bookunder.png","riventest_bookside.png"},
	inventory_image = "riventest_plinkingbook.png",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.45, -0.5, -0.3, 0.45, -0.4, 0.3},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.45, -0.5, -0.3, 0.45, -0.4, 0.3},
		},
	},	
	groups = {choppy=2,dig_immediate=2,flammable=3,not_in_creative_inventory=1},
	sounds = riventest.node_sound_defaults(),
	on_punch = function(pos,node,puncher)
		-- teleport only if player punched with his hand
		local item = puncher:get_wielded_item():get_name()
		if(item=="") then
			local meta = minetest.env:get_meta(pos)
			if not has_linkingbook_privilege(meta, puncher) then return end
			local player = puncher:get_player_name()-- or ""
			local stringpos = meta:get_string("location")
			local p = {}
			p.x, p.y, p.z = string.match(stringpos, "^([%d.-]+)[, ] *([%d.-]+)[, ] *([%d.-]+)$")
			if p.x and p.y and p.z then
	
				teleporiventeste = minetest.env:get_player_by_name(player)
				linkingbook_sound(pos)
				teleporiventeste:setpos(p)
				linkingbook_sound(p)
			end
		end
	end,
	
	can_dig = function(pos,player)
		meta = minetest.env:get_meta(pos)
		return has_linkingbook_privilege(meta, player)
	end,
	drop = '',	
})

--[[
DECORATIVE
]]

GLOWLIKE = function(nodeid,nodename,drawtype)
	if drawtype == nil then 
		drawtype = 'glasslike'
		inv_image = minetest.inventorycube("riventest_"..nodeid..".png")
	else 
		inv_image = "riventest_"..nodeid..".png" 
	end
	minetest.register_node("riventest:"..nodeid, {
		description = nodename,
		drawtype = drawtype,
		tiles = {"riventest_"..nodeid..".png"},
		inventory_image = inv_image,
		light_propagates = true,
		paramtype = "light",
		sunlight_propagates = true,
		light_source = 15	,
		is_ground_content = true,
		groups = {snappy=2,cracky=3},
		sounds = riventest.node_sound_glass_defaults(),
		node_box = {
			type = "fixed",
			fixed = {-0.125, -0.5, -0.125, 0.125, 0.3, 0.125}
		},
		selection_box = {
			type = "fixed",
			fixed = {-0.14, -0.5, -0.14, 0.14, 0.3, 0.14}
		},

	})
end
METALLIKE = function(nodeid, nodename,fence)
	minetest.register_node("riventest:"..nodeid, {
		description = nodename,
		tiles = {"riventest_"..nodeid..".png"},
		is_ground_content = true,
		groups = {bendy=2,cracky=1,melty=2},
		sounds = riventest.node_sound_metal_defaults()
	})
	if fence == true then
		minetest.register_node("riventest:"..nodeid.."_fence", {
			description = nodename.." fence",
			drawtype = "fencelike",
			tiles = {"riventest_"..nodeid..".png"},
			inventory_image = "riventest_"..nodeid.."_fence.png",
			wield_image = "riventest_"..nodeid.."_fence.png",
			paramtype = "light",
			is_ground_content = true,
			selection_box = {
				type = "fixed",
				fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
			},
			groups = {bendy=2,cracky=1,melty=2},
			sounds = riventest.node_sound_metal_defaults()
		})
	end
end

TREELIKE = function(nodeid, nodename,fence)
	minetest.register_node("riventest:"..nodeid, {
		description = nodename,
		tiles = {"riventest_"..nodeid..".png"},
		is_ground_content = true,
		groups = {snappy=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
		sounds = riventest.node_sound_wood_defaults(),
	})
	if fence == true then
		minetest.register_node("riventest:"..nodeid.."_fence", {
			description = nodename.." fence",
			drawtype = "fencelike",
			tiles = {"riventest_"..nodeid..".png"},
			inventory_image = "riventest_"..nodeid.."_fence.png",
			wield_image = "riventest_"..nodeid.."_fence.png",
			paramtype = "light",
			is_ground_content = true,
			selection_box = {
				type = "fixed",
				fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
			},
			groups = {snappy=1,choppy=2,oddly_breakable_by_hand=1,flammable=2,tree=1},
			sounds = riventest.node_sound_wood_defaults()
		})
	end
end

STONELIKE = function(nodeid, nodename)
	minetest.register_node("riventest:"..nodeid, {
		description = nodename,
		tiles = {"riventest_"..nodeid..".png"},
		is_ground_content = true,
		groups = {cracky=3, stone=1},
		sounds = riventest.node_sound_stone_defaults()
	})
end

local SOUNDS = {}
SOUNDNODE = function(nodeid, nodename,drawtype)
	SOUNDS[nodeid] = {}
	SOUNDS[nodeid].sounds = {}
	local on_punch = function(pos,node)
		local sound = SOUNDS[nodeid].sounds[minetest.hash_node_position(pos)]
		if sound == nil then 
			local wanted_sound = {name=nodeid, gain=1.5}
			SOUNDS[nodeid].sounds[minetest.hash_node_position(pos)] = {	handle = minetest.sound_play(wanted_sound, {pos=pos, loop=true}),	name = wanted_sound.name, }

		else 
			minetest.sound_stop(sound.handle)
			SOUNDS[nodeid].sounds[minetest.hash_node_position(pos)] = nil
		end

	end
	after_dig_node = function(pos,node)
		local sound = SOUNDS[nodeid].sounds[minetest.hash_node_position(pos)]
		if sound ~= nil then
			minetest.sound_stop(sound.handle)
			SOUNDS[nodeid].sounds[minetest.hash_node_position(pos)] = nil
			nodeupdate(pos)
		end
	end
	if drawtype == 'signlike' then
		minetest.register_node("riventest:"..nodeid, {
			description = nodename,
			drawtype = "signlike",
			tiles = {"riventest_"..nodeid..'.png'}, 
			inventory_image = "riventest_"..nodeid..'.png',
			wield_image = "riventest_"..nodeid..'.png', 
			paramtype = "light",
			paramtype2 = "wallmounted",
			sunlight_propagates = true,
			walkable = false,
			metadata_name = "sign",
			selection_box = {
				type = "wallmounted",
			},
			groups = {snappy=2,choppy=2,dig_immediate=2,flammable=2},
			legacy_wallmounted = true,
			sounds = riventest.node_sound_defaults(),
			on_punch = on_punch,
			after_dig_node = after_dig_node,		
		})
	else 
		minetest.register_node("riventest:"..nodeid, { 
			description = nodename, 
			drawtype = 'plantlike', 
			tiles = {"riventest_"..nodeid..'.png'}, 
			inventory_image = "riventest_"..nodeid..'.png',
			wield_image = "riventest_"..nodeid..'.png', 
			paramtype = "light",
			groups = {cracky=3},
			sounds = riventest.node_sound_stone_defaults(),
			on_punch = on_punch,	
			after_dig_node = after_dig_node,
		})
	end
end
PLANTLIKE = function(nodeid, nodename,type,option)
	if option == nil then option = false end

	local params ={ description = nodename, drawtype = "plantlike", tiles = {"riventest_"..nodeid..'.png'}, 
	inventory_image = "riventest_"..nodeid..'.png',	wield_image = "riventest_"..nodeid..'.png', paramtype = "light",
	sunlight_propagates=true,
	}
		
	if type == 'veg' then
		params.groups = {snappy=2,dig_immediate=3,flammable=2}
		params.sounds = riventest.node_sound_leaves_defaults()
		if option == false then params.walkable = false end
	elseif type == 'met' then			-- metallic
		params.groups = {snappy=1,bendy=2,cracky=1,melty=2}
		params.sounds = riventest.node_sound_stone_defaults()
	elseif type == 'cri' then			-- craft items
		params.groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3}
		params.sounds = riventest.node_sound_wood_defaults()
		if option == false then params.walkable = false end
	elseif type == 'eat' then			-- edible
		params.groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3}
		params.sounds = riventest.node_sound_wood_defaults()
		params.walkable = false
		params.on_use = minetest.item_eat(option)
	end
	minetest.register_node("riventest:"..nodeid, params)
end

STONELIKE('rt1','inward-squared brownstone')
METALLIKE('rt2','flower-patterned metal')
STONELIKE('rt3','lined brownestone')
METALLIKE('rt4','metal block')
METALLIKE('rt5','golden block')
PLANTLIKE('rt6_mushroom','mushroom','veg')
STONELIKE('rt7','outward-squared brownstone')
STONELIKE('rt8','cobble brightstone')
GLOWLIKE('rt9_lamppost','turquiose lamppost','plantlike')
GLOWLIKE('rt17_lamppost','orange lamppost','plantlike')
GLOWLIKE('rt18_lamppost','green lamppost','plantlike')
GLOWLIKE('rt19_lamppost','red lamppost','plantlike')
METALLIKE('rt10','rusted metal block')
STONELIKE('rt11','flower-patterned brightstone')
STONELIKE('rt12','mosaic brightstone')


SOUNDNODE('1','art (1)','signlike')
SOUNDNODE('2','art (2)','signlike')
SOUNDNODE('3','art (3)','signlike')
TREELIKE('wood','wood')
TREELIKE('woodblue','bluewood')
STONELIKE('stone1','brownstone')
STONELIKE('stone2','graystone')
STONELIKE('stoneblue','bluestone')
METALLIKE('metal','black metal')
METALLIKE('bulkhead','metal bulkhead')
STONELIKE('goldstone1','brightstone')
STONELIKE('goldstone2','goldstone')

minetest.register_node("riventest:rt15", {
	description = "stained glass",
	drawtype = "nodebox",
	tiles = {"riventest_rt15.png"},
--	inventory_image = minetest.inventorycube("riventest_rt15.png"),
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = LIGHT_MAX-1,	
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	sounds = riventest.node_sound_glass_defaults(),
node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.1, 0.5,0.5, 0.1},
--				{-0.1, -0.5, -0.5, 0.1, -0.1, 0.5},

--				{-0.5, 0.4, 0, 0.5, 0.5, 0.5},
--				{-0.1, -0.1, 0, 0.1, 0.4, 0.5},
			},
		},
selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.1, 0.5,0.5, 0.1},
--				{-0.1, -0.5, -0.5, 0.1, -0.1, 0.5},

--				{-0.5, 0.4, 0, 0.5, 0.5, 0.5},
--				{-0.1, -0.1, 0, 0.1, 0.4, 0.5},
			},
		},		
})
minetest.register_node("riventest:glass", {
	description = "glass",
	drawtype = "glasslike",
	tiles = {"riventest_glass.png"},
	inventory_image = minetest.inventorycube("riventest_glass.png"),
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	sounds = riventest.node_sound_glass_defaults(),
})
minetest.register_node("riventest:rt16", {
	description = "puzzle book",
	drawtype = "signlike",
	tiles = {"riventest_rt16.png"},
	inventory_image = "riventest_rt16.png",
	wield_image = "riventest_rt16.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	light_propagates = true,
	sunlight_propagates = true,
	light_source = 10,
	walkable = false,

	selection_box = {
		type = "wallmounted",
	},
	groups = {choppy=2,dig_immediate=2,flammable=3},
	legacy_wallmounted = true,
	sounds = riventest.node_sound_defaults(),
})
extend_chain = function(pos)
	
	local upos = {x=pos.x,y=pos.y-1,z=pos.z}
	local apos = {x=pos.x,y=pos.y+1,z=pos.z}
	
	local unode = minetest.env:get_node(upos)
	local anode = minetest.env:get_node(apos)
	if unode.name == 'air' then
		minetest.env:add_node( upos, { name = 'riventest:chain'} )	
		extend_chain(upos)
	end
	if anode.name == 'air' then
		minetest.env:add_node( apos, { name = 'riventest:chain'} )	
		extend_chain(apos)
	end	

end
minetest.register_node("riventest:chain", {
	description = "chain",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"riventest_chain.png"},
	inventory_image = "riventest_chain.png",
	wield_image = "riventest_chain.png",
	paramtype = "light",
	walkable = false,
	climbable = true,
	buildable_to = true,
	groups = {snappy=2,melty=2,dig_immediate=3},
	sounds = riventest.node_sound_wood_defaults(),
	after_place_node = extend_chain,
})
minetest.register_node("riventest:water_flowing", {
	description = "flowing water",
	inventory_image = minetest.inventorycube("riventest_altwater.png"),
	drawtype = "flowingliquid",
	tiles = {"riventest_altwater.png"},
	alpha = WATER_ALPHA,
	paramtype = "light",
	light_source = 0,	
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drop = "",
	liquidtype = "flowing",
	liquid_alternative_flowing = "riventest:water_flowing",
	liquid_alternative_source = "riventest:water_source",
	liquid_viscosity = WATER_VISC,
	post_effect_color = {a=64, r=100, g=100, b=200},
	special_materials = {
		{image="riventest_altwater.png", backface_culling=false},
		{image="riventest_altwater.png", backface_culling=true},
	},
	groups = {water=3, liquid=3, puts_out_fire=1, not_in_creative_inventory=1 },
})

minetest.register_node("riventest:water_source", {
	description = "water source",
	inventory_image = minetest.inventorycube("riventest_altwater.png"),
	drawtype = "liquid",
	tiles = {"riventest_altwater.png"},
	alpha = WATER_ALPHA,
	paramtype = "light",
	light_source = 0,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	drop = "",
	liquidtype = "source",
	liquid_alternative_flowing = "riventest:water_flowing",
	liquid_alternative_source = "riventest:water_source",
	liquid_viscosity = WATER_VISC,
	post_effect_color = {a=64, r=100, g=100, b=200},
	special_materials = {
		-- New-style water source material (mostly unused)
		{image="riventest_altwater.png", backface_culling=false},
	},
	groups = {water=3, liquid=3, puts_out_fire=1},
})

minetest.register_node("riventest:beetle", {
	description = "decorational beetle",
	drawtype = "signlike",
	tiles = {"riventest_beetle.png"},
	inventory_image = "riventest_beetle.png",
	wield_image = "riventest_beetle.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	light_propagates = true,
	sunlight_propagates = true,
	light_source = 10,
	walkable = false,

	selection_box = {
		type = "wallmounted",
	},
	groups = {choppy=2,dig_immediate=2},
	legacy_wallmounted = true,
	sounds = riventest.node_sound_defaults(),
})
minetest.register_node("riventest:dagger", {
	description = "decorational dagger",
	drawtype = "signlike",
	tiles = {"riventest_dagger.png"},
	inventory_image = "riventest_dagger.png",
	wield_image = "riventest_dagger.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	metadata_name = "sign",
	selection_box = {
		type = "wallmounted",
		wall_top =	{-0.5, 0.45, -0.1875,   0.5,  0.5,  0.1875},
		wall_bottom =	{-0.5, -0.5, -0.1875,   0.5, -0.45, 0.1875},
		wall_side =	{-0.5, -0.5, -0.1875, -0.45,  0.5,  0.1875},
	},
	groups = {choppy=2,dig_immediate=2},
	legacy_wallmounted = true,
	sounds = riventest.node_sound_defaults(),
})
minetest.register_tool("riventest:tool", {
	description = "dagger",
	inventory_image = "riventest_tool.png",
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level=3,
		groupcaps={
			fleshy={times={[1]=6.00, [2]=3, [3]=1}, uses=10, maxlevel=3},
			cracky={times={[1]=0.1, [2]=0.1, [3]=0.1}, uses=5000, maxlevel=3},
			crumbly={times={[1]=0.1, [2]=0.1, [3]=0.1}, uses=5000, maxlevel=3},
			snappy={times={[1]=0.1, [2]=0.1, [3]=0.1}, uses=5000, maxlevel=3}
		}
	},
})

minetest.register_alias('rtt1', 'riventest:1')
minetest.register_alias('rtt2', 'riventest:2')
minetest.register_alias('rtt3', 'riventest:3')
minetest.register_alias('rtbluewood', 'riventest:woodblue')
minetest.register_alias('rtstone1', 'riventest:stone1')
minetest.register_alias('rtstone2', 'riventest:stone2')
minetest.register_alias('rtbluestone', 'riventest:stoneblue')
minetest.register_alias('rtmetal', 'riventest:metal')
minetest.register_alias('rtbulkhead', 'riventest:bulkhead')
minetest.register_alias('rtgold1', 'riventest:goldstone1')
minetest.register_alias('rtgold2', 'riventest:goldstone2')
minetest.register_alias('rtglass', 'riventest:glass')
minetest.register_alias('rtwood', 'riventest:wood')
minetest.register_alias('rtchain', 'riventest:chain')
minetest.register_alias('rtbeetle', 'riventest:beetle')
minetest.register_alias('rtdagger', 'riventest:dagger')
minetest.register_alias('rttool', 'riventest:tool')
minetest.register_alias('rtwater', 'riventest:water_source')
minetest.register_alias('bluebook', 'riventest:linkingbook')
minetest.register_alias('redbook', 'riventest:plinkingbook')
minetest.register_alias('blankbook', 'riventest:blinkingbook')
minetest.register_alias('rttlamp', 'riventest:rt9_lamppost')
minetest.register_alias('rtolamp', 'riventest:rt17_lamppost')
minetest.register_alias('rtglamp', 'riventest:rt18_lamppost')
minetest.register_alias('rtrlamp', 'riventest:rt19_lamppost')
minetest.register_alias('rtpuzzle', 'riventest:rt16')
minetest.register_alias('rtmushroom', 'riventest:rt6_mushroom')

--[[
ITEMS
]]
minetest.register_craftitem('riventest:stick_wood', {
	description = 'wooden stick',
	inventory_image = 'riventest_stick_wood.png',
})

minetest.register_craftitem('riventest:stick_metal', {
	description = 'black metal bar',
	inventory_image = 'riventest_stick_metal.png',
})

minetest.register_craftitem('riventest:stick_rt4', {
	description = 'metal bar',
	inventory_image = 'riventest_stick_rt4.png',
})

--[[
CRAFTS
]]
minetest.register_craft({
	output = 'riventest:stick_wood 4',
	recipe = {{'riventest:wood'}},
})
minetest.register_craft({
	output = 'riventest:stick_metal 4',
	recipe = {{'riventest:metal'}},
})
minetest.register_craft({
	output = 'riventest:stick_rt4 4',
	recipe = {{'riventest:rt4'}},
})

minetest.register_craft({
	output = 'riventest:door1',
	recipe = {
		{'riventest:stick_wood','riventest:stick_wood'},
		{'riventest:stick_wood','riventest:stick_wood'},
		{'riventest:stick_wood','riventest:stick_wood'},
	}
})

minetest.register_craft({
	output = 'riventest:door2',
	recipe = {
		{'riventest:stick_rt4','riventest:stick_rt4'},
		{'riventest:stick_rt4','riventest:stick_rt4'},
		{'riventest:stick_rt4','riventest:stick_rt4'},
	}
})

--[[
  FUELS
]]
minetest.register_craft({
	type = "fuel",
	recipe = "riventest:wood",
	burntime = 30,
})

minetest.register_craft({
	type = "fuel",
	recipe = "riventest:woodblue",
	burntime = 32,
})

minetest.register_craft({
	type = "fuel",
	recipe = "riventest:door1",
	burntime = 30,
})

minetest.register_craft({
	type = "fuel",
	recipe = "riventest:rt16",
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "riventest:linkingbook",
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "riventest:plinkingbook",
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "riventest:1",
	burntime = 1,
})

minetest.register_craft({
	type = "fuel",
	recipe = "riventest:2",
	burntime = 1,
})

minetest.register_craft({
	type = "fuel",
	recipe = "riventest:3",
	burntime = 1,
})

minetest.register_craft({
	type = "fuel",
	recipe = "riventest:stick_wood",
	burntime = 7,
})

minetest.register_craft({
	type = "fuel",
	recipe = "riventest:rt6_mushroom",
	burntime = 1,
})


