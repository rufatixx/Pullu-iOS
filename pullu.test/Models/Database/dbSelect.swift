//
//  dbSelect.swift
//  pullu.test
//
//  Created by Rufat Asadzade on 1/7/20.
//  Copyright © 2020 Rufat Asadzade. All rights reserved.
//

import Foundation
import Alamofire
public class dbSelect {
    
    
    func GetJson(jsonUrlString:String,completionBlock: @escaping (_ result:Data) ->()){
        
        
        guard let url = URL(string: jsonUrlString)else {return}
        let task = URLSession.shared.dataTask(with: url, completionHandler: {(Data,URLResponse,Error)->Void in
            guard let data=Data else{return}
            print(data)
            completionBlock(data)
            
        })
        
        task.resume()
        
        
    }
    
    func SignIn(username:String,pass:String,completionBlock: @escaping (_ result:Array<User>) ->()){
        
        let url="https://pullu.az/api/androidmobileapp/user/login?mail="+username+"&pass="+pass
        GetJson(jsonUrlString: url){
            (json) in
            do{
                
                
                var list  = try
                    JSONDecoder().decode(Array<User>.self, from: json)
                // userList=list
                
                completionBlock(list)
                
            }
            catch let jsonErr{
                print("Error serializing json:",jsonErr)
            }
            
            
        }
        
    }
    
    func getAds(username:String,pass:String,catID:Int?,completionBlock: @escaping (_ result:Array<Advertisement>) ->()){
         var url = "https://pullu.az/api/androidmobileapp/user/get/Ads?mail=\(username)&pass=\(pass)"
        if catID! > 0 {
          url = "https://pullu.az/api/androidmobileapp/user/get/Ads?mail=\(username)&pass=\(pass)&catID=\(catID!)"
        }
       
       
        GetJson(jsonUrlString: url){
            (json) in
            do{
                
                
                var list  = try
                    JSONDecoder().decode(Array<Advertisement>.self, from: json)
                
                // userList=list
                
                completionBlock(list)
                
            }
            catch let jsonErr{
                print("Error serializing json:",jsonErr)
            }
            
        }
        
    }
    
    func getCounties(completionBlock: @escaping (_ result:Array<Country>) ->()){
        
        let url="https://pullu.az/api/androidmobileapp/get/countries"
        GetJson(jsonUrlString: url){
            (json) in
            do{
                
                
                let list  = try
                    JSONDecoder().decode(Array<Country>.self, from: json)
                
                // userList=list
                
                completionBlock(list)
                
            }
            catch let jsonErr{
                print("Error serializing json:",jsonErr)
            }
            
        }
        
    }
    func getCities(countryId:Int,completionBlock: @escaping (_ result:Array<City>) ->()){
        
        let url="https://pullu.az/api/androidmobileapp/get/Cities?countryid=" + String(countryId)
        GetJson(jsonUrlString: url){
            (json) in
            do{
                
                
                let list  = try
                    JSONDecoder().decode(Array<City>.self, from: json)
                
                // userList=list
                
                completionBlock(list)
                
            }
            catch let jsonErr{
                print("Error serializing json:",jsonErr)
            }
            
        }
        
    }
    
    func getProfessions(completionBlock: @escaping (_ result:Array<Profession>) ->()){
        
        let url="https://pullu.az/api/androidmobileapp/get/professions"
        GetJson(jsonUrlString: url){
            (json) in
            do{
                
                
                let list  = try
                    JSONDecoder().decode(Array<Profession>.self, from: json)
                
                // userList=list
                
                completionBlock(list)
                
            }
            catch let jsonErr{
                print("Error serializing json:",jsonErr)
            }
            
        }
        
    }
    func getAdvertById(advertID:Int?,mail:String?,pass:String?, completionBlock: @escaping (_ result:Array<Advertisement>) ->()){
        
        let url="https://pullu.az/api/androidmobileapp/user/about?advertID=\(advertID!)&mail=\(mail!)&pass=\(pass!)"
        GetJson(jsonUrlString: url){
            (json) in
            do{
                
                
                let list  = try
                    JSONDecoder().decode(Array<Advertisement>.self, from: json)
                
                // userList=list
                
                completionBlock(list)
                
            }
            catch let jsonErr{
                print("Error serializing json:",jsonErr)
            }
            
        }
        
    }
    func getStatistics(mail:String?,pass:String?, completionBlock: @escaping (_ result:Statistics) ->()){
        
        let url="https://pullu.az/api/androidmobileapp/user/get/statistics?mail=\(mail!)&pass=\(pass!)"
        GetJson(jsonUrlString: url){
            (json) in
            do{
                
                
                let statistics  = try
                    JSONDecoder().decode(Statistics.self, from: json)
                
                // userList=list
                
                completionBlock(statistics)
                
            }
            catch let jsonErr{
                print("Error serializing json:",jsonErr)
            }
            
        }
        
    }
    
    //Profil
    func getProfileInfo(mail:String? , pass:String?, completionBlock: @escaping (_ result:Array<ProfileModel>) ->()){
        
        let url="https://pullu.az/api/androidmobileapp/user/get/profile?mail=\(mail!)&pass=\(pass!)"
        GetJson(jsonUrlString: url){
            (json) in
            do{
                
                
                let profile  = try
                    JSONDecoder().decode(Array<ProfileModel>.self, from: json)
                
                // userList=list
                
                completionBlock(profile)
                
            }
            catch let jsonErr{
                print("Error serializing json:",jsonErr)
            }
        }
    }
    
   
    
}
