const std = @import("std");
const EntityClass = @import("Entity.zig");
const rl = @import("raylib");
const Allocator = std.mem.Allocator;
const GameObject = EntityClass.GameObject;

pub fn render(Obj: GameObject) bool{
    if (Obj.shape==EntityClass.Shapes.Rect){
        _ = rl.drawRectangle(Obj.x,Obj.y,Obj.width,Obj.height,Obj.color);
        return true;
    }else{
        return false;
    }    
}

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
