const rl = @import("raylib");
pub const Block = struct {
    x: i32 = 0,
    y: i32 = 0,
    width: i32 = 100,
    height: i32 = 100,
    color: rl.Color = rl.Color.violet,
    
    pub fn render(self: *Block) void {
        rl.drawRectangle(self.x, self.y, self.width, self.height, self.color);
    }
};
