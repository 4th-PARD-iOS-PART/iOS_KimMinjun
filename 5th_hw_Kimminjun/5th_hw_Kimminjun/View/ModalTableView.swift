
import UIKit

class ModalTableView : UITableViewCell {
    
    let tagCell : TagCellView = {
        let view = TagCellView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "modalTable")
        contentView.backgroundColor = .black
        setUI()
    }
    
    func setUI(){
        
    }
}
