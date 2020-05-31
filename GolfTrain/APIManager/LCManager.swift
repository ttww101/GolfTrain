//
//  LCManager.swift
//  BasketballTrain
//
//  Created by Apple on 7/15/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import LeanCloud

class LCManager {
    static let shared = LCManager()
    let userDefault = UserDefaults.standard
    var objectId = ""
    
    private init() {
        
    }
    
    func configure() {
        do {
            try LCApplication.default.set(
                id:  "8RruTql7abezNwPz5IYiVMsi-gzGzoHsz",
                key: "05N6SGNXvgAFsbHeby9fEACI"
            )
        } catch {
            print("")
        }
    }
    
    func createUser(username: String, account: String, password: String, completion: @escaping (Bool, String, Error?) -> Void) {
        let query = LCQuery(className: "userInfo")
        query.whereKey("account", .equalTo(account))
        if query.getFirst().object != nil {
            completion(false, "帐号重复", nil)
        } else {
            do {
                let todo = LCObject(className: "userInfo")
                try todo.set("account", value: account)
                try todo.set("password", value: password)
                try todo.set("username", value: username)
                let _ = todo.save {[weak self](result) in
                    switch result {
                    case .success:
                        self?.objectId = todo.objectId!.stringValue!
                        completion(true, "注册成功", nil)
                    case .failure(let error):
                        completion(false, "帐号重复", error)
                    }
                }
            } catch {
                // handle error
            }
        }
    }
    
    func login(_ account: String, _ password: String, completion: @escaping (Bool, String) -> Void) {
        let query = LCQuery(className: "userInfo")
        query.whereKey("account", .equalTo(account))
        query.whereKey("password", .equalTo(password))
        if let object = query.getFirst().object {
            self.objectId = object.objectId!.stringValue!
            completion(true, "登入成功")
        } else {
            completion(false, "帐号密码错误")
        }
    }
    
    func getUserName(completion: @escaping (String, Error?) -> Void) {
        do {
            let query = LCQuery(className: "userInfo")
            let _ = query.get(objectId) { (result) in
                switch result {
                case .success(object: let object):
                    // get value by string key
                    let name = object.get("username")?.stringValue
                    completion(name!, nil)
                case .failure(error: let error):
                    completion("", error)
                }
            }
        } catch {
            // handle error
        }
    }
    
    func saveActivity(_ title: String, _ img: String, _ time: Int, completion: @escaping (Bool, Error?) -> Void) {
        do {
            let todo = LCObject(className: "trainrecord")
            try todo.set("userid", value: objectId)
            try todo.set("trainTitle", value: title)
            try todo.set("trainMin", value: time)
            try todo.set("trainImg", value: img)
            let _ = todo.save {(result) in
                switch result {
                case .success:
                    completion(true, nil)
                case .failure(let error):
                    completion(false, error)
                }
            }
        } catch {
            // handle error
        }
    }
    
    func getActivity(completion: @escaping (Result<[ProTrainModel], Error>) -> Void) {
        
        var proTrainArray = [ProTrainModel]()
        
        let cql = "select * from trainrecord where userid = '\(objectId)' order by created desc"
        
        _ = LCCQLClient.execute(cql) { result in
            switch result {
            case .success(let result):
                let todos = result.objects
                for iii in 0..<todos.count {
                    let title = todos[iii]["trainTitle"]?.stringValue
                    let min = todos[iii]["trainMin"]?.intValue
                    let img = todos[iii]["trainImg"]?.stringValue
                    let date = todos[iii]["createdAt"]?.dateValue
                    let item = ProTrainModel(title: title!, img: img!, date: date!, time: min!)
                    
                    proTrainArray.append(item)
                    
                }
                completion(Result.success(proTrainArray))
            case .failure(let error):
                completion(Result.failure(error))
            }
        }
    }
    
    func saveGameRecord(_ teams: [playerRecordModel], completion: @escaping (Bool, Error?) -> Void) {
        do {
            let todo = LCObject(className: "gamerecord")
            try todo.set("userid", value: objectId)
            var dataObject = [String:[Int]]()
            for team in teams {
                dataObject[team.name] = team.score
            }
            try todo.set("record", value: dataObject)
            let _ = todo.save {(result) in
                switch result {
                case .success:
                    completion(true, nil)
                case .failure(let error):
                    completion(false, error)
                }
            }
        } catch {
            // handle error
        }
    }
    
    func toArray(_ value: [LCArray.Element]) -> [LCValueConvertible] {
        let array = value.map { element in element }
        return array
    }
    
    func getGameRecord(completion: @escaping (Result<[ProGRecordModel], Error>) -> Void) {
        var proGReacordArray = [ProGRecordModel]()
        
        let cql = "select * from gamerecord where userid = '\(objectId)' order by created desc"
        
        _ = LCCQLClient.execute(cql) { result in
            switch result {
            case .success(let result):
                let todos = result.objects
                for iii in 0..<todos.count {
                    var playerModel = [playerRecordModel]()
                    let dataString = todos[iii]["record"]!.jsonString.data(using: .utf8)
                    let dict = try! JSONSerialization.jsonObject(with: dataString!, options: .allowFragments) as! [String:[Int]]
                    var hold = 0
                    for (key, value) in dict {
                        playerModel.append(playerRecordModel(name: key, score: value, toggle: false))
                        hold = value.count
                    }
                    
                    let item = ProGRecordModel(teams: playerModel, hold: hold)

                    proGReacordArray.append(item)
                    
                }
                completion(Result.success(proGReacordArray))
            case .failure(let error):
                completion(Result.failure(error))
            }
        }
        
    }
    
//    func getPrivacy(completion: @escaping (PrivacyModel?, Error?) -> Void) {
//        let query = LCQuery(className: "Privacy")
//        let _ = query.getFirst { (result) in
//            switch result {
//            case .success(object: let object):
//                // get value by string key
//                guard let title = object.get("title")?.stringValue else {
//                    completion(nil, nil)
//                    return
//                }
//                guard let privacy = object.get("privacy_address")?.stringValue else {
//                    completion(nil, nil)
//                    return
//                }
//                let beginModel = PrivacyModel(title: title, privacy: privacy)
//                completion(beginModel, nil)
//            case .failure(error: let error):
//                completion(nil, error)
//            }
//        }
//    }
}


