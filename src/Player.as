package
{
	import org.flixel.*;
	
	public class Player extends FlxSprite
	{
		public var freeze:Boolean;
		public var attack:Boolean;
		public var hit:Boolean;
		public var climb:Boolean;
		
		private var stun:Boolean;
		private var stunTimer:Number = 0;
		private var jump:Number;
		private var aF:int = 0;
		private var timer:Number = 0;
		private var onLedge:Boolean;
		private var canJump:Boolean;
		private var walkTimer:Number = 0;
		private var landed:Boolean;
		private var jumpTime:Number = 0;
		private var dead:Boolean;
		
		public function Player(X:int, Y:int):void
		{
			super(X, Y);
			loadGraphic(Sources.ImgPlayer, true, true, 26, 20);
			width = 8;
			centerOffsets();
			height = 16;
			offset.y = 4;
			
			addAnimation("idle", [0, 1], 3);
			addAnimation("walk", [2, 3, 4, 5], 13);
			addAnimation("jump", [6]);
			addAnimation("fall", [7]);
			addAnimation("slash", [8, 9, 10, 11], 12);
			addAnimation("ledge", [12]);
			addAnimation("death", [13, 14, 14, 14, 14, 14, 14, 14, 15, 16, 17], 9, false);
			
			health = 100;
		}
		
		override public function update():void
		{
			super.update();
			if (health > 100) health = 100;
			
			if (alive)
			{
				if (hit)
				{
					timer += FlxG.elapsed;
					if (timer > 0.3) 
					{
						hit = false;
						timer = 0;
					}
				}
				if (!freeze) move();
				else 
				{
					if (touching & DOWN) play("idle");
					else play("jump");
					acceleration.x = 0;
					velocity.y = 75;
				}
			}
			else
			{
				if (!dead) { play("death"); dead = true; }
			}
		}
		
		private function move():void
		{
			acceleration.x = 0;
			drag.x = maxVelocity.x * 6;
			drag.y = maxVelocity.y * 6;
			
			if (stun)
			{
				stunTimer += FlxG.elapsed;
				play("jump");
				if (stunTimer >= 1) { stun = false; stunTimer = 0; }
			}
			else
			{
				var right:Boolean = (FlxG.keys.RIGHT);
				var left:Boolean = (FlxG.keys.LEFT);
				var up:Boolean = (FlxG.keys.UP);
				var down:Boolean = (FlxG.keys.DOWN);
				var jumped:Boolean = (FlxG.keys.justPressed("UP"));
				var S:Boolean = (FlxG.keys.justPressed("S") );
			}
			
			if (touching & DOWN)
			{
				onLedge = false;
				canJump = false;
				climb = false;
				jump = 0;
				if (jumpTime >= 1) { stun = true; FlxG.flash(0xCC000000, 1); } 
				jumpTime = 0;
				if (jumped) { canJump = true; }
				if (!landed) { FlxG.play(Sources.Mp3Step); landed = true; }
				if (!attack)
				{
					if (velocity.x > 0 || velocity.x < 0) 
					{
						play("walk");
						walkTimer += FlxG.elapsed;
						if (walkTimer > 0.3) { FlxG.play(Sources.Mp3Step, 0.8); walkTimer = 0; }
					}
					else if (velocity.x == 0) play("idle");
				}
			}
			else
			{
				landed = false;
				walkTimer = 0;
				if (!attack) 
				{
					if (jumpTime < 0.9) play("jump");
					else play("fall");
				}
				if (onLedge) play("ledge");
				if (climb) play("fall");
				
				if (!onLedge)
				{
					if (velocity.y > 0) { jumpTime += FlxG.elapsed; }
					
					if (facing == LEFT)
					{
						if (Registry.map.overlapsPoint(new FlxPoint(x - 1, y)) 
						&& !Registry.map.overlapsPoint(new FlxPoint(x-1, y-2)))
						{
							onLedge = true;
						}
					}
					else if (facing == RIGHT)
					{
						if (Registry.map.overlapsPoint(new FlxPoint(x + width + 1, y))
						&& !Registry.map.overlapsPoint(new FlxPoint(x+width+1, y-2)))
						{
							onLedge = true;
						}
					}
				}
				else
				{
					if (facing == LEFT)
					{
						if (!Registry.map.overlapsPoint(new FlxPoint(x - 1, y))) onLedge = false;
					}
					else if (facing == RIGHT)
					{
						if (!Registry.map.overlapsPoint(new FlxPoint(x + width + 1, y))) onLedge = false;
					}
				}
			}
			
			if (onLedge)
			{
				acceleration.y = 0;
				velocity.y = 0;
				canJump = false;
				jump = 0;
				jumpTime = 0;
				if (jumped) { canJump = true; }
			}
			else
			{
				
				if (climb)
				{
					maxVelocity.x = 50;
					acceleration.y = 0;
					velocity.y = 0;
					canJump = false;
					jump = 0;
					jumpTime = 0;
					if (jumped) { canJump = true; }
					
					if (up)
					{
						velocity.y = -50;
					}
					else if (down)
					{
						velocity.y = 50;
					}
					if (right)
					{
						facing = RIGHT;
						acceleration.x = maxVelocity.x * 6;
					}
					else if (left)
					{
						facing = LEFT;
						acceleration.x = -maxVelocity.x * 6;
					}
				}
				else
				{
					maxVelocity.x = 115;
					acceleration.y = maxVelocity.y * 9;
					
					if (jumpTime > 0.45) maxVelocity.y = 150;
					else maxVelocity.y = 90; 
					
					if (!attack && !hit && !climb) if (S)
					{ 
						attack = true;
						FlxG.play(Sources.Mp3Swing);
						play("slash");
					}
					if (attack) 
					{
						up = false;
						if (finished) attack = false;
					}
					if (right)
					{
						if (!attack) { facing = RIGHT; acceleration.x = maxVelocity.x * 6; }
						else velocity.x = maxVelocity.x / 2;
					}
					else if (left)
					{
						if (!attack) { facing = LEFT; acceleration.x = -maxVelocity.x * 6; }
						else velocity.x = -maxVelocity.x / 2;
					}
				}
			}
			
			if (canJump)
			{
				if((jump >= 0) && (up))
				{
					jump += FlxG.elapsed;
					if(jump > 0.25) jump = -1;
				}
				else jump = -1;
				if(jump > 0)
				{
					if(jump < 0.065) velocity.y = -180;
					else velocity.y = -maxVelocity.y;
				}
			}
		}
		
		override public function kill():void
		{
			super.kill();
			play("death");
			alive = false;
			exists = true;
			maxVelocity.x = 0;
			health = 0;
		}
	}
}