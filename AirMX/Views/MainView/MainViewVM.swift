//
//  MainViewVM.swift
//  AirMX
//
//  Created by Mark Trance on 5/14/23.
//

import Foundation
import Combine
import FirebaseAuth

@Observable
final class MainViewVM: ObservableObject {
    var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        AuthManager.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }.store(in: &cancellables)
    }
}
