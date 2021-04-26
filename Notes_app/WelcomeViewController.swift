//
//  WelcomeViewController.swift
//  Notes_app
//
//  Created by Vasilis Skarleas on 30/3/21.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var holderView: UIView!
    
    let scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configure()
    }
    
    private func configure() {
        //set up scroll view
        
        scrollView.frame = holderView.bounds
        holderView.addSubview(scrollView)
        
        
        //pageview controler variable set up
        let titles = ["Welcome", "Apple Pencil", "Secure"]
        let descriptions = ["The memories app is a new way to keep", "If you are using an iPad, the Memories", "Your diary lives in your device."]
        let descript = ["you diary. It's your on-device diary", "app support all the scrible functions", "Nothing gets out of your device"]
        for x in 0..<3 {
            let pageView = UIView(frame: CGRect(x: CGFloat(x) * (holderView.frame.size.width), y: 0, width: holderView.frame.size.width, height: holderView.frame.size.height))
            scrollView.addSubview(pageView)
            
            //title, image, descriptions
            let label = UILabel (frame: CGRect(x: 10, y: 10, width: pageView.frame.size.width-20, height: 120))
            let label1 = UILabel (frame: CGRect(x: 10, y: 90, width: pageView.frame.size.width-20, height: 100))
            let label2 = UILabel (frame: CGRect(x: 10, y: 115, width: pageView.frame.size.width-20, height: 100))
            let imageView = UIImageView(frame: CGRect(x: 10, y: 20+120+10, width: pageView.frame.size.width-20, height: pageView.frame.size.height - 60 - 130 - 15))
            let button = UIButton(frame: CGRect(x: 10, y: pageView.frame.size.height-60, width: pageView.frame.size.width-20, height: 50))
            
            label.textAlignment = .center
            label.font = UIFont(name: "Helvetica-Bold", size: 32)
            pageView.addSubview(label)
            label.text = titles[x]
            
            label1.textAlignment = .center
            label1.font = UIFont (name: "Helvetica", size: 18)
            label1.textColor = .systemGray
            pageView.addSubview(label1)
            label1.text = descriptions[x]
            
            label2.textAlignment = .center
            label2.font = UIFont (name: "Helvetica", size: 18)
            label2.textColor = .systemGray
            pageView.addSubview(label2)
            label2.text = descript[x]
            
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: "welcome_\(x+1)")
            pageView.addSubview(imageView)
            
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            button.layer.cornerRadius = 10
            button.layer.borderWidth = 0
            button.backgroundColor = .systemGray
            button.setTitle("Continue", for: .normal)
            if x == 2 {
                button.setTitle("Let's go", for: .normal)
            }
            button.addTarget(self, action: #selector(didTapButton(button:)), for: .touchUpInside)
            button.tag = x+1
            pageView.addSubview(button)
        }
        
        scrollView.contentSize = CGSize(width: holderView.frame.size.width*3, height: 0)
        scrollView.isPagingEnabled = true
        
    }
    
    @objc func didTapButton( button: UIButton) {
        guard button.tag < 3 else {
            //dismiss and open the main application
            Core.shared.setIsNotNewUser()
            dismiss(animated: true, completion: nil)
            return
        }
        //scroll to next page
        scrollView.setContentOffset(CGPoint(x: holderView.frame.size.width * CGFloat(button.tag), y: 0), animated: true)
    }
    

}
