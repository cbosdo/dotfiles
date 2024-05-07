if test "z$KITTY_PID" != "z"
  function s --description 'alias s=kitty +kitten ssh'
    kitty +kitten ssh $argv;
  end
end
