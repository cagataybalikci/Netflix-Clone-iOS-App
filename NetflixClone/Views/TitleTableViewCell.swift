//
//  TitleTableViewCell.swift
//  NetflixClone
//
//  Created by Çağatay Balıkçı on 6.05.2022.
//

import UIKit
import SDWebImage

class TitleTableViewCell: UITableViewCell {

    static let identifer = "TitleTableViewCell"
    
    
    //MARK: Upcoming Tabs Elements
    let titlePosterImage : UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let playTitleButton : UIButton = {
       let button = UIButton()
        let image = UIImage(systemName: "play.circle" ,withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    //MARK: Init Func
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlePosterImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playTitleButton)
        
        applyConstraints()
    }

    
    //MARK: Constraints for elements
    private func applyConstraints(){
        let titlePosterImageConstraints = [
            titlePosterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlePosterImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titlePosterImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -10),
            titlePosterImage.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: titlePosterImage.trailingAnchor,constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        let playTitleButtonConstraints = [
            playTitleButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            playTitleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20)
        ]
        
        
        NSLayoutConstraint.activate(titlePosterImageConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(playTitleButtonConstraints)
    }
    
    
    //MARK: Config func for to setup data
    public func configure(with model: TitleViewModel){
        
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(model.posterURL)") else {return}
        
        titlePosterImage.sd_setImage(with: url, completed: nil)
        titleLabel.text = model.titleName
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
