CONFIG -= debug_and_release debug_and_release_target

DEFINES += CONAN_LIBRARY

INCLUDEPATH += $$PWD

# Conan files

OTHER_FILES += \
    Conan.json.in \
    LICENSE \
    README.md \
    .travis.yml \
    util/build.sh \
    util/prepare.sh \
    util/qt_install.qs

SOURCES += \
    plugin.cpp \
    settings/settingspage.cpp \
    settings/settingswidget.cpp \
    project/installstep.cpp \
    project/installstepconfigwidget.cpp

HEADERS += \
    conan_global.h \
    constants.h \
    plugin.h \
    settings/settingspage.h \
    settings/settingswidget.h \
    project/installstep.h \
    project/installstepconfigwidget.h

FORMS += \
    project/installstepconfigwidget.ui \
    settings/settingswidget.ui

# Qt Creator linking

## Either set the IDE_SOURCE_TREE when running qmake,
## or set the QTC_SOURCE environment variable, to override the default setting
isEmpty(IDE_SOURCE_TREE): IDE_SOURCE_TREE = $$(QTC_SOURCE)
isEmpty(IDE_SOURCE_TREE): IDE_SOURCE_TREE = ""

## Either set the IDE_BUILD_TREE when running qmake,
## or set the QTC_BUILD environment variable, to override the default setting
isEmpty(IDE_BUILD_TREE): IDE_BUILD_TREE = $$(QTC_BUILD)
isEmpty(IDE_BUILD_TREE): IDE_BUILD_TREE = ""

## uncomment to build plugin into user config directory
## <localappdata>/plugins/<ideversion>
##    where <localappdata> is e.g.
##    "%LOCALAPPDATA%\QtProject\qtcreator" on Windows Vista and later
##    "$XDG_DATA_HOME/data/QtProject/qtcreator" or "~/.local/share/data/QtProject/qtcreator" on Linux
##    "~/Library/Application Support/QtProject/Qt Creator" on OS X
#USE_USER_DESTDIR = yes

###### If the plugin can be depended upon by other plugins, this code needs to be outsourced to
###### <dirname>_dependencies.pri, where <dirname> is the name of the directory containing the
###### plugin's sources.

QTC_PLUGIN_NAME = Conan
QTC_LIB_DEPENDS += \
    # nothing here at this time

QTC_PLUGIN_DEPENDS += \
    coreplugin \
    projectexplorer

QTC_PLUGIN_RECOMMENDS += \
    # optional plugin dependencies. nothing here at this time

###### End _dependencies.pri contents ######

include($$IDE_SOURCE_TREE/src/qtcreatorplugin.pri)
