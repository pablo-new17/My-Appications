
PLATFORM = $$system($$QMAKE_CXX -dumpmachine)
BUILDTIME = $$system(date +%Y/%m/%d\_%H:%M:%S)
DATECODE = $$system(date +%Y%m%d)
REVISION = $$system(cd $$_PRO_FILE_PWD_ && git rev-parse HEAD)
DESTDIR = $$_PRO_FILE_PWD_/build/$$PLATFORM

#build number (auto increament) function
build_numbre.commands = $$PWD/build_numbre.sh "$$_PRO_FILE_PWD_" "$$TARGET" "$$MY_VERSION"
QMAKE_EXTRA_TARGETS += build_numbre
PRE_TARGETDEPS += build_numbre
HEADERS += $$_PRO_FILE_PWD_/$${TARGET}_VERSION.h

MOC_DIR = $$DESTDIR/moc
OBJECTS_DIR  = $$DESTDIR/obj
UI_DIR = $$DESTDIR/ui

DEFINES += BUILD=$$BUILDTIME
DEFINES += REVISION=$$REVISION
