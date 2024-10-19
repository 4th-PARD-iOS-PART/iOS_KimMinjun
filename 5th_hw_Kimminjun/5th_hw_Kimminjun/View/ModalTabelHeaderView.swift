
import UIKit


class ModalTabelHeaderView : UIView {
    
    
    let tagCell : TagCellView = {
        let view = TagCellView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    func setUI(){
        
    }
}
