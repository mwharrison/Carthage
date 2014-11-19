//
//  Version.swift
//  Carthage
//
//  Created by Robert Böhnke on 19/11/14.
//  Copyright (c) 2014 Carthage. All rights reserved.
//

import Foundation
import LlamaKit
import ReactiveCocoa
import CarthageKit

public struct VersionCommand: CommandType {
    public let verb = "version"
    public let function = "Display the current version of Carthage"

	public func run(mode: CommandMode) -> Result<()> {
        let versionString = NSBundle(identifier: "org.carthage.CarthageKit")?.objectForInfoDictionaryKey("CFBundleShortVersionString") as String?

        let semVer = SemanticVersion.fromScanner(NSScanner(string: versionString!)).value()

        println(semVer!)

        return success(())
    }
}