

import UIKit


class TableViewCell : UITableViewCell {
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "TableViewCell")
        setUI()
    }
    
    
    func setUI(){
        
        
    }
}

