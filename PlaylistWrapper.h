#ifndef PLAYLISTWRAPPER_H
#define PLAYLISTWRAPPER_H

#include <QObject>
#include <QMediaPlayer>
#include <QUrl>
#include <QList>

class PlaylistWrapper : public QObject {
    Q_OBJECT
    Q_PROPERTY(int currentIndex READ currentIndex WRITE setCurrentIndex NOTIFY currentIndexChanged)

public:
    explicit PlaylistWrapper(QObject *parent = nullptr);

    int currentIndex() const;
    void setCurrentIndex(int index);

    Q_INVOKABLE void next();
    Q_INVOKABLE void previous();
    Q_INVOKABLE void addMedia(const QUrl &mediaUrl);
    Q_INVOKABLE void play();
    Q_INVOKABLE void pause();

    QMediaPlayer* player() const;

signals:
    void currentIndexChanged(int index);

private:
    QList<QUrl> m_playlist;
    int m_currentIndex = -1;
    QMediaPlayer *m_player;
    void playCurrent();
};

#endif // PLAYLISTWRAPPER_H
