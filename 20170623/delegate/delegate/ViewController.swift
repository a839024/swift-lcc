import UIKit


class ViewController: UIViewController {

    var names: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addName(_ sender: AnyObject) {

        //alert dialog
        let alert = UIAlertController(title: "New Name", message: "Add a new name", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "ADD", style: .default){
            [unowned self] action in
            
            guard let textField = alert.textFields?.first, let nameToSave = textField.text else{
                return
            }
            self.names.append(nameToSave)
            self.tableView.reloadData()
        }
    
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        alert.addTextField()
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Item List"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
}
