//Code generated with DAME. http://www.dambots.com

package 
{
	import org.flixel.*;
	public class Level_Altar extends BaseLevel
	{
		//Embedded media...
		[Embed(source="org/flixel/data/private/maps/altar/mapCSV_Group1_moon.csv", mimeType="application/octet-stream")] public var CSV_Group1moon:Class;
		[Embed(source="org/flixel/data/private/graphics/mountain.png")] public var Img_Group1moon:Class;
		[Embed(source="org/flixel/data/private/maps/altar/mapCSV_Group1_mountain.csv", mimeType="application/octet-stream")] public var CSV_Group1mountain:Class;
		[Embed(source="org/flixel/data/private/graphics/mountain.png")] public var Img_Group1mountain:Class;
		[Embed(source="org/flixel/data/private/maps/altar/mapCSV_Group1_ground.csv", mimeType="application/octet-stream")] public var CSV_Group1ground:Class;
		[Embed(source="org/flixel/data/private/graphics/tile.png")] public var Img_Group1ground:Class;
		[Embed(source="org/flixel/data/private/maps/altar/mapCSV_Group1_grass.csv", mimeType="application/octet-stream")] public var CSV_Group1grass:Class;
		[Embed(source="org/flixel/data/private/graphics/grass.png")] public var Img_Group1grass:Class;

		//Tilemaps
		public var layerGroup1moon:FlxTilemap;
		public var layerGroup1mountain:FlxTilemap;
		public var layerGroup1ground:FlxTilemap;
		public var layerGroup1grass:FlxTilemap;

		//Sprites
		public var Group1spritesGroup:FlxGroup = new FlxGroup;


		public function Level_Altar(addToStage:Boolean = true, onAddSpritesCallback:Function = null)
		{
			// Generate maps.
			layerGroup1moon = new FlxTilemap;
			layerGroup1moon.loadMap( new CSV_Group1moon, Img_Group1moon, 80,50, FlxTilemap.OFF, 0, 1, 1 );
			layerGroup1moon.x = 0.000000;
			layerGroup1moon.y = 0.000000;
			layerGroup1moon.scrollFactor.x = 0.000000;
			layerGroup1moon.scrollFactor.y = 0.000000;
			layerGroup1mountain = new FlxTilemap;
			layerGroup1mountain.loadMap( new CSV_Group1mountain, Img_Group1mountain, 80,50, FlxTilemap.OFF, 0, 1, 1 );
			layerGroup1mountain.x = 0.000000;
			layerGroup1mountain.y = -20.000000;
			layerGroup1mountain.scrollFactor.x = 0.050000;
			layerGroup1mountain.scrollFactor.y = 0.050000;
			layerGroup1ground = new FlxTilemap;
			layerGroup1ground.loadMap( new CSV_Group1ground, Img_Group1ground, 16,16, FlxTilemap.OFF, 0, 1, 1 );
			layerGroup1ground.x = 0.000000;
			layerGroup1ground.y = 0.000000;
			layerGroup1ground.scrollFactor.x = 1.000000;
			layerGroup1ground.scrollFactor.y = 1.000000;
			layerGroup1grass = new FlxTilemap;
			layerGroup1grass.loadMap( new CSV_Group1grass, Img_Group1grass, 16,16, FlxTilemap.OFF, 0, 1, 1 );
			layerGroup1grass.x = 0.000000;
			layerGroup1grass.y = 0.000000;
			layerGroup1grass.scrollFactor.x = 1.000000;
			layerGroup1grass.scrollFactor.y = 1.000000;

			//Add layers to the master group in correct order.
			masterLayer.add(layerGroup1moon);
			masterLayer.add(layerGroup1mountain);
			masterLayer.add(layerGroup1ground);
			masterLayer.add(layerGroup1grass);
			masterLayer.add(Group1spritesGroup);


			if ( addToStage )
			{
				addSpritesForLayerGroup1sprites(onAddSpritesCallback);
				FlxG.state.add(masterLayer);
			}

			mainLayer = layerGroup1ground;

			boundsMinX = 0;
			boundsMinY = -20;
			boundsMaxX = 1280;
			boundsMaxY = 640;

		}

		override public function addSpritesForLayerGroup1sprites(onAddCallback:Function = null):void
		{
			addSpriteToLayer(Column, Group1spritesGroup , 562.000, 280.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 677.000, 280.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 471.000, 280.000, 0.000, false, 1, 1, onAddCallback );//"Column"
			addSpriteToLayer(Column, Group1spritesGroup , 765.000, 280.000, 0.000, false, 1, 1, onAddCallback );//"Column"
		}


	}
}
