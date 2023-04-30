package nl.imfi_jz.minecraft_api;

import nl.imfi_jz.minecraft_api.Displayable.DisplayableMessageBuilder;
import nl.imfi_jz.minecraft_api.TypeDefinitions;
import nl.imfi_jz.minecraft_api.GameObjectFactory.ConstructingItemFactory;
import nl.imfi_jz.minecraft_api.KeyValueFile.NestableKeyValueFile;
import nl.imfi_jz.minecraft_api.Logger;
import nl.imfi_jz.minecraft_api.Recipe.ShapedRecipe;
import nl.imfi_jz.minecraft_api.Recipe.ShapelessRecipe;

/** Both the entrypoint and exit point of this plugin. Don't forget to add @:keep to your implementation. **/
//@:keepSub
interface Gate {
    /** Called when this plugin gets enabled. Typically when the server starts or gets reloaded. **/
    function enable(plugin:Plugin):Void;
    /** Called when this plugin gets disabled. Typically when the server stops or gets reloaded. **/
    function disable(plugin:Plugin):Void;
}

/** Access to information about the currently running game and tools to add things to it. **/
interface Game {
    /** Gets all loaded worlds in the current game. **/
    function getWorlds():StandardCollection<World>;
    /** Returns a factory to create items that are not directly added to the game. Useful for adding recipes or put items directly in chests/inventories. **/
    function getItemFactory():ConstructingItemFactory;
    /** Returns a builder to create messages to show to individual players for a specific amount of time. **/
    function getDisplayableMessageBuilder():DisplayableMessageBuilder;
    /** The current game's difficulty. **/
    function getDifficulty():Difficulty;
    /**
        Run any command known to the game, including commands registered by plugins.
        
        Returns the console's response, where each console line after execution is a new `String` in the returned collection.
        
        Beware that the console can concurrently output lines that are not related to the executed command. Always check all lines for the content you expect.
        In some cases the command runs asynchronously and the console output is sent after the function returns. We cannot wait for completion of asynchronous functions we don't know about, so to help obtain the correct output, `secondsToWaitForConsole` can be used to specify an amount of seconds to wait after the command is called. All console output during this time will populate the returned collection.
    **/
    function executeCommand(commandName:String, ?arguments:StandardCollection<String>, secondsToWaitForConsole:Float = 0):StandardCollection<String>;
}

/** Represends a game difficulty. **/
enum Difficulty { // Change to int?
    Peaceful; Easy; Normal; Hard; Hardcore; Unknown(level:Int);
}

/** Contains plugin details and provides access to all available data and systems on the server/game. **/
interface Plugin extends Named {
    /**
        Returns a `String` consisting of all capitals used in the plugin's name. This is at some places used as a short identifier for the plugin.

        The plugin's name is based on the class that implements the `Gate` interface. It takes the class name and removes "Gate" from it, were it in the name. This name cannot be changed in another way.
    **/
    function getNameCapitals():String;
    /** The game this plugin is currently running in. **/
    function getGame():Game;

    function getRegisterer():Registerer;
    function getFileSystemManager():FileSystemManager;

    /**
        Returns a `Logger` that has no receivers by default. Receivers, like the console or specific players, can be added or removed at any time. Generally you can use this for everything you want to log.
        
        Development debug logs however, should be logged to the `Debugger`, as those logs are conditionally compiled and will reduce the size of and increase the performance of your production code. The `Debugger` is not a `MessageReceiver` for `inline` to work.
    **/
    function getLoggerHolder():Logger;
    /** Returns a `ConsoleLogger` which will log messages to the console. Unlike the `Logger`, receivers of `ConsoleLogger` cannot be changed. **/
    function getConsoleLogger():ConsoleLogger;

    /** Returns a `Scheduler` for this server/game. **/
    function getScheduler():Scheduler;

    /** Returns the shared memory for Haxe and Spigot plugins on this server/game. **/
    function getSharedPluginMemory():SharedPluginMemory;
    /** Returns a collection of all other non-Haxe (Spigot) plugins loaded in this server/game. The preferred way of plugin-to-plugin communication is through `SharedPluginMemory`. Native Spigot plugins can also access this. **/
    function getOtherLoadedPlugins():StandardCollection<Dynamic>;
    /** Returns a collection of all other Haxe plugins loaded in this server/game. The preferred way of plugin-to-plugin communication is through `SharedPluginMemory`. **/
    function getOtherLoadedHaxePlugins():StandardCollection<Plugin>;
    /** Gets the version of the Haxe Plugin Loader the plugin is currently loaded by, in semantic version format (a0.1 equals to 0.1.0-alpha). **/
    function getLoaderVersion():SemanticVersion;
}

/** Registers actions to specific in-game triggers like events or commands. **/
interface Registerer {
    /**
        Registers `event` to the server/game. When the event identified by `event`'s name occurs, `event.occur` will execute.
        
        Returns whether or not registration was successful.
    **/
    function registerEvent(event:Event):Bool;
    /**
        Unregisters previously registered `event` from the server/game.
        
        Returns whether or not unregistration was successful.
    **/
    function unregisterEvent(event:Event):Bool;
    /**
        Registers `command` to the server/game.

        Returns whether or not registration was successful.
    **/
    function registerCommand(command:Command):Bool;
    /**
        Unregisters previously registered `command` from the server/game.
        
        Returns whether or not unregistration was successful.
    **/
    function unregisterCommand(command:Command):Bool;
    /**
        Registers `shapedRecipe` to the server/game. `shapedRecipe` will now be craftable in-game.

        Returns whether or not registration was successful.
    **/
    function registerShapedRecipe(shapedRecipe:ShapedRecipe):Bool;
    /**
        Registers `shapelessRecipe` to the server/game. `shapelessRecipe` will now be craftable in-game.

        Returns whether or not registration was successful.
    **/
    function registerShapelessRecipe(shapelessRecipe:ShapelessRecipe):Bool;

