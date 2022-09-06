//
//  NasaNewsTableViewCell.swift
//  Laborator3
//
//  Created by user216460 on 8/31/22.
//

import UIKit

struct NasaNewsTableViewCellModel{
    let title: String
    let date: String
}
class NasaNewsTableViewCell:UITableViewCell{
    static let cellId = "NasaNewsTableViewCell"
    
    let titleLabel = UILabel()
    let dateLabel = UILabel()
    
    override init(style:UITableViewCell.CellStyle, reuseIdentifier:String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    func setUp(with model:NasaNewsTableViewCellModel){
        titleLabel.text = model.title
        
        dateLabel.text = model.date
        
    }
  
    override var reuseIdentifier: String?{
        return NasaNewsTableViewCell.cellId
    }
    
    required init(coder: NSCoder) {
        fatalError("init coder has not been implemented")
    }
}

private extension NasaNewsTableViewCell{
    func configure(){
        titleLabel.font = UIFont.systemFont(ofSize: 17)
        titleLabel.numberOfLines = 2
        
        dateLabel.font = UIFont.systemFont(ofSize: 12)
        dateLabel.numberOfLines = 1
        
        dateLabel.textColor = UIColor.secondaryLabel
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5).isActive = true
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        
    }}
