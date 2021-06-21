
import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var posts:[Post]? {
        didSet {
            self.tableView.reloadData()
        }
    }
    @IBOutlet weak var delegate: UITableView!
    var client:Client?
    let session = URLSession.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Posts"
        client = Client(session: session)
        client?.getPosts{ (posts) in
            self.posts = posts
            print(self.posts![0].title)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let index = self.tableView.indexPathForSelectedRow {
            if let post = self.posts?[index.row] {
                let destDetailView = segue.destination as? DetailViewController
                destDetailView?.selectedPost = post
            }
        }
        let destNewPostView = segue.destination as? CreateViewController
        destNewPostView?.selectedPosts = posts
        destNewPostView?.delegate = self
    }
}
extension ViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let posts = self.posts else {
            return 0
        }
        return posts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let posts = self.posts {
            cell.textLabel?.text = posts[indexPath.row].title
        }
        return cell
    }
}
extension ViewController:PostDelegate {
    func updatPost(post: Post?) {
        self.posts?.append(post!)
        _ = navigationController?.popToRootViewController(animated: true)
    }
}
