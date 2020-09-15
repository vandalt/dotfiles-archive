# Enable conda (without activating)
if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
    . "$HOME/miniconda3/etc/profile.d/conda.sh"
else
    export PATH="$HOME/miniconda3/bin:$PATH"
fi

# Adapted from https://github.com/dfm/dotfiles and https://github.com/leouieda/dotfiles
cenv() {
read -r -d '' CENV_HELP <<-'EOF'
Usage: cenv [ACTION] [ARGS] [PACKAGES]
Actions:
  None         Creates or activates an environment
  new|create   Creates a new environment
  save         Saves existing environment info in a dir
  up|update    Update the environment
  upall|update-all
               Update all packages inside envionment to most recent version.
               This updates both conda and pip packages
  activate     Activates the environment
  off|deactivate   Equivalent to 'conda deactivate'
  add|install  Install a package
  rm|remove|uninstall
               Uninstall a package
  dev|develop  Add development path to env (using conda.pth)
  clean        Remove the environment
Arguments:
  -h|--help    Show this message
  -n|--name    Name of the envionment
  -d|--dir     Directory where env info is saved (yml, lock and req files)
               Note: This is not the environment prefix
  -f|--file    The conda environment file
  --pip        Install or uninstall a package with pip
Packages: Packages to install
EOF

  condaVersion=`conda --version`
  echo "$condaVersion"

  # Find the action
  case "$1" in
  new|create)
    action="create"
    shift
    ;;
  save)
    action="save"
    shift
    ;;
  activate)
    action="activate"
    shift
    ;;
  off|deactivate)
    action="deactivate"
    shift
    ;;
  add|install)
    action="add"
    shift
    ;;
  rm|remove|uninstall)
    action="remove"
    shift
    ;;
  dev|develop)
    action="dev"
    shift
    ;;
  up|update)
    action="update"
    shift
    ;;
  upall|update-all)
    action="upall"
    shift
    ;;
  clean)
    action="clean"
    shift
    ;;
  *)
    action="activate"
  esac

  if [[ "$action" = "deactivate" ]]; then
    conda deactivate
    return 0
  fi

  help=n
  pip=n
  envName="$CONDA_DEFAULT_ENV"
  echo $envName
  active=y
  if [[ -z $envName ]]; then
    active=n
  fi

  # now enjoy the options in order and nicely split until we see --
  while true; do
    case "$1" in
      -h|--help)
        help=y
        shift
        ;;
      --pip)
        pip=y
        shift
        ;;
      -n|--name)
        envName="$2"
        shift 2
        ;;
      -d|--dir)
        envName="$2"
        shift 2
        ;;
      -f|--file)
        envFile="$2"
        shift 2
        ;;
      --)
        shift
        break
        ;;
      *)
        break
        ;;
    esac
  done

  if [[ "$help" = "y" ]]; then
    echo $CENV_HELP
    return 0
  fi

  # Check got at least some info about the env
  if [[ -z "$envFile" && -z "$envName" ]]; then
    envName="base"
  fi

  # Set env name
  if [[ -z $envName ]]; then
    envName=`sed -n -e 's/^name: //p' $envfile`
  fi

  # Set env dir
  if [[ -z $envDir ]]; then
    envDir="./env"
  fi
  
  # Set env file
  if [[ -z $envFile ]]; then
    envFile="$envDir/environment.yml"
  fi

  # Default lock and pip files
  lockFile="$envDir/environment.lock"
  pipFile="$envDir/requirements.txt"

  fileExists=n
  if [[ -e "$envFile" ]]; then
    fileExists=y
  fi
  envExists=n
  if conda info --envs | grep -q "^$envName"; then
    envExists=y
  fi
  if [[ ! -d "$envDir" ]]; then
    mkdir -p $envDir
  fi

  if [[ "$action" = "clean" ]]; then
    read "flag?Remove this environment ($envName)? [y/N]: "
    if [[ "$flag" = "y" ]] || [[ "$flag" = "Y" ]]; then
      echo -n "Removing: environment $envName and dir $envDir"
      conda deactivate
      rm -rf $envDir
      conda remove --name $envName --all
    fi
    return 0
  fi

  if [[ "$action" = "save" ]]; then
    if [[ $envExists = "n" ]]; then
      echo "Environment $envName does not exist"
      return 1
    fi
    conda list --export | grep pypi | cut -d = -f 1 >> $pipFile
    echo "name: $envName" > $envFile
    conda env export --name $envName --from-history | sed '1d;/^$/d' | sed '$d' >> $envFile
    if [[ -e "$pipFile" ]]; then
      echo "  - pip:" >> $envFile
      echo "    - -r requirements.txt" >> $envFile
    fi
    conda env export --name $envName > $lockFile
    return 0
  fi

  if [[ $fileExists = "n" ]]; then
    if [[ "$action" = "activate" ]] || [[ "$action" = "update" ]]; then
      action="create"
    elif [[ "$action" != "create" ]]; then
      echo "Environment file not found:" $envFile;
      return 1
    fi
  fi

  if [[ "$action" = "activate" ]]; then
    if [[ $envExists = "n" ]]; then
      echo "Environment $envName not found"
      return 1
    fi
    echo "Activating environment: $envName"
    conda activate $envName
    return 0
  fi

  if [[ "$action" = "create" ]]; then
    if [[ $envExists = "y" ]]; then
      echo "Environment $envName already exists"
      return 1
    fi
    if [[ $fileExists = "y" ]]; then
      echo "Creating a new environment from: $envFile"
      conda env create --name $envName --file $envFile
    else
      echo "Creating a new environment with arguments: $@"
      conda create --name $envName pip $@
    fi
    conda activate $envName
  elif [[ "$action" = "update" ]]; then
    echo "Updating environment: $envFile -> $envName"
    conda env update --name $envName -f $envFile --prune
  elif [[ "$action" = "upall" ]]; then
    conda activate $envName
    conda clean -pity
    conda update --all
    conda list --export | grep pypi | cut -d = -f 1 >> $pipFile
    conda list --export | grep pypi | cut -d = -f 1 | xargs -n1 pip install -U
    if [[ "$active" = "n" ]]; then
      conda deactivate
    fi
  elif [[ "$action" = "dev" ]]; then
    conda activate $envName
    conda develop $@
    if [[ "$active" = "n" ]]; then
      conda deactivate
    fi
  elif [[ "$action" = "add" ]]; then
    if [[ "$pip" = "y" ]]; then
      echo "Installing (using pip): $@"
      conda activate $envName
      pip install $@
      for dep in $@
      do
        echo $dep >> $pipFile
      done
      if [[ "$active" = "n" ]]; then
        conda deactivate
      fi
    else
      echo "Installing: $@"
      conda install --name $envName $@
    fi
  elif [[ "$action" = "remove" ]]; then
    if [[ "$pip" = "y" ]]; then
      echo "Uninstalling (using pip): $@"
      conda activate $envName
      pip uninstall $@
      for dep in $@
      do
        sed '/^$@/ d' $pipFile > $pipFile
      done
      if [[ "$active" = "n" ]]; then
        conda deactivate
      fi
    else
      echo "Uninstalling: $@"
      conda remove --name $envName $@
    fi
  fi

  echo "name: $envName" > $envFile
  conda env export --name $envName --from-history | sed '1d;/^$/d' | sed '$d' >> $envFile
  if [[ -e "$pipFile" ]]; then
    echo "  - pip:" >> $envFile
    echo "    - -r requirements.txt" >> $envFile
  fi
  conda env export --name $envName > $lockFile

}

cd_env () {
    # Change directory and activate a conda environment if it's present.
    # Use command to ignore the aliasing of cd
    command cd $1;
    if [[ -e "env/environment.yml" ]]; then
        cenv;
    else
        cenv $HOME/environment.yml;
    fi
}

# other useful aliases
alias cup='conda clean -pity; conda update --all'
alias castro='conda activate astro'
condastro='conda activate astro'
alias cbase='conda activate base'
