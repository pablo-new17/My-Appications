QT -= gui

CONFIG += console
CONFIG -= app_bundle

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS PABLO_TEST

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += main.cpp \
    test.cpp \
    qsshsocket.cpp

MY_VERSION = 1.0.0
TOPDIR = /home/pablo/workspace/projects
!include($$TOPDIR/Build.pri) {
    error("Unable to load $$TOPDIR/build.pri")
}
include($$TOPDIR/accuface/Discovery_Protocol/Discovery_Protocol.pri)

HEADERS += \
    test.h \
    qsshsocket.h
