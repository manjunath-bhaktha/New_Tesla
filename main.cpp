#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QScreen>
#include <QQuickView>
#include <QMediaPlayer>
#include <QQmlContext>
#include <QtWebEngineQuick>
#include "PlaylistWrapper.h"
#include "livecamera.h"

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    // Register PlaylistWrapper for QML
    qmlRegisterType<PlaylistWrapper>("com.example.playlist", 1, 0, "PlaylistWrapper");

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QtWebEngineQuick::initialize();
    QGuiApplication app(argc, argv);

    // Create custom playlist wrapper and player
    PlaylistWrapper *playlistWrapper = new PlaylistWrapper;
    playlistWrapper->addMedia(QUrl::fromLocalFile("/home/rohit/Documents/Die With a Smile.mp3"));
    playlistWrapper->addMedia(QUrl::fromLocalFile("/home/rohit/Documents/After Hours.mp3"));
    playlistWrapper->addMedia(QUrl::fromLocalFile("/home/rohit/Documents/Thunder.mp3"));
    playlistWrapper->addMedia(QUrl::fromLocalFile("/home/rohit/Documents/All The Stars.mp3"));
    playlistWrapper->addMedia(QUrl::fromLocalFile("/home/rohit/Documents/Hymn For The Weekend.mp3"));
    playlistWrapper->setCurrentIndex(0);  // Start playing the first track
    playlistWrapper->play();

    // Live camera support
    LiveCamera live_camera;

    // Screen setup
    QList<QScreen *> screens = QGuiApplication::screens();
    int hdmiIndex = -1;
    QQuickView view;
    if (hdmiIndex >= 0 && hdmiIndex < screens.size()) {
        view.setScreen(screens.at(hdmiIndex));
    }

    // QML engine setup
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("playlistWrapper", playlistWrapper);
    engine.rootContext()->setContextProperty("audioPlayer", playlistWrapper->player()); // expose QMediaPlayer
    engine.rootContext()->setContextProperty("live_camera", &live_camera);

    // Load main QML UI
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    qmlRegisterSingletonType(QUrl("qrc:/StyleTheme.qml"), "Style", 1, 0, "Style");

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
                         if (!obj && url == objUrl)
                             QCoreApplication::exit(-1);
                     }, Qt::QueuedConnection);

    engine.load(url);

    return app.exec();
}
