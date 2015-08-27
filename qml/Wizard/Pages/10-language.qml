/*
 * Copyright (C) 2013-2015 Canonical, Ltd.
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

import QtQuick 2.3
import Ubuntu.Components 1.2
import Ubuntu.SystemSettings.LanguagePlugin 1.0
import Wizard 0.1
import ".." as LocalComponents

LocalComponents.Page {
    objectName: "languagePage"

    title: i18n.tr("Language")
    forwardButtonSourceComponent: forwardButton

    readonly property string defaultLanguage: "en" // default language

    UbuntuLanguagePlugin {
        id: plugin
    }

    Component.onCompleted: {
        if (!modemManager.available) { // don't wait for the modem if it's not there
            init();
        }
    }

    Connections {
        target: modemManager
        onModemsChanged: {
            print("Modems changed")
            init()
        }
    }

    function init()
    {
        var detectedLangs = []
        if (simManager0.present && simManager0.preferredLanguages.length > 0) {
            detectedLangs = simManager0.preferredLanguages;
            print("SIM 0 detected langs:", detectedLangs);
        } else if (simManager1.present && simManager1.preferredLanguages.length > 0) {
            detectedLangs = simManager1.preferredLanguages;
            print("SIM 1 detected langs:", detectedLangs);
        } else {
            print("No lang detected, falling back to default:", defaultLanguage);
            detectedLangs = [defaultLanguage]; // fallback to default lang
        }

        //populateModel(false, detectedLangs)
    }

    Column {
        id: column
        anchors.fill: content

        ListView {
            id: languagesListView
            boundsBehavior: Flickable.StopAtBounds
            clip: true
            currentIndex: plugin.currentLanguage
            snapMode: ListView.SnapToItem

            anchors {
                left: parent.left;
                right: parent.right;
            }

            height: column.height - column.spacing

            model: plugin.languageNames

            delegate: ListItem {
                id: itemDelegate;

                readonly property bool isCurrent: index === ListView.view.currentIndex

                Label {
                    id: langLabel
                    text: modelData

                    anchors {
                        left: parent.left;
                        verticalCenter: parent.verticalCenter;
                    }

                    fontSize: "medium"
                    font.weight: itemDelegate.isCurrent ? Font.Normal : Font.Light
                    color: "#525252"
                }

                Image {
                    anchors {
                        right: parent.right;
                        verticalCenter: parent.verticalCenter;
                    }
                    fillMode: Image.PreserveAspectFit
                    height: langLabel.paintedHeight

                    source: "image://theme/tick"
                    visible: itemDelegate.isCurrent
                }

                onClicked: {
                    languagesListView.currentIndex = index;
                    i18n.language = plugin.languageCodes[index];
                }
            }
        }
    }

    Component {
        id: forwardButton
        LocalComponents.StackButton {
            text: i18n.tr("Next")
            enabled: languagesListView.currentIndex
            onClicked: {
                if (plugin.currentLanguage !== languagesListView.currentIndex) {
                    plugin.currentLanguage = languagesListView.currentIndex;
                    print("Updating session locale:", plugin.languageCodes[plugin.currentLanguage])
                    System.updateSessionLocale(plugin.languageCodes[plugin.currentLanguage]);
                }
                i18n.language = plugin.languageCodes[plugin.currentLanguage]; // re-notify of change after above call (for qlocale change)
                root.countryCode = plugin.languageCodes[plugin.currentLanguage].split('_')[1].split('.')[0] // extract the country code, save it for the timezone page
                pageStack.next();
            }
        }
    }
}
