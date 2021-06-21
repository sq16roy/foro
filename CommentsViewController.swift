//
//  CommentsViewController.swift
//  foro
//
//  Created by Roy Solera on 6/17/21.
//

import UIKit

class CommentsViewController: UIViewController {
    
    var selectedComment:Comment?
    
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var emailView: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Comment"
        self.titleView.text = selectedComment?.name
        self.emailView.text = selectedComment?.email
        self.textView.text = selectedComment?.body
    }
}
