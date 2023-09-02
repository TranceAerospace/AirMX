//
//  SignInWithGoogleHelper.swift
//  AirMX
//
//  Created by Mark Trance on 8/30/23.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift


final class SignInWithGoogleHelper {
    
    @MainActor
    func signIn() async throws -> GoogleSignInResultModel {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first,
              let rootViewController = window.rootViewController else {
            print("There is no root view controller")
            throw AuthenticationError.tokenError(message: "There is no root view controller")
            //return false
        }
        do {
            let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
            guard let idToken = gidSignInResult.user.idToken?.tokenString else {
                throw AuthenticationError.tokenError(message: "ID token missing")
            }
            
            let accessToken = gidSignInResult.user.accessToken.tokenString
            let tokens = GoogleSignInResultModel(idToken: idToken, accessToken: accessToken)
            return tokens
        }
    }
    
    enum AuthenticationError: Error {
        case tokenError(message: String)
    }
}
