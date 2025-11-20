const std = @import("std");
const entityclass = @import("entity.zig");
const enitityrender = @import("RenderEntity.zig");
const PlayerMovement = @import("PlayerMovement.zig");

pub fn vectorforces(el: *enitityrender.EntityList,) void {
    var iter = el.map.iterator();
    while (iter.next()) |entity| {
        if (!entity.value_ptr.*.fixedPos) {
            entity.value_ptr.*.forceVector = .{
                0,
                0
            }; 
        }
    }
    PlayerMovement.movement(&el.map.values()[0]);
     
    var iteratator = el.map.iterator();
    while (iteratator.next()) |entity| {
        if (!entity.value_ptr.*.fixedPos) {
            entity.value_ptr.*.forceVector = .{
                entity.value_ptr.*.forceVector[0],
                entity.value_ptr.*.forceVector[1] + 9.8 
            }; 
        }
    } 
}

pub fn vectorvelocities(el: *enitityrender.EntityList) void {
    var iteratator = el.map.iterator();
    while (iteratator.next()) |entity| {
        var e = entity.value_ptr; 
        e.velocityVector = .{
            e.velocityVector[0] + e.forceVector[0] / e.mass,
            e.velocityVector[1] + e.forceVector[1] / e.mass
        };
        if (e.posVector[1]>=720 and !e.fixedPos){
            e.velocityVector = .{
                e.velocityVector[0],
                0
            };
        }
    }
}

pub fn moveentitiesbyvector(el: *enitityrender.EntityList) void {
    var iteratator = el.map.iterator();
    while (iteratator.next()) |entity| {
        var e = entity.value_ptr; 
        e.posVector = .{
            e.x() + e.velocityVector[0],
            e.y() + e.velocityVector[1]
        };
        if (e.lowerBound()>=720){
            e.posVector = .{
                e.posVector[0],
                720-@as(f32,@floatFromInt(e.height))
            };
            e.velocityVector = .{
                e.velocityVector[0],
                -0.8*e.velocityVector[1]
            };
        }
    }   
}

pub fn physicsSim(el: *enitityrender.EntityList) void {
    vectorforces(el);
    vectorvelocities(el);
    moveentitiesbyvector(el);
}
