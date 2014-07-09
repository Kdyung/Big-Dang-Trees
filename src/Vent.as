package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Chris
	 */
	public class Vent extends FlxSprite
	{
		
		[Embed(source = "../assets/ventwithsteam.png")] public var lifty:Class;
		
		public function Vent(X:int, Y:int) 
		{
			super(X, Y);
			loadGraphic(lifty, false, false);
			
		}
		
		public override function update():void
		{
			super.update();
			
			
		}
	}

}