//
//  NetworkError.swift
//  ReusableFramework
//
//  Created by JEEVAN TIWARI on 20/12/18.
//  Copyright © 2018 Book My Saloon. All rights reserved.
//

import Foundation


public enum NetworkError: String{
    
    case noInternet = "You are offline."
    case invalidUrl = "Seems your url is invlaid."
    case parsingError = "Json Decoder fail to decode."
    case encodingError = "Couldn't encode give data."
}