    /** Returns a collection events currently registered to this server/game by the owning plugin. **/
    function getRegisteredEvents():StandardCollection<Event>;
    /** Returns a collection commands currently registered to this server/game by the owning plugin. **/
    function getRegisteredCommands():StandardCollection<Command>;
}

/** An interface for file system related features. **/
interface FileSystemManager {
    /** Returns an array containing each step to the file path the owning plugin should store extra files into. The returned array represents the file path where every `String` is a folder name, omitting path separator characters altogether. **/
    function getDataFolderPath(?subfolders:StandardCollection<String>):Array<String>;
    /** Returns the host system's file path separator character. **/
    function getPathSeparator():String;
    /** Returns the host system's newline character. **/
    function getLineSeparator():String;
    /**
        Returns access to a YML file which will be saved as `name`.yml in the "data folder" (obtained via `getDataFolderPath`) and optionally any `subfolders`. `headerComment` is an optional comment that will be placed at the first line of the file. `autoSaves` determines whether the file should automatically save after a value has been set.
    
        Note that `subfolders` is an Array containing each subfolder name as a separate `String`, omitting the need to use path saparator characters.
    **/
    function getYmlFile(name:String, ?subfolders:Array<String>, ?headerComment:String, autoSaves:Bool = true):NestableKeyValueFile<Any>;
    #if(IniFiction)
    /**
        Returns access to an INI file which will be saved as `name`.ini in the "data folder" (obtained via `getDataFolderPath`) and optionally any `subfolders`. `headerComment` is an optional comment that will be placed at the first line of the file. `autoSaves` determines whether the file should automatically save after a value has been set.
    
        Note that `subfolders` is an Array containing each subfolder name as a separate `String`, omitting the need to use path saparator characters.
    **/
    function getIniFile(name:String, ?subfolders:Array<String>, ?headerComment:String, autoSaves:Bool = true):KeyValueFile<String>;
    #end
}

/** An interface to schedule functions (or tasks) to execute later. **/
interface Scheduler {
    /**
        Execute function `fun` as soon as possible without blocking anything else. Essentially on a different thread.

        Except for very specific cases, this should never be neccessary, as each code trigger (event, command, etc.) is automatically ran on a different thread.
    **/
    function executeInParallel(fun:()->Void):Void;
    /* Execute a loop with primitive `Int`s and `Float`s on the GPU. Access the result back on the CPU in `result`. This requires OpenCL to be installed on the system, otherwise it will run on CPU anyway. */
    // aparapi does not seem to support my GPUs (AMD 6800 and Intel UHD 630) stating the new instructions are not supported
    /* function executeIterationInParallelOnGpu(
        iterations:Int,
        ?integers:Vector<Vector<Int>>,
        ?floats:Vector<Vector<Float>>,
        onGpu:(iteration:Int)->Void,
        ?withResultOnCpu:()->Void
    ):Void; */
    /** Execute function `fun` as soon as possible potentially slowing down the server. Essentially on the main/server thread. **/
    function executeSequentially(fun:()->Void):Void;
    /** Executes function `fun` after set `seconds`. This will respect the context it is fired from meaning not block the main/server thread and not blocking the current (scheduling) function. **/
    function executeAfterSeconds(seconds:Float, fun:()->Void):Void;
}

/** A key value map that is shared across all plugins on the server/game. **/
interface SharedMemory<T> {
    /** Gets the value set at `key` or null if none was set. **/
    function getValue(key:String):Null<T>;
    /**
        Sets the value at `key` to `value`. Using null as `value` removes the key.

        It is highly recommended that when you set a value to an unused key, you document what other plugins can and should not do with it.
    **/
    function setValue(key:String, value:Null<T>):Void;

    /**
        Determine what this plugin will do when the value at `key` has been set by any plugin. This overwrites previously set `callback`, if any.
        
        Leaving `callback` at null will remove the "registration" and this plugin will do nothing when the value changes.
    **/
    function valueChanged(key:String, ?callback:(previousValue:Null<T>, newValue:Null<T>)->Void):Void;
}

/** Intended to be used for plugin to plugin communication. Values stored in here are available for all other Haxe plugins loaded on the server/game. Keep security and accesiblily in mind when using. Aside from sharing values, this system can be used for plugins to create custom events for other plugins, since plugins can subscribe to value changes. **/
interface SharedPluginMemory {
    function getStringMemory():SharedMemory<String>;
    function getFloatMemory():SharedMemory<Float>;
    function getBoolMemory():SharedMemory<Bool>;
    function getObjectMemory():SharedMemory<Dynamic>;
}
/* 
interface SharedMemory<SetT, GetT> {
    function getValue(key:String):Null<GetT>;
    function setValue(key:String, value:Null<SetT>):Void;

    function valueChanged(key:String, ?callback:(previousValue:Null<GetT>, newValue:Null<GetT>)->Void):Void;
}

interface SharedPluginMemory {
    function getStringMemory():SharedMemory<String, String>;
    function getFloatMemory():SharedMemory<Float, Float>;
    function getBoolMemory():SharedMemory<Bool, Bool>;
    function getObjectMemory():SharedMemory<Any, Dynamic>;
} */