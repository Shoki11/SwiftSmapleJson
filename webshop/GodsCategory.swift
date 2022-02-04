//
//  GodsCategory.swift
//  webshop
//
//  Created by cmStudent on 2022/01/26.
//

import Foundation

struct GoodsCategory: Decodable {
    /// カテゴリのid
    let categoryid: String
    /// カテゴリの名前
    let categoryname: String
}
