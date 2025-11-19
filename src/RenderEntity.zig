const std = @import("std");
const EntityClass = @import("Entity.zig");
const rl = @import("raylib");
const RenderSystem = @import("RenderSystem.zig");

const Allocator = std.mem.Allocator;
const GameObject = EntityClass.GameObject;
const render = RenderSystem.render;

pub const EntityList = struct{
    allocator: Allocator,
    map: std.AutoArrayHashMap(u8, GameObject),
    pub fn init(allocator: Allocator) EntityList{
        return .{
            .allocator = allocator,
            .map = std.AutoArrayHashMap(u8, GameObject).init(allocator),
        };
    }
    pub fn AddObject(self: *EntityList, int:u8, Obj: GameObject) !void{
        _ = try self.map.put(int, Obj);
    } 
    pub fn renderlist(self: *EntityList) !void{
        var iterator = self.map.iterator();
        while (iterator.next()) |entity|{
            _ = render(entity.value_ptr.*);
        }
    }


}; 
