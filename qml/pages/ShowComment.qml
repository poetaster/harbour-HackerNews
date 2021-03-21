import QtQuick 2.0
import Sailfish.Silica 1.0
import "../delegates"

Page {
    id: page
    property string storyBy
    property string storyUrl
    property string storyText
    property string storyTitle
    property string storyKids
    property int storyId

    function httpRequest(url, callback) {
        var doc = new XMLHttpRequest();
        doc.onreadystatechange = function() {
            if (doc.readyState === XMLHttpRequest.DONE) {
                callback(doc);
            }
        }
        doc.open("GET", url);
        doc.send();
    }
    function reloadComments(){
        kidsModel.clear();
        page.httpRequest("https://hacker-news.firebaseio.com/v0/item/" + storyId + ".json", function(doc) {
            var story = JSON.parse(doc.responseText);
            for (var i = 0; i < story.kids.length ; i++) {
                var storyIndex = story.kids[i]
                page.httpRequest("https://hacker-news.firebaseio.com/v0/item/" + storyIndex + ".json", function(doc) {
                    var story = JSON.parse(doc.responseText);
                    //var title = story.title
                    //console.debug(JSON.stringify(story));
                    kidsModel.append({"by": story.by, "comms": story.text,"id": story.id});
                });
            }
        });
    }
    ListModel {
        id: kidsModel
    }
    onStatusChanged: {
        if (PageStatus.Activating) {
            //console.debug(kidsModel.count)
            if (kidsModel.count < 1){
                page.reloadComments();
            }

        }

        /*
        switch (status) {
            case PageStatus.Activating:
                indicator.visible = true;
                errorMsg.visible = false;
                timetableDesc.title = qsTr("Searching...");
                fahrplanBackend.getTimeTable();
                break;
            case PageStatus.Deactivating:
                errorMsg.visible = false;
                fahrplanBackend.parser.cancelRequest();
                break;
        }
        */
    }
    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent
        id: storyView

        PullDownMenu {

            MenuItem {
                text: qsTr("Reload")
                onClicked: {
                    page.reloadComments();
                }
            }
            MenuItem {
                text: qsTr("Open URL in browser")
                onClicked: {
                    Qt.openUrlExternally(storyUrl)
                }
            }
        }


        Column {
            id: header

            x: Theme.horizontalPageMargin
            width: parent.width - 2*x
            spacing: Theme.paddingSmall
            PageHeader {
                title: "Comments Details"

            }
            SectionHeader { text: "Tile & URL" }
            Label {
                width: parent.width
                textFormat: Text.RichText
                wrapMode: Text.WordWrap
                text: storyTitle
                font.pixelSize: Theme.fontSizeExtraSmall
            }
            /*
            Label {
                width: parent.width
                textFormat: Text.RichText
                wrapMode: Text.WrapAnywhere
                text: storyUrl
                font.pixelSize: Theme.fontSizeExtraSmall
            }*/

            SectionHeader {
                id: parentHead
                text: "original Comment"
            }
            Text{}
            Label {
                text: storyText
                textFormat: Text.RichtText
                width: parent.width
                height: 2
                elide: Text.ElideRight
                wrapMode: Text.WordWrap
                linkColor: Theme.primaryColor
                font.pixelSize: Theme.fontSizeSmall

            }

            SectionHeader {
                id: childHead
                text: "further Comments"
            }
        }
        Item {
            width: 1
            height: Theme.paddingMedium
        }

        SilicaListView {
            id: kidsView
            width: parent.width
            anchors.bottom: parent.bottom
            anchors.top: header.bottom

            model: kidsModel;

            delegate: CommentItem {
                id: delegate


                onClicked: {
                    pageStack.push(Qt.resolvedUrl("ShowComment.qml"), {
                                       "storyBy": by,
                                       "storyUrl": storyUrl,
                                       "storyId": id,
                                       "storyText": comms,
                                       "storyTitle": storyTitle});
                }
            }


            VerticalScrollDecorator { flickable: kidsView}
        }




    }
}