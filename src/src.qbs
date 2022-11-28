import qbs

CppApplication {
    Depends { name: "buildconfig" }
    Depends { name: "bundle" }

    consoleApplication: false
    name: "tiny"

    cpp.enableExceptions: false

    install: true
    installDir: buildconfig.installAppPath
    installDebugInformation: true

    cpp.optimization: "small"
    cpp.debugInformation: false

    files: "main.cpp"

    Properties {
        condition: qbs.toolchain.contains("msvc")

        cpp.separateDebugInformation: true
        cpp.generateManifestFile: false
        cpp.cxxFlags: [
            "/Gw",
        ]
        cpp.linkerFlags: [
            "/NODEFAULTLIB",
            "/DYNAMICBASE:NO",
//            "/subsystem:windows",
        ]
        cpp.defines: [
            "TOOLCHAIN_MSVC"
        ]
    }

    Properties {
        condition: qbs.toolchain.contains("mingw")

        cpp.cxxFlags: [
            "-fno-unwind-tables",				// \ if enableExceptions == false
            "-fno-asynchronous-unwind-tables",  // /
            "-fno-stack-protector",
            "-fno-ident",
        ]
        cpp.driverLinkerFlags: [
            "-s",
            "-nostdlib",
            "-nodefaultlibs",
            "-nostartfiles",
        ]
        cpp.defines: [
            "TOOLCHAIN_GCC"
        ]
    }

    cpp.staticLibraries: [
        "kernel32",
        "user32"
    ]

}
