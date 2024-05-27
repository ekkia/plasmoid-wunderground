/*
 * Copyright 2024  Kevin Donnelly
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http: //www.gnu.org/licenses/>.
 */

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import org.kde.plasma.plasmoid
import org.kde.ksvg as KSvg
import org.kde.kirigami as Kirigami
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.components as PlasmaComponents
import "../code/utils.js" as Utils

ColumnLayout {

    ListView {
        id: alertsRepeater

        clip: true

        Layout.fillWidth: true
        Layout.fillHeight: true

        Component {
            id: alertDelegate

            RowLayout {
                width: ListView.view.width

                PlasmaComponents.Label {
                    text: desc

                    Layout.alignment: Qt.AlignHCenter

                    color: severityColor
                }

                PlasmaComponents.Label {
                    text: headline
                    wrapMode: Text.Wrap

                    Layout.fillWidth: true
                }

                Kirigami.Icon {
                    source: "documentinfo-symbolic"

                    Layout.alignment: Qt.AlignHCenter

                    PlasmaCore.ToolTipArea {
                        mainText: i18n("Severity: %1", severity)
                        subText: i18n("Source: %1<br/>Region: %2<br/>Action: %3", source, area, action)

                        interactive: true

                        anchors.fill: parent
                    }
                }
            }
        }

        model: alertsModel

        delegate: alertDelegate
    }
}
