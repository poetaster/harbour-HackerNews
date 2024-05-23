import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "AboutPage"

    allowedOrientations: Orientation.All

    Column {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: Theme.paddingMedium
        anchors.rightMargin: Theme.paddingMedium

        PageHeader {
            title: qsTr("About the DWD client")
        }

        Item {
            width: 1
            height: 3 * Theme.paddingLarge
        }

        Image {
            width: parent.width / 5
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            source: "/usr/share/icons/hicolor/128x128/apps/harbour-dwd.png"
            smooth: true
            asynchronous: true
        }

        Item {
            width: 1
            height: Theme.paddingLarge
        }

        Label {
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: Theme.fontSizeMedium
            color: Theme.primaryColor
            textFormat: Text.StyledText
            linkColor: Theme.highlightColor
            text: qsTr("A simple consumer of the") + "\n" +
                       "<a href=\"https://brightsky.dev\">brightsky.dev</a> view"
            onLinkActivated: {
                Qt.openUrlExternally(link)
            }
        }
        Label {
            id: dwdLabel
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: Theme.fontSizeMedium
            color: Theme.primaryColor
            textFormat: Text.StyledText
            linkColor: Theme.highlightColor
            text: qsTr("of the ") + "<a href=\"https://dwd.de\">" + qsTr("German Weather Service") + "</a>"
            onLinkActivated: {
                Qt.openUrlExternally(link)
            }
        }
        Item {
            width: 69
            height: Theme.paddingLarge
        }
        Image {
            width: 258
            height: 69
            anchors.horizontalCenter: parent.horizontalCenter
            source: "../png/dwd_logo_258x69.png"
        }
        Item {
            width: parent.width
            height: Theme.paddingLarge
        }

        Label {
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: Theme.fontSizeExtraSmall
            color: Theme.secondaryColor
            text:  qsTr(" © 2021-2024 Mark Washeim")
        }

        Item {
            width: parent.width
            height: 2 * Theme.paddingLarge
        }

        Label {
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: Theme.fontSizeSmall
            color: Theme.secondaryColor
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            text: qsTr("This program is FOSS software licensed") + "\n"
                  + qsTr("GNU General Public License v3.")
        }

        Item {
            width: parent.width
            height: Theme.paddingLarge
        }
        Label {
            id: iconLabel
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: Theme.fontSizeMedium
            color: Theme.primaryColor
            textFormat: Text.StyledText
            linkColor: Theme.highlightColor
            text: qsTr("Icons by ") + "<a href=\"https://erikflowers.github.io\">Erik Flowers</a>"
            onLinkActivated: {
                Qt.openUrlExternally(link)
            }
        }
        Item {
            width: parent.width
            height: Theme.paddingLarge
        }
        Label {
            id: radarLabel
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: Theme.fontSizeMedium
            color: Theme.primaryColor
            textFormat: Text.StyledText
            linkColor: Theme.highlightColor
            text: qsTr("Radar courtesy of") + " <a href=\"https://www.rainviewer.com\">rainviewer.com</a>"
            onLinkActivated: {
                Qt.openUrlExternally(link)
            }
        }
        Item {
            width: parent.width
            height: Theme.paddingLarge
        }
        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: Theme.paddingSmall
            color: Theme.secondaryColor
            textFormat: Text.StyledText
            linkColor: Theme.highlightColor
            text: "<a href=\"https://github.com/poetaster/harbour-dwd\">Source: github</a>"
            onLinkActivated: {
                Qt.openUrlExternally(link)
            }
        }
        /*
        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("View license")
            onClicked: {
                pageStack.push(Qt.resolvedUrl("LicensePage.qml"));
            }
        }*/

    }
}
