
import UIKit

class ThirdViewCell : UITableViewCell {
    
    let mainImage: UIImageView = {
        let mainImage = UIImageView()
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        mainImage.contentMode = .scaleAspectFill
        mainImage.clipsToBounds = true
        return mainImage
    }()

    let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    let scriptLabel : UILabel = {
       let label = UILabel()
        label.textColor = . white
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 11 , weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    let categoryLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 11.4, weight: .semibold)
        return label
    }()
    
    let remindButton : UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = .clear
        config.imagePadding = 5
        config.imagePlacement = .top

        if let image = UIImage(named: "Bell"){
            let size = CGSize(width: 24, height: 24)
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            image.draw(in: CGRect(origin: .zero, size: size))
            let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            config.image = scaledImage
        }
        var textButton = AttributedString.init("Remind Me")
        textButton.font = UIFont.systemFont(ofSize: 11.0, weight: .regular)
        config.attributedTitle = textButton
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let shareButton: UIButton = {
           var config = UIButton.Configuration.filled()
           config.background.backgroundColor = .clear
           config.imagePadding = 5
           config.imagePlacement = .top
           if let image = UIImage(named: "share") {
               let size = CGSize(width: 24, height: 24)
               UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
               image.draw(in: CGRect(origin: .zero, size: size))
               let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
               UIGraphicsEndImageContext()
               config.image = scaledImage
           }
        var textButton = AttributedString.init("Share")
        textButton.font = .systemFont(ofSize: 11.0, weight: .regular)
        config.attributedTitle = textButton
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
       }()
        
    let dateLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11.4 , weight: .regular)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    //MARK: - main
    required init?(coder: NSCoder) {
        fatalError()
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "thirdViewCell")
        contentView.backgroundColor = .black
        setUI()
    }
    
    func setUI(){
        contentView.addSubview(mainImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(scriptLabel)
        contentView.addSubview(categoryLabel)
        contentView.addSubview(remindButton)
        contentView.addSubview(shareButton)
        contentView.addSubview(dateLabel)
        
        
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainImage.heightAnchor.constraint(equalToConstant: 200),
            
            remindButton.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 10),
            remindButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 227),

            shareButton.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 10),
            shareButton.leadingAnchor.constraint(equalTo: remindButton.trailingAnchor , constant: 24),
            
            dateLabel.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 73),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            titleLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor , constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor ,constant:  12),
            
            scriptLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 13),
            scriptLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant:  12),
          
            categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            categoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            ])
    }
}
