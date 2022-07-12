package nl.imfi_jz.minecraft_api.implementation;

import haxe.ds.ReadOnlyArray;

@:deprecated
class NestedKey {
    private final key:String;
    private final next:Array<NestedKey>;

    public function new(key:String, next:Array<NestedKey>) {
        this.key = key == null ? "" : key;
        this.next = next == null ? [] : next;
    }

    public function getKey():String {
        return key;
    }

    public function getNext():ReadOnlyArray<NestedKey> {
        return next;
    }
}