

import UIKit

class ViewController: UIViewController {

    let TitleLabel : UILabel = {
        let label = UILabel()
        label.text = "Url Session"
        label.font = UIFont.systemFont(ofSize: 22 , weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tableView : UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let addButton : UIButton = {
        let button = UIButton()
        button.setTitle("추가", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - main
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setTable()
        addButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
    }
    
    @objc func tapButton(){
        let vc = ModalViewController()
        self.present(vc, animated: true)
        
    }
    
    func setTable(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
    }

    func setUI(){
        view.addSubview(TitleLabel)
        view.addSubview(tableView)
        view.addSubview(addButton)
        
        
        NSLayoutConstraint.activate([
            
            TitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 20),
            TitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            addButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor , constant: -20),
            
            tableView.topAnchor.constraint(equalTo: TitleLabel.bottomAnchor , constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
        
    }

}


extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell" , for : indexPath) as? TableViewCell else { return UITableViewCell() }
        
        
        return cell
    }
    
    
}


