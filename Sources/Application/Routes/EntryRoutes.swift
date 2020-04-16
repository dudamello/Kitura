//
//  EntryRoutes.swift
//  Application
//
//  Created by Eduarda Mello on 16/04/20.
//

import Foundation
import LoggerAPI
import KituraContracts

var entries:[NoteEntry] = []

func initializeEntryRoutes(app: App){
    app.router.post("/entries", handler: addEntry)
    app.router.get("/entries", handler: getEntries)
    app.router.delete("/entries", handler: deleteEntry)
}

func addEntry(entry:NoteEntry, completion:
    @escaping(NoteEntry?,RequestError?) -> Void){
    var storeEntry = entry
    storeEntry.id = entries.count.value
    entries.append(storeEntry)
    completion(storeEntry,nil)
}

func getAllEntries(completion:
    @escaping([NoteEntry]?,RequestError?) -> Void) -> Void{
    completion(entries, nil)
}

func getEntries(params:NoteEntryParams?,completion:
    @escaping([NoteEntry]?,RequestError?) -> Void) -> Void{
    guard let params = params else{
        return completion(entries, nil)
    }
    let filteredEntries = entries.filter{$0.label == params.label}
    completion(filteredEntries, nil)
}

func deleteEntry(id:String, completion:@escaping(RequestError?)->Void) {
    guard let index =  entries.firstIndex(where: {$0.id == id})else{
        return completion(.notFound)
    }
    entries.remove(at: index)
    completion(nil)
}
