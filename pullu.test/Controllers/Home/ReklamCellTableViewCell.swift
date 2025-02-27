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
    @IBOutlet weak var aImage: UIImageView!
    @IBOutlet weak var aTitle: UILabel!
    
    @IBOutlet weak var aPrice: UILabel!
    @IBOutlet weak var aInfo: UILabel!
    @IBOutlet weak var aDate: UILabel!
    @IBOutlet weak var aType: UILabel!
    @IBOutlet weak var aViews: UILabel!
    @IBOutlet weak var aCategory: UILabel!
    let loadingIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
    var object:Advertisement?
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
    
    
    override func prepareForReuse() {
        
        aImage.image=UIImage(named: "background")
        
        loadingIndicator.center=CGPoint(x: aImage.bounds.size.width/2, y: aImage.bounds.size.height/2)
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.color = UIColor.lightGray
        // loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating()
        aImage.addSubview(loadingIndicator)
    }
    func reloadData() {
        
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        var dt = dateFormatter.date(from: object!.cDate!)
        //  dateFormatter.dateFormat = "EEEE, dd MMMM"
        dateFormatter.dateFormat = "dd.MM.yyyy"
        aTitle.text=object?.name
        aInfo.text=object?.description
        aType.text=object?.aTypeName
        aCategory.text=object?.catName
        if object!.price! == "Razılaşma yolu ilə" {
            
            aPrice.text="\(object!.price!)"
            
        }
        else  {
            
            aPrice.text="\(object!.price!) AZN "
        }
        aDate.text=dateFormatter.string(from:dt!)
        //
        
        
        
        
        if object?.photo != nil {
            
            self.aImage.image=UIImage(data: object!.photo!)
            loadingIndicator.stopAnimating()
        }
        else {
            if object?.downloaded == true {
                aImage.image=UIImage(named: "damaged")
                loadingIndicator.stopAnimating()
            }
            
        }
        
        
        
        
        
        
        //        else  {
        //
        //
        //            if object?.aTypeId != 3{
        //
        //
        //                aImage.image=UIImage(named: "background")
        //                let loadingIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
        //                loadingIndicator.center=CGPoint(x: aImage.bounds.size.width/2, y: aImage.bounds.size.height/2)
        //                loadingIndicator.hidesWhenStopped = true
        //                loadingIndicator.color = UIColor.lightGray
        //                // loadingIndicator.style = UIActivityIndicatorView.Style.gray
        //                loadingIndicator.startAnimating();
        //                aImage.addSubview(loadingIndicator)
        //            }
        //            else   {
        //                let label = UILabel()
        //                label.center = CGPoint(x: aImage.bounds.size.width/2, y: aImage.bounds.size.height/2)
        //
        //                // you will probably want to set the font (remember to use Dynamic Type!)
        //                label.font = UIFont.preferredFont(forTextStyle: .footnote)
        //
        //                // and set the text color too - remember good contrast
        //                label.textColor = .black
        //
        //                // may not be necessary (e.g., if the width & height match the superview)
        //                // if you do need to center, CGPointMake has been deprecated, so use this
        //
        //
        //                // this changed in Swift 3 (much better, no?)
        //                label.textAlignment = .center
        //
        //                label.text = "I am a test label"
        //
        //                aImage.addSubview(label)
        //
        //
        //            }
        //
        //
        //        }
        
        
        
        
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
