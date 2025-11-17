const std = @import("std");
const rl = @import("raylib");
const block = @import("block.zig");
const grid = @import("2dGrid.zig");

pub fn main() !void {
    const screenWidth = 1280;
    const screenHeight = 720;
    
    rl.initWindow(screenWidth, screenHeight, "ZigGame - Grid Example");
    defer rl.closeWindow();
    
    rl.setTargetFPS(60);
    
    var b = block.Block{ 
        .x = 200,
    };
    while (!rl.windowShouldClose()) {
        rl.beginDrawing();
        defer rl.endDrawing();
                
        rl.clearBackground(rl.Color.beige);
        grid.draw2dGrid(screenWidth,screenHeight,50);        

        b.render();
        rl.drawFPS(10, 10);
    }
}
