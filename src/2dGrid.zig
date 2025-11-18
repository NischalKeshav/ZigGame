const rl = @import("raylib");


pub fn draw2dGrid(screenWidth:i32, screenHeight:i32, gridSpacing:i32) void{
        var x: i32 = 0;
        while (x <= screenWidth) : (x += gridSpacing) {
            rl.drawLine(x+25, 0, x+25, screenHeight, rl.Color.light_gray);
        }
        var y: i32 = 0;
        while (y <= screenHeight) : (y += gridSpacing) {
            rl.drawLine(0, y, screenWidth, y, rl.Color.light_gray);
        }
}
