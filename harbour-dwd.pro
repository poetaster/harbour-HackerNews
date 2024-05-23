# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-dwd

CONFIG += sailfishapp_qml

DISTFILES += \
    qml/cover/CoverPage.qml \
    qml/pages/About.qml \
    qml/pages/RadarViewQml.qml \
    qml/pages/StartPage.qml \
    qml/pages/OverviewPage.qml \
    qml/pages/LocationSearchPage.qml \
    qml/pages/DailyDetails.qml \
    qml/delegates/LocationItem.qml \
    qml/delegates/ForecastItem.qml \
    qml/delegates/WeatherItem.qml \
    qml/Pages/RadarView.qml \
    qml/png/* \
    qml/js/locations.js \
    qml/js/storage.js \
    qml/js/stations.json \
    qml/js/locales.js \
    qml/html/rainviewer-api.html \
    qml/html/leaflet.js \
    qml/html/leaflet.css \
    qml/html/framescript.js \
    rpm/harbour-dwd.spec \
    rpm/harbour-dwd.changes \
    translations/harbour-dwd.ts \
    translations/harbour-dwd-de_DE.ts

OTHER_FILES += \
    harbour-dwd.desktop


# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
TRANSLATIONS += translations/harbour-dwd-de_DE.ts

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172
