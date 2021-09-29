//
//  NetworkService.swift
//  InterviewApp
//
//  Created by Tulai, Andrei on 10/11/18.
//  Copyright © 2018 Tulai, Andrei. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class NetworkService {
    
    static var shared = NetworkService()
    
    func getTodos(_ completion: @escaping ([Todo]?, Error?) -> Void) {
        Alamofire.request("https://jsonplaceholder.typicode.com/todos").responseArray { (response: DataResponse<[Todo]>) in
            let todos = response.result.value
            let error = response.error
            completion(todos, error)
        }
    }
    
    func getPosts(_ completion: @escaping ([Post]?, Error?) -> Void) {
        Alamofire.request("https://jsonplaceholder.typicode.com/posts").responseArray { (response: DataResponse<[Post]>) in
            let posts = response.result.value
            let error = response.error
            completion(posts, error)
        }
    }
    
    func getAlbums(_ completion: @escaping ([Album]?, Error?) -> Void) {
        Alamofire.request("https://jsonplaceholder.typicode.com/albums").responseArray { (response: DataResponse<[Album]>) in
            let albums = response.result.value
            let error = response.error
            completion(albums, error)
        }
    }
}

class Todo: Mappable {
    var userId: Int?
    var id: Int?
    var title: String?
    var completed: Bool?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        userId <- map["userId"]
        id <- map["id"]
        title <- map["title"]
        completed <- map["completed"]
    }
}

class Post: Mappable {
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        userId <- map["userId"]
        id <- map["id"]
        title <- map["title"]
        body <- map["body"]
    }
}

class Album: Mappable {
    var id: Int?
    var title: String?
    var userId: Int?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        userId <- map["userId"]
    }
}
