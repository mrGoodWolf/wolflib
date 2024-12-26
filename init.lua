wolf = {}
wolf.lib = {}
wolf.math = {}

function wolf.mobupdate(mob, player)
    local mobcpy = mob
    mobkit.turn2yaw(mobcpy.mob, mobcpy.yaw, mobcpy.rateofmove)
    if (mobcpy.jump == 0) then
        mobkit.animate(mobcpy.mob, mobcpy.walk_animation)
        mobcpy.mob:set_pos(mobcpy.pos)
        mobcpy.lastpos = mobkit.pos_shift(mobcpy.lastpos, mobcpy.pos)
    end

    if mobcpy.jump == 1 then
        mobkit.animate(mobcpy.mob, mobcpy.jump_stand_still)
    end

    if mobcpy.jump == 2 then
        mobkit.animate(mobcpy.mob, mobcpy.jump_moving_ani)
        mobcpy.lastpos = mobkit.pos_shift(mobcpy.lastpos, mobcpy.pos)
        mobcpy.mob:set_pos(mobcpy.pos)
    end

    return mobcpy
end

-- Function to clamp a value between a minimum and maximum
function wolf.math.clamp(value, min, max)
    if value < min then
        return min
    elseif value > max then
        return max
    else
        return value
    end
end


wolf.lib.jumpstandingstill = 1
wolf.lib.jumpmoving = 2
wolf.lib.nojump = 0