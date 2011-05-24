package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author Florian & Loris
	 */
	public class Hideout extends Entity 
	{
		private var dragging:Boolean;
		
		[Embed(source = '../images/hideouttiles.png')]
		private const tiles:Class;
		
		private var tilemap:Tilemap;
		
		private var twidth:int;
		private var theight:int;
		private var ttype:int;
		private var horizontal:Boolean;
		
		private var offsetX:int;
		private var offsetY:int;
		
		public function Hideout(size:int):void
		{
			
			ttype = size;
			dragging = false;
			switch(size)
			{
				case 2: 
					twidth = 40;
					theight = 80;
					tilemap = new Tilemap(tiles, twidth, theight, 40, 40);
					tilemap.setTile(0, 0, 0);
					tilemap.setTile(0, 1, 3);
					horizontal = false;
					break;
				case 3:
					twidth = 40;
					theight = 120;
					tilemap = new Tilemap(tiles, twidth, theight, 40, 40);
					tilemap.setTile(0, 0, 0);
					tilemap.setTile(0, 1, 18);
					tilemap.setTile(0, 2, 3);
					horizontal = false;
					break;
				case 4:
					twidth = 80;
					theight = 80;
					tilemap = new Tilemap(tiles, twidth, theight, 40, 40);
					tilemap.setTile(0, 0, 4);
					tilemap.setTile(1, 0, 5);
					tilemap.setTile(0, 1, 6);
					tilemap.setTile(1, 1, 7);
					break;
				case 5:
					twidth = 40;
					theight = 200;
					tilemap = new Tilemap(tiles, twidth, theight, 40, 40);
					tilemap.setTile(0, 0, 0);
					tilemap.setTile(0, 1, 8);
					tilemap.setTile(0, 2, 18);
					tilemap.setTile(0, 3, 8);
					tilemap.setTile(0, 4, 3);
					horizontal = false;
					break;
				case 6:
					twidth = 120;
					theight = 80;
					tilemap = new Tilemap(tiles, twidth, theight, 40, 40);
					tilemap.setTile(0, 0, 4);
					tilemap.setTile(1, 0, 8);
					tilemap.setTile(2, 0, 5);
					tilemap.setTile(0, 1, 6);
					tilemap.setTile(1, 1, 9);
					tilemap.setTile(2, 1, 7);
					horizontal = true;
					break;
			}
			
			graphic = tilemap;
		}
	
	
		override public function update():void
		{
			var x2:int = x + twidth;
			var y2:int = y + theight;
			
			var inside:Boolean = false;
			var mousex:int = FP.world.mouseX;
			var mousey:int = FP.world.mouseY;
			
			/*trace("x " + x);
			trace("y " + y);
			trace("mousex " + mousex);
			trace("mousey " + mousey);
			*/
			if (mousex >= x && mousex <= x2 && mousey >= y && mousey <= y2)
			{
				inside = true;
			}	
		
			if(Input.mousePressed && !dragging && inside)
			{
				dragging = true;
			}

			if(dragging && Input.mouseDown)
			{
				x = mousex - offsetX;
				y = mousey - offsetY;
			}

			if(Input.mouseReleased && dragging)
			{
				dragging = false;
				var diffX:int = x % 40;
				var diffY:int = y % 40;
				
				x -= diffX;
				y -= diffY;
				if (diffX > 20)
				{
					x += 40;
				}
				
				if (diffY > 20)
				{
					y += 40;
				}
					 
					
				x = x - (x % 40);
				y = y - (y % 40);
				
				x2 = x + twidth;
				y2 = y + theight;
				
				diffX = x2 - 600;
				diffY = y2 - 600;
				if (diffX > 0)
				{
					x -= diffX;
				}
				if (diffY > 0)
				{
					y -= diffY;
				}
			}
			
			offsetX = mousex - x;
			offsetY = mousey - y;
		}
		
		public function rotate():void
		{
			var temp:int = twidth;
			twidth = theight;
			theight = temp;
			switch(ttype)
			{
				case 2:
					tilemap = new Tilemap(tiles, twidth, theight, 40, 40);
					if (horizontal)
					{
						tilemap.setTile(0, 0, 0);
						tilemap.setTile(0, 1, 3);
						horizontal = false;
					}
					else
					{
						tilemap.setTile(0, 0, 2);
						tilemap.setTile(1, 0, 1);
						horizontal = true;
					}
					graphic = tilemap;
					break;
				case 3:
					tilemap = new Tilemap(tiles, twidth, theight, 40, 40);
					if (horizontal)
					{
						tilemap.setTile(0, 0, 0);
						tilemap.setTile(0, 1, 18);
						tilemap.setTile(0, 2, 3);
						horizontal = false;
					}
					else
					{
						tilemap.setTile(0, 0, 2);
						tilemap.setTile(1, 0, 9);
						tilemap.setTile(2, 0, 1);
						horizontal = true;
					}
					graphic = tilemap;
					break;
				case 4:break;
				case 5:
					tilemap = new Tilemap(tiles, twidth, theight, 40, 40);
					if (horizontal)
					{
						tilemap.setTile(0, 0, 0);
						tilemap.setTile(0, 1, 8);
						tilemap.setTile(0, 2, 18);
						tilemap.setTile(0, 3, 8);
						tilemap.setTile(0, 4, 3);
						horizontal = false;
					}
					else
					{
						tilemap.setTile(0, 0, 2);
						tilemap.setTile(1, 0, 8);
						tilemap.setTile(2, 0, 9);
						tilemap.setTile(3, 0, 8);
						tilemap.setTile(4, 0, 1);
						horizontal = true;
					}
					graphic = tilemap;
					break;
				case 6:
					tilemap = new Tilemap(tiles, twidth, theight, 40, 40);
					if (horizontal)
					{
						tilemap.setTile(0, 0, 4);
						tilemap.setTile(0, 1, 18);
						tilemap.setTile(0, 2, 6);
						tilemap.setTile(1, 0, 5);
						tilemap.setTile(1, 1, 8);
						tilemap.setTile(1, 2, 7);
						horizontal = false;
					}
					else
					{
						tilemap.setTile(0, 0, 4);
						tilemap.setTile(1, 0, 8);
						tilemap.setTile(2, 0, 5);
						tilemap.setTile(0, 1, 6);
						tilemap.setTile(1, 1, 9);
						tilemap.setTile(2, 1, 7);
						horizontal = true;
					}
					graphic = tilemap;
					break;
			}
		}
		
		public function getX():int
		{
			return x;
		}
		
		public function getY():int
		{
			return y;
		}
	}
}