//
//  APIRouter.swift
//  HandySwift
//
//  Created by Lusine Magauzyan on 07.02.23.
//

import Foundation

enum APIRouter {
    case getAuthorities
    case getRatings
    case getEstablishments(authorityId: Int)

    var host: String {
        switch self {
        case .getAuthorities, .getRatings, .getEstablishments:
            return "api.ratings.food.gov.uk"
        }
    }

    var scheme: String {
        switch self {
        case .getAuthorities, .getRatings, .getEstablishments:
            return "https"
        }
    }

    var path: String {
        switch self {
        case .getAuthorities:
            return "/authorities/basic"
        case .getRatings:
            return "/ratings"
        case .getEstablishments:
            return "/establishments"
        }
    }

    var method: String {
        switch self {
        case .getAuthorities, .getRatings, .getEstablishments:
            return "GET"
        }
    }

    var parameters: [URLQueryItem] {
        switch self {
        case .getAuthorities, .getRatings:
            return []
        case .getEstablishments(let authorityId):
            return [URLQueryItem(name: "localAuthorityId", value: "\(authorityId)")]
        }
    }
}
