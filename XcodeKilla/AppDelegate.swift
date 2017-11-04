//
//  AppDelegate.swift
//  KillXcode
//
//  Created by Raghav Mangrola on 11/3/17.
//  Copyright © 2017 Raghav Mangrola. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        if let button = statusItem.button {
            button.image = NSImage(named: NSImage.Name("killXcode16"))
        }
        
        createMenu()
    }
    
    @objc func createMenu() {
        let menu = NSMenu()
        
        let forceQuitXcodeMenuItem = NSMenuItem(title: "Force Quit Xcode", action: #selector(killXcode), keyEquivalent: "")
        let quitKillXcode = NSMenuItem(title: "Quit XcodeKilla", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "")
        
        menu.addItem(forceQuitXcodeMenuItem)
        menu.addItem(quitKillXcode)
        
        statusItem.menu = menu
    }
    
    @objc private func killXcode() {
        for app in NSWorkspace.shared.runningApplications {
            if app.bundleIdentifier == "com.apple.dt.Xcode" {
                app.forceTerminate()
            }
        }
    }
    
}


