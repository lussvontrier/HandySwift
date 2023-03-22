//
//  APIClients.swift
//  HandySwift
//
//  Created by Lusine Magauzyan on 07.02.23.
//

protocol AuthorityProtocol {
    func getAuthorities() async throws -> [Authority]
}

protocol RatingProtocol {
    func getRatings(schemeTypeId: Int) async throws -> [Rating]
}

protocol EstablishmentProtocol {
    func getEstablishments(authorityId: Int) async throws -> [Establishment]
}

class AuthorityClient: AuthorityProtocol {
    
    func getAuthorities() async throws -> [Authority] {
        let response: AuthoritiesResponse = try await APIRequestDispatcher.request(apiRouter: .getAuthorities)
        return response.authorities
    }
}

class RatingClient: RatingProtocol {

    func getRatings(schemeTypeId: Int) async throws -> [Rating] {
        let response: RatingsResponse = try await APIRequestDispatcher.request(apiRouter: .getRatings)
        return response.ratings.filter({ $0.schemeId == schemeTypeId })
    }
}

class EstablishmentClient: EstablishmentProtocol {

    func getEstablishments(authorityId: Int) async throws -> [Establishment] {
        let response: EstablishmentResponse = try await APIRequestDispatcher.request(apiRouter: .getEstablishments(authorityId: authorityId))
        return response.establishments
    }
}
