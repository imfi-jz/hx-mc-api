package nl.imfi_jz.minecraft_api;

import nl.imfi_jz.minecraft_api.TypeDefinitions;

/** A `MessageReceiver` specifically for the server/game console. **/
interface ConsoleLogger extends MessageReceiver extends Enableable {
    
}

/** A logger that can have a number of receivers which can process the messages each in their own way. **/
interface Logger extends MessageReceiver extends Enableable {
    function addReceiver(receiver:MessageReceiver):Bool;
    function getReceivers():StandardCollection<MessageReceiver>;
    function removeReceiver(receiver:MessageReceiver):Bool;
}