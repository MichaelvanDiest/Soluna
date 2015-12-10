package  
{
	import org.flixel.*;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	
	public class TitleScreen extends FlxState
	{
		private var level:BaseLevel;
		private var logo:FlxSprite;
		private var light:FlxSprite;
		private var altar:AltarSprite;
		private var play:Boolean;
		private var timer:Number = 0;
		
		private var playButton:FlxButton;
		private var buttonFullScreen:FlxButton;
		private var diestwareButton:FlxButton;
		
		public function TitleScreen():void
		{
			
		}
		
		override public function create():void
		{
			FlxG.flash(0xFF000000, 1);
			FlxG.framerate = 60;
			FlxG.flashFramerate = 60;
			FlxG.bgColor = 0xFF2c376f;
			
			FlxG.playMusic(Sources.Mp3West);
			FlxG.music.fadeIn(0);
			
			var emitter:FlxEmitter = new FlxEmitter(0,0, 130);
			emitter.width = 384;
			emitter.height = 80;
			emitter.setXSpeed(0, 0);
			emitter.setYSpeed(0, 0);
			emitter.start(true, 0, 0.05);
			add(emitter);
			for(var i:int = 0; i < emitter.maxSize; i++)
			{
				var particle:FlxParticle = new FlxParticle();
				particle.scrollFactor.x = particle.scrollFactor.y = 0;
				particle.makeGraphic(1, 1, 0xFFFFFFF);
				particle.alpha = 0.35;
				particle.exists = false;
				emitter.add(particle);
				particle = new FlxParticle();
				particle.scrollFactor.x = particle.scrollFactor.y = 0;
				particle.makeGraphic(2, 2, 0xFFFFFFFF);
				particle.alpha = 0.2;
				particle.exists = false;
				emitter.add(particle);
			}
			
			level = new Level_Altar(true);
			
			var emitter2:FlxEmitter = new FlxEmitter(535, 475, 500);
			emitter2.width = 200;
			emitter2.height = 5;
			emitter2.setXSpeed(-10, 10);
			emitter2.setYSpeed(-20, -10);
			emitter2.start(false, 3, 0.1);
			add(emitter2);
			for(var k:int = 0; k < emitter2.maxSize; k++)
			{
				particle = new FlxParticle();
				particle.makeGraphic(1, 1, 0xFFFFFFF);
				particle.alpha = 0.4;
				particle.exists = false;
				emitter2.add(particle);
				particle = new FlxParticle();
				particle.makeGraphic(2, 2, 0xFFFFFFFF);
				particle.alpha = 0.2;
				particle.exists = false;
				emitter2.add(particle);
			}
			
			altar = new AltarSprite(613, 471);
			add(altar);
			
			light = new FlxSprite(616, 0);
			light.makeGraphic(20, 480, 0xFFFFFFFF);
			light.alpha = 0.5;
			add(light);
			
			logo = new FlxSprite(0, 0, Sources.ImgLogo);
			logo.scrollFactor.x = logo.scrollFactor.y = 0;
			logo.x = FlxG.width / 2 - logo.width / 2;
			logo.y = FlxG.height / 2 - logo.height / 2;
			logo.alpha = 0;
			add(logo);
			
			var text2:FlxText = new FlxText(0, 0, FlxG.width, "Game by Michael van Diest.");
			text2.setFormat("NES", 8, 0xFFFFFFFF, "center");
			text2.scrollFactor.x = text2.scrollFactor.y = 0;
			text2.x = 2;
			text2.y = FlxG.height - text2.height - 2;
			//add(text2);
			
			var text3:FlxText = new FlxText(0, 0, FlxG.width, "diestware.tumblr.com");
			text3.setFormat("NES", 8, 0xFFFFFFFF, "center");
			text3.scrollFactor.x = text3.scrollFactor.y = 0;
			text3.y = FlxG.height - text2.height - 2;
			add(text3);
			
			playButton = new FlxButton(0, 0, "[A] PLAY", EndLevel);
			playButton.makeGraphic(130, 15, 0x00000000);
			playButton.label.setFormat("NES", 8, 0xFFFFFFFF, "center", 0xFF000000);
			playButton.labelOffset.y = playButton.labelOffset.y - 4;
			playButton.scrollFactor.x = playButton.scrollFactor.y = 0;
			playButton.x = FlxG.width/2 - playButton.width/2;
			playButton.y = FlxG.height / 2 + 30;
			playButton.visible = false;
			add(playButton);
			
			buttonFullScreen = new FlxButton(0, 0, "FULLSCREEN", toggle_fullscreen);
			buttonFullScreen.makeGraphic(70, 15, 0x00000000);
			buttonFullScreen.label.setFormat("NES", 8, 0xFFFFFFFF, "center", 0xFF000000);
			buttonFullScreen.labelOffset.y = buttonFullScreen.labelOffset.y - 4;
			buttonFullScreen.scrollFactor.x = buttonFullScreen.scrollFactor.y = 0;
			buttonFullScreen.x = FlxG.width/2 - buttonFullScreen.width/2;
			buttonFullScreen.y = FlxG.height / 2 + 45;
			buttonFullScreen.visible = false;
            add(buttonFullScreen);
			
			diestwareButton = new FlxButton(0, 0, "DIESTWARE", diestWare);
			diestwareButton.makeGraphic(150, 15, 0x00000000);
			diestwareButton.label.setFormat("NES", 8, 0xFFFFFFFF, "center", 0xFF000000);
			diestwareButton.labelOffset.y = diestwareButton.labelOffset.y - 4;
			diestwareButton.scrollFactor.x = diestwareButton.scrollFactor.y = 0;
			diestwareButton.x = FlxG.width/2 - diestwareButton.width/2;
			diestwareButton.y = FlxG.height / 2 + 60;
			diestwareButton.visible = false;
			add(diestwareButton);
			
			var agdg:FlxSprite = new FlxSprite(FlxG.width - 35, FlxG.height - 60, Sources.ImgAGDG);
			agdg.scrollFactor.x = agdg.scrollFactor.y = 0;
			add(agdg);
			
			FlxG.mouse.show();
			FlxG.camera.focusOn(new FlxPoint(altar.x + altar.width / 2 - 2, altar.y - 80)); 
			FlxG.camera.setBounds(16, 0, level.mainLayer.width-16, level.mainLayer.height);
			FlxG.worldBounds.make(0, 0, level.mainLayer.width, level.mainLayer.height);
		}
		
		override public function update():void
		{
			super.update();
			if (FlxG.keys.justPressed("A")) EndLevel();
			
			timer += FlxG.elapsed;
			if (timer > 1) logo.alpha += 0.005;
			if (timer > 3) 
			{
				playButton.visible = true;
				buttonFullScreen.visible = true;
				diestwareButton.visible = true;
			}
		}
		
		private function EndLevel():void
		{
			FlxG.fade(0xff000000, 1, end);
			FlxG.music.fadeOut(1);
			FlxG.mouse.hide();
		}
		
		private function end():void
		{
			FlxG.switchState(new Intro);
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