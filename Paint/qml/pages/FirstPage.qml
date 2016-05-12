/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0
import an.qt.choseCAndF 1.0

Page {
    id: page;
    property color currentColor;
    property var savePath:"/home/nemo/Pictures/"
    ChoseCAndF{
        id:choseCAndF;
        color:"black";
    }
    Canvas{
        id:canvas;
        property color penColor;
        property int lastX;
        property int lastY;
        property bool judge:false;
        antialiasing:true;
        width:page.width*7/8;
        height:page.height*7/8;
        anchors.centerIn:page;
        function clear(){
            var ctx=getContext("2d");
            ctx.fillStyle="white";
            ctx.fillRect(0,0,canvas.width,canvas.height);
            requestPaint();
        }
        onPaint:{
            var ctx=getContext("2d");

            if(!judge){
            ctx.fillStyle="white";
            ctx.beginPath();
            ctx.fillRect( 0, 0, page.width*7/8, page.height*7/8);
            ctx.fill();
            ctx.closePath();
            judge=true;
            }
            ctx.lineWidth=2;
            ctx.strokeStyle=penColor;
            console.log(ctx.strokeStyle);
            ctx.beginPath();
            ctx.moveTo(lastX, lastY);
            console.log(lastX,lastY);
            lastX=area.mouseX;
            lastY=area.mouseY;
            console.log(lastX,lastY);
            ctx.lineCap="round";
            ctx.lineJoin="round";
            ctx.lineTo(lastX, lastY);
            ctx.stroke();
            ctx.restore();
        }

    }
    MouseArea{
        id:area;
        anchors.fill:page;
        onPressed:{
            canvas.lastX=area.mouseX;
            canvas.lastY=area.mouseY;
        }
        onPositionChanged:{
            canvas.requestPaint();
        }
    }
    Row{
        id:rectRow;
        anchors{
            top:page.top;
            horizontalCenter:page.horizontalCenter;
        }
        spacing:4;
        RectColor{
            id:blk;
            color:choseCAndF.choseColor(choseCAndF.black, 0);
            onClick:{
                canvas.penColor=blk.color;
            }
        }
        RectColor{
            id:rd;
            color:choseCAndF.choseColor(choseCAndF.black, 1);
            onClick:{
                canvas.penColor=rd.color;
            }
        }
        RectColor{
            id:yelw;
            color:choseCAndF.choseColor(choseCAndF.black, 2);
            onClick:{
                canvas.penColor=yelw.color;
            }
        }
        RectColor{
            id:ble;
            color:choseCAndF.choseColor(choseCAndF.black, 3);
            onClick:{
                canvas.penColor=ble.color;
            }
        }
        RectColor{
            id:grn;
            color:choseCAndF.choseColor(choseCAndF.black, 4);
            onClick:{
                canvas.penColor=grn.color;
            }
        }
        RectColor{
            id:cyn;
            color:choseCAndF.choseColor(choseCAndF.black, 5);
            onClick:{
                canvas.penColor=cyn.color;
            }
        }
    }
    Rectangle{
        id:btn;
        width:page.width*1/6;
        height:page.width*1/12;
        radius:4;
        anchors{
            left:page.left;
            leftMargin:page.width*1/16;
            bottom:page.bottom;
        }
        Text{
            text:qsTr("save");
            anchors.centerIn:parent;
            color:"red";
            font.pixelSize:18;
        }
        color:Theme.highlightColor;
        MouseArea{
            anchors.fill:parent;
            onPressed:{
                btn.color="#00000000";
                var data=canvas.toDataURL();
                choseCAndF.saveCanvas(data,savePath);
            }
            onReleased:{
                btn.color=Theme.highlightColor;
            }
        }
    }
    Rectangle{
        id:clearBtn;
        width:page.width*1/6;
        height:page.width*1/12;
        radius:4;
        anchors{
            left:btn.right;
            leftMargin:10;
            bottom:page.bottom;
        }
        color:Theme.highlightColor;
        Text{
            text:qsTr("clear all");
            anchors.centerIn:parent;
            color:"red";
            font.pixelSize:18;
        }
        MouseArea{
            anchors.fill:parent;
            onPressed:{
                clearBtn.color="#00000000";
                canvas.clear();
            }
            onReleased:{
                clearBtn.color=Theme.highlightColor;
            }
        }
    }
}


