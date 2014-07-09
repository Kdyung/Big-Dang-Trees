package
{
    import org.flixel.*;
 
    public class MenuState extends FlxState
    {
        private var startButton:FlxButton;
		[Embed(source = "../assets/Title.png")] private var background:Class;
		
        public function MenuState()
        {
        }
 
        override public function create():void
        {
            FlxG.mouse.show();
			
			var bg:FlxSprite
			bg = new FlxSprite(0, 0, background);
			add(bg);
			
            startButton = new FlxButton(500, 300, "Start Game", startGame);
			startButton.fill(0xffffcc33);
            add(startButton);
        }
 
        private function startGame():void
        {
            FlxG.mouse.hide();
            FlxG.switchState(new PlayState);
        }
    }
}