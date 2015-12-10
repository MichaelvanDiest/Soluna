package  
{
    //import com.newgrounds.*;
    //import com.newgrounds.components.*;
    import flash.display.MovieClip;
	import org.flixel.system.*;

    public class Preloader extends FlxPreloader
    {
		//CHANGE THESE:
		private const id:String = "38499:EkV4ZFvb";
		private const key:String = "kmujPjWG4cctDw6qetJdvcN9VCwJOOg0"; //KEEP THIS SECRET!
		
        public function Preloader():void
        {
			className = "Game";
			super();
            /*var apiConnector:APIConnector = new APIConnector();
            apiConnector.className = "Main";
            apiConnector.apiId = id;
            apiConnector.encryptionKey = key;
            addChild(apiConnector);
			
            if(stage)
            {
                apiConnector.x = (stage.stageWidth - apiConnector.width) / 2;
                apiConnector.y = (stage.stageHeight - apiConnector.height) / 2;
            }*/
			
			//information on API-integration: 
			//http://www.newgrounds.com/wiki/creator-resources/flash-api/getting-started-with-the-api/flixel
        }    
    }
}