//
//  InternetConnection.swift
//  Park-aholic
//
//  Copyright (c) 2014-2017 Alamofire Software Foundation (http://alamofire.org/)
//

import Foundation
import Alamofire

public class Reachability {
    func isConnectedToNetwork() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
