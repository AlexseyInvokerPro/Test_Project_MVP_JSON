//
//  ImageAndComments.swift
//  Test_project_MVP_JSON
//
//  Created by Алексей Авдейчик on 11.10.21.
//

import Foundation

struct ImageAndComments: Decodable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}
