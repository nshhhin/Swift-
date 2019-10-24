//
//  ViewController.swift
//  GetAccelerationSample
//
//  Created by 新納真次郎 on 2019/10/04.
//  Copyright © 2019 新納真次郎. All rights reserved.
//

import UIKit
import CoreMotion
import BackgroundTasks
import VisionKit

class ViewController: UIViewController, VNDocumentCameraViewControllerDelegate {

    // MotionManager
    let motionManager = CMMotionManager()

    var backgroundTaskID : UIBackgroundTaskIdentifier = UIBackgroundTaskIdentifier(rawValue: 0)

    override func viewDidLoad() {
        super.viewDidLoad()

        let documentCameraViewController = VNDocumentCameraViewController()
        documentCameraViewController.delegate = self
        present(documentCameraViewController, animated: true)

        // Do any additional setup after loading the view, typically from a nib.

//        self.backgroundTaskID = UIApplication.shared.beginBackgroundTask(expirationHandler: nil)
//
//        if motionManager.isAccelerometerAvailable {
//            // 加速度センサーの値取得間隔
//            motionManager.accelerometerUpdateInterval = 0.1
//
//            // motionの取得を開始
//            motionManager.startAccelerometerUpdates(to: OperationQueue.current!, withHandler: { (data, error) in
//                // 取得した値をコンソールに表示
//                print("x: \(data?.acceleration.x) y: \(data?.acceleration.y) z: \(data?.acceleration.z)")
//            })
//        }
    }



}

