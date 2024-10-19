
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
        tableView.backgroundColor = .white
        let modalHeaderView = ModalTabelHeaderView()
        tableView.tableHeaderView  = modalHeaderView
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
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
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "modalTable", for: indexPath) as? ModalTableView else{ return UITableViewCell() }
        
        let imageName = ModalViewData.modalModeling[indexPath.row].image
        cell.cellImage.image = UIImage(named: imageName)
        cell.cellTitleLabel.text = ModalViewData.modalModeling[indexPath.row].title
        cell.cellTimeLabel.text = ModalViewData.modalModeling[indexPath.row].time
        cell.cellScriptLabel.text = ModalViewData.modalModeling[indexPath.row].script
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    
    //cell 사이 간격 조정
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let verticalPadding: CGFloat = 25
        let maskLayer = CALayer()
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
    }

}
