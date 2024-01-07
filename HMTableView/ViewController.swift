import UIKit

class ViewController: UIViewController {
    
    let tableView = UITableView()
    let programmingLanguages = ["Swift", "Python", "JavaScript", "Java", "C++", "Ruby", "C#", "PHP", "Kotlin", "Go"]
    let data = Array(1...20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    func setupTableView() {
        tableView.frame = view.bounds
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return data.count
        } else if section == 1 {
            return programmingLanguages.count
        } else {
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = "\(indexPath.row + 1)"
            cell.detailTextLabel?.text = nil
            cell.contentView.subviews.forEach { $0.removeFromSuperview() } // Очистка контента от предыдущих UILabel
        } else if indexPath.section == 1 {
            cell.textLabel?.text = nil
            cell.detailTextLabel?.text = nil
            let label1 = UILabel(frame: CGRect(x: 50, y: 10, width: 150, height: 30))
            label1.text = programmingLanguages[indexPath.row]
            cell.contentView.addSubview(label1)
            
            let label2 = UILabel(frame: CGRect(x: 280, y: 10, width: 150, height: 30))
            label2.text = "\(indexPath.row + 1)"
            cell.contentView.addSubview(label2)
        } else {
            cell.textLabel?.text = "\(indexPath.row + 1)"
            cell.detailTextLabel?.text = "\(indexPath.section)"
        }
        
        return cell
    }
}
