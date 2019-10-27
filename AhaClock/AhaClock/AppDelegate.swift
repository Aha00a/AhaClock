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
    var i = 0;

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let dateFormatterKst = DateFormatter()
        dateFormatterKst.dateFormat = "'KST' yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        dateFormatterKst.timeZone = TimeZone(abbreviation: "KST")
        let dateFormatterEst = DateFormatter()
        dateFormatterEst.dateFormat = "'EST' yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        dateFormatterEst.timeZone = TimeZone(abbreviation: "EST")
        let arrayDateFormatter = [dateFormatterKst, dateFormatterEst];

        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            self.i += 1;
            self.statusItem.button?.title = arrayDateFormatter[self.i % arrayDateFormatter.count].string(from:  Date())
        })
        statusItem.button?.action = #selector(self.setting(_:))
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Settings...", action: #selector(AppDelegate.setting(_:)), keyEquivalent: ","))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
        statusItem.menu = menu
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        timer.invalidate()
    }

    var window: NSWindow!

    @objc func setting(_ sender: Any?) {
        let contentView = ContentView()

        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.center()
        window.setFrameAutosaveName("Settings - AhaClock")
        window.title = "Settings - AhaClock"
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
    }
}
