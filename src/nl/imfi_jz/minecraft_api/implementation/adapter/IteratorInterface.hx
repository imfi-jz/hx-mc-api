package nl.imfi_jz.minecraft_api.implementation.adapter;

@:deprecated
interface IteratorInterface<T> {
    function next():T;
    function hasNext():Bool;
}