const std = @import("std");
const rl = @import("raylib");
const EntityClass = @import("Entity.zig");
const grid = @import("2dGrid.zig");
const EntityRender = @import("RenderEntity.zig");
const PhysicsSystem = @import("PhysicsSystem.zig");
const MovePlayerSystem = @import("PlayerMovement.zig");

pub fn main() !void {
    const screenWidth = 1280;
    const screenHeight = 720;
    
    rl.initWindow(screenWidth, screenHeight, "ZigGame - Grid Example");
    defer rl.closeWindow();
    
    rl.setTargetFPS(60);
    
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const Aalloc = arena.allocator();
    var eList : EntityRender.EntityList = EntityRender.EntityList.init(Aalloc);

    var player = EntityClass.GameObject{ 
        .posVector = .{100,200},
        .fixedPos = false
    };
    const block = EntityClass.GameObject{
        .posVector = .{200, 500},
        .height = 30,
        .width = 200,
        .fixedPos = true
    };
    _ = try eList.AddObject(0, player);
    _ = try eList.AddObject(1, block);

    while (!rl.windowShouldClose()) {
        rl.beginDrawing();
        defer rl.endDrawing();
        MovePlayerSystem.movement(&player); 
        
        rl.clearBackground(rl.Color.beige);
        //grid.draw2dGrid(screenWidth,screenHeight,50);
        
        PhysicsSystem.physicsSim(&eList);
        //MovePlayerSystem.movement(&eList.map.values()[0]); 
        std.debug.print("playerxspeed:{}",.{eList.map.get(0).?.posVector[1]});


        _ = try eList.renderlist();
        rl.drawFPS(10, 10);
    }
}
