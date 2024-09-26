import UIKit


class FirstHeaderView : UIView {
    
    let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "mainImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let logoImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true 
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let playButton : UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = UIColor.lightGray
        config.title = "Play"
        config.image = UIImage(named:"play")
        config.imagePadding = 15
        config.titlePadding = 15
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        config.baseForegroundColor = .black
        let playButton = UIButton(configuration: config)
        playButton.titleLabel?.font = UIFont.systemFont(ofSize: 20.46, weight: .semibold)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        return playButton
    }()

    let myListButton : UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = .clear
        config.imagePadding = 6
        config.imagePlacement = .top
        if let image = UIImage(named: "plus"){
            let size = CGSize(width: 26, height: 26)
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            image.draw(in: CGRect(origin: .zero, size: size))
            let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            config.image = scaledImage
        }
        var text = AttributedString.init("My List")
        text.foregroundColor = #colorLiteral(red: 0.4509803653, green: 0.4509803653, blue: 0.4509803653, alpha: 1)
        text.font = UIFont.systemFont(ofSize: 15 , weight: .light)
        config.attributedTitle = text
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    
    let infoButton : UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = .clear
        config.imagePadding = 6
        config.imagePlacement = .top
        if let image = UIImage(named: "info"){
            let size = CGSize(width: 26, height: 26)
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            image.draw(in: CGRect(origin: .zero, size: size))
            let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            config.image = scaledImage
        }
        var text = AttributedString.init("Info")
        text.foregroundColor = #colorLiteral(red: 0.4509803653, green: 0.4509803653, blue: 0.4509803653, alpha: 1)
        text.font = UIFont.systemFont(ofSize: 14 , weight: .light)
        config.attributedTitle = text
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let headerbutton1 : UIButton = {
        let TvShowButton = UIButton()
        TvShowButton.setTitle("TV Shows", for: .normal)
        TvShowButton.layer.borderColor = UIColor.white.cgColor
        TvShowButton.translatesAutoresizingMaskIntoConstraints = false
        return TvShowButton
    }()

    let headerbutton2 : UIButton = {
        let button2 = UIButton()
        button2.setTitle("Movies", for: .normal)
        button2.layer.borderColor = UIColor.white.cgColor
        button2.translatesAutoresizingMaskIntoConstraints = false
        return button2
    }()

    let headerbutton3 : UIButton = {
        let button3 = UIButton()
        button3.setTitle("MyList", for: .normal)
        button3.layer.borderColor = UIColor.white.cgColor
        button3.translatesAutoresizingMaskIntoConstraints = false
        return button3
    }()
    
    let headerButtonViews : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let ButtonViews : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
  
    required init?(coder: NSCoder) {
        fatalError()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
         setUI()
    }
    
    
    func setUI(){
        self.addSubview(heroImageView)
        self.addSubview(ButtonViews)
        self.addSubview(headerButtonViews)
        headerButtonViews.addSubview(logoImageView)
        headerButtonViews.addSubview(headerbutton1)
        headerButtonViews.addSubview(headerbutton2)
        headerButtonViews.addSubview(headerbutton3)
        ButtonViews.addSubview(myListButton)
        ButtonViews.addSubview(playButton)
        ButtonViews.addSubview(infoButton)
    
        
        NSLayoutConstraint.activate([
            
            
            headerButtonViews.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerButtonViews.topAnchor.constraint(equalTo: self.topAnchor),
            
            ButtonViews.centerXAnchor.constraint(equalTo: centerXAnchor),
            ButtonViews.topAnchor.constraint(equalTo: headerButtonViews.bottomAnchor, constant: 324),
            
            
            heroImageView.topAnchor.constraint(equalTo: self.topAnchor),
            heroImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            heroImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            heroImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            logoImageView.leadingAnchor.constraint(equalTo: headerButtonViews.leadingAnchor, constant: 10),
            logoImageView.topAnchor.constraint(equalTo: headerButtonViews.topAnchor, constant: 10),
            logoImageView.widthAnchor.constraint(equalToConstant: 20),
            logoImageView.heightAnchor.constraint(equalToConstant: 39),
            
            
            headerbutton1.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            headerbutton1.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor ,constant: 23 ),
            
            headerbutton2.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            headerbutton2.leadingAnchor.constraint(equalTo: headerbutton1.trailingAnchor, constant: 40),
            
            headerbutton3.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            headerbutton3.leadingAnchor.constraint(equalTo: headerbutton2.trailingAnchor, constant: 40),
            headerbutton3.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),

            
            myListButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 54),
            myListButton.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 324),
        
            playButton.bottomAnchor.constraint(equalTo: self.bottomAnchor , constant: -35),
            playButton.leadingAnchor.constraint(equalTo: myListButton.trailingAnchor , constant: 42 ),
            
            infoButton.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 324),
            infoButton.leadingAnchor.constraint(equalTo: playButton.trailingAnchor, constant: 41),

        ])
    }
    
    
}
