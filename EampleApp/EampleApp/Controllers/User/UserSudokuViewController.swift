//
//  UserSudokuViewController.swift
//
//  Created by midoks on 15/8/20.
//  Copyright © 2015年 midoks. All rights reserved.
//

import UIKit


//九宫格视图
class UserSudokuViewController: UIViewController, SudokuViewDelegate {
    
    var tmpBarColor:UIColor?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "九宫格验证"
        self.view.backgroundColor = UIColor(red: 35/255.0, green: 39/255.0, blue: 54/255.0, alpha: 1)
        
        tmpBarColor = UINavigationBar.appearance().barTintColor
        UINavigationBar.appearance().barTintColor = UIColor(red: 35/255.0, green: 39/255.0, blue: 54/255.0, alpha: 1)
        
        
        let leftButton = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.plain, target: self, action: #selector(UserSudokuViewController.close(_:)))
        self.navigationItem.leftBarButtonItem   = leftButton
        
        let sudoku = SudokuView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        sudoku.delegate = self
        
        //设置正确的密码
        //如果正在设置密码,就不需要填写了
        sudoku.setPwd("012345678")
        self.view.addSubview(sudoku)
    }
    
    
    func SudokuViewFail(_ pwd: NSString, status: NSString) {
        NSLog("pwd:%@, status:%@", pwd, status)
    }
    
    func SudokuViewOk(_ pwd: NSString, status: NSString) {
        NSLog("pwd:%@, status:%@", pwd, status)
        
        if("end" == status){
            noticeText("您的结果", text: pwd as NSString, time: 2.0)
        }
    }
    
    
    //离开本页面
    override func viewWillDisappear(_ animated: Bool) {
        UINavigationBar.appearance().barTintColor = tmpBarColor
    }
    
    //关闭
    func close(_ button: UIButton){
        self.dismiss(animated: true) { () -> Void in
            //print("close")
        }
    }
    
    
}
