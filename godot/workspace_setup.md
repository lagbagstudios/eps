# C-Sharp Workspace Setup

This document will attempt to guide you through setting up Godot to work as seamlessly as possible with `C#`.

## Initial Setup

Download all of the following:

Tthe Mono version (C# Support) 64-bit (x86_64) of Godot: [Godot Engine - Download | Windows](https://godotengine.org/download)

.NET 7.0: [Download .NET (Linux, macOS, and Windows) (microsoft.com)](https://dotnet.microsoft.com/en-us/download)

Visual Studio Code: [Download Visual Studio Code - Mac, Linux, Windows](https://code.visualstudio.com/Download)

And finally clone/fork this repository: [lagbagstudios/eps (github.com)](https://github.com/lagbagstudios/eps)

## Setting up Godot

There is already a great doc here: [C# basics — Godot Engine (stable) documentation in English](https://docs.godotengine.org/en/stable/tutorials/scripting/c_sharp/c_sharp_basics.html) but I've tried to summarize the exact steps I took below.

1. Download everything in [Initial Setup](#Initial%20Setup)
2. In Godot's **Editor → Editor Settings** menu:
    - Set **Mono** -> **Editor** -> **External Editor** to **Visual Studio Code**.
    - Set **Mono** -> **Builds** -> **Build Tool** to **dotnet CLI**.
3. In Visual Studio Code:
    - Install the [C#](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csharp) extension.
    - Install the [Mono Debug](https://marketplace.visualstudio.com/items?itemName=ms-vscode.mono-debug) extension.
    - Install the [C# Tools for Godot](https://marketplace.visualstudio.com/items?itemName=neikeq.godot-csharp-vscode) extension.
    - Install the [EditorConfig](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig) extension.
4. Leave both VS Code and Godot running
5. Still in Visual Studio Code, type `ctrl+shift+p` to bring up the command pallet
6. Type `C# Godot: Generate Assets for Build and Debug` and when prompted, create build and debug assets.
7. Go to the debug pane, or press `ctrl+shift+d`
8. Select `Launch` from the drop down menu
9. Try running it, if it works you should see a Godot window pop up, and you should be able to see output in the `DEBUG CONSOLE` window in VS Code
10. If it does not work, you may have to remove the trailing `\r` from the `executable` parameters in both `.vscode/tasks.json` and `.vscode/launch.json`. Try again.

## Tweaking VS Code Configs

I've found a few nice-to-haves withing the VS Code settings that make your life a little bit easier when writing C# code.

1. Go to settings, or type `ctrl+,`
2. Click on `Extensions > C# Configuration`
3. Enable the following:
    1. Everything under `Inlay Hints > Types:`
    2. You will definitely want `Omnisharp: Enable Import Competion` to be checked
    3. Change `Omnisharp: Logging Level` to `debug`
