package org.flixel 
{
	
	public class FlxChatBox extends FlxGroup
	{
		public var chatting:Boolean;
		public var done:Boolean;
		
		private var textBG:FlxSprite;
		private var text:FlxText;
		private var changeText:Boolean;
		private var dialogue:Array;
		private var count:int = 0;
		private var target:FlxObject;
		private var button:FlxText;
		private var position:String;
		
		public function FlxChatBox(Width:Number, Target:FlxObject, Dialogue:Array, Size:Number = 8, BG:Boolean = true, Shadow:Boolean = false, Position:String = "none") 
		{
			dialogue = Dialogue;
			target = Target;
			position = Position;
			
			textBG = new FlxSprite(0, 0);
			textBG.visible = false;
			textBG.alpha = 0;
			if (BG) add(textBG);
			
			text = new FlxText(0, 0, Width);
			text.setFormat("NES", Size, 0xFFFFFFFF, "left");
			text.visible = false;
			text.alpha = 0;
			if (Shadow) text.shadow = 0xFF000000;
			add(text);
			
			button = new FlxText(0, 0, 10);
			button.setFormat(null, 8, 0xFFA31919, "left");
			button.visible = false;
			button.text = "A";
			add(button);
		}
		
		override public function update():void
		{
			super.update();
			
			if (chatting)
			{
				chat();
			}
			else 
			{
				textBG.visible = false;
				text.visible = false;
				button.visible = false;
				if (!(Registry.player == null)) if (Registry.player.overlaps(target) && FlxG.keys.justPressed("A")) chatting = true;
				else chatting = false;
			}
		}
		
		private function chat():void
		{
			if (!(Registry.player == null)) Registry.player.freeze = true;
			if (position == "none")
			{
				textBG.x = target.x - textBG.width/2 + target.width/2;
				textBG.y = target.y - textBG.height - 10;
				button.x = textBG.x + textBG.width - button.width + 1;
				button.y = textBG.y + textBG.height - button.height + 2;
			}
			else if (position == "center")
			{
				textBG.x = FlxG.width / 2 - textBG.width / 2;
				textBG.y = FlxG.height / 2 + 30;
				text.scrollFactor.x = text.scrollFactor.y = 0;
				textBG.scrollFactor.x = textBG.scrollFactor.y = 0;
				button .scrollFactor.x = button.scrollFactor.y = 0;
				button.x = FlxG.width - button.width;
				button.y = FlxG.height - button.height;
			}
			
			for (var i:int = 0; i <= dialogue.length; i++)
			{
				if (position == "none") textBG.makeGraphic(text.width + 5, text.height + 10, 0xFF000000);
				if (position == "center") textBG.makeGraphic(FlxG.width - 10, text.height + 10, 0xFF000000);
				if (i < dialogue.length) if (count == i) text.text = dialogue[i];
				else if (count == dialogue.length) 
				{ 
					count = 0; 
					chatting = false; 
					if (!(Registry.player == null)) Registry.player.freeze = false; 
					done = true; 
				}
			}
			
			if (FlxG.keys.justPressed("A")) if (!changeText && text.alpha == 1) { changeText = true; }
			if (changeText)
			{
				textBG.alpha -= 0.06;
				text.alpha -= 0.06;
				button.alpha -= 0.06;
				if (textBG.alpha == 0) { count++; changeText = false; }
			}
			else
			{
				textBG.alpha += 0.06;
				text.alpha += 0.06;
				button.alpha += 0.06;
			}
			text.x = textBG.x+2;
			text.y = textBG.y;
			textBG.visible = true;
			button.visible = true;
			text.visible = true;
		}
		
		public function ChangeChat(Dialogue:Array):void
		{
			dialogue = Dialogue;
		}
	}
}