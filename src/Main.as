package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Zachary Lewis
	 */
	public class Main extends Engine 
	{
		
		public function Main():void 
		{
			super(320, 240, 60, true);
			FP.screen.scale = 2;
		}
		
		override public function init():void 
		{
			FP.world = new RotationWorld();
			super.init();
		}
		
	}
	
}