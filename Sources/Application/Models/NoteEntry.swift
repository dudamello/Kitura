//
//  NoteEntry.swift
//  Application
//
//  Created by Eduarda Mello on 16/04/20.
//

import Foundation
import KituraContracts

struct NoteEntryParams:QueryParams {
    var label:String?
}

struct NoteEntry:Codable{
    var id:String?
    var text:String
    var label:String
    var date:Date
}
