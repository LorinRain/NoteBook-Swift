//
//  HomeCell.swift
//  NoteBook-Swift
//
//  Created by Lorin on 15/11/24.
//  Copyright © 2015年 LorinRain. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {

    var contentLabel: UILabel!
    var timeLabel: UILabel!
    var note: Note!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // set background color
        self.backgroundColor = UIColor.clearColor()
        
        // cell background image
        let cellBgImageView = UIImageView(image: UIImage(named: "list_item_bg.png"))
        cellBgImageView.frame = CGRectMake(0, 5, widthByScreenSize(320), 80)
        
        self.contentView.addSubview(cellBgImageView)
        
        // cell left side clip
        let clipView = UIImageView(image: UIImage(named: "clip_normal.png"))
        clipView.frame = CGRectMake(0, 50, 20, cellBgImageView.frame.size.height)
        
        self.contentView.addSubview(clipView)
        
        // content Label
        self.contentLabel = UILabel.init()
        self.contentLabel.frame = CGRectMake(cellBgImageView.frame.size.height / 3 + 17, cellBgImageView.frame.size.height / 3 + 8, cellBgImageView.frame.size.width - (cellBgImageView.frame.size.height / 3 + 10) - 20, cellBgImageView.frame.size.height - (cellBgImageView.frame.size.height / 3 + 10) - 10)
        self.contentLabel.font = UIFont.systemFontOfSize(16)
        self.contentLabel.textColor = UIColor(red: CGFloat(110/255), green: CGFloat(67/255), blue: CGFloat(47/255), alpha: 1)
        cellBgImageView .addSubview(self.contentLabel)
        
        // time Label
        self.timeLabel = UILabel.init()
        self.timeLabel.frame = CGRectMake(cellBgImageView.frame.size.height / 3 + 17, 8, cellBgImageView.frame.size.width - (cellBgImageView.frame.size.height / 3 + 10) - 20, cellBgImageView.frame.size.height / 3 - 10)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func widthByScreenSize(width:CGFloat) -> CGFloat {
        return (width/320.0)*UIScreen.mainScreen().bounds.size.width
    }

}
