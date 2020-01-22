//
//  ReklamCellTableViewCell.swift
//  pullu.test
//
//  Created by Rufat Asadov on 1/10/20.
//  Copyright © 2020 Rufat Asadzade. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire
protocol ReklamCellDelegate {
    func orderClick(object: Advertisement)
}

class ReklamCellTableViewCell: UITableViewCell {
    @IBOutlet weak var ReklamImage: UIImageView!
    @IBOutlet weak var ReklamTitle: UILabel!
    
    @IBOutlet weak var ReklamInfo: UILabel!
    @IBOutlet weak var ReklamDate: UILabel!
    @IBOutlet weak var ReklamType: UILabel!
    @IBOutlet weak var ReklamBaxish: UILabel!
    @IBOutlet weak var ReklamCategory: UILabel!
    var object: Advertisement?
    // var delegate: ReklamCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBOutlet weak var advertClick: UIView!
    
    func reloadData() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        var dt = dateFormatter.date(from: object!.cDate!)
        dateFormatter.dateFormat = "EEEE, dd MMMM"
        ReklamTitle.text=object?.name
        ReklamInfo.text=object?.description
        ReklamType.text=object?.aTypeName
        ReklamCategory.text=object?.catName
        
        ReklamDate.text=dateFormatter.string(from:dt!)
        
        if  object?.photo != nil{
            self.ReklamImage.image=UIImage(data: object!.photo!)
        }
        else  {
            ReklamImage.image=UIImage(named: "background")
            let loadingIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
            loadingIndicator.center=CGPoint(x: ReklamImage.bounds.size.width/2, y: ReklamImage.bounds.size.height/2)
            loadingIndicator.hidesWhenStopped = true
            loadingIndicator.color = UIColor.lightGray
            // loadingIndicator.style = UIActivityIndicatorView.Style.gray
            loadingIndicator.startAnimating();
            ReklamImage.addSubview(loadingIndicator)
            
            //present(alert, animated: true, completion: nil)
            
        }
        
        // self.ReklamImage.contentMode = .scaleAspectFill
        
        
        
        /*Alamofire.request(object!.photoUrl!).responseImage { response in
         if let catPicture = response.result.value {
         self.ReklamImage.image=""
         self.ReklamImage.contentMode = .scaleAspectFill
         //print("image downloaded: \(catPicture)")
         }
         }*/
        
    }
}
