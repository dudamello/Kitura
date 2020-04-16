//
//  GetRoutes.swift
//  Application
//
//  Created by Eduarda Mello on 16/04/20.
//

import Foundation
import LoggerAPI
import KituraContracts

func initializeGetRoutes(app: App){
    app.router.get("/hello"){
        request, response, next in
        response.headers["Content-Type"] = "text/txt"
        response.send("Hello Kitura")
        next()
    }
}

//100-199 - informacao
//200-2099 - sucesso
//300-399 - redirect
//400-499 - erro
//500-599 - erro servidor

