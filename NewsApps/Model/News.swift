//
//  Articles.swift
//  NewsApps
//
//  Created by Muhammad Adhi on 19/01/22.
//

import Foundation

struct News: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Articles]
}

struct Articles: Decodable {
    let author:String?
    let title:String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String?
    let source: Source
}

struct Source: Decodable {
    let name: String
}
