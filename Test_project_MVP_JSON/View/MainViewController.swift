//
//  ViewController.swift
//  Test_project_MVP_JSON
//
//  Created by Алексей Авдейчик on 11.10.21.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: MainViewPresenterProtocol?
    
    override func viewDidLoad() {
        title = "Test_Project_MVP_JSON"
        super.viewDidLoad()
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
}
// MARK: - Extention for VC (Delegate, DataSource)
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath)
        let comment = presenter?.comments?[indexPath.row]
        
        (cell as? CustomTableViewCell)?.myLabel.text = comment?.title
        
        guard let recivedImage = try? Data(contentsOf: URL(string: comment!.thumbnailUrl)!) else { return cell }
        
        (cell as? CustomTableViewCell)?.myImageView.image = UIImage(data: recivedImage)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
}

extension MainViewController: MainViewProtocol {
    func success() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}

