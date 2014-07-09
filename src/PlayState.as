package
{
    import org.flixel.*;
 
    public class PlayState extends FlxState
    {
		[Embed(source = "/../assets/unBEARable.jpg")] private var ImgBG:Class;
		[Embed(source = "../dame/mapCSV_Group1_Map1.csv", mimeType = "application/octet-stream")] public var levelMap:Class;
		[Embed(source = "../assets/spritesheet.png")] public var levelTiles:Class;
		[Embed(source = "../assets/owl.png")] public var owlpic:Class;
		
		public var map:FlxTilemap = new FlxTilemap;
		
		public var player:Player;
		public var ouch:Obstacle;
		public var lifty:Vent;
		public var lifty2:Vent;
		public var finish:FinishState;
		
		public var owl:FlxSprite;
		
        public function PlayState()
        {
        }
 
        override public function create():void
        {
            add(new FlxSprite);
			var bg:FlxSprite
			bg = new FlxSprite(0, 0, ImgBG);
			
			bg.color = 0xffcc00ff;
			add(bg);
			
			finish = new FinishState();
			
			add(map.loadMap(new levelMap, levelTiles, 64, 64, 0, 0, 1, 2));
			
			add(lifty = new Vent(128, (map.height - (3 * 63))));
			add(lifty2 = new Vent(600, (map.height - (3 * 63))));
			add(ouch = new Obstacle(500, 30));
			
			owl = new FlxSprite(map.width - 80, map.height - (56*4), owlpic);
			add(owl);
			
			add(player = new Player(64, 64));
			
			// make camera follow player
			FlxG.worldBounds = map.getBounds();
			FlxG.camera.follow(player, FlxCamera.STYLE_LOCKON);
			FlxG.camera.setBounds(0, 0, map.width, map.height);
			
            super.create();
        }
		
		override public function update():void 
        {
            super.update();
            if (FlxG.collide(player, map) == true)
			{
				// player loses
				FlxG.switchState(new FinishState);
			}
							
			// set bounds for player
			if (player.x < 0) {
				player.x = 0;
			}
			else if ((player.x + player.width) > map.width) {
				player.x = (map.width - player.width);
			}
			
			if (player.y < 0) {
				player.y = 0;
			}
			
			// If player hits obstacle, do damage to player
			if (FlxG.overlap(player, ouch))
			{
				finish.win = false;
				FlxG.switchState(finish);
//				player.dead = true;
			}

			if(FlxG.overlap(player, lifty) || FlxG.overlap(player, lifty2))
			{
				player.isFlying = true;
			}
			else {
				player.isFlying = false;
			}

			if (FlxG.overlap(player, owl))
			{
				finish.win = true;
				FlxG.switchState(finish);
			}
        }
    }
}