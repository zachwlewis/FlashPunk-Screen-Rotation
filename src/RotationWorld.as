package  
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.ParticleType;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Zachary Lewis
	 */
	public class RotationWorld extends World
	{
		private var p:Player;
		private var g:Grid;
		private var ge:Entity;
		private var gg:Image;
		
		private var trash:Image;
		
		private var hud:Graphiclist;
		
		private var stageRotation:Number = 0;
		
		public function RotationWorld() 
		{
			
		}
		
		override public function begin():void 
		{			
			p = new Player();
			p.x = 8;
			p.y = 8;
			p.setHitbox(8, 8, 0, 0);
			add(p);
			
			g = new Grid(320, 240, 8, 8);
			
			var t:Text = new Text("LIVES AND SHIT", 2, 2);
			t.color = 0xff0000;
			var tt:Text = new Text("OTHER HUD", 230, 220);
			tt.color = 0xff0000;
			hud = new Graphiclist(t, tt);
			
			g.setRect(0, 0, 40, 30);
			g.setRect(1, 1, 38, 28, false);
			g.setRect(4, 3, 5, 2);
			g.setRect(20, 19, 12, 1);
			
			gg = new Image(g.data);
			
			gg.scale = 8;
			ge = new Entity(0, 0, gg, g);
			add(ge);
			super.begin();
		}
		
		override public function render():void 
		{
			super.render();
			trash = new Image(FP.buffer);
			FP.screen.refresh();
			trash.centerOrigin();
			trash.angle = stageRotation;
			trash.render(FP.buffer, new Point(), FP.camera);
			hud.render(FP.buffer, new Point(), FP.camera);
		}
		
		override public function update():void 
		{
			var mx:int = 0, my:int = 0;
			
			if (Input.check(Key.LEFT)) mx--;
			if (Input.check(Key.RIGHT)) mx++;
			if (Input.check(Key.UP)) my--;
			if (Input.check(Key.DOWN)) my++;
			

			Image(p.graphic).color = 0xffffff;
			if (p.collideWith(ge, p.x + mx * 1.2, p.y))
			{
				Image(p.graphic).color = 0xff0000;
				if (FP.sign(mx) > 0)
				{
					p.x = Math.floor((p.x + mx * 1.2) / 8) * 8;
				}
				else
				{
					p.x = Math.floor(p.x / 8) * 8;
				}
			}
			else 
			{
				p.x += mx * 1.2;	
			}
			
			
			if (p.collideWith(ge, p.x, p.y + my * 1.2))
			{
				Image(p.graphic).color = 0xff0000;
				if (FP.sign(my) > 0)
				{
					p.y = Math.floor((p.y + my * 1.2) / 8) * 8;
				}
				else
				{
					p.y = Math.floor(p.y / 8) * 8;
				}
			}
			else 
			{
				p.y += my * 1.2;	
			}
			
			if (Input.check(Key.Q)) stageRotation--; 
			if (Input.check(Key.E)) stageRotation++;
			if (Input.pressed(Key.SPACE))
			{
				stageRotation = Math.round(stageRotation / 90) * 90;
			}
			
			super.update();
		}
		
	}

}