package nl.imfi_jz.minecraft_api;

/** Something that can receive messages at a severity level. **/
interface MessageReceiver {
    /** Tell this receiver a `message` at a `severity`. What happens with the message is up to the receiver. **/
    function tell(message:String, severity:SeverityGuideline = SeverityGuideline.Log):Void;
    
    /** Set a specific `severity` to be muted or not. Usually the receiver will not display or log a message received at a muted severity, however this is also up to the implementation. **/
    function setSeverityLevelMute(severity:SeverityGuideline, muted:Bool):Void;
    function isSeverityLevelMuted(severity:SeverityGuideline):Bool;
}

/** A scale of levels of severity for textual messages. **/
enum SeverityGuideline {
    Log;
    Debug;
    Warning;
    Error;
    Notice;
    Custom(severity:Int);
}