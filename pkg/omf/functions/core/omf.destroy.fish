function omf.destroy -d "Remove Oh My Fish"
  echo (omf::dim)"Removing Oh My Fish..."(omf::off)

  # Trigger uninstall events
  set -l installed_package_path $OMF_PATH/pkg/*
  for pkg in (basename $installed_package_path)
    omf.packages.run_hook $path uninstall
    emit uninstall_$pkg
  end

  # Run the uninstaller
  fish "$OMF_PATH/bin/install" --uninstall "--path=$OMF_PATH" "--config=$OMF_CONFIG"

  # Start a new OMF-free shell
  set -q CI; or exec fish < /dev/tty
end
