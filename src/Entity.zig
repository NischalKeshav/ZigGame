const rl = @import("raylib");

pub const Shapes = enum {Rect, Circle};

pub const GameObject= struct {
    x: i32 = 0,
    y: i32 = 0,
    width: i32 = 100,
    height: i32 = 100,
    color: rl.Color = rl.Color.violet,
    collisionDetection: bool = true,
    shape: Shapes  = Shapes.Rect,
    useImage: bool = false,
    class: []const u8 = "Basic",
    imageURL: []const u8 = "",
    weight: i32 = 0,
    fixedPos: bool = true,
    forceVector: [2]i32 = .{0,0},
};
