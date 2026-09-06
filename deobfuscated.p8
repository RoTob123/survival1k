-- survival1k
-- by rotob123

tiles = {} -- initiate grid of tiles
pal({10, 11, 12, -15}, 1) -- use custom palette (day)

-- generate terrain, which is markov's chain right now.
-- 1-2: sand and grass - do nothing :|
-- 3: water - you can drink it to get +10 water
seq = {
	{ -- sand up
		{1, 2, 3}, -- sand left
		{2},       -- grass left
		{1, 3}     -- water left
	},
	{ -- grass up
		{1, 2},    -- sand left
		{1, 2},    -- grass left
		{1}        -- water left
	},
	{ -- water up
		{1, 3},    -- sand left
		{1},       -- grass left
		{3}        -- water left
	},
}
for y=0,63 do
	tiles[y] = {}
	for x=0,63 do
		if (x != 0) then
			if (y != 0) then
				tiles[y][x] = seq[tiles[y-1][x]][tiles[y][x-1]][rnd(#seq[tiles[y-1][x]][tiles[y][x-1]])\1+1]
			else
				tiles[y][x] = seq[2][tiles[y][x-1]][rnd(#seq[2][tiles[y][x-1]])\1+1]
			end
		else tiles[y][0] = rnd(3)\1+1 
		end
	end
end

enemies = {} -- table that contains enemies
s = {"🐱", "😐", "웃"} -- all 3 variations of aggressive enemy
plr_x = 63 -- player's x (duh)
plr_y = 63 -- player's y (duuuhh)
t = 0 -- time (actually frames but eh)
water = 75 -- water value
hp = 100 -- health points
atk_dur = 0 -- debounce for attacking
atk = 1 -- damage
exp = 0 -- exp gained
day = true -- is it day right now?

::_::
cls()

-- basic controls
if btn(3) then
	plr_y = min(plr_y+1, 315)
elseif btn(2) then
	plr_y = max(plr_y-1, 0)
end
if btn(0) then
	plr_x = max(plr_x-1, 0)
elseif btn(1) then
	plr_x = min(plr_x+1, 315)
end 

-- get player's tile position (aka floor of pos/5)
plr_tl_x = plr_x\5
plr_tl_y = plr_y\5

-- drinking
if btnp(4) and tiles[plr_tl_y][plr_tl_x] == 3 then
	tiles[plr_tl_y][plr_tl_x] = 1 -- dry the tile out, setting it to sand
	water = min(water+10, 75) -- clamping
	?"\ai6v2e2d1c1c1" -- sound! :d
end

-- attacking
if btnp(5) and atk_dur == 0 then
	?"\ai6v2e3d3c2b1" -- sound! (2)
	atk_dur = 10 -- the ability won't be spammable now
	for i in all(enemies) do -- check for victims
		if i then -- idk??? it crashed a lot without this
			-- if the enemy is 9 pixels away and it is not on iframes
			if abs(i[2]-plr_x) < 10 and abs(i[3]-plr_y) < 10 and i[5] == 0 then
				i[4] -= atk -- deal damage
				i[5] = 10 -- iframes
				-- if enemy died, gain exp, and level up if exp >= atk*100
				if i[4] <= 0 then
					exp += i[1]*10 + rnd(20)\1
					hp += i[1]*10
					if exp >= atk*100 then
						?"\ai3s8v2eafb" -- sound!! (ok, ok i will stop.)
						atk += 1
						exp = 0
					end
					del(enemies, i)
				end
			end
		end
	end
end
t += 1 -- i honestly dont know why i put this isolated from everything
-- d e h y d r a t i o n
-- lose water every 19 frames (i decided to use prime number to get this asyncronous effect)
-- if water is 0, lose hp
if t % 19 == 0 then
	water = max(water-1, 0)
	if (water == 0) hp -= 1
end

-- day/night cycle. visually it only changes palette to be darker
if t % 1800 == 0 then
	day = not day
	if (day)pal({10, 11, 12, -15}, 1) else pal({4, 3, 1, -15}, 1)
end

-- spawning enemies
-- properites:
-- 1 - damage it deals, 0 - passive, anything else - aggressive
-- 2-3, x-y position
-- 4 - hp
-- 5 - iframes
-- 6 - the sprite to use (used in aggressive enemies only)
if t % 60 == 0 then
	-- during night more aggressive enemies will spawn
	if day then
		if rnd(15-atk)\1 == 0 then
			enemies[#enemies+1] = {rnd(3)\1+atk, rnd(300)+10, rnd(300)+10, rnd(atk*2)\1+atk, 0, rnd(2)\1+1}
		end
	else
		if rnd(10-atk)\1 == 0 then
			enemies[#enemies+1] = {rnd(5)\1+atk, rnd(300)+10, rnd(300)+10, rnd(atk*3)\1+atk, 0, rnd(2)\1+1}
		end
	end
end
if t % 30 == 0 and rnd(5)\1 == 0 then
	enemies[#enemies+1] = {0, rnd(300)+10, rnd(300)+10, rnd(3+atk/2)\1, 0, rnd(2)\1+1} -- passive enemy
end

-- camera, this one's tricky
-- without this start_xy and end_xy, the game lags so much.
-- we basically display only tiles that are visible

cam_x=plr_x-63
cam_y=plr_y-63
camera(cam_x, cam_y)
start_x=max(cam_x \ 5, 0)
end_x=min((cam_x + 128) \ 5, 63)
start_y=max(cam_y \ 5, 0)
end_y=min((cam_y + 128) \ 5, 63)

for y=start_y,end_y do
	for x=start_x,end_x do
		rectfill(x*5, y*5, (x+1)*5, (y+1)*5, tiles[y][x]) -- drawing tiles!!!
	end
end

rect(plr_tl_x*5, plr_tl_y*5, plr_tl_x*5+4, plr_tl_y*5+4, 7) -- player's tile position indicator

-- draw a red circle indicating attack
if atk_dur != 0 then 
	atk_dur -= 1
	circfill(plr_x, plr_y, 7, 8)
end

-- enemies' ai!
for i in all(enemies) do
	if i[1] == 0 then
		-- passive enemies - randomly wander around. that's it.
		if rnd(2)\1 == 0 then
			i[3] = min(max(i[3]+rnd(4)-2, 0), 315)
			i[2] = min(max(i[2]+rnd(4)-2, 0), 315)
		end
		if i[5] == 0 then
			?"★",i[2]-3,i[3]-3,9
		else
			i[5] -= 1
			?"★",i[2]-3,i[3]-3,(i[5]%2)+8
		end
	else
		-- aggressive enemies - get vector to player's position and simple move towards it
		dir = atan2(plr_x-i[2], plr_y-i[3])
		i[3] += sin(dir)
		i[2] += cos(dir)
		if abs(i[2]-plr_x) < 10 and abs(i[3]-plr_y) < 10 and i[5] == 0 then
			hp -= i[1]
		end
		if i[5] == 0 then
			?s[i[6]],i[2]-3,i[3]-3,9
		else
			i[5] -= 1
			?s[i[6]],i[2]-3,i[3]-3,(i[5]%2)+8
		end
	end
end
if(hp<=0)then
?"\as8bagfedc"
goto dead -- if hp = 0, go to game over screen
end
?"웃",plr_x-3,plr_y-2,0 -- draw the player
?"dmg: "..atk..", time: "..((t\30)%120).."\nhp: "..hp.."\nwater: "..water.."/75\nxp: "..exp.."/"..(atk*100),plr_x-61,plr_y+40,4 -- draw stats
flip()goto _ -- end the frame by flipping (sound strange but ok)
::dead::cls()camera() -- dead subroutine - just displays game over with level reached
?"you died!\nlevel: "..atk.." ("..atk*100-100+exp..")\nthx for playing!",5,5,7
flip()goto dead

-- gg man
