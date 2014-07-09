package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Chris
	 */
	public class Obstacle extends FlxSprite
	{
		public var damage:int = 5;
//		[Embed(source = "../assets/BEE_EFF_EFF.png")] public var ouchie:Class;
//		[Embed(source = "../assets/obstacle_0.png")] public var ouchie:Class;
		[Embed(source = "../assets/obstacleAnimation.png")] public var ouchie:Class;

		public function Obstacle(X:int, Y:int):void 
		{
			super(X, Y);
			loadGraphic(ouchie, true, true, 98, 98, true);
			addAnimation("fly", [0, 1], 4, true);
			play("fly");
//			loadGraphic(ouchie, true, true);
//			this.scale.x = this.scale.y = .25;
		}
		
		override public function update():void
		{
			super.update();
			
		}
		
	}

}