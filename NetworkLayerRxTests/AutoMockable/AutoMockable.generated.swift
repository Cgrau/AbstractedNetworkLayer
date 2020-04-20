// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
@testable import NetworkLayerRx
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif














class BlablaMock: NSObject, Blabla {

    //MARK: - testThis

    private(set) var testThisCallsCount = 0
    var testThisCalled: Bool {
        return testThisCallsCount > 0
    }
    var testThisClosure: (() -> Void)?

    func testThis() {
        testThisCallsCount += 1
        testThisClosure?()
    }

}
