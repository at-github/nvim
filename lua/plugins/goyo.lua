vim.cmd([[
  augroup goyo_and_co
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!
  augroup end
]])
