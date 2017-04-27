//
//  DraggableImageView.swift
//  codepath_Tinder
//
//  Created by Anisha Jain on 4/26/17.
//  Copyright © 2017 Anisha Jain. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!

    var imageCenter: CGPoint?
    var image: UIImage? {
        get { return imageView.image }
        set { imageView.image = newValue }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {
        // standard initialization logic
        let nib = UINib(nibName: "DraggableImageView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
            
    }
    
    @IBAction func onPanGesture(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: contentView)
        let translation = sender.translation(in: superview)
        //let velocity = sender.velocity(in: superview)
        if sender.state == .began {
            imageCenter = imageView.center
        } else if sender.state == .changed {
            if location.y < imageView.frame.height / 2 {
                //imageView.center = CGPoint(x: imageCenter!.x + translation.x, y: imageCenter!.y)
                let degrees = translation.x * 45 / imageView.frame.width
                let transform = CGAffineTransform(rotationAngle: degrees * .pi / 180)
                imageView.transform = transform
            } else {
                let tranX = -translation.x
                let degrees = (tranX * 135 / imageView.frame.width)
                let transform = CGAffineTransform(rotationAngle: degrees * .pi / 180)
                imageView.transform = transform
            }
        } else if sender.state == .ended {
            if translation.x > 50 {
                UIView.animate(withDuration: 0.4, animations: { 
                    self.imageView.center = CGPoint(x: (self.superview?.frame.size.width)! + self.imageView.frame.width, y: self.imageCenter!.y)
                })
            } else if translation.x < 50 {
                UIView.animate(withDuration: 0.4, animations: { 
                    self.imageView.center = CGPoint(x: -(self.superview?.frame.size.width)! - self.imageView.frame.width, y: self.imageCenter!.y)
                })
            } else {
                imageView.transform = CGAffineTransform.identity
                imageView.center = imageCenter!
            }
        }
    }
    
   }
