

import UIKit

class ViewController: UIViewController {

    var member : [MemberData] = []
    let baseURL = "http://ec2-13-209-3-68.ap-northeast-2.compute.amazonaws.com:8080"
    let titleLabel : UILabel = {
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
        getData()
        
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
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        view.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            addButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor , constant: -20),
            
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor , constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
        
    }

}

//MARK: - TableView Extension
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return member.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell" , for : indexPath) as? TableViewCell else { return UITableViewCell() }

        let memberCell = member[indexPath.row]
        cell.partLabel.text = memberCell.part
        cell.nameLabel.text = memberCell.name
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        
        self.present(vc,animated: true)
    }
    
}


//MARK: - API 코드
extension ViewController {
    
    func getData() {
        guard let url = URL(string: "\(baseURL)/user?part=all") else {
           print("🚨 url error")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error : \(error.localizedDescription)")
                return
            }
            
            if let data = data {
                do{
                    let user = try JSONDecoder().decode([MemberData].self , from: data)
                    
                    self.member = user
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print("Decoding error: \(error)")
                }
            }
        }.resume()
        
    }
    
    
    
    
}
