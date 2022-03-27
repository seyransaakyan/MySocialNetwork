//  SocialNetwork
//
//  Created by Seyran Saakyan on 26.03.2022.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var posts: [Post] = []
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIManager.shared.getPost(id: "post1", imageID: "1") {res1 in
            self.posts.append(res1!)
            APIManager.shared.getPost(id: "post2", imageID: "2") {res2 in
                self.posts.append(res2!)
                APIManager.shared.getPost(id: "post3", imageID: "3") {res3 in
                    self.posts.append(res3!)
                    DispatchQueue.main.async {
                        self.table.reloadData()
                    }
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsTableViewCell
        cell.postName.text = posts[indexPath.row].name
        cell.postDate.text = posts[indexPath.row].date
        cell.postText.text = posts[indexPath.row].text
        cell.postImage.image = posts[indexPath.row].image
        
        return cell
    }

}
