#include <QtWidgets/QApplication>
#include <QtQuick/QQuickView>
//switch when build portable version
#include <QtStudio3D/qstudio3dglobal.h>
//#include <qstudio3dglobal.h>

int main(int argc, char *argv[])
{
    qputenv("QSG_INFO", "1");

    QApplication app(argc, argv);

    QSurfaceFormat::setDefaultFormat(Q3DS::surfaceFormat());

    QQuickView view;
    view.setSource(QUrl("qrc:/main.qml"));

    view.setTitle(QStringLiteral("GTDemo 3D"));
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.resize(1280, 720);
    view.show();

    return app.exec();
}
