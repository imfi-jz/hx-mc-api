package nl.imfi_jz.minecraft_api;

import nl.imfi_jz.minecraft_api.TypeDefinitions;
import nl.imfi_jz.minecraft_api.GameObject.Player;
import nl.imfi_jz.minecraft_api.GameObject.Block;
import nl.imfi_jz.minecraft_api.Logger.ConsoleLogger;

/** Represents a command which can be executed on demand by players or via other triggers. **/
interface Command extends Named {
    /** Implementation of this command being executed by the game/server console. `arguments` are input given after the command's name, and thus do not include the command's name, separated by spaces. **/
    function executeByConsole(executor:ConsoleLogger, arguments:StandardCollection<String>):Void;
    /** Implementation of this command being executed by a player. `arguments` are input given after the command's name, and thus do not include the command's name, separated by spaces. **/
    function executeByPlayer(executor:Player, arguments:StandardCollection<String>):Void;
    /** Implementation of this command being executed by a block (e.g. command block). `arguments` are input given after the command's name, and thus do not include the command's name, separated by spaces. **/
    function executeByBlock(executor:Block, arguments:StandardCollection<String>):Void;
    /** Implementation of this command being executed by a miscellanious `executor`. This method will be executed when none of the other variations are applicable. `arguments` are input given after the command's name, and thus do not include the command's name, separated by spaces. **/
    function executeByGameObject(executor:GameObject, arguments:StandardCollection<String>):Void;
}