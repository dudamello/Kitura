//
//  NoteEntry.swift
//  Application
//
//  Created by Eduarda Mello on 16/04/20.
//

import Foundation
import KituraContracts
import SwiftKueryORM

struct NoteEntryParams:QueryParams {
    var label:String?
}

struct NoteEntry:Model{
    var id:String?
    var text:String
    var label:String
    var date:Date
}
