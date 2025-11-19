const std = @import("std");
const EntityClass = @import("Entity.zig");
const rl = @import("raylib");
const Allocator = std.mem.Allocator;
const GameObject = EntityClass.GameObject;

pub fn render(Obj: GameObject) bool{
    if (Obj.shape==EntityClass.Shapes.Rect){
        _ = rl.drawRectangle(Obj.xAsInt(),Obj.yAsInt(), Obj.width,Obj.height,Obj.color);
        return true;
    }else{
        return false;
    }    
}
