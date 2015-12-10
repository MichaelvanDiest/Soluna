package  
{
	import org.flixel.*;
	
	public class Win extends FlxState
	{
		private var level:BaseLevel;
		private var light:FlxSprite;
		private var altar:AltarSprite;
		private var play:Boolean;
		private var sunGem:SunGem;
		private var timer:Number = 0;
		private var AltarColor:FlxSprite;
		private var flash:FlxSprite;
		private var credits:FlxText;
		
		private var timer2:Number = 0;
		
		public function Win():void
		{
			
		}
		
		override public function create():void
		{
			FlxG.framerate = 60;
			FlxG.flashFramerate = 60;
			FlxG.bgColor = 0xFF2c376f;
			FlxG.flash(0xFF000000, 7);
			FlxG.play(Sources.Mp3ColorGem);
			
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
			
			level = new Level_Altar(true, null);
			
			altar = new AltarSprite(613, 471);
			add(altar);
			
			light = new FlxSprite(616, 0);
			light.makeGraphic(20, 480, 0xFFFFFFFF);
			light.alpha = 0.5;
			add(light);
			
			AltarColor = new FlxSprite(0, 0, Sources.ImgAltarColor);
			AltarColor.scrollFactor.x = AltarColor.scrollFactor.y = 0;
			AltarColor.visible = false;
			add(AltarColor);
			
			sunGem = new SunGem(618, 90);
			add(sunGem);
			
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
			
			flash = new FlxSprite(0, 0);
			flash.makeGraphic(FlxG.width, FlxG.height, 0xFFFFFFFF);
			flash.scrollFactor.x = flash.scrollFactor.y = 0;
			flash.visible = false;
			add(flash);
			
			credits = new FlxText(FlxG.width / 2 - 55, FlxG.height, 110);
			credits.setFormat("NES", 8, 0xFFFFFFFF, "left", 0xFF000000);
			credits.scrollFactor.x = credits.scrollFactor.y = 0;
			credits.text = "Game By:\n\nMichael van Diest\ndiestware.tumblr.com \n\n\n\nSpecial Thanks To:\n\nCrazy_Leen\nHRES\nLeguic\nAGDG \n\n\n\nThanks for playing.";
			add(credits);
			
			FlxG.camera.follow(sunGem, FlxCamera.STYLE_LOCKON);
			FlxG.camera.setBounds(16, 0, level.mainLayer.width-16, level.mainLayer.height-138);
			FlxG.camera.zoom = 4;
		}
		
		override public function update():void
		{
			super.update();
			
			if (FlxG.camera.zoom > 2) FlxG.camera.zoom -= 0.0028;
			
			if (sunGem.y < 450) sunGem.velocity.y = 34;
			else 
			{
				sunGem.velocity.y = 0;
				
				timer += FlxG.elapsed;
				if (timer > 3 && timer < 3.2)
				{
					FlxG.shake(0.005, 2);
				}
				if (timer > 5 && timer < 6)
				{
					flash.visible = true;
					AltarColor.visible = true;
					if (!play)
					{
						FlxG.playMusic(Sources.Mp3Altar);
						FlxG.music.fadeIn(10);
						play = true;
					}
				}
				if (timer > 7)
				{
					flash.alpha -= 0.002;
				}
				if (timer > 17)
				{
					credits.velocity.y = -10;
				}
				if (credits.y - credits.height < -380) 
				{
					FlxG.music.volume -= 0.003;
					FlxG.fade(0xFF000000, 5, end);
				}
			}
			
		}
		
		private function end():void
		{
			FlxG.resetGame();
		}
	}

}