for %%f in (tests\kubersettings*) do (
  set /p val=<%%f
  copy %%f kubersettings.tfvars
  docker-compose up
)
git checkout kubersettings.tfvars
