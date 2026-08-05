//===----------------------------------------------------------------------===//
//
// This source file is part of the SwiftNIO open source project
//
// Copyright (c) 2026 Apple Inc. and the SwiftNIO project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of SwiftNIO project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

#if os(FreeBSD)
/// The root CA bundle path discovered on this host.
internal let rootCAFilePath: String? = locateRootCAFile()

/// The root CA directory discovered on this host.
internal let rootCADirectoryPath: String? = locateRootCADirectory()

/// Common root CA bundle locations on FreeBSD.
private let rootCAFileSearchPaths = [
    "/usr/local/etc/ssl/cert.pem",
    "/etc/ssl/cert.pem",
    "/usr/local/share/certs/ca-root-nss.crt",
]

/// Common root CA directory locations on FreeBSD.
private let rootCADirectorySearchPaths = [
    "/usr/local/share/certs"
]

private func locateRootCAFile() -> String? {
    rootCAFileSearchPaths.first {
        FileSystemObject.type(ofPath: $0) == .file
    }
}

private func locateRootCADirectory() -> String? {
    rootCADirectorySearchPaths.first {
        FileSystemObject.type(ofPath: $0) == .directory
    }
}
#endif
