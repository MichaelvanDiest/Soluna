package  
{
	import managers.Enemy;
	import org.flixel.*;
	
	public class Skeleton extends Enemy
	{
		private const RANGE:int = 45 + (FlxG.random() * 100);
		private const ARANGE:int = 14;
		
		private var onLedge:Boolean;
		private var jump:Boolean;
		private var timer:Number = 0;
		private var playerPath:FlxPath;
		private var ledgeTime:Number = 0;
		private var dropChance:Number = 0;
		
		private var healthBar:FlxSprite;
		
		public function Skeleton(X:int, Y:int):void
		{
			super(X, Y);
			loadGraphic(Sources.ImgSkeleton, true, true, 26, 20);
			width = 11;
			centerOffsets();
			height = 16;
			offset.y = 4;
			
			addAnimation("idle", [0, 1], 3);
			addAnimation("walk", [2, 3, 4, 5], 13);
			addAnimation("jump", [6]);
			addAnimation("attack", [7, 8, 8, 8, 9, 10, 10, 10, 10], 13);
			addAnimation("death", [11, 12, 12, 12, 12, 12, 12, 12, 13, 14, 15, 15], 20, false);
			addAnimation("ledge", [16]);
			
			maxVelocity.y = 140;
			acceleration.y = 600;
			maxVelocity.x = 75;
			drag.x = maxVelocity.x * 8;
			
			health = 100;
			playerPath = new FlxPath();
		}
		
		override public function update():void
		{
			super.update();
			
			if (healthBar == null)
			{
				healthBar = new FlxSprite(x, y);
				healthBar.makeGraphic(10, 1, 0xff6B0000);
				FlxG.state.add(healthBar);
			}
			else
			{
				healthBar.x = x;
				healthBar.y = y - 2;
				if (health > 0) healthBar.makeGraphic(health/10, 1, 0xff6B0000);
			}
			
			if (alive) move();
			else if (finished)
			{
				exists = false;
				healthBar.kill();
			}
		}
		
		private function move():void
		{
			acceleration.x = 0;
			
			var target:FlxSprite = Registry.player;
			var dx:Number = (target.x - x);
			var dy:Number = (target.y - y);
			var distance:Number = Math.sqrt(dx * dx + dy * dy);
			
			if (attacking)
			{
				if (finished) attacking = false;
			}
			else if (onLedge) play("ledge");
			else if (jump) play("jump");
			else if (velocity.x == 0) play("idle");
			else if (velocity.x > 0 || velocity.x < 0) play("walk");
			
			if (touching & DOWN)
			{
				onLedge = false;
				jump = false;
				if (touching & WALL) velocity.y = -1200;
			}
			else
			{
				if (!onLedge)
				{
					jump = true;
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
						if (!Registry.map.overlapsPoint(new FlxPoint(x - 1, y)))
						{
							onLedge = false;
						}
					}
					else if (facing == RIGHT)
					{
						if (!Registry.map.overlapsPoint(new FlxPoint(x + width + 1, y)))
						{
							onLedge = false;
						}
					}
				}
			}
			
			if (onLedge)
			{
				stopFollowingPath();
				acceleration.y = 0;
				velocity.y = 0;
				ledgeTime += FlxG.elapsed;
				if (ledgeTime > (0.5 + FlxG.random()))
				{
					velocity.y = -1200;
					ledgeTime = 0;
				}
			}
			else
			{
				acceleration.y = 600;
				
				if (distance < ARANGE && Registry.player.alive == true)
				{
					stopFollowingPath();
					timer += FlxG.elapsed;
					if (timer >= (0.1 + FlxG.random()))
					if (!attacking && !onLedge) { attacking = true; play("attack"); timer = 0; }
				}
			}
			
			if (distance < RANGE && distance > ARANGE)
			{
				playerPath.add(Registry.player.x, Registry.player.y);
				playerPath.nodes.reverse();
				
				if (!hit)
				{
					if (velocity.x > 0) facing = RIGHT;
					else if (velocity.x < 0) facing = LEFT;
					if (!attacking) maxVelocity.x = 85;
					else maxVelocity.x = 60;
					
					if (target.x < x) acceleration.x = -maxVelocity.x * 6;
					if (target.x > x) acceleration.x = maxVelocity.x * 6;
				}
			}
			else stopFollowingPath();
		}
		
		override public function kill():void
		{
			super.kill();
			alive = false;
			exists = true;
			play("death");
			stopFollowingPath();
			maxVelocity.x = 0;
			Registry.effects.addDead(x, y);
			healthBar.kill();
			FlxG.globalSeed = FlxG.random();
			dropChance = FlxG.random();
			if (dropChance > 0.55) FlxG.state.add(new HealthOrb(x + width / 2, y));
			Registry.enemies.count--;
		}
	}
}