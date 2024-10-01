
import UIKit


class SecondViewController : UIViewController{
    let searchBar : UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search for a show, movie, genre, e.t.c.", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        search.searchTextField.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        search.searchTextField.backgroundColor = #colorLiteral(red: 0.2588235736, green: 0.2588235736, blue: 0.2588235736, alpha: 1)
        search.searchBarStyle = .minimal
        search.searchTextField.layer.cornerRadius = 5
        search.layer.borderWidth = 0
        search.searchTextField.clipsToBounds = true
        search.updateHeight(height: 48)
        search.searchTextField.leftView?.tintColor = .lightGray
        
        let micImageView = UIImageView(image: UIImage(named: "plus"))
        micImageView.tintColor = .lightGray
        micImageView.contentMode = .scaleAspectFit
        micImageView.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        search.searchTextField.rightView = micImageView
        search.searchTextField.rightViewMode = .always
        
        return search
    }()
    
    let tableView : UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    let mainTitle : UILabel = {
        let label = UILabel()
        label.text = "Top Searches"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 26.75 )
        
        return label
    }()
    
    //MARK: - main
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUI()
        setTable()
    }
    
    func setTable(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SecondViewCell.self, forCellReuseIdentifier: "secondCell")
    }
    
    func setUI(){

        navigationItem.titleView = searchBar
        view.addSubview(mainTitle)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            mainTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            mainTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            
            tableView.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 21),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
    
        
}

//MARK: - tableView
extension SecondViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SecondViewData.tablemodeling.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath) as? SecondViewCell
        else { return UITableViewCell() }
        
        cell.cellLabel.text = SecondViewData.tablemodeling[indexPath.row].title
        let cellImageName = SecondViewData.tablemodeling[indexPath.row].image_name1
        cell.cellImage.image = UIImage(named: cellImageName)
        let cellPlayImageName = SecondViewData.tablemodeling[indexPath.row].play_image
        cell.cellPlayImage.image = UIImage(named: cellPlayImageName)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SecondViewData.tablemodeling.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
    
    // cell 사이의 간격
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let vPadding : CGFloat = 3
        let maskLayer = CALayer()
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: vPadding/2)
        cell.layer.mask = maskLayer
    }
}


// MARK: -서치바 높이 조절 커스텀
extension UISearchBar {
    func updateHeight(height: CGFloat, radius: CGFloat = 8.0) {
        let image: UIImage? = UIImage.imageWithColor(color: UIColor.clear, size: CGSize(width: 1, height: height))
        setSearchFieldBackgroundImage(image, for: .normal)
        for subview in self.subviews {
            for subSubViews in subview.subviews {
                if #available(iOS 13.0, *) {
                    for child in subSubViews.subviews {
                        if let textField = child as? UISearchTextField {
                            textField.layer.cornerRadius = radius
                            textField.clipsToBounds = true
                        }
                    }
                    continue
                }
                if let textField = subSubViews as? UITextField {
                    textField.layer.cornerRadius = radius
                    textField.clipsToBounds = true
                }
            }
        }
    }
}

extension UIImage {
    static func imageWithColor(color: UIColor, size: CGSize) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        guard let image: UIImage = UIGraphicsGetImageFromCurrentImageContext() else {
            return nil
        }
        UIGraphicsEndImageContext()
        return image
    }
}
