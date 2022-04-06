//
//  File.swift
//  
//
//  Created by Dhruv Jaiswal on 04/04/22.
//

import Foundation
public class TorusNodePub:Equatable {
    public static func == (lhs: TorusNodePub, rhs: TorusNodePub) -> Bool {
        return lhs.X == rhs.X && lhs.Y == rhs.Y
    }
    
    private let X : String;
    private let Y : String;
    
    public init(_X : String, _Y : String) {
        self.X = _X;
        self.Y = _Y;
    }

    public func getX() -> String {
        return X;
    }

    public func getY() -> String {
        return Y;
    }
}
