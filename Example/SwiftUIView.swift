//
//  SwiftUIView.swift
//  CQAnimatedCollectionViewLayout_Example
//
//  Created by steve on 2019/11/19.
//  Copyright © 2019 王承权. All rights reserved.
//

#if canImport(UIKit)

#elseif canImport(AppKit)
// macOS – use NSColor
#else
// all other platforms – use a custom color object
#endif

#if canImport(SwiftUI)

import SwiftUI

struct SwiftUIView: View {
    @available(iOS 13.0.0, *)
    var body: some View {
        Text("Hello, World! i am here").font(.title).foregroundColor(.red)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    @available(iOS 13.0.0, *)
    static var previews: some View {
        SwiftUIView()
    }
}

#endif

//https://github.com/apple/swift-evolution/blob/master/proposals/0075-import-test.md

