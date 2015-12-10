package managers 
{
	import org.flixel.*;
	
	public class EnemyManager extends FlxGroup
	{
		public var count:int = 0;
		
		public function EnemyManager():void
		{
			
		}
		
		public function hitEnemy(player:Player, enemy:Enemy):void
		{
			if (enemy.alive)
			{
				if (player.attack)
				{
					if (player.facing == FlxObject.RIGHT) 
					if (enemy.overlapsPoint(new FlxPoint(player.x + player.width + 8, player.y + player.height / 2))
					|| enemy.overlapsPoint(new FlxPoint(player.x + player.width, player.y + player.height / 2)))
					if (player.frame == 10)
					{
						enemy.hit = true;
						Registry.effects.addDamagePoints(enemy.x, enemy.y, 25, false);
						enemy.velocity.x = enemy.maxVelocity.x * 6;
						enemy.hurt(25);
						FlxG.play(Sources.Mp3SkeletonHurt, 0.6);
					}
					if (player.facing == FlxObject.LEFT) 
					if (enemy.overlapsPoint(new FlxPoint(player.x - 8, player.y + player.height / 2))
					|| enemy.overlapsPoint(new FlxPoint(player.x-1, player.height / 2))
					|| enemy.overlaps(player))
					if (player.frame == 10)
					{
						enemy.hit = true;
						Registry.effects.addDamagePoints(enemy.x, enemy.y, 25, false);
						enemy.velocity.x = -enemy.maxVelocity.x * 6;
						enemy.hurt(25);
						FlxG.play(Sources.Mp3SkeletonHurt, 0.6);
					}
				}
			}
		}
		
		public function isEnemyHit(player:Player, enemy:Enemy):Boolean
		{
			if (!(enemy == null))
			if (!enemy.hit) return true;
			else return false;
			else return false;
		}
		
		public function hitPlayer(player:Player, enemy:Enemy):void
		{
			if (!(enemy == null))
			if (enemy.attacking)
			{
				if (enemy.facing == FlxObject.RIGHT)
				if (player.overlapsPoint(new FlxPoint(enemy.x + enemy.width + 8, enemy.y + enemy.height / 2))
				|| player.overlapsPoint(new FlxPoint(enemy.x + enemy.width, enemy.y + enemy.height / 2))
				|| enemy.overlaps(player))
				if (enemy.frame == 9)
				{
					player.hit = true;
					Registry.effects.addDamagePoints(player.x, player.y, 15, true);
					player.velocity.x = 80;
					player.hurt(15);
					FlxG.play(Sources.Mp3Hurt, 0.9);
				}
				if (enemy.facing == FlxObject.LEFT)
				if (player.overlapsPoint(new FlxPoint(enemy.x - 8, enemy.y + enemy.height / 2))
				|| player.overlapsPoint(new FlxPoint(enemy.x - 1, enemy.y + enemy.height / 2))
				|| enemy.overlaps(player))
				if (enemy.frame == 9)
				{
					player.hit = true;
					Registry.effects.addDamagePoints(player.x, player.y, 15, true);
					player.velocity.x = -80;
					player.hurt(15);
					FlxG.play(Sources.Mp3Hurt, 0.9);
				}
			}
		}
		
		public function isPlayerHit(player:Player, enemy:Enemy):Boolean
		{
			if (!player.hit) return true;
			else return false;
		}
	}
}