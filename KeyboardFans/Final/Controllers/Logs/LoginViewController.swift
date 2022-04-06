//
//  LoginViewController.swift
//  Final
//
//  Created by 張明璿 on 2022/3/21.
//
import UIKit
import FBSDKLoginKit
import AuthenticationServices
import GoogleSignIn
import Kingfisher

class LoginViewController: UIViewController {
    
    @IBOutlet weak var appleLoginButton: UIButton!
    @IBOutlet weak var fbLoginButton: UIButton!
    @IBOutlet weak var googleSigninButton: UIButton!
    
    var loadingView: UIView?
    let signInConfig = GIDConfiguration.init(clientID: "765320809392-gqc0d6n9vtuu37eflhauj71d9di9v06h.apps.googleusercontent.com")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

       
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

       
    }
    
    @IBAction func applePressed(_ sender: Any) {
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.fullName, .email]
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.performRequests()
    }
    
    
    @IBAction func googlePressed(_ sender: Any) {
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) {  user, error in
            guard error == nil else { return }
            guard let user = user else { return }
            
            let emailAddress = user.profile?.email
            let fullName = user.profile?.name
            
            let profilePicUrl = user.profile?.imageURL(withDimension: 320)
            User.currenUser.setInfo(name: "\(fullName!)", email: "\(emailAddress!)", pictureURL: "\(profilePicUrl!)", method: "Google")
            
        }
        
    }


//    @IBAction func FBPressed(_ sender: Any) {
//        let loginManager = LoginManager()
//
//        loginManager.logIn(permissions: [.publicProfile, .email, .userPhotos], viewController : nil) { loginResult in
//            switch loginResult {
//            case .failed(let error):
//                print(error)
//            case .cancelled:
//                print("-------User cancelled login")
//            case .success(granted: _, declined: _, token: _):
//                self.getUserInfoByFacebook()
//
//            }
//        }
//
//    }
    func handleLogInWithAppleID() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }
    func getUserInfoByFacebook(){
        print("-------Logged in")
        if let accessToken = AccessToken.current {
            Profile.loadCurrentProfile { (profile, error) in
                if let profile = profile {
                    
                    User.currenUser.setInfo(name: "\(profile.name!)", email: "\(profile.email!)", pictureURL: "\(profile.imageURL(forMode: .normal, size: CGSize(width: 150, height: 150))!)", method: "Facebook")
                }
            }
        }
        //self.toAnotherVC()
    }
    func getUserInfoByGoogle(){
        print("-------Logged in")
        let request = GraphRequest.init(graphPath: "me", parameters: ["fields":"name, email"]).start { connection, result, error in
            let result = result as! NSDictionary
            print(result)
        }
        if let accessToken = AccessToken.current {
            
            print("-----------userID: \(accessToken.userID)")
            print("-----------tokenString: \(accessToken.tokenString)")
            
            
        } else {
            print("not login")
        }
    }


}

extension LoginViewController: ASAuthorizationControllerPresentationContextProviding, ASAuthorizationControllerDelegate {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return ASPresentationAnchor()
    }
    
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            let userIdentifier = appleIDCredential.user
            
            
            let defaults = UserDefaults.standard
            defaults.set(userIdentifier, forKey: "userIdentifier")
            
            if let userIdentifier = UserDefaults.standard.object(forKey: "userIdentifier") as? String {
                let authorizationProvider = ASAuthorizationAppleIDProvider()
                authorizationProvider.getCredentialState(forUserID: userIdentifier) { (state, error) in
                    switch (state) {
                    case .authorized:
                        print("Account Found - Signed In")
                        break
                    case .revoked:
                        print("No Account Found")
                        fallthrough
                    case .notFound:
                        print("No Account Found")
                    default:
                        break
                    }
                }
            }
            //Save the UserIdentifier somewhere in your server/database
            
            User.currenUser.setInfo(name: "Henry Lin", email: "zero2005x@gmail.com", pictureURL: "", method: "Apple")
            
           // self.toAnotherVC()
            
            break
        default:
            break
        }
    }
}
