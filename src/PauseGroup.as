package  
{
	import org.flixel.*;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	
	public class PauseGroup extends FlxGroup 
	{
		
		public function PauseGroup():void
		{
			var bg:FlxSprite = new FlxSprite(0, 0);
			bg.makeGraphic(FlxG.width, FlxG.height, 0xFF000000);
			bg.scrollFactor.x = bg.scrollFactor.y = 0;
			bg.alpha = 0.7;
			add(bg);
			
			var paused:FlxText = new FlxText(0, 0, FlxG.width, "PAUSED");
			paused.setFormat("NES", 8, 0xFFFFFFFF, "center");
			paused.scrollFactor.x = paused.scrollFactor.y = 0;
			add(paused);
			
			var diestwareButton:FlxButton = new FlxButton(0, 0, "DIESTWARE", diestWare);
			diestwareButton.makeGraphic(70, 15, 0xFF000000);
			diestwareButton.label.setFormat("NES", 8);
			diestwareButton.labelOffset.y = diestwareButton.labelOffset.y - 4;
			diestwareButton.scrollFactor.x = diestwareButton.scrollFactor.y = 0;
			diestwareButton.x = FlxG.width/2 - diestwareButton.width/2;
			diestwareButton.y = FlxG.height/2 - diestwareButton.height*2;
			add(diestwareButton);
			
			var buttonFullScreen:FlxButton = new FlxButton(0, 0, "FULLSCREEN", toggle_fullscreen);
			buttonFullScreen.makeGraphic(70, 15, 0xFF000000);
			buttonFullScreen.label.setFormat("NES", 8);
			buttonFullScreen.labelOffset.y = buttonFullScreen.labelOffset.y - 4;
			buttonFullScreen.scrollFactor.x = buttonFullScreen.scrollFactor.y = 0;
			buttonFullScreen.x = FlxG.width/2 - buttonFullScreen.width/2;
			buttonFullScreen.y = FlxG.height/2 - buttonFullScreen.height/2;
            add(buttonFullScreen);
		}
		
		override public function update():void
		{
			super.update();
			if (FlxG.paused) 
			{
				FlxG.pauseSounds();
				FlxG.mouse.show();
				FlxG.state.add(this);
			}
			else 
			{
				FlxG.resumeSounds();
				FlxG.mouse.hide();
				FlxG.state.remove(this);
			}
			
			if(FlxG.keys.justPressed("P")) FlxG.paused = !FlxG.paused;
		}
		
		private function diestWare():void
		{
			FlxU.openURL("http://diestware.tumblr.com/");
		}
		
		private function toggle_fullscreen(ForceDisplayState:String=null):void
		{
			if (ForceDisplayState) {
                FlxG.stage.displayState = ForceDisplayState;
            } else {
                if (FlxG.stage.displayState == StageDisplayState.NORMAL) {
                    FlxG.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
                } else {
                    FlxG.stage.displayState = StageDisplayState.NORMAL;
                }
            }
			
			FlxG.stage.scaleMode = StageScaleMode.SHOW_ALL;
			FlxG.stage.align = "";
		}
	}
}