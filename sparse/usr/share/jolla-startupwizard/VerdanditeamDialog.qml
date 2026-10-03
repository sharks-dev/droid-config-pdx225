kimport QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.Configuration 1.0

Dialog {
    id: root

    property int selectionCount: 0
    property var selectedApplications: []

    readonly property var availableApps: [
        { name: "Chum GUI",   desc: "The trusted Chum AppStore",      packageName: "sailfishos-chum-gui-installer" },
        { name: "Storeman",   desc: "The wild Openrepos installer",   packageName: "harbour-storeman-installer" },
        { name: "Picoplayer", desc: "The best video player",          packageName: "picoplayer" },
        { name: "µTube",      desc: "Youtube client",                 packageName: "microtube" },
        { name: "Nanofiles",  desc: "Simple file manager",           packageName: "nanofiles" },
        { name: "Musikilo",   desc: "Advanced music player",         packageName: "musikilo" },
        { name: "Yottagram",  desc: "Telegram client",                packageName: "yottagram" },
        { name: "Backupapp",  desc: "Advanced device backup app",    packageName: "backupapp" }
    ]

    function updateApplicationSelection(packageName, selected) {
        var index = selectedApplications.indexOf(packageName)
        if (selected && index < 0) {
            selectedApplications.push(packageName)
            selectionCount++
        } else if (!selected && index > -1) {
            selectedApplications.splice(index, 1)
            selectionCount--
        }
    }

    ConfigurationValue {
        id: installQueue
        key: "/apps/firstboot/install_packages"
        defaultValue: ""
    }

    function installSelectedApps() {
        installQueue.value = selectedApplications.join(" ")
    }

    Component.onCompleted: {
        // Pre-select all apps by default
        for (var i = 0; i < availableApps.length; i++) {
            updateApplicationSelection(availableApps[i].packageName, true)
        }
    }

    onAccepted: {
        if (selectionCount > 0) {
            installSelectedApps()
        }

        pageStack.animatorPush(acceptDestination)
    }

    SilicaListView {
        anchors.fill: parent

        header: Column {
            width: parent.width

            DialogHeader {
                title: "Welcome"
                acceptText: root.selectionCount > 0
                            ? "Install (" + root.selectionCount + ")"
                            : "Skip"
                cancelText: ""
            }

            Label {
                text: "We hope you enjoy your new SailfishOS device.\n\nTo help you get started, we recommend installing the following applications.\n"
                wrapMode: Text.Wrap
                width: parent.width - (2 * Theme.horizontalPageMargin)
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Label {
                text: "-Verdanditeam developers."
                anchors.right: parent.right
                anchors.rightMargin: Theme.horizontalPageMargin
            }
        }

        model: root.availableApps

        delegate: TextSwitch {
            text: modelData.name
            description: modelData.desc
            checked: true
            onCheckedChanged: {
                updateApplicationSelection(modelData.packageName, checked)
            }
        }
    }
}

