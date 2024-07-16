using Raylib;
using System;
using System.Collections;

namespace BeefProject
{
	class Program : RaylibApp
	{
		public static void Main()
		{
			Self app = scope .();

	 		app.title = scope .("Raylib Beef Example");
			app.width = 800;
			app.height = 600;
			app.config = .FLAG_VSYNC_HINT;
			app.Run();
		}

		public override void Draw()
		{
			ClearBackground(.(52, 52, 52, 255));

			let text = "Hello from Beef! Hope you have a good day!";
			DrawText(text, 100, 100, 20, .RAYWHITE);
		}
	}
}
