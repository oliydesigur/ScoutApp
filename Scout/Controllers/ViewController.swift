//
//  ViewController.swift
//  Scout
//
//  Created by Stefan Olaru on 31/08/2017.
//  Copyright © 2017 Stefan Olaru. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // MARK: - Vars
    @IBOutlet weak var grayView: UIView!
    var ballView: UIImageView!
    var snap: UISnapBehavior!
    var gravity: UIGravityBehavior!
    var animator: UIDynamicAnimator!
    var collision: UICollisionBehavior!
    var itemBehaviour: UIDynamicItemBehavior!
    
    // MARK: - Lifecycle Methods -
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //For the first screen hide the navigation bar
        navigationController?.navigationBar.isHidden = true
        animateBall()
    }
    
    
    // MARK: - Private functions -
    private func animateBall() {
        ballView = UIImageView(frame: CGRect(x: view.frame.size.width / 2 - 75, y: 0, width: 150, height: 150))
        ballView.image = UIImage(named: "ball2.png")
        ballView.contentMode = .scaleAspectFit
        ballView.isUserInteractionEnabled = true
        view.addSubview(ballView)
        ballView.startRotating()
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [ballView])
        animator.addBehavior(gravity)
        
        collision = UICollisionBehavior(items: [ballView])
        collision.translatesReferenceBoundsIntoBoundary = true
        collision.addBoundary(withIdentifier: "bottomBoundary" as NSCopying , from: CGPoint.init(x: 0, y: grayView.frame.origin.y + 38), to: CGPoint.init(x: view.frame.size.width, y: grayView.frame.origin.y + 38))
        
        animator.addBehavior(collision)
        
        itemBehaviour = UIDynamicItemBehavior(items: [ballView])
        itemBehaviour.elasticity = 0.7
        animator.addBehavior(itemBehaviour)
        let when = DispatchTime.now() + 0.7
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.ballView.stopRotating()
        }
    }
    
    @IBAction func handleTap(_ sender: UITapGestureRecognizer) {
        
        let tapPoint: CGPoint = sender.location(in: view)
        
        if (snap != nil) {
            animator.removeBehavior(snap)
        }
        
        snap = UISnapBehavior(item: ballView, snapTo: tapPoint)
        animator.addBehavior(snap)
    }
    
}


