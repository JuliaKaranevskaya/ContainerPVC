////
////  SplashPresenter.swift
////  ContainerPVC
////
////  Created by Юлия Караневская on 6.10.21.
////
//
//import UIKit
//
//protocol SplashPresenterDescription {
//    func present()
//    func dismiss(completion: (() -> Void)?)
//}
//
//@available(iOS 13.0, *)
//class SplashPresenter: SplashPresenterDescription {
//
//    private lazy var foregroundSplashWindow: UIWindow = {
//        let splashWindow = UIWindow()
//
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//
//        let splashVC = storyboard.instantiateViewController(identifier: "SplashViewController") as? SplashViewController
//
//        splashWindow.windowLevel = .normal + 1
//        splashWindow.rootViewController = splashVC
//
//        return splashWindow
//    }()
//
//
//
//    func present() {
//        foregroundSplashWindow.isHidden = false
//
//        let splashVC = foregroundSplashWindow.rootViewController as? SplashViewController
//
//        UIView.animate(withDuration: 0.3) {
//            splashVC?.logoImage.transform = CGAffineTransform(scaleX: 88 / 72, y: 88 / 72)
//        }
//    }
//
//    func dismiss(completion: (() -> Void)?) {
//
//        guard let window = UIApplication.shared.delegate?.window, let mainWindow = window else {
//            return
//        }
//
//        self.foregroundSplashWindow.alpha = 0
//
//        let mask = CALayer()
//        mask.contents = SplashViewController.logoImage
//        window?.layer.mask = mask
//
//    }
//
//
//}
