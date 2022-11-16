using Godot;
using System;

public class Main : Node2D
{
    public override void _Ready()
    {
        Sprite mySprite = GetNode<Sprite>("Test");
        bool test = mySprite.Visible;
        GD.Print(test);
        mySprite.Visible = false;

        GD.Print(mySprite.Visible);
    }

    public override void _Process(float delta)
    {
        if (delta > 0.0167)
        {
            GD.Print(delta);
        }
    }
}
