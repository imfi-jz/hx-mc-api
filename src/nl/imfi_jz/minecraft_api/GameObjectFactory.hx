package nl.imfi_jz.minecraft_api;

import nl.imfi_jz.minecraft_api.GameObject.Encounter;
import nl.imfi_jz.minecraft_api.GameObject.Item;

/** Base `GameObject` factory. **/
interface GameObjectFactory {
    /** Creates and returns a standard `GameObject` based on a given `name`. `name` is case insensitive and can match partially. **/
    function createGameObject(name:String):GameObject;
}


/** `GameObject` factory that creates `GameObject`s which are not directly added into the game. **/
interface ConstructingGameObjectFactory extends GameObjectFactory {
}

/** `Item` factory that creates `Item`s which are not directly added into the game. **/
interface ConstructingItemFactory extends ConstructingGameObjectFactory {
    /** Create a standard `GameObject` based on a given `name`. `name` is case insensitive and can match partially. **/
    function createGameObject(name:String):Item;
}

/** `GameObject` factory that creates `GameObject`s which are directly spawned at a location in a world. **/
interface SpawningGameObjectFactory extends GameObjectFactory {
    /** Spawns and returns a standard `GameObject` based on a given `name` at given `coordinates`. `name` is case insensitive and can match partially. **/
    function spawnGameObject(name:String, coordinates:ThreeDimensional):GameObject;
}

/** `Item` factory that creates `Item`s which are directly spawned at a location in a world. **/
interface SpawningItemFactory extends SpawningGameObjectFactory {
    /** Spawns and returns a standard `Item` based on a given `name` at given `coordinates`. `name` is case insensitive and can match partially. **/
    function spawnGameObject(name:String, coordinates:ThreeDimensional):Item;
}

/** `Encounter` factory that creates `Encounter`s which are directly spawned at a location in a world. **/
interface SpawningEncounterFactory extends SpawningGameObjectFactory {
    /** Spawns and returns a standard `Encounter` based on a given `name` at given `coordinates`. `name` is case insensitive and can match partially. **/
    function spawnGameObject(name:String, coordinates:ThreeDimensional):Encounter;
}