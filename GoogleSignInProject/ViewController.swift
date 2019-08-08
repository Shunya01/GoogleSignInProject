//
//  ViewController.swift
//  GoogleSignInProject
//
//  Created by 渡邉舜也 on 07/08/2019.
//  Copyright © 2019 渡邉舜也. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //おまじない
        GIDSignIn.sharedInstance()?.uiDelegate = self
        GIDSignIn.sharedInstance()?.delegate = self
    }

}

extension ViewController:GIDSignInDelegate,GIDSignInUIDelegate{
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        //エラーの確認
        if let error = error {
            //errorがnilでない場合（エラーがある場合）
            print("Google Sign In でエラーが発生しました")
            print(error.localizedDescription)
            return
        }
        
        //Googleサインインの準備（トークンの取得）
        //ユーザー情報の取得
        let authentication = user.authentication
        //Googleのトークンの取得
        let credential = GoogleAuthProvider.credential(withIDToken: authentication!.idToken, accessToken: authentication!.accessToken)
        
        
        //Googleでログインする。Firebaseにログイン情報を書き込む
        Auth.auth().signIn(with: credential) {(AuthDataResult,error)
            in
            
            if let error = error{
                print("失敗")
                print(error.localizedDescription)
            }else{
                print("成功")
                //selfとはViewControllerを指す
                self.performSegue(withIdentifier: "toHome", sender: nil)
            }
            
        }
        
    }
    
    
    
}
