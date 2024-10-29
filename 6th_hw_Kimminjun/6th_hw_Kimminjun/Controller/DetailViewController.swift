
import UIKit

class DetailViewController : UIViewController {
   
    var name : String = ""
    var age : Int = 0
    var part : String = ""
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 40)
        return label
    }()
    
    let partLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let ageLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let deleteButton : UIButton = {
        let button = UIButton()
        button.setTitle("Delete", for: .normal)
        button.tintColor = .red
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let editButton : UIButton = {
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - main
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setValue()
    }
    
    func setValue(){
        nameLabel.text = name
        partLabel.text = part
        ageLabel.text = "\(String(age))"
    }
    
    func setUI() {
        view.addSubview(nameLabel)
        view.addSubview(partLabel)
        view.addSubview(ageLabel)
        view.addSubview(deleteButton)
        view.addSubview(editButton)
    
        
        NSLayoutConstraint.activate([
            deleteButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 20),
            deleteButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            editButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            editButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            partLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor ,constant: 20),
            partLabel.bottomAnchor.constraint(equalTo: ageLabel.topAnchor, constant: -20),
            
            ageLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            ageLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            
        ])
    }
}
