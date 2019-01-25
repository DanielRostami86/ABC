//
//  cellArticlesViewModel.swift
//  ABCEngineering
//
//  Created by Daniel  on 25/1/19.
//  Copyright © 2019 Australian Broadcasting Corporation. All rights reserved.
//

import Foundation

struct cellArticlesViewModel {
    
    let title: String
    let synopsis: String
    let href: String
    let publishedDate: String
    
    init(data:Article) {
        
        title = data.title
        synopsis = data.synopsis
        href = data.href
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.doesRelativeDateFormatting = true
        publishedDate = formatter.string(from: data.publishedDate)
    }
}
