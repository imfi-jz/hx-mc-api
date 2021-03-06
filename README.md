# Minecraft API for [Haxe](https://haxe.org/)
This is an API that will allow you to write plugins for Minecraft in Haxe. At this time "plugins" means, a plugin for a **Spigot** server. However in the future this might also include forge/fabric. 

Here are some pros and cons for using this API compared to the official Spigot API:
✅ Pros | ❎ Cons
---|---
Easy to understand and use | New API to learn
All Haxe language features | Limited features
Automatically multi-threaded (plugins will never lag the server) | Requires a loader (included)
Plugin to plugin communication/events | Patches to game updates might be delayed
Conditionally compiled debug logs | 
<!-- More stable API (less breaking updates) | -->

# Installation
Install the haxelib `minecraft-api`. There is no need to clone/download this repository.

# Usage
Plugins written with this API require a special loader to run. Currently there is only a loader for Spigot which can be downloaded from [the Spigot resources page](https://www.spigotmc.org/resources/haxe-plugin-loader.103369/history). 

Before you can start writing code you need a hxml file that contains instructions for Haxe to compile your code. Create for example `build.hxml` and add the following content to it:

```ini (hxml)
-lib minecraft-api

# If your source code is placed in ./src
--class-path src
# The namespace of your project, example: nl.imfi_jz.api_tutorial
your.full.namespace
```

The minimum requirement for a Haxe Minecraft plugin to load is a class that implements the `Gate` interface. 

```haxe
package nl.imfi_jz.api_tutorial;

import nl.imfi_jz.minecraft_api.Gate;

@:keep
class TutorialGate implements Gate {

    public function enable(plugin:Plugin) {
        trace('Hello world!');
    }

    public function disable(plugin:Plugin) {
        trace('Goodbye!');
    }
}
```

I recommend putting your source code in a folder called src, followed by subfolders of your namespace. For example `src/nl/imfi_jz/api_tutorial`.

Now you can compile your code with the command `haxe build.hxml`. Your plugin will appear in the same directory, named HxMcPlugin.jar. Make sure you have the loader jar file in your server's plugin directory. Move your plugin jar file into either the plugins or plugins/HxMcPluginLoader folder. 

The plugins/HxMcPluginLoader folder is recommended because using the plugins folder will cause the server to throw an error because the Haxe plugins do not have a plugin.yml file. The plugin will however load regardless.

![Haxe MC plugin loader destination folder](https://user-images.githubusercontent.com/10811551/176917171-18e00613-75e1-477d-b8db-d2dfe3aaaf9c.png)

![Haxe MC plugin destination folder](https://user-images.githubusercontent.com/10811551/176917130-d3b9fcfa-a205-4fbc-8cd2-1ef531a1561f.png)

Your plugin should now load and do its thing!

For a more in depth tutorial please [watch my introduction video](https://youtu.be/Y3j-8_2JHsI):

[<img src="https://user-images.githubusercontent.com/10811551/178589130-afae30a2-2381-40aa-a237-fec2b4de12b7.png" width="250" border="1">](https://youtu.be/Y3j-8_2JHsI)

# Showcase
## Blueprints
Blueprints is a small plugin I made in Haxe that allows players to craft blueprints. Blueprints are a new item that contain a strucuture that can be place down multiple times at different locations. Below is a [demo video](https://www.twitch.tv/videos/1288999978) (it is a stream highlight, not an actual demonstration, so it is a bit scuffed).

[<img src="https://user-images.githubusercontent.com/10811551/178467976-5876331d-a9ea-4440-a2fc-8818a14a2714.png" width="250" border="1">](https://www.twitch.tv/videos/1288999978)

 I'm planning to make the source code available for reference and learning purposes.

## Machine learning AI

There is also a in progress plugin I am working on to add machine learning to the monster's AI. The source code for that is currently closed but there are some clips of a prototype version on [my Twitch channel](https://twitch.com/jokerzappie). <!-- available but should not be used, modified or distributed. -->

# Contributions
Currently the loader is closed source. However, if you find issues using the API, it does not work as described or if you want to suggest changes/additions to it, feel free to [make an issue](https://github.com/imfi-jz/hx-mc-api/issues/new/choose) or a pull request for it on the repository.

This is my first big public project so advice is welcome.

## Contact / share your work
Feel free to [share things you made using this API](https://github.com/imfi-jz/hx-mc-api/discussions/categories/show-and-tell). Currently I do not have a specific way for you to contact me directly but [check out the discussions](https://github.com/imfi-jz/hx-mc-api/discussions) or try any platform I am on lol.

# License
Apache 2.0 (see LICENSE.txt)
