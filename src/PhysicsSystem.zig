const std = @import("std");
const entityclass = @import("entity.zig");
const enitityrender = @import("RenderEntity.zig");

pub fn vectorforces(el: *enitityrender.EntityList,) void {
    var iteratator = el.map.iterator();
    while (iteratator.next()) |entity| {
        if (!entity.value_ptr.*.fixedPos) {
            entity.value_ptr.*.forceVector = .{
                entity.value_ptr.*.forceVector[0],
                entity.value_ptr.*.forceVector[1] + 0.33
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
    }   
}

pub fn physicsSim(el: *enitityrender.EntityList) void {
    vectorforces(el);
    vectorvelocities(el);
    moveentitiesbyvector(el);
}
