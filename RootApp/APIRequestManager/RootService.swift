//
//  RootService.swift
//  RootApp
//
//  Created by Sarankumar on 04/11/19.
//  Copyright © 2019 Saran. All rights reserved.
//

import Foundation
import Alamofire

enum HeadersType {
    case General
    case None
}

func HTTPHeaders(forType type: HeadersType) -> [String: String]? {
    let headers: [String: String] = [:]
    switch type {
    case .General: break
    case .None: break
    }
    return headers
}

class RootService: NSObject {
    class func request(
        _ url: URLConvertible,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        headersType: HeadersType,
        _ completionHandler: @escaping CompletionHandler) {
        var encoding: ParameterEncoding = URLEncoding.default
        switch method {
        case .get, .delete:
            break
        case .post, .patch, .put:
            encoding = JSONEncoding.default
        default:
            break
        }
        guard let headers = HTTPHeaders(forType: headersType) else {
            completionHandler(false, nil, nil)
            return
        }
        let _ = Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).responseJSON { (response) in
            guard let httpResponse = response.response else {
                if let error = response.error as NSError?, error.code == kNoInternetConnection {
                    completionHandler(false, nil, error)
                } else {
                    let error = NSError(domain: "No response", code: kEmptyResponseErrorCode, userInfo: nil)
                    completionHandler(false, nil, error)
                }
                return
            }
            var isSuccess = false
            switch httpResponse.statusCode {
            case 200 ... 299:
                isSuccess = true
            case 400 ... 499:
                RootService.error(url, method: method, parameters: parameters, headers: headers, HttpStatusCode: httpResponse.statusCode, response: response.result.value as AnyObject?)
            case 500 ... 599:
                RootService.error(url, method: method, parameters: parameters, headers: headers, HttpStatusCode: httpResponse.statusCode, response: response.result.value as AnyObject?)
            default:
                print("unknown error \(httpResponse.statusCode)")
            }
            completionHandler(isSuccess, response.result.value as AnyObject?, response.error as NSError?)
        }
    }
    
    class func error(
        _ url: URLConvertible,
        method: HTTPMethod,
        parameters: Parameters?,
        headers: HTTPHeaders?,
        HttpStatusCode: Int,
        response: AnyObject?) {
        var errorLog = ["Description": "The request failed",
                        "HttpStatusCode": HttpStatusCode,
                        "URL": url,
                        "Method": method,
                        "Parameters": parameters ?? "No Params"] as [String : Any]
        if let JSONResponse = response {
            errorLog["Response"] = JSONResponse
        }
        if let headersInfo = headers {
            errorLog["Headers"] = headersInfo
        }
    }
}
