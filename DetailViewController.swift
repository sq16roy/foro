
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var detailTableView: UITableView!
    @IBOutlet weak var detailTitle: UILabel!
    
    var comments:[Comment]? {
        didSet {
            self.detailTableView.reloadData()
        }
    }
    
    var selectedPost:Post?
    var client:Client?
    let session = URLSession.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Post"
        self.detailTitle.text = selectedPost?.title
        self.textView.text = selectedPost?.body
        client = Client(session: session)
        client?.getComments(post: selectedPost!, complete: { comments in
            self.comments = comments
        })
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let index = self.detailTableView.indexPathForSelectedRow {
            if let comment = self.comments?[index.row] {
                let destCommentView = segue.destination as? CommentsViewController
                destCommentView?.selectedComment = comment
            }
        }
    }
}

extension DetailViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let comments = self.comments else {
            return 0
        }
        return comments.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let comments = self.comments {
            cell.textLabel?.text = comments[indexPath.row].name
        }
        return cell
    }
}
