package  
{
	import org.flixel.*;
	import managers.*;
	
	public class Altar extends FlxState
	{
		private var level:BaseLevel;
		private var light:FlxSprite;
		private var altar:AltarSprite;
		private var altarChat:FlxChatBox;
		private var altarWait:Number = 0;
		private var play:Boolean;
		
		public function Altar():void
		{
			
		}
		
		protected function onSpriteAddedCallback(sprite:FlxSprite, group:FlxGroup):void
		{
			
		}
		
		override public function create():void
		{
			FlxG.framerate = 60;
			FlxG.flashFramerate = 60;
			FlxG.bgColor = 0xFF2c376f;
			
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
			
			level = new Level_Altar(true, onSpriteAddedCallback);
			
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
			
			if (Registry.lastlevel == 0)
			{
				FlxG.flash(0);
				Registry.player = new Player(623, 0);
				Registry.player.freeze = true;
			}
			else if (Registry.lastlevel == 1)
			{
				Registry.player = new Player(45, 525);
			}
			else if (Registry.lastlevel == 2)
			{
				Registry.player = new Player(1250, 525);
				Registry.player.facing = FlxObject.LEFT;
			}
			add(Registry.player);
			
			light = new FlxSprite(616, 0);
			light.makeGraphic(20, 480, 0xFFFFFFFF);
			light.alpha = 0.5;
			add(light);
			
			if (Registry.SunGemPieces < 1)
			{
				altarChat = new FlxChatBox(FlxG.width, altar, [
				"Warrior...",
				"I see what fate has befallen us. The sacred gem has been destroyed.",
				"We call upon you to save us and save yourself.",
				"Seek the west and find your fate. Seek the east and find your legacy.",
				"Will you recover the balance of the shards or do you choose to let all fall into darkness?",
				"It is you who must decide, and us who must accept the fate."],
				8, false, false, "center");
			}
			else if (Registry.SunGemPieces == 1)
			{
				altarChat = new FlxChatBox(FlxG.width, altar, [
				"Warrior please continue and find the second piece."],
				8, false, false, "center");
			}
			else if (Registry.SunGemPieces > 1)
			{
				altarChat = new FlxChatBox(FlxG.width, altar, [
				"The night grows dark traveller. Perhaps it is the beginning of the end. Maybe though, it is the deep gloaming before the dawn.",
				"Your journey traveller, is why the dawn may come. There is no darkness without some light, it is not the opposite, it is an absense.",
				"Become a source of hope for this land, and shine the night back into mere shadow!"],
				8, false, false, "center");
			}
			add(altarChat);
			
			Registry.healthBar = new HealthBar();
			add(Registry.healthBar);
			
			Registry.effects = new EffectsManager();
			add(Registry.effects);
			
			Registry.map = level.mainLayer;
			FlxG.camera.follow(Registry.player, FlxCamera.STYLE_LOCKON);
			FlxG.camera.setBounds(16, 0, level.mainLayer.width-16, level.mainLayer.height);
			FlxG.worldBounds.make(0, 0, level.mainLayer.width, level.mainLayer.height);
		}
		
		override public function update():void
		{
			if (!FlxG.paused) super.update();
			Registry.pauseGroup.update();
			
			if (!play)
			{
				FlxG.playMusic(Sources.Mp3Altar);
				FlxG.music.fadeIn(3);
				play = true;
			}
			
			if (Registry.SunGemPieces > 1)
			if (altarChat.done) { FlxG.fade(0xFF000000, 3, end); FlxG.music.volume -= 0.005 }
			
			if (Registry.player.x < 14) FlxG.switchState(new West);
			if (Registry.player.x > 1270) FlxG.switchState(new East);
			
			if (Registry.lastlevel == 0 && !altarChat.done) FlxG.overlap(Registry.player, altar, chat);
			FlxG.collide(Registry.player, level.mainLayer);
		}
		
		private function chat(player:Player, altar:FlxSprite):void
		{
			altarWait += FlxG.elapsed;
			if (altarWait > 0.5) altarChat.chatting = true;
		}
		
		private function end():void
		{
			FlxG.music.stop();
			FlxG.switchState(new BossFight);
		}
	}
}