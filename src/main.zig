const std = @import("std");
const rl = @import("raylib");
const EntityClass = @import("Entity.zig");
const grid = @import("2dGrid.zig");
const EntityRender = @import("RenderEntity.zig");



pub fn main() !void {
    const screenWidth = 1280;
    const screenHeight = 720;
    
    rl.initWindow(screenWidth, screenHeight, "ZigGame - Grid Example");
    defer rl.closeWindow();
    
    rl.setTargetFPS(60);
    
    const player = EntityClass.GameObject{ 
        .x = 200,
    };
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const Aalloc = arena.allocator();
    var eList = EntityRender.EntityList.init(Aalloc);



    _ = try eList.AddObject(1, player);

    while (!rl.windowShouldClose()) {
        rl.beginDrawing();
        defer rl.endDrawing();
                
        rl.clearBackground(rl.Color.beige);
        grid.draw2dGrid(screenWidth,screenHeight,50);
        _ = try eList.renderlist();
        rl.drawFPS(10, 10);

    }
}
