package  
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Zachary Lewis
	 */
	public class Player extends Entity
	{
		
		public function Player() 
		{
			var bd:BitmapData = new BitmapData(8, 8);
			bd.setPixel(4, 2, 0);
			bd.setPixel(6, 2, 0);
			bd.setPixel(4, 1, 0);
			bd.setPixel(6, 1, 0);
			graphic = new Image(bd);
		}
		
	}

}