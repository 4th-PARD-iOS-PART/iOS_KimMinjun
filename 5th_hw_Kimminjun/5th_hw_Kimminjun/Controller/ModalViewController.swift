
import UIKit

class ModalViewController : UIViewController {
    
    let tableView : UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    //MARK: - main
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setTable()
    }
    
    func setUI(){
        view.addSubview(tableView)
        let modalHeaderView = ModalTabelHeaderView()
        tableView.tableHeaderView  = modalHeaderView
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func setTable(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .black
        tableView.register(ModalTableView.self, forCellReuseIdentifier: "modalTable")
    }
}



//MARK: -tableView extension
extension ModalViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "modalTable", for: indexPath) as? ModalTableView else{ return UITableViewCell() }
        
        return cell
    }
    
    
    
}
