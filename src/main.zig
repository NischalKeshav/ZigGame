const std = @import("std");
const rl = @import("raylib");
const block = @import("block.zig");
pub fn main() !void {
    const screenWidth = 1280;
    const screenHeight = 720;
    
    rl.initWindow(screenWidth, screenHeight, "ZigGame - Grid Example");
    defer rl.closeWindow();
    
    rl.setTargetFPS(60);
    
    const gridSpacing = 50;
    var b = block.Block{ 
        .x = 200,
    };
    while (!rl.windowShouldClose()) {
        rl.beginDrawing();
        defer rl.endDrawing();
                
        rl.clearBackground(rl.Color.beige);
        
        var x: i32 = 0;
        while (x <= screenWidth) : (x += gridSpacing) {
            rl.drawLine(x+25, 0, x+25, screenHeight, rl.Color.light_gray);

        }
        
        var y: i32 = 0;
        while (y <= screenHeight) : (y += gridSpacing) {
            rl.drawLine(0, y, screenWidth, y, rl.Color.light_gray);
        }

        b.render();
        rl.drawFPS(10, 10);
    }
}
