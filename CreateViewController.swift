//
//  CreateViewController.swift
//  foro
//
//  Created by Roy Solera on 6/17/21.
//

import UIKit

class CreateViewController: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var bodyField: UITextField!
    
    var selectedPosts:[Post]?
    var client:Client?
    var delegate:PostDelegate?
    let session = URLSession.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButton(_ sender: Any) {
        var newPost = Post(
            userId: 1,
            title: self.titleField.text!,
            id: selectedPosts!.count + 1,
            body: self.bodyField.text!)
        
        client = Client(session: session)
        client?.newPost(post: newPost, complete: { data in
            print(data)
            self.delegate?.updatPost(post: data)
        })
    }

}
