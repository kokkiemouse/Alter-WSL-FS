set time_tmp=%time: =0%
set TAG=%date:/=%%time_tmp:~0,2%%time_tmp:~3,2%%time_tmp:~6,2%
git tag %TAG%
git push origin %TAG%
git push origin master
