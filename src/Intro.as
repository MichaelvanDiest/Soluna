package  
{
	import org.flixel.*;
	
	public class Intro extends FlxState
	{
		private var image:FlxSprite;
		private var overlay:FlxSprite;
		private var text:FlxChatBox;
		private var timer:Number = 0;
		
		public function Intro():void
		{
			
		}
		
		override public function create():void
		{
			FlxG.framerate = 60;
			FlxG.flashFramerate = 60;
			FlxG.flash(0xFF000000, 3);
			
			image = new FlxSprite(0, 0, Sources.ImgField);
			add(image);
			
			overlay = new FlxSprite(0, 0);
			overlay.makeGraphic(FlxG.width, FlxG.height, 0xFF999999);
			overlay.alpha = 0.5;
			add(overlay);
			
			text = new FlxChatBox(FlxG.width, image, [
			"A land cloaked in the light of the Sun Gem.",
			"It seemed that it would last forever. The days of seeing into the vastness of the horizon, unsure and excited of what lay ahead.",
			"Within possibility lies hope. Perhaps though..",
			"These hopes were misplaced..."],
			8, false, true, "center");
			add(text);
		}
		
		override public function update():void
		{
			super.update();
			
			if (timer > 3) if (!text.done) text.chatting = true;
			timer += FlxG.elapsed;
			
			if (text.done) FlxG.fade(0xFF000000, 3, end);
		}
		
		private function end():void
		{
			FlxG.switchState(new Opening);
		}
	}
}