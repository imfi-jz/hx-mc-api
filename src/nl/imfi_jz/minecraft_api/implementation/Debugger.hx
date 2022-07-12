package nl.imfi_jz.minecraft_api.implementation;
#if(!mc_api || mc_debug || warn)

import nl.imfi_jz.minecraft_api.MessageReceiver.SeverityGuideline;
import nl.imfi_jz.minecraft_api.Logger;

/** Helper class for writing conditionally compiled debug logs. Logs will only compile when `-D mc_debug` is defined and warnings will only compile when `-D warn` is defined. **/
class Debugger {
    private static var logger:Logger;

    /** Gives the debugger a logger instance. A logger is required for logging to work and not set by default. **/
    public static inline function setLogger(logger:Logger) {
        #if(mc_debug || warn)
        Debugger.logger = logger;
        #end
    }

    /** Logs a message to the Debug level of the set logger if compile flag `mc_debug` is defined. **/
    public static inline function log(message:String) {
        #if(mc_debug)
        logger.tell(message, SeverityGuideline.Debug);
        #end
    }

    /** Given a cpu time `preCpuTime`, and an `activity`, this will log a message to the Debug level of the set logger stating how much milliseconds the activity has taken. Only compiles when compile flag `mc_debug` is defined. **/
    public static inline function logMsTaken(activity:String, preCpuTime:Float) {
        #if(mc_debug)
        logger.tell('$activity took ${std.Math.round((Sys.cpuTime() - preCpuTime) * 1000)} ms', SeverityGuideline.Debug);
        #end
    }

    /** Logs a message to the Warning level of the set logger if compile flag `warn` is defined. **/
    public static inline function warn(message:String) {
        #if(warn)
        logger.tell(message, SeverityGuideline.Warning);
        #end
    }
}
#end