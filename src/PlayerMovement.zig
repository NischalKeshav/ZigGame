const std = @import("std");
const rl = @import("raylib");
const GameObject= @import("Entity.zig").GameObject;
const Utils= @import("Utils.zig");


pub fn movement(player: *GameObject)void{
    if(rl.isKeyDown(rl.KeyboardKey.right)){
        player.forceVector=.{
            1.5,
            player.forceVector[1]
        };
    }
    if(rl.isKeyUp(rl.KeyboardKey.right) and player.velocityVector[0]>0){
        player.velocityVector = .{0, player.velocityVector[1]};
    }
    if(rl.isKeyDown(rl.KeyboardKey.left)){
        player.forceVector=.{
            -1.5,
            player.forceVector[1]
        };
    }
    if(rl.isKeyUp(rl.KeyboardKey.left) and player.velocityVector[0]<0){
        player.velocityVector = .{0, player.velocityVector[1]};
    }
    if (rl.isKeyPressed(rl.KeyboardKey.space) and player.velocityVector[1]>-25){
        player.forceVector = .{player.forceVector[0], -60};
    }
    player.forceVector = .{
        player.forceVector[0]+Utils.findDrag(player.*)[0],
        player.forceVector[1]+Utils.findDrag(player.*)[1] 
    };
}


