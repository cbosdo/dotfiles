if test "z$KITTY_PID" != "z"
  function ssh --description 'alias ssh=kitty +kitten ssh'
    kitty +kitten ssh $argv;
  end
end
