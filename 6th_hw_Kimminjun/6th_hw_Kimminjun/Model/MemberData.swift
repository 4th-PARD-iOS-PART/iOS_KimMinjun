//
//  MemberData.swift
//  6th_hw_Kimminjun
//
//  Created by 김민준 on 10/28/24.
//

import Foundation


struct ApiResponse: Codable {
    let status: String
    let data: [MemberData]
}

struct MemberData : Codable {
    var id : Int?
    var name : String
    var part : String
    var age : Int
}
