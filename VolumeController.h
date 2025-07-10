#ifndef VOLUMECONTROLLER_H
#define VOLUMECONTROLLER_H

#include <QObject>

class VolumeController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(qreal volume READ volume WRITE setVolume NOTIFY volumeChanged)

public:
    explicit VolumeController(QObject *parent = nullptr);

    qreal volume() const;
    Q_INVOKABLE void setVolume(qreal value); // 0.0 to 1.0

signals:
    void volumeChanged();

private:
    bool setPulseAudioVolume(int percent);
    bool setAlsaVolume(int percent);
};

#endif // VOLUMECONTROLLER_H
