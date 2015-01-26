ANDROID_BUNDLED_JAR_DEPENDENCIES = \
    jar/QtAndroidWebView-bundled.jar
ANDROID_JAR_DEPENDENCIES = \
    jar/QtAndroidWebView.jar

INCLUDEPATH += $$PWD

PUBLIC_HEADERS += \
    qwebview_global.h

COMMON_HEADERS += \
    qwebview_p.h \
    qwebviewinterface_p.h \
    qquickwebview.h \
    qnativeviewcontroller_p.h \
    qwebview_p_p.h \
    qquickviewcontroller_p.h \
    qwebviewloadrequest_p.h \
    qquickwebviewloadrequest.h

COMMON_SOURCES += \
    qwebview.cpp \
    qquickwebview.cpp \
    qquickviewcontroller.cpp \
    qquickwebviewloadrequest.cpp \
    qwebviewloadrequest.cpp

android {
    QT += core-private
    LIBS += -ljnigraphics
    SOURCES += \
        $$COMMON_SOURCES \
        qwebview_android.cpp
    PRIVATE_HEADERS += \
        $$COMMON_HEADERS \
        qwebview_android_p.h

} else:ios {
    SOURCES += \
        $$COMMON_SOURCES
    OBJECTIVE_SOURCES += \
        qwebview_ios.mm
    PRIVATE_HEADERS += \
        $$COMMON_HEADERS \
        qwebview_ios_p.h

} else {
    qtHaveModule(webengine) {
        QT += webengine webengine-private
        DEFINES += QT_WEBVIEW_WEBENGINE_BACKEND
    } else {
        SOURCES += \
            qwebview.cpp
        PRIVATE_HEADERS += \
            qwebviewinterface_p.h
    }
}

HEADERS += $$PUBLIC_HEADERS $$PRIVATE_HEADERS
