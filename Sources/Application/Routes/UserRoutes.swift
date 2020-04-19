//
//  UserRoutes.swift
//  Application
//
//  Created by Eduarda Mello on 19/04/20.
//

import Foundation
import LoggerAPI
import Kitura

func initializeUserRoutes(app:App){
    app.router.post("/user", handler: addUser)
    app.router.delete("/user", handler: deleteUser)
}

func addUser(user:UserAuth, completion:@escaping(UserAuth?,RequestError?)->Void){
    user.save(completion)
}

func deleteUser(user:UserAuth, id:String, completion:@escaping(RequestError?)->Void){
    if user.id != id{
        completion(RequestError.forbidden)
    }
    UserAuth.delete(id: id, completion)
}
