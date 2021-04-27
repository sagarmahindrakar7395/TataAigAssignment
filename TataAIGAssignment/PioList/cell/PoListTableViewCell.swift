//
//  PoListTableViewCell.swift
//  TataAIGAssignment
//
//  Created by Sagar Mahindrakar on 27/04/21.
//

import UIKit

protocol DetailMapDelegate: class {
    func detailMapClicked(_ tag:Int)
}

class PoListTableViewCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var mapBtn: UIButton!
    weak var delegate: DetailMapDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        backView.applybackgroundShadow()
        mapBtn.roundCorners(corners: [.topLeft, .topRight], radius:CGFloat(Constants.Radius.btnRadius))
        backView.roundCorners(corners: [.topLeft, .topRight], radius:CGFloat(Constants.Radius.viewRadius))

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func displayFleetInfo(_ info:String){
        infoLabel.text = info
        if info == "TAXI"{
            infoLabel.textColor = UIColor.red
        }else{
            infoLabel.textColor = UIColor.black
        }
    }
    
    @IBAction func detailMapCTA(_ sender: Any) {
        let value = self.tag
        delegate?.detailMapClicked(value)
    }
    
}
