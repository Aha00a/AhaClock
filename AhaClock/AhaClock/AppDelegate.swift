//
//  AppDelegate.swift
//  AhaClock
//
//  Created by KIM, Aha on 2019/10/20.
//  Copyright © 2019 KIM, Aha. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.variableLength)
    var timer = Timer()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            self.statusItem.button?.title =  dateFormatterGet.string(from:  Date())
        })
        statusItem.button?.action = #selector(self.setting(_:))
        let menu = NSMenu()

//        menu.addItem(NSMenuItem(title: "Open Date & Time Prefrences...", action: #selector(AppDelegate.setting(_:)), keyEquivalent: "p"))
//        menu.addItem(NSMenuItem(title: "Settings...", action: #selector(AppDelegate.setting(_:)), keyEquivalent: ","))
//        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))

        statusItem.menu = menu

    }

    func applicationWillTerminate(_ aNotification: Notification) {
        timer.invalidate()
    }
    
    @objc func setting(_ sender: Any?) {
        print("1");
    }

}
