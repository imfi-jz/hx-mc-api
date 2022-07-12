package nl.imfi_jz.minecraft_api;

import nl.imfi_jz.minecraft_api.GameObject.Player;

/** Something that can be displayed to a player. **/
interface Displayable {
    /** Displays to `viewer`. Returns whether the `viewer` successfully got it displayed. **/
    function displayToPlayer(viewer:Player):Bool;
}

/** A text message that can be displayed to a player. **/
interface DisplayableMessage extends Displayable {
    function getMessage():String;
    /** Gets the time this message will take to fade in upon display. Time is in seconds. **/
    function getFadeInTimeInSeconds():Float;
    /** Gets the time this message will take to fade out after its "visible time" has passed. Time is in seconds. **/
    function getFadeOutTimeInSeconds():Float;
    /** Gets the time this message will be visible for after its "fade in" time has passed. Time is in seconds. **/
    function getTimeVisibleInSeconds():Float;
}

@:deprecated
interface Title extends DisplayableMessage {
    
}
@:deprecated
interface SubTitle extends DisplayableMessage {
    
}

/** A builder that helps construct a DisplayableMessage. **/
interface DisplayableMessageBuilder {
    /** Creates and returns a "Title" from this builder. A title will be displayed with a large font below the center of the player's screen. **/
    function toTitle(text:String):DisplayableMessage;
    /** Creates and returns a "Sub Title" from this builder. A sub title will be displayed with a medium font below the center of the player's screen, below a title. **/
    function toSubTitle(text:String):DisplayableMessage;

    /** Sets the time, in `seconds`, this message will take to fade in upon display. **/
    function setFadeInTime(seconds:Float):DisplayableMessageBuilder;
    /** Sets the time, in `seconds`, this message will take to fade out after its "visible time" has passed. **/
    function setFadeOutTime(seconds:Float):DisplayableMessageBuilder;
    /** Sets the time, in `seconds`, this message will remain visible after its "fade in time" has passed. **/
    function setTimeVisible(seconds:Float):DisplayableMessageBuilder;
}