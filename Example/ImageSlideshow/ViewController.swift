//
//  ViewController.swift
//  ImageSlideshow
//
//  Created by Petr Zvoníček on 30.07.15.
//  Copyright (c) 2015 Petr Zvonicek. All rights reserved.
//

import UIKit
import ImageSlideshow

class ViewController: UIViewController {

    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    @IBOutlet var slideshow: ImageSlideshow!

//    let localSource = [BundleImageSource(imageString: "img1"), BundleImageSource(imageString: "img2"), BundleImageSource(imageString: "img3"), BundleImageSource(imageString: "img4"), BundleImageSource(imageString: "img5")]
//    let afNetworkingSource = [AFURLSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, AFURLSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, AFURLSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!]
//    let alamofireSource = [AlamofireSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, AlamofireSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, AlamofireSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!]
//    let sdWebImageSource = [SDWebImageSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, SDWebImageSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, SDWebImageSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!]
    let kingfisherSource = [KingfisherSource(urlString: "http://1.bp.blogspot.com/-hNC-oT6f-fY/TeXxO26yjvI/AAAAAAAAAOY/qfkOqdKkBi8/s1600/platon-photographer-putin-man-of-the-year-portrait.jpg")!, KingfisherSource(urlString: "http://1.bp.blogspot.com/-hNC-oT6f-fY/TeXxO26yjvI/AAAAAAAAAOY/qfkOqdKkBi8/s1600/platon-photographer-putin-man-of-the-year-portrait.jpg")!, KingfisherSource(urlString: "http://1.bp.blogspot.com/-hNC-oT6f-fY/TeXxO26yjvI/AAAAAAAAAOY/qfkOqdKkBi8/s1600/platon-photographer-putin-man-of-the-year-portrait.jpg")!, KingfisherSource(urlString: "http://1.bp.blogspot.com/-hNC-oT6f-fY/TeXxO26yjvI/AAAAAAAAAOY/qfkOqdKkBi8/s1600/platon-photographer-putin-man-of-the-year-portrait.jpg")!]

    override func viewDidLoad() {
        super.viewDidLoad()

        slideshow.slideshowInterval = 5.0
        slideshow.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        slideshow.contentScaleMode = UIViewContentMode.scaleAspectFill

        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.lightGray
        pageControl.pageIndicatorTintColor = UIColor.black
        slideshow.pageIndicator = pageControl

        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        slideshow.activityIndicator = DefaultActivityIndicator()
        slideshow.delegate = self

        // can be used with other sample sources as `afNetworkingSource`, `alamofireSource` or `sdWebImageSource` or `kingfisherSource`
        slideshow.setImageInputs(kingfisherSource)

        let recognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.didTap))
        slideshow.addGestureRecognizer(recognizer)
        
        
        for i in 0..<self.slideshow.slideshowItems.count {
            let item = self.slideshow.slideshowItems[i]
            item.imageView.alignment = i%2 == 0 ? .top : .center
        }
    }

    @objc func didTap() {
        let fullScreenController = slideshow.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }
}

extension ViewController: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {        
        print("current page:", page)
    }
}
