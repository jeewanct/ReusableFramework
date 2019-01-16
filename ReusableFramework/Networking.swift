//
//  Networking.swift
//  ReusableFramework
//
//  Created by JEEVAN TIWARI on 13/12/18.
//  Copyright © 2018 Book My Saloon. All rights reserved.
//

import Foundation
import RxSwift

open class Network: NSObject{
    
    public static let shared = Network()
    
    //MARK: RxSwift
   open  func get<T: Codable>( apiRequest: APIRequest) -> Observable<T>{
        let networkObservable = Observable<T>.create{
            observable in
            
            let request = apiRequest.request(with: Constants.baseUrl)
            
            let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                do{
                    let json = try JSONDecoder().decode(T.self, from: data ?? Data())
                    observable.onNext(json)
                }catch let jsonError{
                    observable.onError(jsonError)
                }
                observable.onCompleted()
            })
            
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
            
        }
        return networkObservable
    }
    
 open   func post<T: Decodable>(apiRequest: APIRequest) -> Observable<T>{
        let networkObservable = Observable<T>.create{
            observable in
            
            let request = apiRequest.request(with: Constants.baseUrl)
            let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                do{
                    let json = try JSONDecoder().decode(T.self, from: data ?? Data())
                    observable.onNext(json)
                }catch let jsonError{
                    observable.onError(jsonError)
                }
                observable.onCompleted()
            })
            
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
            
        }
        return networkObservable
}

}


open class EncodeData{
    open class func getData<T: Codable>(parameters: T) -> (Data?, NetworkError?){
        
        do{
            let encodedData = try JSONEncoder().encode(parameters.self)
            return (encodedData, nil)
        }catch _ {
            return (nil, NetworkError.encodingError)
        }
       
    }
    
}
