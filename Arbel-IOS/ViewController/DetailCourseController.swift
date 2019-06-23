//
//  DetailCourseController.swift
//  Arbel-IOS
//
//  Created by Simone on 23/04/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class DetailCourseController: ButtonBarPagerTabStripViewController  {
    
    public var selectedBarWidth: CGFloat?
    
    public enum PagerTabStripBehaviour {
        case common(skipIntermediteViewControllers: Bool)
        case progressive(skipIntermediteViewControllers: Bool, elasticIndicatorLimit: Bool)
    }
    
    override func viewDidLoad() {
        styleTabBar()
        
        super.viewDidLoad()
        
        var CourseCell_id = PassData.globalVariable.passData
        
        for course in Users.userLogin.success.courses {
            if (course.id == CourseCell_id) {
                self.navigationItem.title = "\(course.year)° " + "\(course.course)".uppercased()
            }
        }
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child1 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StudentTab") as! StudentTabController
        let child2 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TestTab") as! TestTabController
        let child3 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ActivityTab") as! ActivityTabController
        return [child1, child2, child3]
    }
    
    func styleTabBar() {
        // Sets the background colour of the pager strip and the pager strip item
        settings.style.buttonBarBackgroundColor = UIColor(white: 1, alpha: 0)
        settings.style.buttonBarItemBackgroundColor = UIColor(white: 1, alpha: 0)
        
        // Sets the pager strip item font and font color
        settings.style.buttonBarItemFont = .boldSystemFont (ofSize: 12)
        settings.style.buttonBarItemTitleColor = .lightGray
        
        // Sets the pager strip item offsets
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemsShouldFillAvailableWidth = false
        settings.style.buttonBarLeftContentInset = 20
        settings.style.buttonBarRightContentInset = 0
        settings.style.buttonBarMinimumInteritemSpacing = 20
        settings.style.buttonBarHeight = 27
        settings.style.selectedBarHeight = 2
        settings.style.selectedBarBackgroundColor = .white
        
        // Changing item text color on swipe
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = UIColor(white: 1, alpha: 0.7)
            newCell?.label.textColor = .white
        }
    }
}
