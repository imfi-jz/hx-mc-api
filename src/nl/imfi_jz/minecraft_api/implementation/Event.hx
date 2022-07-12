package nl.imfi_jz.minecraft_api.implementation;

import nl.imfi_jz.minecraft_api.Event.EventHandler;
import nl.imfi_jz.minecraft_api.Event.EventData;
import nl.imfi_jz.minecraft_api.TypeDefinitions;

/** Convenience class for creating a structure of handling an event with multiple handlers. **/
abstract class EventHandledByHandlers implements Event {
    private final handlers:StandardCollection<EventHandler> = new StandardCollection<EventHandler>();

    private function new(handlers) {
        this.handlers = handlers;
    }

    public final function occur(involvement:EventData):Void {
        for(handler in handlers){
            handler.handle(handler.getHandlingData(involvement));
        }
    }
}