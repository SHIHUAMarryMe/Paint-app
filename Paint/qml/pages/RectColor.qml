import QtQuick 2.0
import Sailfish.Silica 1.0

Rectangle {
    id:rect;
    property color colorF:rect.color;
    signal click;
    width:page.width*1/11;
    height:page.height*1/16;
    radius:4;
    border{
        width:2;
        color:"white";
    }
    MouseArea{
        anchors.fill:parent;
        onPressed:{
            click();
            rect.border.width=6;
        }
        onReleased:{
            rect.border.width=2;
        }
    }
}
