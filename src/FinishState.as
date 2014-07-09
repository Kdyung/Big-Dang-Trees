package  
{
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;

	public class FinishState extends FlxState
	{
		[Embed(source = "../assets/Finish.png")] private var background:Class;
		private var restartButton:FlxButton;
		private var endgameText:FlxText;
		
		public var win:Boolean;

		public function FinishState() 
		{
			
		}
		
		override public function create():void
        {
            FlxG.mouse.show();
			
			var bg:FlxSprite
			bg = new FlxSprite(0, 0, background);
			add(bg);
			
			if (win)
			{
				endgameText = new FlxText(280, 150, 300, "YOU WIN");
				restartButton = new FlxButton(300, 200, "Restart", startGame);
			}
			else
			{
				endgameText = new FlxText(280, 150, 300, "Game Over");
				restartButton = new FlxButton(300, 200, "Try Again?", startGame);
			}
			
			restartButton.fill(0xffffcc33);
			endgameText.size = 20;
			add(endgameText);
            add(restartButton);
        }
		
		private function startGame():void
        {
            FlxG.mouse.hide();
            FlxG.switchState(new PlayState);
        }
		
	}

}