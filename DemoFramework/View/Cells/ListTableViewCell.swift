//
//  ListTableViewCell.swift
//  DemoFramework
//
//  Created by Apple on 01/06/24.
//

import UIKit

class ListTableViewCell: UITableViewCell {
 static let identifier = "ListTableViewCell"
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imgView.layer.cornerRadius = self.imgView.frame.width/2
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(with user: User) {
        
        nameLbl.text = "\(user.firstName) \(user.lastName)"
        emailLbl.text = user.email
        
        // Load image from URL
        if let url = URL(string: user.avatar) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.imgView.image = UIImage(data: data)
                    }
                }
            }
        }
    }
    
}
