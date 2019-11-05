//
//  Constants.swift
//  RootApp
//
//  Created by Sarankumar on 04/11/19.
//  Copyright © 2019 saran. All rights reserved.
//

import Foundation
import UIKit

let AppDelegateInstance = UIApplication.shared.delegate as! AppDelegate
let EMPTY_STRING = ""
let EMPTY_VALUE = 0
let kEmptyResponseErrorCode = 9999
let kNoInternetConnection = -1009

//TypeAlias
typealias CompletionHandler = (_ success: Bool, _ result: Any?, _ error: NSError?) -> Void
typealias CompletionStatusHandler = (_ success: Bool) -> Void
public typealias JSONObject = Any
public typealias JSONArray = [JSONObject]
public typealias JSONDictionary = [String: JSONObject]
public typealias JSONArrayDictionary = [[String: JSONObject]]

// HTTP Status codes
enum HTTPStatus: NSInteger {
    case ok = 200
    case created = 201
    case accepted = 202
    case nonAuthoritativeInformation = 203
    case noContent = 204
    case resetContent = 205
    case partialContent = 206
    case multiStatus = 207
    case alreadyReported = 208
    case unauthorized = 401
    case notFound = 404
    case unprocessableEntity = 422
    case serviceUnavailable = 503
}


struct Constants {
    struct Storyboards {
        static let Main     = "Main"
    }
    struct Identifier {
    }
    struct CellIdentifier {
        static let CardCollectionViewCell = "CardCollectionViewCell"
    }
    struct NibIdentifier {
        static let CardCollectionViewCell = "CardCollectionViewCell"
    }
}
