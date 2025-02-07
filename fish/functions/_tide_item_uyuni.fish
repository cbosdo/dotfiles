function _tide_item_uyuni
    if set -q OBS_PROJ
        set proj (string replace -r 'home:([^:]+):branches' '$1' $OBS_PROJ)
        set proj (string replace 'Devel:Galaxy:Manager' Manager $proj)
        set proj (string replace 'systemsmanagement:Uyuni' Uyuni $proj)
        _tide_print_item uyuni $tide_uyuni_icon' ' $proj
    end
end
set -U tide_uyuni_icon ''
set -U tide_uyuni_color FFFFFF
set -U tide_uyuni_bg_color 25BBBF
