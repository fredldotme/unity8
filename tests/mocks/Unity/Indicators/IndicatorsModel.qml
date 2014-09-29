/*
 * Copyright (C) 2013 Canonical, Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.0
import Unity.Indicators 0.1 as Indicators

Indicators.FakeIndicatorsModel {

    Component.onCompleted: {
        Indicators.UnityMenuModelCache.setCachedModelData("com.canonical.indicators.fake1",
                                               "/com/canonical/indicators/fake1",
                                               "/com/canonical/indicators/fake1",
                                               {
                                                   "title": "Bluetooth (F)",
                                                   "icons": [ "image://theme/bluetooth-active" ],
                                               });
        Indicators.UnityMenuModelCache.setCachedModelData("com.canonical.indicators.fake2",
                                               "/com/canonical/indicators/fake2",
                                               "/com/canonical/indicators/fake2",
                                               {
                                                   "title": "Network (F)",
                                                   "icons": [ "image://theme/simcard-error", "image://theme/wifi-high" ],
                                               });
        Indicators.UnityMenuModelCache.setCachedModelData("com.canonical.indicators.fake3",
                                               "/com/canonical/indicators/fake3",
                                               "/com/canonical/indicators/fake3",
                                               {
                                                   "title": "Sound (F)",
                                                   "icons": [ "image://theme/audio-volume-high" ],
                                               });
        Indicators.UnityMenuModelCache.setCachedModelData("com.canonical.indicators.fake4",
                                               "/com/canonical/indicators/fake4",
                                               "/com/canonical/indicators/fake4",
                                               {
                                                   "title": "Battery (F)",
                                                   "icons": [ "image://theme/battery-020" ],
                                               });
        Indicators.UnityMenuModelCache.setCachedModelData("com.canonical.indicators.fake5",
                                               "/com/canonical/indicators/fake5",
                                               "/com/canonical/indicators/fake5",
                                               {
                                                   "title": "Upcoming Events (F)",
                                                   "label": "12:04",
                                               });
    }

    function load(profile) {
        unload();

        append({
            "identifier": "fake-indicator-bluetooth",
            "pageSource": "qrc:/tests/indciators/qml/fake_menu_page1.qml",
            "indicatorProperties": {
                "enabled": true,
                "busName": "com.canonical.indicators.fake1",
                "menuObjectPath": "/com/canonical/indicators/fake1",
                "actionsObjectPath": "/com/canonical/indicators/fake1"
            }
        });

        append({
        "identifier": "fake-indicator-network",
            "pageSource": "qrc:/tests/indciators/qml/fake_menu_page2.qml",
        "indicatorProperties": {
            "enabled": true,
            "busName": "com.canonical.indicators.fake2",
            "menuObjectPath": "/com/canonical/indicators/fake2",
            "actionsObjectPath": "/com/canonical/indicators/fake2"
            }
        });

        append({
            "identifier": "fake-indicator-sound",
            "pageSource": "qrc:/tests/indciators/qml/fake_menu_page3.qml",
            "indicatorProperties": {
                "enabled": true,
                "busName": "com.canonical.indicators.fake3",
                "menuObjectPath": "/com/canonical/indicators/fake3",
                "actionsObjectPath": "/com/canonical/indicators/fake3"
            }
        });

        append({
            "identifier": "fake-indicator-battery",
            "pageSource": "qrc:/tests/indciators/qml/fake_menu_page4.qml",
            "indicatorProperties": {
                "enabled": true,
                "busName": "com.canonical.indicators.fake4",
                "menuObjectPath": "/com/canonical/indicators/fake4",
                "actionsObjectPath": "/com/canonical/indicators/fake4"
            }
        });

        append({
            "identifier": "fake-indicator-datetime",
            "pageSource": "qrc:/tests/indciators/qml/fake_menu_page5.qml",
            "indicatorProperties": {
                "enabled": true,
                "busName": "com.canonical.indicators.fake5",
                "menuObjectPath": "/com/canonical/indicators/fake5",
                "actionsObjectPath": "/com/canonical/indicators/fake5"
            }
        });
    }
}
