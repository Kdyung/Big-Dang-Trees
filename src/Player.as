package  
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.FlxTimer;
	 
	public class Player extends FlxSprite
	{
		[Embed(source = "../assets/new_hat.png")] public var sanic:Class;
		protected static const RUN_SPEED:int = 300;
		protected static const GRAVITY:int =50;
		protected static const JUMP_SPEED:int = 20;
		protected static const FLY:int = -300;
		
		public var dead:Boolean;
		public var isFlying:Boolean;
		public var timing:FlxTimer;
		
		public function Player(X:int,Y:int):void
		{
			super(X, Y);
			loadGraphic(sanic, false, true);
			drag.x = RUN_SPEED * 8;  
            acceleration.y = GRAVITY;
            maxVelocity.x = RUN_SPEED;
            maxVelocity.y = JUMP_SPEED;
			dead = false;
			
			timing = new FlxTimer();
		}
	
		public override function update():void
        {
            super.update();
            acceleration.x = 0; //Reset to 0 when no button is pushed
			
            if (FlxG.keys.LEFT)
            {
                facing = LEFT; 
                acceleration.x = -drag.x;
            }
            else if (FlxG.keys.RIGHT)
            {
                facing = RIGHT;
                acceleration.x = drag.x;                
            }
			
			if(FlxG.keys.justPressed("UP"))
            {
                velocity.y = -JUMP_SPEED;
            }
			
			// If flying, reverse gravity
			if (isFlying == 1)
			{
				timing.start(2, 1, null);
				acceleration.y = FLY;
			}
			else
			{
				acceleration.y = GRAVITY;
			}
		}
		
		
	}

}