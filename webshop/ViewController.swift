//
//  ViewController.swift
//  webshop
//
//  Created by cmStudent on 2022/01/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var firstCategory: UIButton!
    @IBOutlet var secondCategory: UIButton!
    @IBOutlet var thirdCategory: UIButton!
    @IBOutlet var forceCategory: UIButton!
    
    var categoryList = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCategoryList()
        setUpCategory()
    }
    
    private func setUpCategoryList() {
        categoryList.append(firstCategory)
        categoryList.append(secondCategory)
        categoryList.append(thirdCategory)
        categoryList.append(forceCategory)
    }
    
    private func setUpCategory() {
        let url: URL = URL(string: "https://20cm0119.main.jp/WebShop/jsonCategory.php")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            do {
                let data = try JSONDecoder().decode([GoodsCategory].self, from: data!)
                // 呼び出す
                DispatchQueue.main.async {
                    for i in 0 ..< data.count {
                        self.categoryList[i].setTitle(data[i].categoryname, for: .normal)
                    }
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
