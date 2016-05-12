import QtQuick 2.0
import Sailfish.Silica 1.0

Rectangle {
    id:rectButton;
    FirstPage{id:firstPage}
    width:firstPage.width*5/6;
    height:firstPage.width*5/6;
    color:"red";
    signal click;
    MouseArea{
        id:mouseA;
        anchors.fill:parent;
        onPressed:{
            rectButton.color="#00000000";
        }
    }
    Component.onCompleted:{
        rectButton.click.connect(mouseA.pressed);
    }
}
