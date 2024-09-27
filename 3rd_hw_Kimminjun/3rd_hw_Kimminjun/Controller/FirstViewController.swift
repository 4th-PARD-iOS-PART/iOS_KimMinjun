
import UIKit


class FirstViewController : UIViewController{
    let sectionTitles : [String] = ["Popular on Netflix","Trending Now", "Top 10 in Nigeria Today","My List", "African Movies","Nollywood Movies & Tv"]
   
    let tableView : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.backgroundColor = .black
        table.translatesAutoresizingMaskIntoConstraints = false
        //section 간격 없애기
        if #available(iOS 15.0, *) {
            table.sectionHeaderTopPadding = 11
            }
        return table
    }()
    
    
    
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        deleteColorNavTab()
        setUI()
        navigationController?.setNavigationBarHidden(true, animated: false)

    }
    
    func setUI(){
        view.addSubview(tableView)
        
        //테이블 뷰 기본 세팅
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FirstViewCell.self, forCellReuseIdentifier: "firstCell")
        
        
        //헤더뷰 연결
        let headerView = FirstHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        tableView.tableHeaderView = headerView
        
        NSLayoutConstraint.activate([
            
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            
        ])
    }
    
    func deleteColorNavTab(){
        navigationController?.navigationBar.isTranslucent = false
        tabBarController?.tabBar.isTranslucent = false
        
        navigationController?.navigationBar.barTintColor = UIColor.black
        tabBarController?.tabBar.barTintColor = UIColor.black 
    }
    
}




extension FirstViewController : UITableViewDelegate, UITableViewDataSource{
    //행의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    // cell 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as?
                FirstViewCell else { return UITableViewCell() }
        switch indexPath.section {
        case 0:
            cell.getSectionNumber(num: 0)
        case 1:
            cell.getSectionNumber(num: 1)
        case 2:
            cell.getSectionNumber(num: 2)
        case 3:
            cell.getSectionNumber(num: 3)
        case 4:
            cell.getSectionNumber(num: 4)
        case 5:
            cell.getSectionNumber(num: 5)
        default:
            cell.getSectionNumber(num: 0)
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.tintColor = .black
        header.textLabel?.font = .systemFont(ofSize: 20.9, weight: .bold)
        header.textLabel?.textColor = .white
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y , width: 100, height: header.bounds.height)
    }


 
    
}
