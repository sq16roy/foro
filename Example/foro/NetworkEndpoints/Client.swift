//
//  Client.swift
//  PlaylistReader
//
//  Created by Roy Solera on 6/17/21.
//

import Foundation

class Client: NetworkGeneric {
    let baseURL = "https://jsonplaceholder.typicode.com/"
    var session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func getPosts(complete:  @escaping ([Post]) -> Void) {
        let path = "posts"
        let url = URL(string: "\(baseURL)\(path)")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        self.fetch(type: [Post].self, with: request) { result in
            switch result{
            case .success(let post):
                complete(post)
            case .failure(let error):
                print(error)
            }
        }
        
    }
    func getComments(post: Post, complete:  @escaping ([Comment]) -> Void) {
        let path = "comments?postId=\(post.id)"
        let url = URL(string: "\(baseURL)\(path)")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
       
        self.fetch(type: [Comment].self, with: request) { result in
            switch result{
            case .success(let comment):
                complete(comment)
            case .failure(let error):
                print(error)
            }
        }
        
    }
    func newPost(post: Post, complete:  @escaping (Post) -> Void) {
        let path = "posts"
        let url = URL(string: "\(baseURL)\(path)")
        var request = URLRequest(url: url!)
    
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let data = try! JSONEncoder().encode(post)

        request.httpBody = data
        
        self.fetch(type: Post.self, with: request) { resut in
            switch resut{
            case .success(let post):
                complete(post)
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
