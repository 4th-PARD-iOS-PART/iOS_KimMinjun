

import UIKit

class AddViewController : UIViewController {
    
    var viewController : ViewController?
    
    var nameField : UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.placeholder = "이름을 입력해주세요"
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1.0
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var partField : UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.placeholder = "파트를 입력해주세요"
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1.0
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var ageField : UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.placeholder = "나이를 입력해주세요"
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1.0
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let addButton : UIButton = {
        let button = UIButton()
        button.setTitle("추가하기", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - main
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addButton.addTarget(self, action: #selector(addButtonClicked), for: .touchUpInside)
        setUI()
    }
    
    @objc func addButtonClicked(){
        
        guard let name = nameField.text,
              let part = partField.text,
              let ageStr = ageField.text,
              let age = Int(ageStr)
        else { return }
        
        let user = MemberData(name: name, part: part, age: age)
        guard let viewController = viewController else {return}
        postData(mem : user , vc: viewController)
        dismiss(animated: true)
    }
    
    func setUI() {
        view.addSubview(nameField)
        view.addSubview(partField)
        view.addSubview(ageField)
        view.addSubview(addButton)
    
        NSLayoutConstraint.activate([
            nameField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            nameField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor ,constant: 10),
            nameField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        
            partField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 20),
            partField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor ,constant: 10),
            partField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
                    
            ageField.topAnchor.constraint(equalTo: partField.bottomAnchor, constant: 20),
            ageField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor ,constant: 10),
            ageField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor , constant: -20),
            
            
        ])
        
    }
}

extension AddViewController {
    func postData(mem : MemberData ,vc : ViewController){
        guard let url = URL(string: "http://ec2-13-209-3-68.ap-northeast-2.compute.amazonaws.com:8080/user")
        else {
            print("🚨Not Invailed URL")
            return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do{
            let encoder = JSONEncoder()
            let jsonData = try encoder.encode(mem)
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error  {
                    print("🚨 Error: \(error.localizedDescription)")
                    return
                }
                
                if let data = data {
                    print("✅Response: \(String(decoding: data, as: Unicode.UTF8.self))")
                    DispatchQueue.main.async{
                        
                        vc.getData()
                        vc.tableView.reloadData()
                    }
                    
                }
            }
            task.resume()
        }catch {
            print("🚨 error",error)
        }
    }
    
    
}
