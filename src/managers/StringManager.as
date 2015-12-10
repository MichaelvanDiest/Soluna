package managers 
{
	import org.flixel.*;
	
	public class StringManager extends FlxGroup
	{
		
		public function StringManager():void
		{
			
		}
		
		public function cutString(player:Player, string:FlxSprite):void
		{
			if (player.attack)
			{
				if (player.facing == FlxObject.RIGHT) 
				if (string.overlapsPoint(new FlxPoint(player.x + player.width + 8, player.y + player.height / 2))
				|| string.overlapsPoint(new FlxPoint(player.x + player.width, player.y + player.height / 2))
				|| string.overlaps(player))
				if (player.frame == 9)
				{
					string.kill();
				}
				if (player.facing == FlxObject.LEFT) 
				if (string.overlapsPoint(new FlxPoint(player.x - 8, player.y + player.height / 2))
				|| string.overlapsPoint(new FlxPoint(player.x-1, player.height / 2))
				|| string.overlaps(player))
				if (player.frame == 9)
				{
					string.kill();
				}
			}
		}
	}
}