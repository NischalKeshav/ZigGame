const rl = @import("raylib");

pub const Shapes = enum {Rect, Circle};

pub const GameObject= struct {
    posVector: [2]f32= .{0,0},
    width: i32 = 100,
    height: i32 = 100,
    color: rl.Color = rl.Color.violet,
    collisionDetection: bool = true,
    shape: Shapes  = Shapes.Rect,
    useImage: bool = false,
    class: []const u8 = "Basic",
    imageURL: []const u8 = "",
    mass: f32= 1,
    fixedPos: bool = true,
    forceVector: [2]f32= .{0,0},
    velocityVector: [2]f32= .{0,0},
    pub fn x(self:GameObject) f32{
        return self.posVector[0];
    }
    pub fn y(self:GameObject)f32{
        return self.posVector[1];
    }
    pub fn xAsInt(self:GameObject) i32{
        return @intFromFloat(self.posVector[0]);
    }
    pub fn yAsInt(self:GameObject) i32{
        return @intFromFloat(self.posVector[1]);
    }
};
