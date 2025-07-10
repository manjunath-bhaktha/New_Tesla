#include "VolumeController.h"
#include <QProcess>
#include <QDebug>

VolumeController::VolumeController(QObject *parent) : QObject(parent) {}

qreal VolumeController::volume() const {
    // Not implemented here for brevity.
    return 0.0;
}

void VolumeController::setVolume(qreal value) {
    int percent = static_cast<int>(value * 100);
    if (!setPulseAudioVolume(percent)) {
        qDebug() << "PulseAudio failed or not available, falling back to ALSA.";
        if (!setAlsaVolume(percent)) {
            qWarning() << "Failed to set volume using both PulseAudio and ALSA.";
        }
    } else {
        emit volumeChanged();
    }
}

bool VolumeController::setPulseAudioVolume(int percent) {
    QProcess pulseCheck;
    pulseCheck.start("which", QStringList() << "pactl");
    pulseCheck.waitForFinished();

    if (pulseCheck.readAllStandardOutput().isEmpty())
        return false;

    QString volumeStr = QString("%1%").arg(percent);
    QProcess result;
    result.start("pactl", QStringList() << "set-sink-volume" << "@DEFAULT_SINK@" << volumeStr);
    result.waitForFinished();

    return result.exitStatus() == QProcess::NormalExit;
}

bool VolumeController::setAlsaVolume(int percent) {
    QProcess alsaCheck;
    alsaCheck.start("which", QStringList() << "amixer");
    alsaCheck.waitForFinished();

    if (alsaCheck.readAllStandardOutput().isEmpty())
        return false;

    QString volumeStr = QString("%1%").arg(percent);
    QProcess result;
    result.start("amixer", QStringList() << "sset" << "Master" << volumeStr);
    result.waitForFinished();

    return result.exitStatus() == QProcess::NormalExit;
}
