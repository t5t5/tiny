Module {
    property bool staticBuild: false

    property bool makeTests: false
    property bool staticRuntime: false

    readonly property string installAppPath: {
        return ".";
    }

    readonly property string installBinaryPath: {
        return installAppPath
    }

    readonly property string installLibraryPath: {
        return installAppPath
    }

    Depends { name: "cpp" }

    cpp.cxxLanguageVersion: "c++17"
}
