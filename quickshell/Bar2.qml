import QtQuick
import Quickshell

PanelWindow {
    id: panel

    // 2. Buat ukuran PanelWindow LEBIH BESAR dari bentuk aslinya
    // Ini memberi ruang napas agar efek membesar tidak terpotong (clipped)
    width: 350
    height: 100
    // Transparan agar area kosong di sekitarnya tidak kelihatan
    color: "transparent"

    // 1. Tentukan posisi panel
    anchors {
        top: true
    }

    // 3. Elemen Visual Utama (Inner Box)
    Rectangle {
        id: innerPanel

        // Ukuran normal saat belum didekati mouse
        width: 280
        height: 50
        anchors.centerIn: parent
        color: "#1e1e2e"
        radius: 12
        // EFEL UTAMA: Skala awal adalah 1.0 (100%)
        scale: 1
        // Biarkan posisi pusat pembesaran tepat di tengah
        transformOrigin: Item.Center

        // Konten di dalam panel
        Text {
            anchors.centerIn: parent
            text: mouseHover.containsMouse ? "✨ Hovered! ✨" : "Arahkan Mouse Ke Sini"
            color: "#cdd6f4"
            font.pixelSize: 14
            font.bold: true
        }

        // 4. Pendeteksi Gerakan Mouse
        MouseArea {
            // Kembali normal

            id: mouseHover

            anchors.fill: parent
            hoverEnabled: true // PENTING: Aktifkan penangkap kursor hover
            // Ubah skala saat kursor masuk/keluar
            onEntered: innerPanel.scale = 1.15
            // Membesar 15%
            onExited: innerPanel.scale = 1
        }

        // Animasi pergerakan skala agar halus/smooth
        Behavior on scale {
            NumberAnimation {
                duration: 200 // lama animasi dalam milidetik
                easing.type: Easing.OutCubic // gaya efek membesar
            }

        }

    }

}
