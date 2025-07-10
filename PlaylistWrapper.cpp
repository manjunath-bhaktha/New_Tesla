#include "PlaylistWrapper.h"

PlaylistWrapper::PlaylistWrapper(QObject *parent)
    : QObject(parent),
      m_player(new QMediaPlayer(this)),
      m_currentIndex(-1)
{
    connect(m_player, &QMediaPlayer::mediaStatusChanged, this, [=](QMediaPlayer::MediaStatus status) {
        if (status == QMediaPlayer::EndOfMedia) {
            next(); // Auto-play next media
        }
    });
}

int PlaylistWrapper::currentIndex() const {
    return m_currentIndex;
}

void PlaylistWrapper::setCurrentIndex(int index) {
    if (index >= 0 && index < m_playlist.size()) {
        m_currentIndex = index;
        emit currentIndexChanged(index);
        playCurrent();
    }
}

void PlaylistWrapper::next() {
    if (m_currentIndex + 1 < m_playlist.size()) {
        setCurrentIndex(m_currentIndex + 1);
    }
}

void PlaylistWrapper::previous() {
    if (m_currentIndex - 1 >= 0) {
        setCurrentIndex(m_currentIndex - 1);
    }
}

void PlaylistWrapper::addMedia(const QUrl &mediaUrl) {
    m_playlist.append(mediaUrl);
    if (m_currentIndex == -1) {
        setCurrentIndex(0); // Start playing the first media automatically
    }
}

void PlaylistWrapper::play() {
    m_player->play();
}

void PlaylistWrapper::pause() {
    m_player->pause();
}

void PlaylistWrapper::playCurrent() {
    if (m_currentIndex >= 0 && m_currentIndex < m_playlist.size()) {
        m_player->setSource(m_playlist[m_currentIndex]);
        m_player->play();
    }
}

QMediaPlayer* PlaylistWrapper::player() const {
    return m_player;
}
