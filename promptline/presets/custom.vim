
fun! promptline#presets#custom#get()
  return {
        \'a': [ promptline#slices#user(), promptline#slices#jobs() ],
        \'b': [ promptline#slices#cwd() ],
        \'c' : [ promptline#slices#vcs_branch(), promptline#slices#git_status() ],
        \'warn' : [ promptline#slices#last_exit_code(), promptline#slices#battery() ]}
endfun

