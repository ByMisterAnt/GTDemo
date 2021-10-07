import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick3D 1.15
import QtStudio3D.OpenGL 2.5
import QtQuick.Controls 2.15
import QtCharts 2.3

Item {
    id: root
    width: 1280
    height: 720
    visible: true

    Studio3D {
        id: studio3D
        visible: true
        anchors.fill: parent

        property vector3d rotCarVec3d: Qt.vector3d(0.0, 0.0, 0.0)
        property real rotBlade: 0

        //Presentation settings
        ViewerSettings{
        scaleMode: ViewerSettings.ScaleModeFit
        }
        Presentation {
            id: pres
            source: "qrc:/engineView/engineView.uia"


            //input data to presentation
            DataInput {
                name: "standRot"
                value: Qt.vector3d(0.0, rotationStandY.value,  0.0)
            }

        }

//------------------- control UI --------------------------

//rotationDialog
Rectangle{
    id: rotationDialog
    width: 300
    height: 120
    color: "#99000000"
    radius: 7
    border.width: 0

    visible: false


    x: parent.width/24
    y: parent.height/8 - 50

    Rectangle{
        id: sliderRow
        x: 0
        y: 45
        width: parent.width
        height: 66
        opacity: 1
        color: "#000000"
        Column{
            width: parent.width
        Text {
            id: text1
            x: 0
            y: 0

            padding: 0

            width: parent.width
            height: 28

            opacity: 1
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            leftPadding: 20
            color: "#ffffff"
            text: qsTr("Rotate scene")
            font.pixelSize: 18
        }


        Slider {
          id: rotationStandY
           x: 10
           y: 0
           width: parent.width - 20
           height: 30
           from: 0
           to: 720

        stepSize: 1
        value: 360
    }
  }
}



        Item{
            x: 0
            y: 0
            width: parent.width
            height: 40

            Rectangle{
                id: topPanelBG
                x: 0
                y: 0
                width: parent.width
                height: 40
                opacity: 0.7
                color: "#000000"
                radius: 7
                border.width: 0
            }
            Rectangle{
                id: topPanelBottom
                x: 0
                y: parent.height - 7

                width: parent.width
                height: 7
                opacity: 0.1

                color: "#000000"
                radius: 0
                border.width: 0
            }

            Text {
                id: rotWindowText
                x: 0
                y: 0

                padding: 0

                width: parent.width
                height: parent.height

                opacity: 1
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                leftPadding: 20
                color: "#ffffff"
                text: qsTr("Scene rotation control")
                font.pixelSize: 18
            }

            RoundButton {
              id: roundButton

              x: parent.width - 35
              y: 5

              width: 30
              height: 30

              opacity: 0.9
              visible: true

              onClicked: rotationDialog.visible = false

                background: Rectangle{
                    id: btnBcg
                    border.width: 1
                    radius: 25
                    color: "#99000000"

                Image {
                    id: image
                    x: 0
                    y: 0
                    width: 100
                    height: 100
                    anchors.fill: parent
                    source: "qrc:/engineView/x_img.png"
                    fillMode: Image.PreserveAspectFit
                }
            }
        }
    }






    }
//rotation Dialog/

//inspectDialog
Rectangle{

    property alias assemblySW: assemblySW

    id: inspectDialog
    width: 300
    height: 120
    color: "#99000000"
    radius: 7
    border.width: 0

    visible: false


    x: parent.width*23/24 - 300
    y: parent.height/8 - 50

    Rectangle{
        id: changeRow
        x: 0
        y: 45
        width: parent.width
        height: 66
        opacity: 1
        color: "#000000"
        Row{
            id: swRow
            width: parent.width
            padding: 20

            Text {
            id: swTxt
            x: 0
            y: 0

            padding: 0

            width: parent.width - 120
            height: 28

            opacity: 1
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            leftPadding: 20
            color: "#ffffff"
            text: qsTr("Rotate scene")
            font.pixelSize: 18
        }

        Switch {
            id: assemblySW
            text: ""

            onClicked: swRow.assemSWfcn(assemblySW.checked)
        }

        function assemSWfcn(flag){
            if(flag){
                pres.goToSlide("Scene", "disassembly")
            }
            if(!flag){
                pres.goToSlide("Scene", "assembly")
            }
        }


        }
    }



    Item{
        x: 0
        y: 0
        width: parent.width
        height: 40

        Rectangle{
            x: 0
            y: 0
            width: parent.width
            height: 40
            opacity: 0.7
            color: "#000000"
            radius: 7
            border.width: 0
        }
        Rectangle{
            x: 0
            y: parent.height - 7

            width: parent.width
            height: 7
            opacity: 0.1

            color: "#000000"
            radius: 0
            border.width: 0
        }

        Text {
            id: inspWindowText
            x: 0
            y: 0

            padding: 0

            width: parent.width
            height: parent.height

            opacity: 1
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            leftPadding: 20
            color: "#ffffff"
            text: qsTr("Inspect engine")
            font.pixelSize: 18
        }

        RoundButton {

          x: parent.width - 35
          y: 5

          width: 30
          height: 30

          opacity: 0.9
          visible: true

          onClicked: inspectDialog.visible = false

            background: Rectangle{
                border.width: 1
                radius: 25
                color: "#99000000"

            Image {
                x: 0
                y: 0
                width: 100
                height: 100
                anchors.fill: parent
                source: "qrc:/engineView/x_img.png"
                fillMode: Image.PreserveAspectFit
            }
        }
    }
}
}
//inspectDialog/

//plotDialog
Rectangle{


    id: plotDialog
    width: 400
    height: 420
    color: "#99000000"
    radius: 7
    border.width: 0

    visible: false


    x: parent.width*23/24 - 400
    y: parent.height > 900 ? parent.height/1.5 - 110 : parent.height/2.2 - 50


    Item{
        x: 0
        y: 0
        width: parent.width
        height: 40

        Rectangle{
            x: 0
            y: 0
            width: parent.width
            height: 40
            opacity: 0.7
            color: "#000000"
            radius: 7
            border.width: 0
        }
        Rectangle{
            x: 0
            y: parent.height - 7

            width: parent.width
            height: 7
            opacity: 0.1

            color: "#000000"
            radius: 0
            border.width: 0
        }

        Text {
            id: plotWindowText
            x: 0
            y: 0

            padding: 0

            width: parent.width
            height: parent.height

            opacity: 1
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            leftPadding: 20
            color: "#ffffff"
            text: qsTr("Step plot")
            font.pixelSize: 18
        }

        RoundButton {

          x: parent.width - 35
          y: 5

          width: 30
          height: 30

          opacity: 0.9
          visible: true

          onClicked: plotDialog.visible = false

          background: Rectangle{
              border.width: 1
              radius: 25
              color: "#99000000"

              Image {
                  x: 0
                  y: 0
                  width: 100
                  height: 100
                  anchors.fill: parent
                  source: "qrc:/engineView/x_img.png"
                  fillMode: Image.PreserveAspectFit
              }
          }
        }
    }

    ChartView {
        id: splineS
        x: 0
        y: 0

        width: 390
        height: 370

        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 20
        anchors.horizontalCenter: parent.horizontalCenter

        title: "Turbine rotation, n"
        legend.visible: false
        antialiasing: true

        SplineSeries {

               //name: "Переходный процесс"
               XYPoint { x: 0; y: 0.0 }
               XYPoint { x: 1.1; y: 2.9 }
               XYPoint { x: 1.5; y: 2.7 }
               XYPoint { x: 1.9; y: 2.4 }
               XYPoint { x: 2.1; y: 2.1 }
               XYPoint { x: 2.9; y: 2.6 }
               XYPoint { x: 3.4; y: 2.3 }
               XYPoint { x: 4.1; y: 3.1 }

           }
    }

 }
//plotDialog

//Menu buttons
Item{

    id: menuPlase

    property bool menuVisible: false

    x: parent.width/2 - 170
    y: parent.height > 900 ? parent.height/1.5 + 110 : parent.height/1.5

    width: 340
    height: 220
    opacity: 1
    visible: true

    function hideMenu(windowToShow){
        menuPlase.menuVisible = false
        if(windowToShow == plotDialog){
            pres.goToSlide("Scene", "bladesRot")
        }

        windowToShow.visible = true
    }

    RoundButton {
        id: menuBtn
        x: parent.width/2 - 50
        y: parent.height/2

        width: 100
        height: 100

        visible: true

        onClicked: menuPlase.menuVisible = true

        contentItem: Text {
            text: qsTr("Menu")
                font.pointSize: 20
                font.family: "Tahoma"
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

        background: Rectangle{
            border.width: 1
            radius: 50
            color: "#99000000"
        }
    }


    RoundButton {
        id: rotBtn
        x: parent.width/8 - 40
        y: parent.height/2 + 10
        text: "+"

        width: 80
        height: 80

        visible: menuPlase.menuVisible
        onClicked: menuPlase.hideMenu(rotationDialog)


        contentItem: Text {
            text: qsTr("Rotation")
                font.pointSize: 11
                font.family: "Tahoma"
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

        background: Rectangle{
            border.width: 1
            radius: parent.width/2
            color: "#99000000"
        }
    }

    RoundButton {
        id: inspectBtn
        x: parent.width/2 - 40
        y: parent.height/8 - 20
        text: "+"

        width: 80
        height: 80

        visible: menuPlase.menuVisible

        onClicked: menuPlase.hideMenu(inspectDialog)

        contentItem: Text {
            text: qsTr("Inspect")
                font.pointSize: 11
                font.family: "Tahoma"
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

        background: Rectangle{
            border.width: 1
            radius: parent.width/2
            color: "#99000000"
        }
    }

    RoundButton {
        id: calcBtn
        x: parent.width*7/8 - 40
        y: parent.height/2 + 10
        text: "+"

        width: 80
        height: 80

        visible: menuPlase.menuVisible
        onClicked: menuPlase.hideMenu(plotDialog)

        contentItem: Text {
            text: qsTr("Calculate")
                font.pointSize: 11
                font.family: "Tahoma"
                color: "#ffffff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

        background: Rectangle{
            border.width: 1
            radius: parent.width/2
            color: "#99000000"
        }
    }

}
    }
//    Slider {
//        id: verticalPos
//        x: parent.width/24
//        y: parent.height/3
//        width: 59
//        height: 202
//        to: 720
//        from: 0
//        orientation: Qt.Vertical
//        value: 20
//    }

}
