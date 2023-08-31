namespace SceneGraph;

class Sprite : Node
{
	void* texture;
	void* frame;

	public override void Draw()
	{
		// graphics.DrawTexture(texture, frame, position, rotation, scale);
	}
}