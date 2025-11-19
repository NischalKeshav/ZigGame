const std = @import("std");
const rl = @import("raylib");
const EntityClass = @import("Entity.zig");
const grid = @import("2dGrid.zig");
const EntityRender = @import("RenderEntity.zig");
const PhysicsSystem = @import("PhysicsSystem.zig");


pub fn main() !void {
    const screenWidth = 1280;
    const screenHeight = 720;
    
    rl.initWindow(screenWidth, screenHeight, "ZigGame - Grid Example");
    defer rl.closeWindow();
    
    rl.setTargetFPS(30);
    
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const Aalloc = arena.allocator();
    var eList : EntityRender.EntityList = EntityRender.EntityList.init(Aalloc);

    const player = EntityClass.GameObject{ 
        .posVector = .{100,200},
        .fixedPos = false
    };
    const block = EntityClass.GameObject{
        .posVector = .{200, 500},
        .height = 30,
        .width = 200,
        .fixedPos = true
    };
    _ = try eList.AddObject(1, player);
    _ = try eList.AddObject(2, block);

    while (!rl.windowShouldClose()) {
        rl.beginDrawing();
        defer rl.endDrawing();
                
        rl.clearBackground(rl.Color.beige);
        grid.draw2dGrid(screenWidth,screenHeight,50);
        PhysicsSystem.physicsSim(&eList);
        _ = try eList.renderlist();
        rl.drawFPS(10, 10);
    }
}
