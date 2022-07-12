package nl.imfi_jz.minecraft_api;

@:deprecated
interface Asynchronizable {
    function mustExecuteSynchronous():Bool;
    //function getAsynchronousScope():AsynchronousScope;
}

@:deprecated
interface AsynchronousScope { // ?
    function delayToRunSynchronous(func:()->Void):Void;
}