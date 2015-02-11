/*
 * Copyright (C) 2014 Canonical, Ltd.
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
import Ubuntu.Components 1.1

TutorialPage {
    id: root

    title: i18n.tr("These are the shortcuts to favorite apps")
    text: i18n.tr("Tap here to finish.")
    fullTextWidth: true

    foreground {
        children: [
            Image {
                objectName: "tick"
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: parent.top
                    topMargin: root.textBottom + units.gu(3)
                }
                source: Qt.resolvedUrl("graphics/tick.png")
                height: units.gu(6.5)
                width: units.gu(6.5)

                MouseArea {
                    anchors.fill: parent
                    onClicked: root.hide()
                }
            }
        ]
    }
}