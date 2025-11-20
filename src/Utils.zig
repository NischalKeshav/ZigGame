const std = @import("std");
const EntityClass = @import("Entity.zig");
const GameObject = EntityClass.GameObject;
const math = std.math;

pub fn findDrag(obj: GameObject) [2]f32 {
    const fx = if (obj.velocityVector[0] != 0)
        obj.dragCoeff * math.pow(f32, 2, obj.velocityVector[0]) * -1.0 * (@abs(obj.velocityVector[0]) / obj.velocityVector[0])
    else
        0.0;
    const fy = if (obj.velocityVector[1] != 0)
        obj.dragCoeff * math.pow(f32, 2, obj.velocityVector[1]) * -1.0 * (@abs(obj.velocityVector[1]) / obj.velocityVector[1])
    else
        0.0;
    return .{ fx, fy };
}

