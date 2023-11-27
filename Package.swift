// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "abseil-deling",
  products: [
    .library(
      name: "abseil-deling",
      targets: [
        "abseil-deling",
      ]
    )
  ],

  targets: [
    .target(
      name: "abseil-deling",
      path: ".",
      exclude: [
        // main functions
        "absl/hash/internal/print_hash_of.cc",
        "absl/random/internal/gaussian_distribution_gentables.cc",
        "absl/random/internal/randen_benchmarks.cc",
      ],
      sources: [
        "absl/"
      ],
      publicHeadersPath: ".",
      cSettings: [
        .headerSearchPath("./"),
      ],
      linkerSettings: [
        .linkedFramework("CoreFoundation"),
      ]
    ),
    .testTarget(
      name: "build-test",
      dependencies: [
        "abseil-deling",
      ],
      path: "SwiftPMTests/build-test"
    ),
  ],

  cxxLanguageStandard: CXXLanguageStandard.cxx1z
)

