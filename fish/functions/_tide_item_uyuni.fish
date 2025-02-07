function _tide_item_uyuni
    if set -q OBS_PROJ
        _tide_print_item uyuni $tide_uyuni_icon' ' $OBS_PROJ
    end
end
set -U tide_uyuni_icon ''
set -U tide_uyuni_color FFFFFF
set -U tide_uyuni_bg_color 25BBBF
