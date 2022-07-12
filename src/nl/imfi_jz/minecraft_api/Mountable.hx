package nl.imfi_jz.minecraft_api;

/** Something that `MountRider`s can ride. **/
interface Mountable {
    function getRider():MountRider;
    /** Ejects any rider that this `Mountable` may have and returns whether they got ejected. **/
    function ejectRider():Bool;
}

/** Can ride `Mountable`s. **/
interface MountRider {
    function mount(mount:Mountable):Bool;
    function dismount():Bool;
    /** Returns the mount this `MountRider` is riding, or null if none. **/
    function getMount():Mountable;
}