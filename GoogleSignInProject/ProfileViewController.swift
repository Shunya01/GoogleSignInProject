//
//  ProfileViewController.swift
//  GoogleSignInProject
//
//  Created by 渡邉舜也 on 08/08/2019.
//  Copyright © 2019 渡邉舜也. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var mailLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //ログインしているユーザー情報の取得
        let user = Auth.auth().currentUser!
        
        do{
            //プロフィール写真の設定
            //URLから写真データを取得
            let imageData = try Data(contentsOf: user.photoURL!)
            //写真データから画像を設定
            let image = UIImage(data: imageData)
            imageView.image = image
            //メールアドレスの設定
            mailLabel.text = user.email
            //名前に設定
            nameLabel.text = user.displayName
        } catch let error{
          //何かしらのエラーが発生した場合、こちらを処理
            print(error.localizedDescription)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
