-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    general = {
        layout = "dwindle",
    },


    dwindle = {
    preserve_split = true, -- jaga posisi split biar gak melompat pas pseudo dibuka
    force_split = 2,       -- maksa split selalu ke arah kanan/bawah biar ruang kosongnya terprediksi
    },

    master = {
        new_status = "master",
        orientation = "center",
        center_master_fallback = "center"
    },

    scrolling = {
        column_width = 0.5,
        direction = "right",
        focus_fit_method = 1,
        follow_focus = true,
        fullscreen_on_one_column = false,
        explicit_column_widths = "0.333, 0.5, 0.667, 0.8, 1.0", -- Tambahin di sini
    }
})
