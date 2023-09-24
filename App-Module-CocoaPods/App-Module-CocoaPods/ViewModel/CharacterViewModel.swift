//
//  CharacterViewModel.swift
//  App-Module-CocoaPods
//
//  Created by Paulo Pinheiro on 9/23/23.
//

import Foundation
import Network

protocol CharacterViewModel: ObservableObject {
    func getCharacters() async
}

//protocol CharacterService {
//   func fetchAllCharacters() async throws -> [Character]
//    init()
//}

@MainActor
final class CharacterViewModelImpl: CharacterViewModel {
    
    
    enum State {
        case na
        case loading
        case success(data: [Character])
        case failed(error: Error)
    }
    
    @Published private(set) var state: State = .na
    @Published var hasError: Bool = false
    
    // Handle Errors with the alert
    let service: CharacterService
    
    init(service: CharacterService) {
        self.service = service
    }
    
    func getCharacters() async {
        self.state = .loading
        self.hasError = false
        do {
            let data = try await service.fetchAllCharacters()
            self.state = .success(data: data)
        } catch {
            self.state = .failed(error: error)
            self.hasError = true
        }
    }
}
