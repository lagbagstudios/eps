using Godot;
using System;

public class Main : Node2D
{
    Sprite test;
    public override void _Ready()
    {
        test = GetNode<Sprite>("Test");
    }

    public override void _Process(float delta)
    {
        SceneTree tree = GetTree();
        if (delta > 0.0167)
        {
            GD.Print(delta);
            GD.Print(test.Visible);
        }
    }
}
