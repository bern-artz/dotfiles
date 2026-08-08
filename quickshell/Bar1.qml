import QtQuick
import QtQuick.Shapes

Shape {
    anchors.centerIn: parent
    width: 600
    height: 50

    ShapePath {
        fillColor: "#1e1e2e"
        // mulai dari kiri bawah
        startX: 0
        startY: 50

        // garis bawah kiri → masuk ke lengkungan
        PathLine {
            x: 30
            y: 50
        }

        // lengkungan kiri
        PathArc {
            x: 50
            y: 30
            radiusX: 20
            radiusY: 20
            direction: PathArc.Counterclockwise
        }

        // sisi kiri
        PathLine {
            x: 50
            y: 0
        }

        // bagian atas
        PathLine {
            x: 550
            y: 0
        }

        // sisi kanan
        PathLine {
            x: 550
            y: 30
        }

        // lengkungan kanan
        PathArc {
            x: 570
            y: 50
            radiusX: 20
            radiusY: 20
            direction: PathArc.Counterclockwise
        }

        // garis bawah kanan → keluar
        PathLine {
            x: 600
            y: 50
        }

        // tutup path
        PathLine {
            x: 0
            y: 50
        }

    }

}
